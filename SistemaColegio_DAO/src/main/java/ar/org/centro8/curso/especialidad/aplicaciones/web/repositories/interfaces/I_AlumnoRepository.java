package ar.org.centro8.curso.especialidad.aplicaciones.web.repositories.interfaces;

import java.util.ArrayList;
import java.util.List;
import ar.org.centro8.curso.especialidad.aplicaciones.web.entities.Alumno;

public interface I_AlumnoRepository {
	void save(Alumno alumno);
	void remove(Alumno alumno);
	void update(Alumno alumno);
	List<Alumno>getAll();

	default Alumno getById(int id) {
		return getAll()
				       .stream()
				       .filter(alumno->alumno.getId()==id)
				       .findFirst()
				       .orElse(new Alumno());
	}
	
	default List<Alumno>getLikeAlumno(String buscarAlumno){
		if(buscarAlumno==null) return new ArrayList<Alumno>();
		return getAll()
					   .stream()
					   .filter(alumno->alumno
									         .getApellido()
									         .toLowerCase()
									         .contains(buscarAlumno.toLowerCase()) 
									         || 		//busqueda por apellido o por nombre
									   alumno
									         .getNombre()
									         .toLowerCase()
									         .contains(buscarAlumno.toLowerCase()))
					   .toList();										
	}
}
