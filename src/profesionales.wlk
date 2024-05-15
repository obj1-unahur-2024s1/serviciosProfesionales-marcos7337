class Empresa {
	const profecionalesContratados = []
	var honorarios
	
	method honorarioDeReferencia() = honorarios
	method honorarioDeReferencia(nuevoHonorario) { honorarios = nuevoHonorario}
	
	method contratar(profesional) { profecionalesContratados.add(profesional) }
	method despedir(profesional) { profecionalesContratados.remove(profesional) }
	method cuantosEstudiaronEn(universidad) = profecionalesContratados.count({x => (x.universidad() == universidad)})
	method profecionalesCaros() = profecionalesContratados.filter({x => (x.honorariosPorHora() > self.honorarioDeReferencia())})
	method universidadesFormadoras() {
		const univFormadoras = #{}
		univFormadoras.addAll(profecionalesContratados.map({x => x.universidad()}))
		return univFormadoras
	}
	method esDeGenteAcotada() = profecionalesContratados.all({x => (x.provinciasDondePuedeTrabajar().size() <= 3)})
}

// esta clase está completa, no necesita nada más
class ProfesionalAsociado {
	var universidad
	
	method universidad() { return universidad }
	method universidad(univ) { universidad = univ }
	
	method provinciasDondePuedeTrabajar() { return #{"Entre Ríos", "Corrientes", "Santa Fe"} }
	
	method honorariosPorHora() { return 3000 }
}


// a esta clase le faltan métodos
class ProfesionalVinculado {
	var universidad = "nada"
	
	method universidad() { return universidad }
	method universidad(univ) { universidad = univ }
	
	method provinciasDondePuedeTrabajar() = universidad.provincia()
	method honorariosPorHora() = universidad.honorarios()
	
}


// a esta clase le faltan atributos y métodos
class ProfesionalLibre {
	var provincias
	var universidad
	var honorarios
	
	method universidad() { return universidad }
	method universidad(univ) { universidad = univ }
	
	method provinciasDondePuedeTrabajar() = provincias
	method provinciasDondePuedeTrabajar(grupoProvincias) {provincias = grupoProvincias}
	
	method honorariosPorHora() = honorarios
	method honorariosPorHOra(cantidad) {honorarios = cantidad}
}

class Universidad {
	var provincia
	var honorarios
	
	method provincia() = provincia
	method provincia(nuevaProvincia) { provincia = nuevaProvincia }
	
	method honorarios() = honorarios
	method honorarios(cantidad) { honorarios = cantidad}
}
