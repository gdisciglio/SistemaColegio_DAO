package ar.org.centro8.curso.especialidad.aplicaciones.web.repositories.jdbc;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import ar.org.centro8.curso.especialidad.aplicaciones.web.connectors.Connector;
import ar.org.centro8.curso.especialidad.aplicaciones.web.entities.Curso;
import ar.org.centro8.curso.especialidad.aplicaciones.web.enums.Dia;
import ar.org.centro8.curso.especialidad.aplicaciones.web.enums.Turno;
import ar.org.centro8.curso.especialidad.aplicaciones.web.repositories.interfaces.I_CursoRepository;

public class CursoRepository implements I_CursoRepository {

    Connection conn=Connector.getConnection();

    @Override
    public List<Curso> getAll() {
        List<Curso>lista=new ArrayList<>();
        try(ResultSet rs=conn
        					  .createStatement()
        					  .executeQuery("select * from cursos where activo='s'")) {
            while(rs.next()){
                lista.add(new Curso(
                    rs.getInt("id"), 
                    rs.getString("titulo"), 
                    rs.getString("profesor"), 
                    Dia.valueOf(rs.getString("dia")), 
                    Turno.valueOf(rs.getString("turno"))
                    ));
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return lista;
    }
    
    @Override
    public void save(Curso curso) {
        if(curso==null) return;
        try (PreparedStatement ps=conn.prepareStatement(
            "insert into cursos (titulo, profesor, dia, turno) values (?,?,?,?)",
            PreparedStatement.RETURN_GENERATED_KEYS
        )) {
            ps.setString(1, curso.getTitulo());
            ps.setString(2, curso.getProfesor());
            ps.setString(3, curso.getDia().toString());
            ps.setString(4, curso.getTurno().toString());
            ps.execute();
            ResultSet rs=ps.getGeneratedKeys();
            if(rs.next()) curso.setId(rs.getInt(1));
        } catch (Exception e) {
            System.out.println(e);
        }
    }

    @Override
    public void remove(Curso curso) {
        if(curso==null) return;
        /*int cantidadAlumnos = getCantidadAlumnos(curso);
        if(cantidadAlumnos > 0) {
            
        } else {*/
        //try (PreparedStatement ps=conn.prepareStatement("delete from cursos where id=?")) {
        try (PreparedStatement ps=conn.prepareStatement("update cursos set activo='n' where id=?")) {
            ps.setInt(1, curso.getId());
            ps.execute();
        } catch (Exception e) {
            System.out.println(e);
          }
     }
 

    @Override
    public void update(Curso curso) {
        if(curso==null) return;
        
    }

	@Override
	public int getCantidadAlumnos(Curso curso) {
		if(curso==null) return 0;
		String query="select count(*) cantidad from alumnos where activo='s' and idCurso="+curso.getId();
		int cantidad=0;
		try (ResultSet rs=conn.createStatement().executeQuery(query)){
			if(rs.next()) cantidad=rs.getInt("cantidad");
		} catch (Exception e) {
			System.out.println(e);
		}
		return cantidad;
	}
    
    
    
}
