import wollok.game.*
import personaje.*
import factory.*
import colision-y-clases.*
import ingredientes.*

// NIVEL 1
class Arbusto inherits Visual {
    var property position
    var property tipo 
    var property contenido = null // yarará, vacío o ingrediente, se setean despues del new

    method image() {
      return "arbusto-" + tipo.cuerpo() + ".png"
    }

    method serInspeccionadoPor(personaje) {
      self.marcarComoBuscado()
      contenido.interactuarCon(personaje)
    }

    method marcarComoBuscado() {
      tipo.estado("buscado")
    }

    method esUnArbusto() = true

    method marcarIngredienteRecolectado() {
      contenido = new Recolectado( arbusto = self )
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

  method position() = arbusto.position()

  method interactuarCon(personaje) {
    game.say( personaje, "¡Qué lástima che! acá solo hay yuyo" )
  }
}

// NIVEL 2
object pampero inherits Perseguidor( position = game.at(15,15) ) {
  method image() = "pampero.png"

  override method interactuarCon(personaje) {
    game.sound("audioPampero.mp3").play()
    game.say( personaje, "¡Ay virgencita! ¡Se me dio vuelta el mundo!" )
    personaje.marearse()
    self.aparecerEnUnLugarAleatorio()
  }

  method aparecerEnUnLugarAleatorio() {
    position = generadorDeAleatoriedad.posicionAleatoria()
  }
}
