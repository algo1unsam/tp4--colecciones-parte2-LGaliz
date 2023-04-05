object espada{
    var property uso = false

    method poder(_personaje){
        if(not uso) return _personaje.poderBase() 
        else return _personaje.poderBase() / 2 
    }
    
    method usar(){
    	uso = true
    }
}

object collar {
    var property uso = 0
    const poderBase = 3
   
    method poder(_personaje){
        if(_personaje.poderBase() > 6) return poderBase + uso 
        else return poderBase
    }
    
    method usar(){
    	uso += 1
    }
}

object armadura {
	const poderBase = 6
  	
  	method usar(){}

	method poder(personaje) = poderBase
}

object libro {}

object castillo {
	
	const property artefactos = #{}
		
	method agregarArtefactos(_artefactos) {
		artefactos.addAll(_artefactos)		
	}
}


object rolando {
	const property artefactos = #{}
	const property historial = []
	var property capacidad = 2
	var property poderBase = 5

	method encontrar(artefacto) {
		if(artefactos.size() < capacidad) {
			artefactos.add(artefacto)
		}
		historial.add(artefacto)
	}
	
	method almacenarEn(lugar) {
		lugar.agregarArtefactos(artefactos)
		artefactos.clear()
	}	
	
	method posesiones() = self.artefactos() + castillo.artefactos()
	
	method tiene(artefacto) = self.posesiones().contains(artefacto)	
	
	method poder() = poderBase + self.poderDeTodosLosArtefactos()
	
	method poderDeTodosLosArtefactos() = artefactos.sum({item => item.poder(self)}) 
	
	method batalla(){
		poderBase += 1
		artefactos.forEach({artefacto => artefacto.usar()})
	}
}