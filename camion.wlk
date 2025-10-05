import cosas.*

object camion {
	const property cosas = #{}
	const property tara = 1000
	const property pesoMaximo = 2500
	
	method cargar(unaCosa) {
		//no se puede cargar algo ya cargado
		cosas.add(unaCosa)
	}
	
	method descarga(unaCosa) {
		//no se puede descargar si no esta cargada
		cosas.remove(unaCosa)
	}
	
	method todaCargaEsPar() = cosas.all({ paquete => paquete.peso().even() })
	
	method cargaConPesoIgualA(pesoCarga) = cosas.any(
		{ paquete => paquete.peso() == pesoCarga }
	)
	
	method pesoTotal() = tara + cosas.sum({ paquete => paquete.peso() })
	
	method cargaExcedidaDePeso() = self.pesoTotal() > pesoMaximo
	
	method cargaConPeligrosidadDe(unaPeligrosidad) = cosas.filter(
		{ paquete => paquete.nivelPeligrosidad() == unaPeligrosidad }
	)
	
	method cargaConPeligrosidadMayorA(peligrosidad) = cosas.filter(
		{ paquete => paquete.nivelPeligrosidad() > peligrosidad }
	)
	
	method cargaConPeligrosidadMayorAlPesoDe(
		unaCarga
	) = self.cargaConPeligrosidadMayorA(unaCarga.nivelPeligrosidad())
	
	method puedeCircularEnRutaDeNivel(
		unNivel
	) = (!self.cargaExcedidaDePeso()) && self.cargaConPeligrosidadMayorA(
		unNivel
	).isEmpty()
	
	method tieneAlgoQuePesaEntre_Y_(min, max) = cosas.any(
		{ paquete => paquete.peso().between(min, max) }
	)
	
	method cargaMasPesada() {
		var cosaMasPesada = null
		if (cosas.isEmpty()) self.error("no hay cosas cargadas")
		cosas.forEach(
			{ cosa => if (cosaMasPesada == null) {
					cosaMasPesada = cosa
				} else {
					if (cosa.peso() > cosaMasPesada.peso()) {
						cosaMasPesada = cosa
					}
				} }
		)
		return cosaMasPesada
	}
	
	method cargaMasPesada2() {
		if(cosas.isEmpty()) 
		{self.error("no hay cosas cargadas")}
		var cosaMasPesada = null
		cosas.forEach(
			{ cosa => if (cosaMasPesada == null) {
					cosaMasPesada = cosa
				} else {
					if (cosa.peso() > cosaMasPesada.peso()) {
						cosaMasPesada = cosa
					}
				} }
		)return cosaMasPesada
	}
}