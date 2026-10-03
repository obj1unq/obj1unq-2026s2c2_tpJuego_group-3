import wollok.game.*
import personaje.*
import direcciones.*

object config {
	method configurarEscenario() {
		game.title("Jacinta")
		game.height(26)
		game.width(26)
	}

	method movimientos() {
		keyboard.left().onPressDo( { jacinta.mover(izquierda) } )
		keyboard.right().onPressDo( { jacinta.mover(derecha) } )
		keyboard.up().onPressDo( { jacinta.mover(arriba) } )
		keyboard.down().onPressDo( { jacinta.mover(abajo) } )
		//keyboard.().onPressDo( { jacinta.inspeccionar() } )
	}
}
 	