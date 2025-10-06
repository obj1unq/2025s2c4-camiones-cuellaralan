object knightRider {
	const bultos = 1
	
	method peso() = 500
	
	method nivelPeligrosidad() = 10
	
	method cantidadBultos() = bultos
	
	method reaccionarAlAccidente() {
		
	}
}

object arenaAGranel {
	var property peso = 100
	const peligrosidad = 1
	const bultos = 1
	
	method nivelPeligrosidad() = peligrosidad
	
	method cantidadBultos() = bultos
	
	method reaccionarAlAccidente() {
		peso += 20
	}
}

object bumblebee {
	var property transformacion = auto
	const bultos = 2
	
	method cantidadBultos() = bultos
	
	method peso() = 800
	
	method nivelPeligrosidad() = transformacion.nivelPeligrosidad()
	
	method reaccionarAlAccidente() {
		transformacion = transformacion.modoContrario()
	}
}

object auto {
	const peligrosidad = 15
	
	method nivelPeligrosidad() = peligrosidad
	
	method modoContrario() = robot
}

object robot {
	const peligrosidad = 30
	
	method nivelPeligrosidad() = peligrosidad
	
	method modoContrario() = auto
}

object paqueteLadrillos {
	var property cantidadLadrillos = 1
	const pesoUnLadrillo = 2
	const peligrosidad = 2
	
	method peso() = cantidadLadrillos * pesoUnLadrillo
	
	method nivelPeligrosidad() = peligrosidad
	
	//revisar
	method cantidadBultos() = if (cantidadLadrillos.between(1, 100)) {
		1
	} else {
		if (cantidadLadrillos.between(101, 300)) 2 else 3
	}
	
	method reaccionarAlAccidente() {
		if (cantidadLadrillos < 12) {
			cantidadLadrillos = 0
		} else {
			cantidadLadrillos -= 12
		}
	}
}

object bateriaAntiaerea {
	var property tieneMisiles = true
	const pesoConMisiles = 300
	const pesoSinMisiles = 200
	
	method peso() = if (tieneMisiles) pesoConMisiles else pesoSinMisiles
	
	method nivelPeligrosidad() = if (tieneMisiles) 100 else 0
	
	method cantidadBultos() = if (!tieneMisiles) 1 else 2

	method reaccionarAlAccidente() {
		tieneMisiles = false
	}
}

object residuosRadiactivos {
	var property peso = 50
	const peligrosidad = 200
	const bultos = 1
	
	method cantidadBultos() = bultos
	
	method nivelPeligrosidad() = peligrosidad
	
	method reaccionarAlAccidente() {
		peso += 15
	}
}

object contenedor {
	const property cosas = #{}
	const property tara = 100
	const bultos = 1
	
	method peso() = tara + cosas.sum({ cosa => cosa.peso() })
	
	method nivelPeligrosidad() = if (cosas.isEmpty()) 0
	                             else cosas.max(
	                             		{ cosa => cosa.nivelPeligrosidad() }
	                             	).nivelPeligrosidad()
	
	method cargar(unaCosa) {
		//no se puede cargar algo ya cargado
		cosas.add(unaCosa)
	}
	
	method cantidadBultos() = bultos + cosas.sum(
		{ paquete => paquete.cantidadBultos() }
	)
	
	method reaccionarAlAccidente() {
		cosas.forEach({ cosa => cosa.reaccionarAlAccidente() })
	}
}

object embalaje {
	var property cosa = bumblebee
	const bultos = 2
	
	method cantidadBultos() = bultos
	
	method peso() = cosa.peso()
	
	method nivelPeligrosidad() = cosa.nivelPeligrosidad() / 2
	
	method reaccionarAlAccidente() {
		
	}
}