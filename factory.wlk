import obstaculos.*
import enemigos.*

// const new TipoArbusto( morfología = "flores", estado = "simple" )
// const new TipoArbusto( morfología = "flores", estado = "buscado" )
// const new TipoArbusto( morfología = "hojas", estado = "simple" )
// const new TipoArbusto( morfología = "hojas", estado = "buscado" )

object factoryArbustos {
    method crear(){
        const contenido = [
            "yarará", "vacío", "cebolla", "calabaza", "choclo", "papa" // cuando tenga los objetos hechos esto cambia
        ]

        const posibleContenidoMezclado = contenido.randomized() // documentacion wollok: Answers a new list of the same type and with the same content in a random order

        (0..5).forEach( { elemento => 
            const arbusto = new Arbusto( 
                    position = generadorDeAleatoriedad.posicionAleatoria(),
                    tipo = generadorDeAleatoriedad.tipoArbustoAleatorio(),
                    contenido = posibleContenidoMezclado.get(elemento)
                )
                game.addVisual(arbusto)
            }
        )
    }
}


object generadorDeAleatoriedad {
    method posicionAleatoria() {
        return game.at(
            ( 5..game.width() - 5).anyOne(),
            ( 5..game.height() - 5).anyOne()
        )
    }

    method tipoArbustoAleatorio() {
        const morfologías = ["hojas", "flores"]

        return new TipoArbusto( morfología = morfologías.anyOne(), estado = "simple")
    }
}

object vacío {
  
}