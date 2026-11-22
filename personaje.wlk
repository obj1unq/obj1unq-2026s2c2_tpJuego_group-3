import colision-y-clases.*
import wollok.game.*
import direcciones.*
import obstaculos.*
import inventario.*
import vidas-y-mate.*
import nivelManager.*

object jacinta inherits Visual{
  var property position = game.origin()
  var property ingredientes = morral 
  var property vida = 3        // check

  var últimaDirección = abajo // puse abajo por poner una x defecto xk no me deja dejarlo vacio
  var property estadoMovimiento = normal

  var property tieneFacon = false // cambiar por estado de imagen

  var property perdio = false

  method image() { // VER ESTO 
    return if (tieneFacon) "jacintaConFacon.png" else "jacinta.png"
  }

  method ingredientes() = morral.ingredientes()

  method ataqueDeEnemigo() {
    if (not perdio) {
      vida -= 1
      vidas.actualizar(vida)

      if (vida == 0) {
        perdio = true
        nivelManager.reiniciarNivel()
      }
    }
  }

  method recibirVidaExtra() {         
    vida += 1
    vidas.actualizar(vida)
  }

  method tomarMate() {
    if (not perdio) {
        self.validarTomarMate()
        self.validarCantidadVidas()
        self.recibirVidaExtra()
        mate.usar()
        game.say(self, "¡El mate me revive!")
    }
  }

  method validarTomarMate(){   
    if (not mate.puedeUsarse()){
      self.error("¡Me quedé sin agua che!") // ¡No tengo más vidas disponibles!
    }
  }

  method validarCantidadVidas(){
    if ( vida >= 3 ) {
      self.error("No estoy para tomar mate!") // No necesito tomar mate, ya tengo todas mis vidas!
    }
  }

  method mover(dirección) {
    últimaDirección = dirección
    if ( not perdio ) {             
      position = estadoMovimiento.moverseHacia(dirección, self) 
    } 
  }

  // NIVEL 1 - ARBUSTOS
  method buscarEn(posicion) {
    self.validarBuscarEn(posicion)
    self.inspeccionarEn(posicion)
  }

  method validarBuscarEn(posicion) {
    if ( not self.hayArbustoEn(posicion) ){
      self.error("No hay nada en este lugar")
    }
  }

  method hayArbustoEn(posicion) {
    return not self.arbustosEn(posicion).isEmpty() 
  }

  method arbustoEn(posicion) {
    return self.arbustosEn(posicion).anyOne() // documentacion wollok: Answers any element of a non-empty collection
  }

  method arbustosEn(posicion) {
    return game.getObjectsIn(posicion).filter( { elemento => self.esArbustoVálidoParaBuscar(elemento) } )
  }

  method esArbustoVálidoParaBuscar(elemento) {
    return elemento != self and elemento.esUnArbusto() 
  }
  
  method inspeccionarEn(posicion) {
    const arbusto = self.arbustoEn(posicion)
    arbusto.serInspeccionado()
    arbusto.contenido().interactuarCon(self)
  }

  method serEmpujada(){
    const posiciónHaciaAtras = últimaDirección.opuesta().siguiente(position)
    position = posiciónHaciaAtras
  }

  // NIVEL 2 - PAMPERO
  method marearse() {
    estadoMovimiento = mareada
    game.schedule( 8000, { self.volverALaNormalidad() } )
  }

  method volverALaNormalidad() {
    estadoMovimiento = normal
    game.say( self, "Ya está, se me pasó el mareo" )
  }

  // NIVEL 2 - LOBIZON
  method ahuyentar() {
    tieneFacon = true
    game.say( self, "Tomá" )
    self.guardarFacon()
  }

  method guardarFacon() {
    game.schedule( 800, { tieneFacon = false } )
  }

  method recargarMate() {
    if (lago.contiene(position)) {
        if (mate.puedeUsarse()) {
            game.say( self, "Ya tengo suficiente agua en el mate, no necesito recargarlo" )
        } else {
            mate.recargar()
            game.say( self, "¡Ya tengo agua para el mate!" )
        }
    } else {
        game.say( self, "Tengo que acercarme al lago para recargar el mate" )
    }
  }

  method reiniciarEstado() {
    vida = 3
    position = game.origin()
    perdio = false
    vidas.actualizar(vida)
    ingredientes.vaciarMorral()
  }

  override method chocar(objeto) {
    objeto.chocar(self)
  }
}

// ESTADOS DE MOVIMIENTO JACINTA
object mareada {

  method moverseHacia(dirección, personaje) {
    return dirección.opuesta().siguiente(personaje.position())
  }

}

object normal {

  method moverseHacia(dirección, personaje) {
    return dirección.siguiente(personaje.position())
  }

}