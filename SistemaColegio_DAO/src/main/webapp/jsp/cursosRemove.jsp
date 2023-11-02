<%@page import="ar.org.centro8.curso.especialidad.aplicaciones.web.repositories.interfaces.I_CursoRepository"%>
<%@page import="ar.org.centro8.curso.especialidad.aplicaciones.web.repositories.jdbc.CursoRepository"%>
<%@page import="ar.org.centro8.curso.especialidad.aplicaciones.web.entities.Curso"%>
<%
	int idBorrar = Integer.parseInt(request.getParameter("idBorrar"));
	I_CursoRepository cr=new CursoRepository();
	cr.remove(cr.getById(idBorrar));
	response.sendRedirect("/cursos.jsp");
%>