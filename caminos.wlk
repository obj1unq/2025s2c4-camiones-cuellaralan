import camion.*

object ruta9 {
    var property nivel = 20
    
    method nivelDePeligrosidad() = nivel
    method soporaElVieaje() = camion.puedeCircularEnRutaDeNivel(nivel)

  
}
object caminosVecinales {
  var property pesoMaximoPermitido = 20 
  method soporaElVieaje() = camion.pesoTotal() < pesoMaximoPermitido
}