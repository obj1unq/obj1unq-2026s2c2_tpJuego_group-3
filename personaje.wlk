import wollok.game.*
import direcciones.*

object jacinta {
  var property position = game.origin()

  method image() {
    return "jacinta.png"
  }

  method mover(dirección) {
    position = dirección.siguiente(position)
  }
}