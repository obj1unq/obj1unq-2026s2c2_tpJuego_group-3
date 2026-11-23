import wollok.game.*
import personaje.*
import direcciones.*
import inventario.*
import niveles.*
import configuraciones.*
import factory.*
import vidas-y-mate.*

object nivelManager {
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

        nivelActual.agregarPersonaje()

        game.addVisual(personaje)

        game.onCollideDo(jacinta, {objeto => objeto.chocar(jacinta)})
    }

    method actualizarNivel() {
        nivelActual.validarFinal()
        game.clear()

        const nivelAnterior = nivelActual
        nivelActual = nivelAnterior.actualizarNivel()
        
        self.iniciarNivel()

        vidas.reiniciar(jacinta.vida())
    }

    method metaActual() {
        return nivelActual.meta()
    }

    method reiniciarNivel() {
        game.clear()

        self.iniciarNivel()
        mate.recargar()
        jacinta.reiniciarEstado()
    }
}