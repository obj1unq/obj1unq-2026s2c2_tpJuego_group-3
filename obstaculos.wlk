import wollok.game.*

// Los obstaculos son nivel 1: arbustos del pastizal , nivel 2: viento, nivel 3: parejas que bailan.

class Arbusto {
    // tiene tres situaciones que son random: la primera es que puede estar vacio, la segunda es que 
    // puede tener un ingrediente y la tercera es que puede tener a la yarará.

    var property position
    var property tipo // tipoArbusto: con hojas o flores
    var property contenido // yarará, vacío o ingrediente (por ahora son 4)

    method image() {
      return "arbusto-" + tipo.cuerpo() + ".png"
    }

    method serInspeccionado() {
      tipo.estado("buscado")
    }
}

class TipoArbusto {
    var property morfología // "hojas" o "flores"
    var property estado = "simple"

    method cuerpo() {
        return morfología + "-" + estado
    }
}
