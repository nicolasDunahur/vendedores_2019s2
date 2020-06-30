import centrosDeDistribucion.*
import clientes.*

class Vendedor {
	var property esPersonaFisica = true
	var property certificaciones = []
	method esVersatil(){
		return certificaciones().size()>2
			and certificaciones().any({ c => c.esSobreProductos()})
			and certificaciones().any({ c => not c.esSobreProductos()})
	}
	
	method puedeTrabajar(unaCiudad)
	
	method esFirme(){
		return self.puntajeTotalDeCertificaciones() >= 30
	}
	
	method esInflutente()
	
	method puntajeTotalDeCertificaciones(){
		return certificaciones.sum({certi => certi.puntos()})
	}
	
	method esGenerico(){
		return not certificaciones.any({cer => cer.esSobreProductos()})
	}
	
	method agregarCertificacion(unaCertificacion){
		certificaciones.add(unaCertificacion)
	}
	
	method afinidadConCD(unCentro){
		return self.puedeTrabajar(unCentro.ciudad())
	}
	
	method tresOMasCertificacionesSobreProductos(){
		return certificaciones.map({certi => certi.esSobreProductos()}).size() >2
	}
	
	
}

class Fijo inherits Vendedor {
	var property ciudadVive
	
	override method puedeTrabajar(unaCiudad){
		return unaCiudad == ciudadVive
	}
	
	override method esInflutente(){return false}
	
}

class Viajante inherits Vendedor {
	var property provinciaHabilitadas = []
	
	override method puedeTrabajar(unaCiudad){
		return provinciaHabilitadas.contains(unaCiudad)
	}
	override method esInflutente(){
		return provinciaHabilitadas.sum({prov => prov().poblacion()}))>10
	}
	
}

class ComercioCorresponsal inherits Vendedor {
	var property sucursalesEn = []
	override method puedeTrabajar(unaCiudad){
		return sucursalesEn.contains(unaCiudad)
	}
	override method esInflutente(){
		return 5 <= sucursalesEn.size()
			or 3 <= self.presenciaEnLasProvincias()	
	}
	
	method presenciaEnLasProvincias() {
		return sucursalesEn.map({ciudad => ciudad.provincia()}).asSet()
	}
	
	override method afinidadConCD(unCentro){
		return super() and
			sucursalesEn.forEach({sucu => not unCentro.puedeCubrir(sucu)})
	}
	/// chequear si esta bien o se puede hacer mejor
	
	override method esPersonaFisica(false) 
}

class Ciudad  {
	var property provincia
}

class Provincia {
	var property poblacion
}

class Certificacion {
	var property puntos
	var property esSobreProductos
}