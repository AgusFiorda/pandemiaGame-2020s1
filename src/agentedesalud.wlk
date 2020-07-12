import wollok.game.*
import manzanas.*
import personas.*
import simulacion.*
object agenteDeSalud {
	var property image 
    var property position = game.origin()
   	
	method moverAgente(){
	        keyboard.up().onPressDo({self. moverseHacia(self.position().up(1))})
	        keyboard.down().onPressDo({self. moverseHacia(self.position().down(1))})
	        keyboard.right().onPressDo({self. moverseHacia(self.position().right(1))})
	        keyboard.left().onPressDo({self. moverseHacia(self.position().left(1))})
		}
		method  moverseHacia(direccion){
        position = direccion
    }		
    method aislar(){
    	
    		Manzana.personas.filter({p=>p.presentaSintomas()}).forEach({p=>p.estaAislada(true)})
    		
    }
    
    
    
		}