import wollok.game.*
import personaje.*
import direcciones.*
import inventario.*
import niveles.*
import configuraciones.*
import factory.*
import vidas-y-mate.*

object nivelManager {
    var property nivelActual = intro
    //const nivelAnterior = nivelActual

    //method nivelAnterior() = nivelAnterior

    method iniciarIntro() {
        config.teclasIntro()
        game.addVisual(nivelActual)
    }

    method actualizarVisual() {
        game.clear()
        
        const nivelAnterior = nivelActual
        nivelActual = nivelAnterior.siguienteVisual()
        
        nivelActual.iniciar()
    }

    method iniciarNivel() {
        jacinta.nivelActual(nivelActual)

        game.addVisual(nivelActual)

        nivelActual.activarNivel()

	    config.teclas()

        vidas.actualizar(jacinta.vida())

        const personaje = nivelActual.personaje()

        if (game.hasVisual(personaje)) {
            game.removeVisual(personaje)
        }

        nivelActual.agregarPersonaje()

        game.onCollideDo(jacinta, { objeto => objeto.chocar(jacinta)} )
    }

    method actualizarNivel() {
        nivelActual.validarFinal()
        game.clear()

        const nivelAnterior = nivelActual
        nivelActual = nivelAnterior.actualizarNivel()
        
        nivelActual.iniciar()

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