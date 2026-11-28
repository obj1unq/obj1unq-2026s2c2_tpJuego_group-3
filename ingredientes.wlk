import inventario.*

class Ingrediente {
    var property arbusto

    method position() = arbusto.position() 

    method image()

    method nombre()

    method interactuarCon(personaje) {
        morral.agregarIngrediente(self)
        game.sound("audioItemPickUp.mp3").play()
        game.say( personaje, "¡Genial! encontré " + self.nombre() )
        arbusto.marcarIngredienteRecolectado()
    }
}

class Calabaza inherits Ingrediente {
    override method image() = "calabaza.png"

    override method nombre() = "calabaza"
}

class Cebolla inherits Ingrediente {
    override method image() = "cebolla.png"

    override method nombre() = "cebolla"
}

class Papa inherits Ingrediente {
    override method image() = "papa.png"

    override method nombre() = "papa"
}

class Choclo inherits Ingrediente {
    override method image() = "choclo.png"

    override method nombre() = "choclo"
}

class Recolectado {
    var property arbusto

    method position() = arbusto.position() 

    method interactuarCon(personaje) {
        game.sound("audioNoSePuede.mp3").play()
        game.say( personaje, "Ya recolecté el ingrediente" )
    }
}