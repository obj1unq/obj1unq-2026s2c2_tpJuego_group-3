import wollok.game.*
import direcciones.*
import obstaculos.*
import morral.*
import mate.*

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


  method ataqueDeEnemigo() {               // segun enemigo las vidas que quita?
        vida -= 1
  }


  method recibirVidaExtra() {             // era solo una vida que da no? como un bonus
        vida += 1
  }


  method tomarMate() {
    self.validarTomarMate()
    self.recibirVidaExtra()
    mate.usar()
  }

  method validarTomarMate(){                // si el mate ya se uso tira error, o mejor que no haga nada?
    if (not mate.puedeUsarse()){
      self.error("no hay más vidas disponibles")
    }
  }

  method mover(dirección) {
    position = dirección.siguiente(position)
  }

}

  //method inspeccionar() {
  //  return 
  //}

