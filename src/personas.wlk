import manzanas.*
import simulacion.*

class Persona {
	var property estaAislada = false
	var property respetaLaCuarentena = false
	var property diaDeInfeccion = 0
	var property presentaSintomas = false

	method estaInfectada() {		
		return diaDeInfeccion > 0
	}
	
	method diaYSintomas() {
		if (self.estaInfectada())
			if  ( presentaSintomas ) { return "La persona presenta sintomas y se infecto el dia " + diaDeInfeccion }
			else return "La persona no presenta sintomas y se infecto el dia " + diaDeInfeccion 
		else return "La persona no esta infectada"
	}
	
	method infectarse(simul) {
		diaDeInfeccion = simul.diaActual()
		
	}
	
	
	

	
	
	
}

