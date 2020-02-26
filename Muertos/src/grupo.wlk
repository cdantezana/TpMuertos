class Grupo {
	var property miembros = #{}
	
	method lider() = miembros.max({ sobreviviente => sobreviviente.carisma() })
	
	method poderOfensivo() = miembros.sum({ sobreviviente => sobreviviente.poderOfensivo() })
	
	method algunoTieneArmasRuidosas() = miembros.any({ sobreviviente => sobreviviente.tieneArmasRuidosas() })

	method miembroMasDebil() = miembros.min({ sobreviviente => sobreviviente.poderOfensivo() })

	method tomar(lugar) {
		lugar.tomar(self)
	}
	
	method atacantes() = miembros.filter({ sobreviviente => sobreviviente.puedeAtacar() })
}
