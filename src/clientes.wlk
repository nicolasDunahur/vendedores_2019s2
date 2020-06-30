import vendedores.*
import centrosDeDistribucion.*

class Cliente {
	method puedeSerAtendidoPor(unVendedor)
	
}

class Inseguro inherits Cliente {
	
	override method puedeSerAtendidoPor(unVendedor){
		return unVendedor.esVersatil() and unVendedor.esFirme()
	}
}

class Detallista inherits Cliente {
	
	override method puedeSerAtendidoPor(unVendedor){
		return unVendedor.tresOMasCertificacionesSobreProductos()
	}
}

class Humanista inherits Cliente {
	
	override method puedeSerAtendidoPor(unVendedor){
		return unVendedor.esPersonaFisica()
}