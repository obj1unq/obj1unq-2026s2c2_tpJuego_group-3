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
    const vida1 = new IconoVida(position = game.at(1, 24))
    const vida2 = new IconoVida(position = game.at(2, 24))
    const vida3 = new IconoVida(position = game.at(3, 24))
        
    method actualizar(cantidad) {
        vida1.actualizar(cantidad >= 1)
        vida2.actualizar(cantidad >= 2)
        vida3.actualizar(cantidad >= 3)
    }

    method reiniciar(cantidad) {
        vida1.actualizar(false)
        vida2.actualizar(false)
        vida3.actualizar(false)

        self.actualizar(cantidad)
    }
}

object mate {
    var property position = game.at(5, 24)
    
    var property estado = cargado

    method puedeUsarse() {
        return estado.sePuedeUsar()
    }

    method usar() {
        estado = descargado
    }

    method image() {
        return estado.imagen()
    }


    method recargar() {
        estado = cargado
    }

}



object cargado {

    const sePuedeUsar = true

    method imagen(){
        return "mate.png"
    }

    method sePuedeUsar(){
        return sePuedeUsar
    }
}



object descargado {

    const sePuedeUsar = false

    method imagen(){
        return "mate-inactivo.png"
    }

    method sePuedeUsar(){
        return sePuedeUsar
    }
}



object lago {
    var property activo = false

    method activar() {
        activo = true
    }

    method desactivar() {
        activo = false
    }

    method contiene(position) {        // la posicion donde esta jacinta, si esta dentro del lago y el lago esta activo, devuelve true
        return activo and 
               position.x().between(0, 1) and
               position.y().between(14, 19)
    }
}