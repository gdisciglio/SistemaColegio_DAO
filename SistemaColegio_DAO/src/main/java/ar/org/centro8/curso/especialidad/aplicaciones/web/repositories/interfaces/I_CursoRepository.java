package ar.org.centro8.curso.especialidad.aplicaciones.web.repositories.interfaces;

import java.util.List;
import ar.org.centro8.curso.especialidad.aplicaciones.web.entities.Curso;

public interface I_CursoRepository {
	void save(Curso curso);
	void remove(Curso curso);
	void update(Curso curso);
	List<Curso>getAll();
	
	int getCantidadAlumnos(Curso curso);
	
	default Curso getById(int id) {
		return getAll()
					   .stream()
					   .filter(curso->curso.getId()==id)
					   .findFirst()
					   .orElse(new Curso());
	}
	
	default List<Curso>getLikeTitulo(String titulo){
		return getAll()
						.stream()
						.filter(curso->curso
					                 		.getTitulo()
					                 		.toLowerCase()
					                 		.contains(titulo.toLowerCase()))
						.toList();
	}
}
