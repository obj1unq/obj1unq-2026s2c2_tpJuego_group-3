import wollok.game.*
import personaje.*
import factory.*

// NIVEL 1
class Arbusto {
    // tiene tres situaciones: puede estar vacio, tener un ingrediente o puede aparecer una yarará.
    var property position
    var property tipo // tipoArbusto: con hojas o flores
    var property contenido = null// yarará, vacío o ingrediente (por ahora son 4), se setean despues del new

    method image() {
      return "arbusto-" + tipo.cuerpo() + ".png"
    }

    method serInspeccionado() {
      tipo.estado("buscado")
    }

    method esUnArbusto() {
      return true
    }
}

class TipoArbusto {
    var property morfología // "floresRosas" o "floresAmarillas"
    var property estado = "simple"

    method cuerpo() {
        return morfología + "-" + estado
    }
}

class Vacío {
  var property arbusto

  method position() {return arbusto.position()}

  method interactuarCon(personaje) {
    game.say( personaje, "¡Qué lástima che! acá solo hay yuyo" )
  }
}

// NIVEL 2
object pampero {
  var property position = game.at(15,15)

  method image() = "pampero.png"

  method interactuarCon(personaje) {
    // se podria agregar audio de viento fuerte
    game.say( personaje, "¡Ay virgencita! ¡Se me dio vuelta el mundo!" )
    personaje.marearse()
    self.aparecerEnUnLugarAleatorio()
  }

  method aparecerEnUnLugarAleatorio() {
    position = generadorDeAleatoriedad.posicionAleatoria()
  }

  method perseguirPersonaje() {
    const objetivo = jacinta.position()
    const nuevaPosicionX = ( position.x() + self.dirección( position.x(), objetivo.x()) ).max(0).min( game.width() - 1 )
    const nuevaPosicionY = ( position.y() + self.dirección( position.y(), objetivo.y()) ).max(0).min( game.height() - 1 )
    position = game.at(nuevaPosicionX, nuevaPosicionY)
  }

  method dirección(actual, objetivo) {
    if (objetivo > actual) return 1
    if (objetivo < actual) return -1
    return 0
  }
}
