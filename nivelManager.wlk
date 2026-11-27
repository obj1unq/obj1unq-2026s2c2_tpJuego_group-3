import wollok.game.*
import personaje.*
import direcciones.*
import inventario.*
import niveles.*
import configuraciones.*
import factory.*
import vidas-y-mate.*

//Esta parte del codigo es de prueba, se debe borrar luego de implementar la clase y objetos correspondientes
import colision-y-clases.*
object pareja1 inherits Visual {
    method position() = game.at( 1, 5)
    method image() = "pareja_intento_1.gif"
}
object pareja2 inherits Visual {
    method position() = game.at(1, 7)
    method image() = "pareja_intento_2.gif"
}
//Hasta aca el codigo de prueba
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

        //Codigo de pruba, esto despues no va
        game.addVisual(pareja1)
        game.addVisual(pareja2)
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