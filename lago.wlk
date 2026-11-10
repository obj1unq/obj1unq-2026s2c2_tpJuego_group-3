object lago {

    method contiene(position) {
        return position.x().between(0, 1) and         // coordenadas provisorias
               position.y().between(14, 19)
    }

}