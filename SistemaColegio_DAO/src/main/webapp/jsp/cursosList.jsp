<%@page import="ar.org.centro8.curso.especialidad.aplicaciones.web.connectors.Connector"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.util.List"%>
<%@page import="ar.org.centro8.curso.especialidad.aplicaciones.web.repositories.interfaces.I_CursoRepository"%>
<%@page import="ar.org.centro8.curso.especialidad.aplicaciones.web.repositories.jdbc.CursoRepository"%>
<%@page import="ar.org.centro8.curso.especialidad.aplicaciones.web.entities.Curso"%>
<%
	I_CursoRepository cr=new CursoRepository();
	List<Curso>lista=cr.getAll();
	
	for(Curso curso: lista){
		out.print("<option>"+ curso.getTitulo() +"</option>");
	}
	
%>