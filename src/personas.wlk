import manzanas.*
import simulacion.*

class Persona {
	var property estaAislada = false
	var property respetaLaCuarentena = false
	var property diaDeInfeccion = -1
	var property presentaSintomas = false
	var property estaInfectada = self.diaDeInfeccion()>-1
	const property manzana
	/*method estaInfectada() {		
		return diaDeInfeccion > -1
	}*/
	
	method diaYSintomas() {
		if (self.estaInfectada())
			if  ( presentaSintomas ) { return "La persona presenta sintomas y se infecto el dia " + diaDeInfeccion }
			else return "La persona no presenta sintomas y se infecto el dia " + diaDeInfeccion 
		else return "La persona no esta infectada"
	}
	
	
method infectarse() {
       estaInfectada= true
        diaDeInfeccion = simulacion.diaActual()
        if ( simulacion.tomarChance(30) ) { presentaSintomas = true }

    }
	method curacion(){
		
		if((simulacion.diaActual()-self.diaDeInfeccion()) >=20){
			self.diaDeInfeccion(0)
		}
	}
	
	
	

	
	
	
}

