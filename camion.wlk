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
}