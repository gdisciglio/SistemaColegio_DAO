<%@page import="ar.org.centro8.curso.especialidad.aplicaciones.web.repositories.interfaces.I_AlumnoRepository"%>
<%@page import="ar.org.centro8.curso.especialidad.aplicaciones.web.repositories.jdbc.AlumnoRepository"%>
<%@page import="ar.org.centro8.curso.especialidad.aplicaciones.web.entities.Alumno"%>
<%
	int idBorrar = Integer.parseInt(request.getParameter("idBorrar"));
	I_AlumnoRepository cr=new AlumnoRepository();
	cr.remove(cr.getById(idBorrar));
	response.sendRedirect("/alumnos.jsp");
%>