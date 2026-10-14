import morral.*

object calabaza {
    method image() {
        return "calabaza.png"
    }

    method nombre() {
        return "calabaza"
    }

    method interactuarCon(personaje) {
        morral.agregarIngrediente(self)
        game.say( personaje, "¡Genial! encontré " + self.nombre() )
    }
}

object cebolla {
    method image() {
        return "cebolla.png"
    }

    method nombre() {
        return "cebolla"
    }

    method interactuarCon(personaje) {
        morral.agregarIngrediente(self)
        game.say( personaje, "¡Genial! encontré " + self.nombre() )
    }
}

object papa {
    method image() {
        return "papa.png"
    }

    method nombre() {
        return "papa"
    }

    method interactuarCon(personaje) {
        morral.agregarIngrediente(self)
        game.say( personaje, "¡Genial! encontré " + self.nombre() )
    }
}

object choclo {
    method image() {
        return "choclo.png"
    }

    method nombre() {
        return "choclo"
    }

    method interactuarCon(personaje) {
        morral.agregarIngrediente(self)
        game.say( personaje, "¡Genial! encontré " + self.nombre() )
    }
}
