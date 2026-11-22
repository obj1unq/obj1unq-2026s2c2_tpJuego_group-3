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