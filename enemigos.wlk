object yarará {
    method image() {
        return "yarara.png"
    }

    method interactuarCon(personaje) {
        personaje.ataqueDeEnemigo()
        game.say( personaje, "¡Ay! me picó una yarará" )
    }
}