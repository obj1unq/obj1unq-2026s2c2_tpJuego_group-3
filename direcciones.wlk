import wollok.game.*

object mapa {
    method validarDentro(position) {
        if ( not self.dentroDelMapa(position) ) {
            self.error( position.toString() + " está fuera del mapa" )
        }
    }

    method dentroDelMapa(position) {
        return position.x().between( 0, game.width() -1 ) and position.y().between( 0, game.height() -1 )
    }
}

object arriba {
    method siguiente(position) {
        const nuevaPosition = position.up(1) 
        mapa.validarDentro(nuevaPosition)
        return nuevaPosition
    }
    
    method opuesta() = abajo

    method imagenPersonaje(conFacon) = if (conFacon) "jacintaConFacon.png" else "jacinta.png"
}

object abajo {
    method siguiente(position) {
        const nuevaPosition = position.down(1) 
        mapa.validarDentro(nuevaPosition)
        return nuevaPosition
    }

    method opuesta() = arriba

    method imagenPersonaje(conFacon) = if (conFacon) "jacintaConFacon.png" else "jacinta.png"
}

object derecha {
    method siguiente(position) {
        const nuevaPosition = position.right(1) 
        mapa.validarDentro(nuevaPosition)
        return nuevaPosition
    }

    method opuesta() = izquierda

    method imagenPersonaje(conFacon) = if (conFacon) "jacintaConFacon-derecha.png" else "jacinta-derecha.png"
}

object izquierda{
    method siguiente(position) {
        const nuevaPosition = position.left(1) 
        mapa.validarDentro(nuevaPosition)
        return nuevaPosition
    }

    method opuesta() = derecha

    method imagenPersonaje() = "jacinta.png"

    method imagenPersonaje(conFacon) = if (conFacon) "jacintaConFacon.png" else "jacinta.png"
}
