<%@page import="ar.org.centro8.curso.especialidad.aplicaciones.web.repositories.interfaces.I_CursoRepository"%>
<%@page import="ar.org.centro8.curso.especialidad.aplicaciones.web.repositories.jdbc.CursoRepository"%>
<%@page import="ar.org.centro8.curso.especialidad.aplicaciones.web.entities.Curso"%>
<%@page import="ar.org.centro8.curso.especialidad.aplicaciones.web.enums.Dia"%>
<%@page import="ar.org.centro8.curso.especialidad.aplicaciones.web.enums.Turno"%>
<%
	String titulo = request.getParameter("titulo");
	String profesor = request.getParameter("profesor");
	String dia = request.getParameter("dia");
	String turno = request.getParameter("turno");
	
	if (titulo != null && profesor != null) {
		I_CursoRepository cr=new CursoRepository();
		Curso curso=new Curso(titulo,profesor,Dia.valueOf(dia),Turno.valueOf(turno));
		cr.save(curso);
		if(curso.getId()>=0){
			out.print("Se guardó Curso ID nº: " +
					   curso.getId() +
					   " -> " +
					   curso.getTitulo());
						
		}else{
			out.print("No se pudo guardar el Curso!");
		}
	}
%>