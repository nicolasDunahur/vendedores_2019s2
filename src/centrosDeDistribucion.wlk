import vendedores.*

class CentroDeDistribucion {
	
	var property ciudad
	var property vendedores =[]
	
	method agregarVendedor(unVendedor){
		if (vendedores.contains(unVendedor)){
			self.error("Ya esta en la lista")
		}
		vendedores.add(unVendedor)
	}
	
	method vendedorEstrella(){
		return vendedores.max({v => v.puntajeTotalDeCertificaciones()})
	}
	
	method puedeCubrir(unaCiudad){
		return vendedores.any({v => v.puedeTrabajar(unaCiudad)})
	}
	
	method susVendedoresGenericos(){
		return vendedores.map({v => v.esGenerico()})
	}
	
	method esRobusto(){
		return vendedores.filter({ v => v.esFirme()}).size() > 2
	}
	
	method repartirCertificacion(unaCertificacion){
		vendedores.forEach({ v => v.agregarCertificacion(unaCertificacion)})
	}
	
	method vendedorCandidato(unVendedor){
		return unVendedor.esVersatil() and unVendedor.afinidadConCD(self)
	}
	
}
