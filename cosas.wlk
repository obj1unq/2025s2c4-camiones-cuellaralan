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