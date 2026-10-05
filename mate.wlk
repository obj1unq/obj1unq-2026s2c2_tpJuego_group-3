import personaje.*

object mate {

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





