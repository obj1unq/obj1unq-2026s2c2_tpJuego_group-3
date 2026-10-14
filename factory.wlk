import obstaculos.*
import enemigos.*
import ingredientes.*


// const new TipoArbusto( morfología = "flores", estado = "simple" )
// const new TipoArbusto( morfología = "flores", estado = "buscado" )
// const new TipoArbusto( morfología = "hojas", estado = "simple" )
// const new TipoArbusto( morfología = "hojas", estado = "buscado" )

object constructorYarara { //Correccion del profe
    method construir(arbusto) {
        return new Yarará(arbusto = arbusto)
    }
}

object constructorVacio {//Correccion del profe
    method construir(arbusto) {
        return new Vacío(arbusto=arbusto)
    }
}



object factoryArbustos {
    method crear(){
        const contenido = [
            constructorYarara, constructorVacio, cebolla, calabaza, choclo, papa
        ]

        //const posibleContenidoMezclado = contenido.randomized() // documentacion wollok: Answers a new list of the same type and with the same content in a random order

        (0..5).forEach( { elemento => 
            const arbusto = new Arbusto( 
                    position = generadorDeAleatoriedad.posicionAleatoria(),
                    tipo = generadorDeAleatoriedad.tipoArbustoAleatorio()
                )
                arbusto.contenido(contenido.anyOne().construir(arbusto)) //correccion del profe
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

        return new TipoArbusto( morfología = morfologías.anyOne(), estado = "simple" )
    }
}