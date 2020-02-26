class Sobreviviente {
	var property resistencia
	var property carisma
	var property estado
	var property armas = []
	var property poderBase
	
	method aumentarCarisma(cantidad) {
		carisma += cantidad
	}
	
	method aumentarResistencia(cantidad) {
		resistencia += cantidad
	}
	
	method cambiarEstado(nuevoEstado) {
		estado = nuevoEstado
	}
	
	method puedeAtacar() = resistencia > 12
	
	method atacar(caminante) {
		if(self.puedeAtacar()) {
			resistencia -= 2
			estado.atacar(self)
		}
	}
	
	method poderPropio() = poderBase * (1 + carisma / 100)
	
	method poderOfensivo() {
		return armas.anyOne().poderOfensivo() + self.poderPropio()
	}
	
	method tieneArmasRuidosas() = armas.any({ arma => arma.esRuidosa() })
	
	method agregarArmas(listaArmas) {
		armas.addAll(listaArmas)
	}
	
	method comer() {
		estado.comer(self)
	}
	
	method perderArma() {
		armas.remove(armas.anyOne())
	}
}

class Predador inherits Sobreviviente {
	var property esclavos = #{}
	
	override method atacar(caminante) {
		super(caminante)
		self.esclavizar(caminante)
	}
	
	method esclavizar(caminante) {
		if(caminante.estaDebil()) {
			esclavos.add(caminante)
		}
	}
	
	override method poderOfensivo() {
		return super() / 2 + esclavos.sum({ esclavo => esclavo.poderCorrosivo() })
	}
}
