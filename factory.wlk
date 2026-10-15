import obstaculos.*
import enemigos.*
import ingredientes.*

// const new TipoArbusto( morfología = "flores", estado = "simple" )
// const new TipoArbusto( morfología = "flores", estado = "buscado" )
// const new TipoArbusto( morfología = "hojas", estado = "simple" )
// const new TipoArbusto( morfología = "hojas", estado = "buscado" )

object constructorYarara { //Correccion del profe
    method construir(arbusto) {
        return new Yarará( arbusto = arbusto )
    }
}

object constructorVacio {//Correccion del profe
    method construir(arbusto) {
        return new Vacío( arbusto = arbusto )
    }
}

object constructorCebolla {//Correccion del profe
    method construir(arbusto) {
        return new Cebolla( arbusto = arbusto )
    }
}

object constructorCalabaza {//Correccion del profe
    method construir(arbusto) {
        return new Calabaza( arbusto = arbusto )
    }
}

object constructorChoclo{//Correccion del profe
    method construir(arbusto) {
        return new Choclo( arbusto = arbusto )
    }
}

object constructorPapa {//Correccion del profe
    method construir(arbusto) {
        return new Papa( arbusto = arbusto )
    }
}

object factoryArbustos {
    method crear(){
        const contenidos = [
            constructorYarara, constructorVacio, constructorCebolla, constructorCalabaza, constructorChoclo, constructorPapa, constructorVacio, constructorYarara, constructorVacio, constructorYarara, constructorVacio
        ]

        //const posibleContenidoMezclado = contenido.randomized() // documentacion wollok: Answers a new list of the same type and with the same content in a random order

        contenidos.forEach( { contenido => 
            const arbusto = new Arbusto( 
                    position = generadorDeAleatoriedad.posicionAleatoria(),
                    tipo = generadorDeAleatoriedad.tipoArbustoAleatorio()
                )
                arbusto.contenido(contenido.construir(arbusto)) //correccion del profe
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