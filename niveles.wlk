import wollok.game.*
import personaje.*
import factory.*
import obstaculos.*
import enemigos.*

class Nivel {
    var property position = game.origin()

    method activarNivel() {
        game.clear()
        game.sound("audioNivel1y2.mp3").play()
    }

    method image()
}

object nivel1 inherits Nivel { // pastizal
    override method image() {
        return "fondoNivel1.jpg"
    }
}

object nivel2 inherits Nivel { // campo con caminos

    override method activarNivel() {
        super()

        game.addVisual(pampero)

        self.persecuciónAPersonaje()

        game.addVisual(lobizón)

        self.colisionesDelNivel()
    }

    method persecuciónAPersonaje() {
        game.onTick( 1000, "movimientoPampero", { pampero.perseguirPersonaje() } )
        game.onTick( 1600, "movimientoLobizon", { lobizón.perseguirPersonaje() } )
    }

    method colisionesDelNivel() {
        game.onCollideDo( jacinta, { objeto => objeto.interactuarCon(jacinta) })
    }

    override method image() {
        return "fondoNivel2.jpg"
    }
}