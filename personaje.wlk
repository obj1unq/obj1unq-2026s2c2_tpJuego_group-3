import wollok.game.*
import direcciones.*
import obstaculos.*

object jacinta {
  var property position = game.origin()
  var property ingredientes = [] //temporal, esto puede ser el morral, avisar así modifico el código del inventario

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