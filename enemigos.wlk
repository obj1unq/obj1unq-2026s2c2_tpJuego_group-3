import personaje.*

class Yarará {
    var property arbusto

    method position() { return arbusto.position() }

    method image() {
        return "yarara.png"
    }

    method interactuarCon(personaje) {
        game.addVisual(self)
        game.sound("audioYarara.mp3").play()
        personaje.ataqueDeEnemigo()
        game.say( personaje, "¡Ay! me picó una yarará" )
        personaje.serEmpujada()
    }
}

object lobizón {
    var property position = game.at(20, 20)
    const nombreTick = "movimientoLobizon"

    method image() = "lobizon.png"

    method interactuarCon(personaje) {
        // audio de aullido? grñido?
        if ( personaje.tieneFacon() ) {
            game.say( personaje, "¡Fuera!" )
            self.desaparecer()
        } else {
            game.say( personaje, "¡Aia!" )
            personaje.ataqueDeEnemigo()
        }
    }

    method desaparecer() {
        game.removeTickEvent(nombreTick)
        game.removeVisual(self)
    }

    method buscarAJacinta() {
        if ( self.distanciaAJacinta() > 3 ) self.perseguirPersonaje() else jacinta.ataqueDeEnemigo()
    }

    method distanciaAJacinta() {
        return  ( position.x() - jacinta.position().x() ).abs() + 
                ( position.y() - jacinta.position().y() ).abs()
    }

    method perseguirPersonaje() {
        const objetivo = jacinta.position()
        const nuevaPosicionX = ( position.x() + self.dirección( position.x(), objetivo.x()) ).max(0).min( game.width() - 1 )
        const nuevaPosicionY = ( position.y() + self.dirección( position.y(), objetivo.y()) ).max(0).min( game.height() - 1 )
        position = game.at(nuevaPosicionX, nuevaPosicionY)
    }

    method dirección(actual, objetivo) {
        if (objetivo > actual) return 1
        if (objetivo < actual) return -1
        return 0
    }
}