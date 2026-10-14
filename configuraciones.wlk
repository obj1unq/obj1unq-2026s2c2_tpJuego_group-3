import wollok.game.*
import personaje.*
import direcciones.*
import inventario.*

object config {
	method configurarEscenario() {
		game.title("Jacinta")
		game.height(26)
		game.width(26)
		game.cellSize(50)
	}

	method movimientos() {
		keyboard.left().onPressDo( { jacinta.mover(izquierda) } )
		keyboard.right().onPressDo( { jacinta.mover(derecha) } )
		keyboard.up().onPressDo( { jacinta.mover(arriba) } )
		keyboard.down().onPressDo( { jacinta.mover(abajo) } )
    keyboard.t().onPressDo( { jacinta.tomarMate() } )     
    keyboard.b().onPressDo( { jacinta.buscarEn( jacinta.position() ) } )
	}

	method inventario() {
		const slot1 = new Inventario(position = game.at(10, game.height()-2), numeroDeSlot = 0, personaje = jacinta)
		const slot2 = new Inventario(position = game.at(11, game.height()-2), numeroDeSlot = 1, personaje = jacinta)
		const slot3 = new Inventario(position = game.at(12, game.height()-2), numeroDeSlot = 2, personaje = jacinta)
		game.addVisual(slot1)
		game.addVisual(slot2)
		game.addVisual(slot3)
	
		
	}
}

 	