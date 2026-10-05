import wollok.game.*
import personaje.*
object config {
	method configurarEscenario() {
		game.title("Jacinta")
		game.height(50)
		game.width(50)


		keyboard.t().onPressDo( { jacinta.tomarMate() } )     
	}
}