object knightRider {
    method peso() {
        return 500
    }

    method nivelDePeligrosidad() {
        return 10
    }
}

object bumblebee {
    var estaComoAuto = true

    method cambiarForma() {
        estaComoAuto = !estaComoAuto
    }

    method peso() {
        return 800
    }

    method nivelDePeligrosidad() {
        return if(estaComoAuto) 15 else 30
    }
}

object paqueteDeLadrillos {
    var property cantidadDeLadrillos = 0
    
    method peso() {
        return 2 * cantidadDeLadrillos
    }

    method nivelDePeligrosidad() {
        return 2
    }
}

object arenaAgranel {
    var property peso = 0

    method nivelDePeligrosidad() {
        return 1
    }
}

object bateriaAntiaerea {
    var estaConMisiles = false

    method cargarMisiles() {
        estaConMisiles = true
    }

    method descargarMisiles() {
        estaConMisiles = false
    }

    method peso() {
        return if(estaConMisiles) 300 else 200
    }

    method nivelDePeligrosidad() {
        return if(estaConMisiles) 100 else 0
    }
}

object contenedorPortuario {
    const property contenido = []

    method agregarContenido(unElemento) {
        contenido.add(unElemento)
    }

    method quitarContenido(unElemento) {
        contenido.remove(unElemento)
    }

    method peso() {
        return 100 + contenido.sum({unaCosa => unaCosa.peso()})
    }

    method nivelDePeligrosidad() {
        return if(contenido.isEmpty()) 0 else contenido.max({unaCosa => unaCosa.nivelDePeligrosidad()}).nivelDePeligrosidad()
    }
}

object residuosRadioactivos {
    var property peso = 0

    method nivelDePeligrosidad() {
        return 200
    }
}

object embalajeDeSeguridad {
    var property unElemento = bumblebee

    method peso() {
        return unElemento.peso()
    }

    method nivelDePeligrosidad() {
        return unElemento.nivelDePeligrosidad() / 2
    }
}