import wollok.game.*
import personaje.*
import factory.*
import obstaculos.*
import enemigos.*
import inventario.*
import vidas-y-mate.*
import nivelManager.*
import configuraciones.*

class Nivel {
    var property personaje = jacinta
    var property position = game.origin()

    method activarNivel() {
        game.sound("audioNivel1y2.mp3").play()
        game.addVisual(self.meta())
    }

    method image()

    method validarFinal()

    method actualizarNivel(){
        self.validarFinal()
        return
    }

    method visualesNecesarias()


    method remover() {
        self.visualesNecesarias().forEach({visual => game.removeVisual(visual)})
    }
    

    method meta()
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
        if(morral.cantidadIngredientes() < 3) {
            self.error("No tengo todos los ingredientes para irme")
    }
}

    override method actualizarNivel(){
        super()
        return nivel2
    }

    override method visualesNecesarias() {
        return #{self, metaNivel1}
    }

    override method meta() {
        return metaNivel1
    }
}

object nivel2 inherits Nivel { // campo con caminos

    override method activarNivel() {

        lago.desactivar()

        game.addVisual(mate)


        game.addVisual(pampero)

        self.persecuciónAPersonaje()

        game.addVisual(lobizón)

        self.colisionesDelNivel()

        super() 

        lago.activar()
    }

    method persecuciónAPersonaje() {
        game.onTick( 1000, "movimientoPampero", { pampero.perseguirPersonaje() } )
        game.onTick( 1600, "movimientoLobizon", { lobizón.perseguirPersonaje() } )
    }

    method colisionesDelNivel() {
        game.onCollideDo( jacinta, { objeto => objeto.interactuarCon(jacinta) })
    }


    override method image() {
        return "fondoNivel2.jpeg"
    }

    override method validarFinal(){
        if(personaje.vida() <= 0){ 
            self.error("Tengo que llegar al pueblo sano y salvo")
        }
    }

    override method actualizarNivel() {
        super()
        return nivel3
    }

    override method visualesNecesarias() {
        return #{metaNivel2, self}
    }

    override method meta() {
        return metaNivel2
    }

    override method remover(){
        super()
        game.removeTickEvent("movimientoPampero")
        game.removeTickEvent("movimientoLobizon")
    }
}

object nivel3 inherits Nivel {

    override method activarNivel() {
        //game.addVisual(metaNivel3)
    }

    override method image() { //Falta el fondo del nivel 3
        return "fondoNivel1.jpg"
    }

    override method validarFinal(){
        if(personaje.vida() <= 0){  //Me falta definir la condicion del nivel 3
            self.error("Tengo que llegar al pueblo sano y salvo")
        }
    }

    override method actualizarNivel() {
        super()//No sé si esto deberia ser, termino la parte de metas y lo evaluo
        return finDelJuego
    }


    override method visualesNecesarias() {
        return #{metaNivel3, self}
    }

    override method meta() {
        return metaNivel3
    }
}

object finDelJuego {

    var property position = game.origin()

    method image() {
        return "finDelJuego.jpg"//Falta una pantalla de fin del juego
    }
}

class Meta {
    var property position = game.at(13, 5)
    
    method image() = "meta.png" 

    method configurarColision(personaje) {
        game.onCollideDo(self, { objeto => if (objeto == personaje) { self.interactuarCon() } })
    } 
    /*
    Implementar la colision en Jacinta unicamente, "chocar" los que no tengan colision no hacen nada, los que si "interactuarCon"
    Hay una clase colisionables: Meta, Lobi, Pampeano al "chocar" deben usar "interactuarCon"
    En todos los objetos visuales que puedan conlisionar con Jacinta deben entender el mensaje "chocar"
    meta hereda de la clase "colisionable", y esta hereda de la clase "visual" 
    La clase visual tiene el metodo "chocar" que no hace nada
    */
    method interactuarCon() { 
        nivelManager.actualizarNivel()
    } 
}
object metaNivel1 inherits Meta {
}

object metaNivel2 inherits Meta {
    override method position() = game.at(13, 16)
}

object metaNivel3 inherits Meta {
    override method position() = game.at(13, game.origin().y())
    override method image() = "meta2.png"
}

