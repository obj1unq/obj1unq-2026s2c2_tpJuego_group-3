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
        game.removeVisual(nivelActual) 
        nivelActual.remover()

        const nivelAnterior = nivelActual
        nivelActual = nivelAnterior.actualizarNivel()
        
        self.iniciarNivel()
    }


    method viisuales() {
        return nivelActual.visualesNecesarias()({visualActual => visualActual})
    }

    method metaActual() {
        return nivelActual.meta()
    }
}
