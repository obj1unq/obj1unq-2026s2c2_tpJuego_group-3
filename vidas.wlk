import wollok.game.*

class IconoVida {

    var property position

    var property visible = false


    method image() {
        return "vida.png"
    }


    method actualizar(debeMostrarse) {
        if (debeMostrarse and not visible) {
            game.addVisual(self)
            visible = true
        }
        if (not debeMostrarse and visible) {
            game.removeVisual(self)
            visible = false
        }
    }
}

object vidas {
    const vida1 = new IconoVida(position = game.at(1, 25))
    const vida2 = new IconoVida(position = game.at(2, 25))
    const vida3 = new IconoVida(position = game.at(3, 25))
    const vida4 = new IconoVida(position = game.at(4, 25))      // 4 vidas por la extra que le da el mate

    method actualizar(cantidad) {
        vida1.actualizar(cantidad >= 1)
        vida2.actualizar(cantidad >= 2)
        vida3.actualizar(cantidad >= 3)
        vida4.actualizar(cantidad >= 4)
    }
}