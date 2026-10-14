import personaje.*
class Inventario {
    var property numeroDeSlot
    var property position
    var property personaje

    method image() {
        return "slot" + if(personaje.ingredientes().size() > numeroDeSlot){ 
            const ingrediente = personaje.ingredientes().get(numeroDeSlot)
            "-con-" + ingrediente.nombre() + ".png"
        } else {
            "-vacio.png"
        }
            
    }
    method text() { //Correccion del profe
        return self.image()
    }
}



