object almacen {
  var property cosas = #{} 

    method almacenar(unaCosa) {
        cosas.add(unaCosa)
    }

    method almacenarCarga(carga) {
      cosas = cosas + carga
    }


}