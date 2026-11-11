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
}

object morral {
    var property ingredientes = []    // lo hice como lista porque entiendo que puede tener repetidos

    var property position = game.at(12, 24)

    method agregarIngrediente(ingrediente) {
        ingredientes.add(ingrediente)
    }

    method tiene(ingrediente) {
        return ingredientes.contains(ingrediente)
    }

    method cantidadIngredientes() {
        return ingredientes.size()
    }
}

