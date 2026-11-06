import wollok.game.*
import personaje.*
import morral.*
import mate.*
import gameManager.*
import configuraciones.*
class Nivel {
    var property personaje = jacinta

    method activarNivel() {
        game.clear()
    }

    method image()

    method validarFinal()

    method actualizarNivel(){
        self.validarFinal()
        return
    }

    method visualesDelNivel() 

    method visualesNecesarias()
    
}

object nivel1 inherits Nivel { // pastizal
    var property position = game.origin()
    const meta = metaNivel1

    method meta(){
        return meta
    }

    override method activarNivel() {
        super()
        game.sound("audioNivel1.mp3").play()
    }

    override method image() {
        return "fondoNivel1.jpg"
    }

    override method validarFinal(){
    if(morral.cantidadIngredientes() < 3) {
       self.error("No tengo todos los ingredientes para irme")
    }
}

    override method actualizarNivel(){
        super()
        return nivel2
    }

    override method visualesDelNivel() { 
        game.addVisual(mate)
        game.addVisual(metaNivel1)
    }

    override method visualesNecesarias() {
        return #{mate, metaNivel1, self}
    }

    method remover() {
        self.visualesNecesarias().forEach({visual => game.removeVisual(visual)})
    }

}

object nivel2 inherits Nivel {
    var property position = game.origin()

    override method image() {
        return "fondoNivel2.jpeg"
    }

    override method validarFinal(){
        if(personaje.vida() <= 0){ 
            self.error("Tengo que llegar al pueblo sano y salvo")
        }
    }

    override method actualizarNivel() {
        super()
        return nivel1
    }

    override method visualesDelNivel() {
        game.addVisual(metaNivel2)
    }

    override method visualesNecesarias() {
        return #{metaNivel2, self}
    }

    method remover() {
        self.visualesNecesarias().forEach({visual => game.removeVisual(visual)})
    }
}

object nivel3 inherits Nivel {
    var property position = game.origin()

    override method image() { //Falta el fondo del nivel 3
        return "gauchito.jpg"
    }

    override method validarFinal(){
        if(personaje.vida() <= 0){  //Me falta definir la condicion del nivel 3
            self.error("Tengo que llegar al pueblo sano y salvo")
        }
    }

    override method actualizarNivel() {
        super()//No sé si esto deberia ser, termino la parte de metas y lo evaluo
        return finDelJuego
    }

    override method visualesDelNivel() {
        game.addVisual(metaNivel3)
    }

    override method visualesNecesarias() {
        return #{metaNivel3, self}
    }
}

object finDelJuego {

    var property position = game.origin()

    method image() {
        return "finDelJuego.jpg"//Falta una pantalla de fin del juego
    }
}

class Meta {
    var property position = game.at(13, 5)
    method image()

    method configurarColision(personaje) {
        game.onCollideDo(self, { objeto => if (objeto == personaje) { self.interactuarCon() } })
    }

    method interactuarCon() { //Implemente el metodo de try catch que mostro el profesor leo
        try {
            gameManager.actualizarNivel()
        } catch e : Exception {
            game.say(self, e.message()) 
        }
    }
}
object metaNivel1 inherits Meta {
    override method image() = "meta.png" //Cambiar las imagenes de meta
}

object metaNivel2 inherits Meta {
    override method image() = "meta.png"
    override method position() = game.at(13, 16)
}

object metaNivel3 inherits Meta {
    override method position() = game.at(13, game.origin().y())
    override method image() = "meta.png"
}

