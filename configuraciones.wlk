import wollok.game.*
import personaje.*
import direcciones.*
import inventario.*

object config {
	method configurarEscenario() {
		game.title("Jacinta")
		game.height(26)
		game.width(26)

	method movimientos() {
		keyboard.left().onPressDo( { jacinta.mover(izquierda) } )
		keyboard.right().onPressDo( { jacinta.mover(derecha) } )
		keyboard.up().onPressDo( { jacinta.mover(arriba) } )
		keyboard.down().onPressDo( { jacinta.mover(abajo) } )
    keyboard.t().onPressDo( { jacinta.tomarMate() } )     
		//keyboard.().onPressDo( { jacinta.inspeccionar() } )
	}

	method inventario() {
		const slot1 = new Inventario(position = game.at(1, 12), numeroDeSlot = 0, personaje = jacinta)
		game.addVisual(slot1)
	}

	method inventario() {
		const slot1 = new Inventario(position = game.at(1, 12), numeroDeSlot = 0, personaje = jacinta)
		game.addVisual(slot1)
	}
}
 	