object saludable {
	method atacar(sobreviviente) {}
	method comer(sobreviviente) {}
}

object arrebatado {
	method atacar(sobreviviente) {
		sobreviviente.aumentarCarisma(1)
	}
	method comer(sobreviviente) {
		sobreviviente.aumentarResistencia(50)
		sobreviviente.aumentarCarisma(20)
	}
}

object infectado {
	var property cantAtaques = 0
	
	method atacar(sobreviviente) {
		sobreviviente.aumentarCarisma(-3)
		if(cantAtaques++ == 5){
			sobreviviente.cambiarEstado(desmayado)
		}
	}
	method comer(sobreviviente) {
		if(cantAtaques > 3){
			cantAtaques = 0
		}
		else {
			sobreviviente.cambiarEstado(saludable)
		}
		sobreviviente.aumentarResistencia(40)
	}
}

object desmayado {
	method atacar(sobreviviente) {}
	method comer(sobreviviente) {
			sobreviviente.cambiarEstado(saludable)
	}
}
