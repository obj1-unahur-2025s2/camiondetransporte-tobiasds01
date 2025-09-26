object camion {
    const property carga = []

    method cargar(elemento) {
        carga.add(elemento)
    }

    method descargar(elemento) {
        carga.remove(elemento)
    }

    method pesoTotal() {
        return 1000 + carga.sum({unaCosa => unaCosa.peso()})
    }

    method tieneTodoPesoPar() {
        return carga.all({unaCosa => unaCosa.peso().even()})
    }

    method hayAlgunoConPeso(unPeso) {
        return carga.any({unaCosa => unaCosa.peso() == unPeso})
    } 

    method primeroConNivel(unNivel) {
        return carga.find({unaCosa => unaCosa.nivelDePeligrosidad() == unNivel})
    }

    method cosasQueSuperanElNivel(unNivel) {
        return carga.filter({unaCosa => unaCosa.nivelDePeligrosidad() > unNivel})
    }

    method cosasQueSuperanPeligrosidadDe(unElemento) {
        return carga.filter({unaCosa => unaCosa.nivelDePeligrosidad() > unElemento.nivelDePeligrosidad()})
    }

    method excedeElPesoMaximo() {
        return self.pesoTotal() > 2500
    }

    method puedeCircularEnRuta(nivelDePeligrosidad) {
        return !self.excedeElPesoMaximo() && self.cosasQueSuperanElNivel(nivelDePeligrosidad).isEmpty()
    }

    method tieneAlgoEntreValores(primerValor, segundoValor) {
        return carga.any({unaCosa => unaCosa.peso().between(primerValor, segundoValor)})
    }

    method cosaMasPesada() {
        return carga.max({unaCosa => unaCosa.peso()})
    }
}