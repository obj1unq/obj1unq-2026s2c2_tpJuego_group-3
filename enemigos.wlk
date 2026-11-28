import personaje.*
import colision-y-clases.*
import direcciones.*

// NIVEL 1
class Yarará inherits Colisionable {
    var property arbusto

    method position() { return arbusto.position() }

    method image() {
        return "yarara.png"
    }

    override method interactuarCon(personaje) {
        game.addVisual(self)
        game.sound("audioYarara.mp3").play()
        personaje.ataqueDeEnemigo()
        game.say( personaje, "¡Ay! me picó una yarará" )
        personaje.serEmpujada()
    }
}

// NIVEL 2
object lobizón inherits Perseguidor( position = game.at(20, 20) ) {
    const nombreTick = "movimientoLobizon"

    method image() = "lobizon.png"

    override method interactuarCon(personaje) {
        if ( personaje.tieneFacon() ) {
            game.say( self, "¡Grrggrrgrr!" )
            self.desaparecer()
        } else {
            game.say( personaje, "¡Aia!" )
            game.say( self, "¡Grrggrrgrr!" )
            personaje.ataqueDeEnemigo()
        }
    }

    method desaparecer() {
        game.removeTickEvent(nombreTick)
        game.removeVisual(self)
    }
}


// NIVEL 3
class ParejaDeBaile inherits Visual {
  const imagen
  const property posicionX 
  const objetivo = jacinta 
  const property tipoProyectil // alpargata, pañuelo o sombrero
  var proyectilesLanzados = 0 // contador
  const proyectilesMáximos = 10

  method image() = imagen

  method position() = game.at( posicionX , self.posicionY() )

  method posicionY() {
    return if ( objetivo.position().y() > 11 ) 11 else objetivo.position().y().max(2)
  }

  method lanzarProyectil() { 
    if ( self.puedeSeguirLanzandoProyectil() ) {
      proyectilesLanzados += 1
      self.lanzar()
    }
  }

  method puedeSeguirLanzandoProyectil() {
    return proyectilesLanzados < proyectilesMáximos
  }

  method lanzar() {
    const proyectilALanzar = tipoProyectil.anyOne()
    const proyectil = proyectilALanzar.construir( self.position(), objetivo )
    proyectil.serLanzado()
  }
}

class Proyectil inherits Perseguidor {
  method image()

  method serLanzado() {
    game.addVisual(self)
    self.iniciarMovimiento()
  }

  method iniciarMovimiento() {
    const nombreTick = "proyectil-" + self.identity().toString()

    game.onTick( 600 , nombreTick, {
      if ( game.hasVisual(self) ) {
          self.lanzarse(nombreTick)
      } else {
          game.removeTickEvent(nombreTick)
      }
    })
  }

  method lanzarse(nombreTick) {
    self.perseguirAPersonaje()

    if ( self.estáEnLaMismaPosiciónQue(objetivo) ) {
      self.interactuarCon(objetivo)
      self.desaparecer(nombreTick)
    }
  }

  method estáEnLaMismaPosiciónQue(obj) {
    return position == obj.position()
  }

  override method interactuarCon(personaje){
    if ( personaje.tieneFacon() ) {
      self.serEliminadoPor(personaje)
    } else {
        self.impactar(personaje)
    }
    game.removeVisual(self)
  }

  method serEliminadoPor(personaje) {
    game.say( personaje, "Qué mala puntería che" )
  }

  method impactar(personaje){
    personaje.ataqueDeEnemigo()
  }

  method desaparecer(nombreTick) {
    game.removeTickEvent(nombreTick)
    game.removeVisual(self)
  }
}

class Alpargata inherits Proyectil {
  override method image() = "alpargata.png"

  override method impactar(personaje){
    super(personaje)
    game.say( personaje, "¡Me dio en el ojo!" )
  }
}

class Pañuelo inherits Proyectil {
  override method image() = "panuelo.png"

  override method impactar(personaje){
    super(personaje)
    game.say( personaje, "¡Me voy a enganchar!" )
  }
}

class Sombrero inherits Proyectil {
  override method image() = "sombrero.png"

  override method impactar(personaje){
    super(personaje)
    game.say( personaje, "¡Auch!" )
  }
}

object constructorAlpargata { 
    method construir(pos, obj) {
        return new Alpargata( position = pos, objetivo = obj )
    }
}

object constructorSombrero { 
    method construir(pos, obj) {
        return new Sombrero( position = pos, objetivo = obj )
    }
}

object constructorPañuelo { 
    method construir(pos, obj) {
        return new Pañuelo( position = pos, objetivo = obj )
    }
}