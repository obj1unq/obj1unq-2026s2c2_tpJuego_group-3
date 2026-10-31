import wollok.game.*
import personaje.*
import direcciones.*
import inventario.*
import niveles.*
import mate.*
import morral.*

object gameManager {
    var nivelActual = nivel1

    method iniciarNivel() {

		game.addVisual(nivelActual)
        nivelActual.visualesDelNivel()

    }

    method actualizarNivel(){
        nivelActual = nivelActual.actualizarNivel()
    }

    method nivelActual() {
        return nivelActual.image()
    }
}