class Yarará {

    var property arbusto

    method image() {
        return "yarara.png"
    }

    method position() {return arbusto.position()}

    method interactuarCon(personaje) {
        personaje.ataqueDeEnemigo()
        game.say( personaje, "¡Ay! me picó una yarará" )
    }
}