import wollok.game.*
import direcciones.*
import obstaculos.*
import morral.*
import mate.*
import vidas.*

object jacinta {
  var property position = game.origin()
  var property ingredientes = [] //temporal, esto puede ser el morral, avisar así modifico el código del inventario

  var property vida = 3        // check

  method image() {
    return "jacinta.png"
  }

  method ingredientes() {
    return morral.ingredientes()
  }

  method ataqueDeEnemigo() {              // segun enemigo las vidas que quita?
    vida -= 1
    vidas.actualizar(vida)
  }


  method recibirVidaExtra() {            // era solo una vida que da no? como un bonus
    vida += 1
    vidas.actualizar(vida)
  }


  method tomarMate() {
    self.validarTomarMate()
    self.validarCantidadVidas()
    self.recibirVidaExtra()
    mate.usar()
    game.say(self, "¡Excelente! Recuperé una vida ")
  }

  method validarTomarMate(){                // si el mate ya se uso tira error, o mejor que no haga nada?
    if (not mate.puedeUsarse()){
      self.error("¡No tengo más vidas disponibles!")
    }
  }

  method validarCantidadVidas(){
    if (vida >= 3) {
      self.error("No necesito tomar mate, ya tengo todas mis vidas!")
    }
  }


  method mover(dirección) {
    position = dirección.siguiente(position)
  }

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
    return not self.arbustosEn(posicion).isEmpty() // creo que esto es lo que no me lee el juego 
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


}