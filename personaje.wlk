import colision-y-clases.*
import wollok.game.*
import direcciones.*
import obstaculos.*
import inventario.*
import vidas-y-mate.*
import nivelManager.*
import niveles.*

object jacinta inherits Visual {
  var property nivelActual = nivelManager.nivelActual()

  var property position = game.origin()

  var property ingredientes = morral 

  var property vida = 3

  var últimaDirección = abajo

  var property estadoMovimiento = normal

  var property tieneFacon = false 

  method image() { 
    return últimaDirección.imagenPersonaje( tieneFacon )
  }

  method mover(dirección) {
    últimaDirección = dirección
    if ( not self.perdio() ) {             
      position = estadoMovimiento.moverseHacia(dirección, self) 
    } 
  }

  method ingredientes() = morral.ingredientes()

  method ataqueDeEnemigo() {
    vida = (vida - 1).max(0)
    vidas.actualizar(vida)

    if ( self.perdio() ) {
      nivelManager.reiniciarNivel()
      //nivelManager.nivelActual(gameOver)
    }
  }

  method perdio() {
    return vida <= 0
  }

  // MATE - VIDA
  method recibirVidaExtra() {         
    vida += 1
    vidas.actualizar(vida)
  }

  method tomarMate() {
    if ( not self.perdio() ) {
      self.validarTomarMate()
      self.validarCantidadVidas()
      self.recibirVidaExtra()
      mate.usar()
      game.say(self, "¡El mate me revive!" )
    }
  }

  method validarTomarMate(){   
    if ( not mate.puedeUsarse() ) {
      self.error( "¡Se me terminaron los mates che!" )
    }
  }

  method validarCantidadVidas() {
    if ( vida >= 3 ) {
      self.error( "No necesito tomar mate" )
    }
  }

  method intentarRecargarMate() {
    if ( not self.perdio() ) {
      nivelActual.recargarMate()
    }
  }

  method recargarMate() {       
    if ( self.estáEnElLago() ) {
      mate.intentarRecargar(self)
    } else {
        game.say( self, "Tengo que acercarme al lago para recargar el mate" )
    }
  }

  method estáEnElLago() {
    return lago.contiene(position)
  }

  method reiniciarEstado() {
    vida = 3
    vidas.actualizar(vida)
    ingredientes.vaciarMorral()
  }


  // NIVEL 1 - ARBUSTOS
  method intentarBuscarEn(posicion) {
    if ( not self.perdio() ) {
      nivelActual.buscarEn(posicion)
    }
  }

  method buscarEn(posicion) {
    self.validarBuscarEn(posicion)
    self.inspeccionarEn(posicion)
  }

  method validarBuscarEn(posicion) {
    if ( not self.hayArbustoEn(posicion) ){
      self.error( "No hay nada acá" )
    }
  }

  method hayArbustoEn(posicion) {
    return not self.arbustosEn(posicion).isEmpty() 
  }

  method arbustoEn(posicion) {
    return self.arbustosEn(posicion).anyOne()
  }

  method arbustosEn(posicion) {
    return game.getObjectsIn(posicion).filter( { elemento => self.esArbustoVálidoParaBuscar(elemento) } )
  }

  method esArbustoVálidoParaBuscar(elemento) {
    return elemento != self and elemento.esUnArbusto() 
  }
  
  method inspeccionarEn(posicion) {
    const arbusto = self.arbustoEn(posicion)
    arbusto.serInspeccionadoPor(self)
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
    game.say( self, "Se me pasó el mareo" )
  }

  // NIVEL 2 - LOBIZON
  method intentarAhuyentar() {
    if ( not self.perdio() ) {
      nivelActual.ahuyentar()
    }
  }

  method usarFacon() {
    tieneFacon = true
    game.say( self, "Tomá" )
    self.guardarFacon()
  }

  method guardarFacon() {
    game.schedule( 1000, { tieneFacon = false } )
  }

  // PARA NIVEL 3
  method restaurarEstado() {
    estadoMovimiento = normal
    tieneFacon = false
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