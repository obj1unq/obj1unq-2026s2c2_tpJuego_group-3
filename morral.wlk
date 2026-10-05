object morral {

    var property ingredientes = []    // lo hice como lista porque entiendo que puede tener repetidos


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