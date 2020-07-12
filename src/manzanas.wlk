import personas.*
import simulacion.*
import wollok.game.*

class Manzana {
	const property personas = []
	var property position
	
	method image() {
		// reeemplazarlo por los distintos colores de acuerdo a la cantidad de infectados
		// también vale reemplazar estos dibujos horribles por otros más lindos
		return "blanco.png"
	}
	
	// este les va a servir para el movimiento
	method esManzanaVecina(manzana) {
		return manzana.position().distance(position) == 1
	}

	method pasarUnDia() {
		self.transladoDeUnHabitante()
		self.simulacionContagiosDiarios()
		// despues agregar la curacion
	}
	
	method personaSeMudaA(persona, manzanaDestino) {
		// implementar
		personas.remove(persona)
		manzanaDestino.agregarPersona(persona)
			
	}
	
	method cantidadContagiadores() {
		return  personas.count({p=>p.estaInfectada() and not p.estaAislada()})
		//TERMINADO
	}
	
	method noInfectades() {
		return personas.filter({ pers => not pers.estaInfectada() })
	} 	
	
	method simulacionContagiosDiarios() { 
		const cantidadContagiadores = self.cantidadContagiadores()
		if (cantidadContagiadores > 0) {
			self.noInfectades().forEach({ persona => 
				if (simulacion.debeInfectarsePersona(persona, cantidadContagiadores)) {
					persona.infectarse()
				}
			})
		}
	}
	
	method transladoDeUnHabitante() {
		const quienesSePuedenMudar = personas.filter({ pers => not pers.estaAislada() })
		if (quienesSePuedenMudar.size() > 2) {
			const viajero = quienesSePuedenMudar.anyOne()
			const destino = simulacion.manzanas().filter({ manz => self.esManzanaVecina(manz) }).anyOne()
			self.personaSeMudaA(viajero, destino)			
		}
	}
	// ESTE LO CREE YO
	method personasInfectadas(){
		return personas.count({p=>p.estaInfectada()})
	}
	
	method personasInfectadasNoAisladas() {
		return personas.filter({ p => p.estaInfectada() }).filter({ p => p.estaAislada() }).size()
	}

	method agregarPersona(persona){
		personas.add(persona)
	}
	method genteViviendo(){
		return self.personas().size()
	}
	
	
		
}
