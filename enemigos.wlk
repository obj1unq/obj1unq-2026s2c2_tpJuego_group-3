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
    }
}