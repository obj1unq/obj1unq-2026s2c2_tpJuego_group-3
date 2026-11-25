// camino
object c {

    method configurar(position) {
        mapaNivel2.registrarPosicionTransitable(position)
    }
}

// terreno bloqueado
object x {

    method configurar(position) {
        // No hace nada: es terreno no transitable
    }
}

// terreno lago
object l {

    method configurar(position) {
        mapaNivel2.registrarPosicionTransitable(position)
    }
}





object mapaNivel2 {

    var posicionesTransitables = []     // guarda las coordenadas de todas las que tengan c o l

    var property activo = false           // si el nivel esta activo


    const dibujo = [
        [x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x],
        [x,x,x,x,x,x,c,c,c,c,c,c,c,c,c,c,c,x,x,x,x,x,x,x,x,x],
        [x,x,x,x,x,c,c,x,x,x,x,x,x,x,x,c,c,x,x,x,x,x,x,x,x,x],
        [x,x,c,x,x,c,c,x,x,x,x,x,x,x,x,c,c,x,x,x,x,x,x,x,x,x],
        [x,x,c,c,c,c,x,x,x,x,x,x,x,x,x,c,c,x,x,x,x,x,x,x,x,x],
        [x,c,c,x,x,x,x,x,x,x,x,x,x,x,x,c,c,x,x,x,x,x,x,x,x,x],
        [l,l,x,x,x,x,x,x,x,x,x,x,x,x,x,c,c,x,x,x,x,x,x,x,x,x],
        [l,l,x,x,x,x,x,c,c,c,x,x,x,x,c,c,x,x,x,x,x,x,x,x,x,x],
        [l,x,x,x,x,x,c,c,c,c,c,x,x,c,c,x,x,x,x,x,x,x,x,x,x,x],
        [l,l,x,x,x,c,c,x,x,x,c,c,c,c,x,x,x,x,x,c,c,c,c,c,c,x],
        [l,l,x,x,x,c,x,x,x,x,x,x,x,x,x,x,x,x,c,c,x,x,x,x,x,x],
        [l,c,c,x,x,c,x,x,x,x,x,x,x,x,x,x,x,c,c,x,x,x,x,x,x,x],
        [x,c,c,c,c,c,x,x,x,x,c,c,c,c,c,x,x,c,x,x,x,x,x,x,x,x],
        [x,x,x,x,x,c,c,c,c,c,c,x,x,c,c,x,x,c,x,x,x,x,x,x,x,x],
        [x,x,x,x,x,x,x,x,x,x,x,x,x,c,c,x,x,c,x,x,x,x,x,x,x,x],
        [x,x,x,x,x,x,x,x,x,x,x,x,c,c,c,c,c,c,x,x,x,x,x,x,x,x], //15
        [x,x,x,x,x,x,x,x,x,x,x,x,c,c,c,c,c,c,x,x,x,x,x,x,x,x],
        [x,x,x,x,x,x,x,x,x,x,x,x,c,x,x,x,c,c,c,x,x,x,x,x,x,x],
        [x,x,x,x,x,x,x,x,x,x,x,x,c,c,x,c,c,c,c,c,x,x,c,c,c,c],
        [x,x,x,x,x,x,x,x,x,x,x,x,c,c,c,c,c,x,x,c,c,c,c,x,x,x],
        [x,x,x,x,x,x,x,x,x,x,x,x,c,c,c,c,x,x,x,x,c,c,c,x,x,x],
        [x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x],
        [x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x],
        [x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x],
        [x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x],
        [x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x]
    ].reverse()


    method configurar() {
        activo = true
        posicionesTransitables = []
        (0..game.width() - 1).forEach({ x => (0..game.height() - 1).forEach({ y => self.configurar(x, y)})})  // los forEach recorren todas las posiciones
    }


    method configurar(x, y) {    // procesa cada celda
        dibujo.get(y).get(x).configurar(game.at(x, y))
    }


    method registrarPosicionTransitable(position) {
        posicionesTransitables.add(position)
    }

    method esTransitable(position) {
        return not activo or posicionesTransitables.contains(position)
    }

    method desactivar() {
        activo = false
    }
}