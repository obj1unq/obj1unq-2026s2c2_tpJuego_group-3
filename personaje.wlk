import wollok.game.*
import direcciones.*
import obstaculos.*

object jacinta {
  var property position = game.origin()

  method image() {
    return "jacinta.png"
  }

  method mover(dirección) {
    position = dirección.siguiente(position)
  }

  //method inspeccionar() {
  //  return 
  //}
}