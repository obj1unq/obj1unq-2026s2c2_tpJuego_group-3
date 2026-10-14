import wollok.game.*

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


    method image() {
        return "morral3.png"
    }
}