import wollok.game.*
import personaje.*
import direcciones.*
import inventario.*

object config {
	method configurarEscenario() {
		game.title("Jacinta")
		game.height(50)
		game.width(50)
	}

	method movimientos() {
		keyboard.left().onPressDo( { jacinta.mover(izquierda) } )
		keyboard.right().onPressDo( { jacinta.mover(derecha) } )
		keyboard.up().onPressDo( { jacinta.mover(arriba) } )
		keyboard.down().onPressDo( { jacinta.mover(abajo) } )
	}

	method inventario() {
		const slot1 = new Inventario(position = game.at(1, 12), numeroDeSlot = 0, personaje = jacinta)
		game.addVisual(slot1)
	}
}
 	