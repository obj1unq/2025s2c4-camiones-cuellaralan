object knightRider {
	method peso() = 500
	
	method nivelPeligrosidad() = 10
	const bultos = 1
	method cantidadBultos() = bultos
}

object arenaAGranel {
	var property peso = 100
	const peligrosidad = 1
	method nivelPeligrosidad() = peligrosidad
	const bultos = 1
	method cantidadBultos() = bultos

}

object bumblebee {
	var property transformacion = auto
	const bultos = 2
	method cantidadBultos() = bultos
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
	//revisar
	method cantidadBultos()
	{
		return if(cantidadLadrillos.between(1, 100)) 1
		       else if(cantidadLadrillos.between(101, 300)) 2
		       else 3
	}
}

object bateriaAntiaerea {
	var property tieneMisiles = true
	const pesoConMisiles = 300
	const pesoSinMisiles = 200
	
	method peso() = if (tieneMisiles) pesoConMisiles else pesoSinMisiles
	
	method nivelPeligrosidad() = if (tieneMisiles) 100 else 0

	method cantidadBultos() = if(!tieneMisiles) 1 else 2
}

object residuosRadiactivos {
	var property peso = 50
	const peligrosidad = 200
	const bultos = 1
	method cantidadBultos() = bultos
	method nivelPeligrosidad() = peligrosidad
}

object contenedor {
	const property cosas = #{}
	const property tara = 100
	
	method peso() = tara + cosas.sum({ cosa => cosa.peso() })
	
	method nivelPeligrosidad() = if (cosas.isEmpty()) 0
	                             else cosas.max(
	                             		{ cosa => cosa.nivelPeligrosidad() }
	                             	).nivelPeligrosidad()
	
	method cargar(unaCosa) {
		//no se puede cargar algo ya cargado
		cosas.add(unaCosa)
	}
	const bultos = 1
	method cantidadBultos() = bultos + cosas.sum({paquete => paquete.cantidadBultos()})
}

object embalaje {
	var property cosa = bumblebee
	const bultos = 2
	method cantidadBultos() = bultos
	
	method peso() = cosa.peso()
	
	method nivelPeligrosidad() = cosa.nivelPeligrosidad() / 2
	
}