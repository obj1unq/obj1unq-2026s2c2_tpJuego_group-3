import wollok.game.*

object mate {

    var property position = game.at(1, 24)
    
    var property disponible = true


    method puedeUsarse() {
        return disponible
    }


    method usar() {
        disponible = false
    }


    method image() {
        return "mate.png"
    }
}





