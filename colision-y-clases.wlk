import personaje.*
class Visual {
    method chocar(objeto) {

    }
}

class Colisionable inherits Visual {
    override method chocar(objeto) {
        self.interactuarCon(objeto)
    }

    method interactuarCon(objeto)
}

class Perseguidor inherits Colisionable {
    var property position
    const property objetivo = jacinta

    method perseguirAPersonaje() {
        const destino = objetivo.position()
        const nuevaPosicionX = ( position.x() + self.dirección( position.x(), destino.x()) ).max(0).min( game.width() - 1 )
        const nuevaPosicionY = ( position.y() + self.dirección( position.y(), destino.y()) ).max(0).min( game.height() - 1 )
        position = game.at(nuevaPosicionX, nuevaPosicionY)
    }

     method distanciaAPersonaje() {
        const destino = objetivo.position()
        return  ( position.x() - destino.x() ).abs() + ( position.y() - destino.y() ).abs()
    }

    method dirección(actual, obj) {
        if (obj > actual) return 1
        if (obj < actual) return -1
        return 0
    }
}