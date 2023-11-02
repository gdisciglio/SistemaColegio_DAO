package ar.org.centro8.curso.especialidad.aplicaciones.web.repositories.jdbc;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import ar.org.centro8.curso.especialidad.aplicaciones.web.connectors.Connector;
import ar.org.centro8.curso.especialidad.aplicaciones.web.entities.Alumno;
import ar.org.centro8.curso.especialidad.aplicaciones.web.repositories.interfaces.I_AlumnoRepository;

public class AlumnoRepository implements I_AlumnoRepository {
	
	Connection conn=Connector.getConnection();

	@Override
	public List<Alumno> getAll() {
		List<Alumno>lista_A=new ArrayList<>();
		try(ResultSet rs=conn
							 .createStatement()
							 .executeQuery("select a.id, a.nombre, a.apellido, a.edad, c.id as idCurso " +
										   "from alumnos a " +
										   "inner join cursos c " +
										   "on a.idCurso = c.id " +
										   "where a.activo='s';")){
            while(rs.next()){
                lista_A.add(new Alumno(
                		rs.getInt("id"),
                		rs.getString("nombre"),
                		rs.getString("apellido"),
                		rs.getInt("edad"),
                		rs.getInt("idCurso")
                    ));
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return lista_A;
    }
	
	@Override
	public void save(Alumno alumno) {
		if(alumno==null) return;
        try (PreparedStatement ps=conn.prepareStatement(
            "insert into alumnos (nombre, apellido, edad, idCurso) values (?,?,?,?)",
            PreparedStatement.RETURN_GENERATED_KEYS
        )) {
            ps.setString(1, alumno.getNombre());
            ps.setString(2, alumno.getApellido());
            ps.setInt(3, alumno.getEdad());
            ps.setInt(4, alumno.getIdCurso());
            ps.execute();
            ResultSet rs=ps.getGeneratedKeys();
            if(rs.next()) alumno.setId(rs.getInt(1));
        } catch (Exception e) {
            System.out.println(e);
        }
		
	}

	@Override
	public void remove(Alumno alumno) {
		if(alumno==null) return;
        //try (PreparedStatement ps=conn.prepareStatement("delete from alumnos where id=?")) {
        try (PreparedStatement ps=conn.prepareStatement("update alumnos set activo='n' where id=?")) {
            ps.setInt(1, alumno.getId());
            ps.execute();
        } catch (Exception e) {
            System.out.println(e);
        }
		
	}

	@Override
	public void update(Alumno alumno) {
		if(alumno==null) return;
		
	}
	
}