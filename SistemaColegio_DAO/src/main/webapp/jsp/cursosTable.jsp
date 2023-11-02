<%@page import="java.util.List"%>
<%@page import="ar.org.centro8.curso.especialidad.aplicaciones.web.repositories.interfaces.I_CursoRepository"%>
<%@page import="ar.org.centro8.curso.especialidad.aplicaciones.web.repositories.jdbc.CursoRepository"%>
<%@page import="ar.org.centro8.curso.especialidad.aplicaciones.web.entities.Curso"%>
<%@page import="ar.org.centro8.curso.especialidad.aplicaciones.web.enums.Dia"%>
<%@page import="ar.org.centro8.curso.especialidad.aplicaciones.web.enums.Turno"%>
<%
	String buscar="";
	if(request.getParameter("buscar")!=null){
		buscar=request.getParameter("buscar");
	}
	I_CursoRepository cr=new CursoRepository();
	List<Curso>lista=cr.getLikeTitulo(buscar);
	
	for(Curso curso: lista){
		out.print("<tr>");
		out.print("<th>"+curso.getId()+"</th>");
		out.print("<td>"+curso.getTitulo()+"</td>");
		out.print("<td>"+curso.getProfesor()+"</td>");
		out.print("<td>"+curso.getDia()+"</td>");
		out.print("<td>"+curso.getTurno()+"</td>");
		out.print("<td>"+cr.getCantidadAlumnos(curso)+"</td>");
		out.print(	"<td>"+
					"<form action='/jsp/cursosRemove.jsp' method='GET' onsubmit='return confirmarEliminacionCurso()'>"+
					"<input type='text' class='form-control' value='"+curso.getId()+"' name='idBorrar' hidden >"+
				    //"<input type='text' class='form-control' value='"+cr.getCantidadAlumnos(curso)+"' name='cantidadAlumnos' hidden>"+
					"<button type='submit' class='btn btn-outline-danger'>"+
					"<img src='/images/trash.svg' alt='Eliminar' width='16' height='16' fill='currentColor' viewBox='0 0 16 16'>"+
					"</button>"+
					"</form>"+
					"</td>'"
				);
		out.print("</tr>");
	}
%>