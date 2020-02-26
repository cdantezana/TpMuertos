class Lugar {
	var property caminantes = []
		
	method poderCorrosivo() = caminantes.sum({ caminante => caminante.poderCorrosivo() })

	method puedeTomarse(grupo) = true
	
	method tomar(grupo) {}
}

class Prision inherits Lugar {
	var property pabellones
	var property armas = []
	
	override method puedeTomarse(grupo) = grupo.poderOfensivo() > pabellones*2
	
	override method tomar(grupo) {
		grupo.miembroMasDebil().agregarArmas(armas)
		armas = []
	}
}

class Granja inherits Lugar {
	override method tomar(grupo) {
		grupo.miembros().forEach({ sobreviviente => sobreviviente.comer() })
	}
}

class Bosque inherits Lugar {
	var property tieneNiebla
	
	override method puedeTomarse(grupo) = !grupo.algunoTieneArmasRuidosas()
	
	override method tomar(grupo) {
		if(tieneNiebla) {
			grupo.miembros().anyOne().perderArma()
		}
	}
}