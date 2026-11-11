import wollok.game.*
import personaje.*
import direcciones.*
import inventario.*
import niveles.*
import mate.*
import morral.*
import vidas.*
import factory.*


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

    method reiniciarNivel() {
        game.clear()

        jacinta.reiniciarEstado()
        mate.reiniciar()
        vidas.reiniciar()
        nivelActual.activarNivel()
        game.addVisual(mate)
        game.addVisual(morral)
        game.addVisual(jacinta)

        if (nivelActual == nivel1) {
            factoryArbustos.crear()
        }
    }
}