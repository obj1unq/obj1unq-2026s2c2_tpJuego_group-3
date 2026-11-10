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