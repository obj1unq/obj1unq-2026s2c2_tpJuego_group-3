import wollok.game.*

class Nivel {
    method activarNivel() {
        game.clear()
    }

    method image()
}

object nivel1 inherits Nivel { // pastizal
    var property position = game.origin()

    override method activarNivel() {
        super()
        game.sound("audioNivel1.mp3").play()
    }

    override method image() {
        return "fondoNivel1.jpg"
    }

}

object nivel2 inherits Nivel {
    var property position = game.origin()

    override method image() {
        return "fondoNivel2.jpg"
    }
}