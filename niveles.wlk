import wollok.game.*
import personaje.*
import factory.*
import obstaculos.*
import enemigos.*
import inventario.*
import vidas-y-mate.*
import nivelManager.*
import configuraciones.*
import colision-y-clases.*

class Nivel inherits Visual {
    var property personaje = jacinta
    var property position = game.origin()

    method activarNivel() {
        game.sound("audioNivel1y2.mp3").play()
        game.addVisual( self.meta() )
    }

    method image()

    method validarFinal()

    method actualizarNivel(){
        self.validarFinal()
        return
    }

    method visualesNecesarias()

    method remover() {
        self.visualesNecesarias().forEach( { visual => game.removeVisual(visual) } )
    }

    method meta()

    method agregarPersonaje()

    method buscarEn(posicion) { } // para el uso de la tecla b

    method ahuyentar() { } // para el uso de tecla f

    method recargarMate() { } // para el uso de tecla r
}

object nivel1 inherits Nivel { // pastizal
    override method activarNivel() {
	    factoryArbustos.crear()
        game.addVisual(mate)
        config.inventario()
        super()
    }

    override method image() {
        return "fondoNivel1.jpg"
    }

    override method validarFinal(){
        if( morral.cantidadIngredientes() < 3 ) {
            self.error( "Me faltan ingredientes" )
        }
    }

    override method actualizarNivel(){
        super()
        return nivel2
    }

    override method visualesNecesarias() {
        return #{ self, metaNivel1 }
    }

    override method meta() {
        return metaNivel1
    }

    override method agregarPersonaje() {
        personaje.position( game.origin() ) 
    }

    override method buscarEn(posicion) { // tecla b
        personaje.buscarEn(posicion)
    }
}

object nivel2 inherits Nivel { // campo con caminos
    override method activarNivel() {
        lago.desactivar()

        game.addVisual(mate)

        game.addVisual(pampero)

        game.addVisual(lobizón)

        self.persecuciónAPersonaje()

        super() 

        lago.activar()
    }

    method persecuciónAPersonaje() {
        game.onTick( 1000, "movimientoPampero", { pampero.perseguirAPersonaje() } )
        game.onTick( 1600, "movimientoLobizon", { lobizón.perseguirAPersonaje() } )
    }

    override method image() {
        return "fondoNivel2.jpeg"
    }

    override method validarFinal(){
        if( game.hasVisual(lobizón) ){ 
            self.error( "Todavía tengo que eliminar al lobizón" ) // "Tengo que llegar al pueblo sano y salvo"
        }
    }

    override method actualizarNivel() {
        super()
        return nivel3
    }

    override method visualesNecesarias() {
        return #{ metaNivel2, self }
    }

    override method meta() {
        return metaNivel2
    }

    override method remover(){
        super()
        game.removeTickEvent( "movimientoPampero" )
        game.removeTickEvent( "movimientoLobizon" )
    }

    override method agregarPersonaje() {
        personaje.position( game.at(2, 21) ) 
    }

    override method ahuyentar() { // tecla f
        personaje.usarFacon()
    }

    override method recargarMate() { // tecla r
        personaje.recargarMate()
    }
}

object nivel3 inherits Nivel { // peña
    override method activarNivel() {
        game.sound("audioNivel3.mp3").play()

        // agregar la visual de la meta 

        personaje.restaurarEstado()

        game.addVisual(mate)

        self.parejas()
    }

    method parejas() {
      const pareja1 = new ParejaDeBaile ( imagen = "pareja1.gif", posicionX = 5, tipoProyectil = #{constructorAlpargata, constructorSombrero, constructorPañuelo} )
      const pareja2 = new ParejaDeBaile ( imagen = "pareja2.gif", posicionX = 20, tipoProyectil = #{constructorAlpargata, constructorSombrero, constructorPañuelo} )

      game.addVisual(pareja1)
      game.addVisual(pareja2)

      game.onTick( 3000, "lanzamientoProyectilesPareja1", { pareja1.lanzarProyectil() } )
      game.onTick( 3000, "lanzamientoProyectilesPareja2", { pareja2.lanzarProyectil() } )
    }

    override method image() { 
        return "fondoNivel3.png"
    }

    override method validarFinal() {
        if ( personaje.vida() <= 0 ) {  // Me falta definir la condicion del nivel 3 REVISAR !
            self.error( "Tengo que llegar a la cocina si o si" )
        }
    }

    override method actualizarNivel() {
        super()
        return finDelJuego
    }

    override method visualesNecesarias() {
        return #{ metaNivel3, self }
    }

    override method meta() {
        return metaNivel3
    }

    override method remover() {
        super()
        game.removeTickEvent( "lanzamientoProyectilesPareja1" )
        game.removeTickEvent( "lanzamientoProyectilesPareja2" )
    }

    override method agregarPersonaje() {
        personaje.position( game.at(12, 1) ) 
    }

    override method ahuyentar() { // tecla f
        personaje.usarFacon()
    }
}

object finDelJuego {
    var property position = game.origin()

    method image() {
        return "gameWin.png"
    }
}

class Meta inherits Colisionable{
    var property position = game.at(23, 7)
    
    method image() = "meta.png" 

    /* RESUELTO
    Implementar la colision en Jacinta unicamente, "chocar" los que no tengan colision no hacen nada, los que si "interactuarCon"
    Hay una clase colisionables: Meta, Lobi, Pampeano al "chocar" deben usar "interactuarCon"
    En todos los objetos visuales que puedan conlisionar con Jacinta deben entender el mensaje "chocar"
    meta hereda de la clase "colisionable", y esta hereda de la clase "visual" 
    La clase visual tiene el metodo "chocar" que no hace nada
    */
    override method interactuarCon(personaje) { 
        nivelManager.actualizarNivel()
    } 
}
object metaNivel1 inherits Meta {

}

object metaNivel2 inherits Meta {
    override method position() = game.at(23, 7)
}

object metaNivel3 inherits Meta {
    override method position() = game.at(13, game.origin().y())
    override method image() = "meta2.png"
}