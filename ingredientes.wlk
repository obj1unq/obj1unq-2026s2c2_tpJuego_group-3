import morral.*

class Calabaza {

    var property arbusto

    method position() { return arbusto.position() }

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

class Cebolla {

    var property arbusto

    method position() { return arbusto.position() }

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

class Papa {

    var property arbusto

    method position() { return arbusto.position() }

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

class Choclo {

    var property arbusto

    method position() { return arbusto.position() }

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
