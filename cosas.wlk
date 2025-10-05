object knightRider {
	method peso() = 500
	
	method nivelPeligrosidad() = 10
}

object arenaAGranel {
	var property peso = 100
	const peligrosidad = 1
	
	method nivelPeligrosidad() = peligrosidad
}

object bumblebee {
	var property transformacion = auto
	
	method peso() = 800
	
	method nivelPeligrosidad() = transformacion.nivelPeligrosidad()
}

object auto {
	const peligrosidad = 15
	
	method nivelPeligrosidad() = peligrosidad
}

object robot {
	const peligrosidad = 30
	
	method nivelPeligrosidad() = peligrosidad
}

object paqueteLadrillos {
	var property cantidadLadrillos = 1
	const pesoUnLadrillo = 2
	const peligrosidad = 2
	
	method peso() = cantidadLadrillos * pesoUnLadrillo
	
	method nivelPeligrosidad() = peligrosidad
}

object bateriaAntiaerea {
	var property tieneMisiles = true
	const pesoConMisiles = 300
	const pesoSinMisiles = 200
	method peso() {return if (tieneMisiles)  pesoConMisiles else  pesoSinMisiles} 
	method nivelPeligrosidad() {
	  return if (tieneMisiles)  100 else 0
	}
}

object residuosRadiactivos {
	var property peso = 50
	const peligrosidad = 200
	
	method nivelPeligrosidad() = peligrosidad
}

object contenedor {
  const property cosas = #{}
  const property tara = 100

  method peso() = tara + cosas.sum({ cosa => cosa.peso() })

  method nivelPeligrosidad() {
	return if (cosas.isEmpty()) 0 else cosas.max({ cosa => cosa.nivelPeligrosidad() }).nivelPeligrosidad()
  }
  method cargar(unaCosa) {
		//no se puede cargar algo ya cargado
		cosas.add(unaCosa)
	}
}

object embalaje{
	var property cosa = bumblebee
	method peso() = cosa.peso()
	method nivelPeligrosidad() = cosa.nivelPeligrosidad() / 2
} 
  
