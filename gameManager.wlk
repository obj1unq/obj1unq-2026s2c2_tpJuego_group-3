import wollok.game.*
import personaje.*
import direcciones.*
import inventario.*
import niveles.*
import mate.*
import morral.*
import configuraciones.*
import vidas.*

object gameManager {
    var nivelActual = nivel1

   method iniciarNivel() {
        game.addVisual(nivelActual)

        nivelActual.activarNivel()

	    config.teclas()


	    vidas.actualizar(jacinta.vida())

        const personaje = nivelActual.personaje()

        if (game.hasVisual(personaje)) {
            game.removeVisual(personaje)
        }

        personaje.position(game.origin()) 
        game.addVisual(personaje)

        self.metaActual().configurarColision(personaje)
    }

    method actualizarNivel(){
        nivelActual.validarFinal()
        game.clear()

        const nivelAnterior = nivelActual
        nivelActual = nivelAnterior.actualizarNivel()
        
        self.iniciarNivel()
    }

    method metaActual() {
        return nivelActual.meta()
    }
}
