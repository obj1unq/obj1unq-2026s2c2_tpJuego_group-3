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
}

object abajo {
    method siguiente(position) {
        const nuevaPosition = position.down(1) 
        mapa.validarDentro(nuevaPosition)
        return nuevaPosition
    }
}

object derecha {
    method siguiente(position) {
        const nuevaPosition = position.right(1) 
        mapa.validarDentro(nuevaPosition)
        return nuevaPosition
    }
}

object izquierda{
    method siguiente(position) {
        const nuevaPosition = position.left(1) 
        mapa.validarDentro(nuevaPosition)
        return nuevaPosition
    }
}
