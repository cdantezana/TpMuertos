class Caminante {
	var property sed
	var property estaSomnoliento
	var property dientes
	
	method poderCorrosivo() = 2 * sed + dientes
	
	method estaDebil() = sed < 15 && estaSomnoliento
}
