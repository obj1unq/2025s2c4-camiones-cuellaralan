import cosas.*

object camion {
	const property cosas = #{}
		
	method cargar(unaCosa) {
		//no se puede cargar algo ya cargado
		cosas.add(unaCosa)
	}

	method descarga(unaCosa) {
		//no se puede descargar si no esta cargada
		cosas.remove(unaCosa)
	}

}
