<%@page import="ar.org.centro8.curso.especialidad.aplicaciones.web.entities.Curso"%>
<%@page import="ar.org.centro8.curso.especialidad.aplicaciones.web.repositories.jdbc.CursoRepository"%>
<%@page import="ar.org.centro8.curso.especialidad.aplicaciones.web.repositories.interfaces.I_CursoRepository"%>
<%@page import="java.util.List"%>
<%@page import="ar.org.centro8.curso.especialidad.aplicaciones.web.repositories.interfaces.I_AlumnoRepository"%>
<%@page import="ar.org.centro8.curso.especialidad.aplicaciones.web.repositories.jdbc.AlumnoRepository"%>
<%@page import="ar.org.centro8.curso.especialidad.aplicaciones.web.entities.Alumno"%>
<%
	String buscar="";
	if(request.getParameter("buscar")!=null){
		buscar=request.getParameter("buscar");
	}
	I_AlumnoRepository cr_A=new AlumnoRepository();
	List<Alumno>lista_A=cr_A.getLikeAlumno(buscar);
	
	I_CursoRepository cr_CR=new CursoRepository();
	
	for(Alumno alumno: lista_A){
		out.print("<tr>");
		out.print("<th>"+alumno.getId()+"</th>");
		out.print("<td>"+alumno.getNombre()+"</td>");
		out.print("<td>"+alumno.getApellido()+"</td>");
		out.print("<td>"+alumno.getEdad()+"</td>");
		
		Curso nombre_curso = cr_CR.getById(alumno.getIdCurso());
		out.print("<td>"+nombre_curso.getTitulo()+"</td>");
		
		out.print(	"<td>"+
					"<form action='/jsp/alumnosRemove.jsp' method='GET' onsubmit='return confirmarEliminacionAlumno()'>"+
					"<input type='text' class='form-control' value='"+alumno.getId()+"' name='idBorrar' hidden >"+
					"<button type='submit' class='btn btn-outline-danger'>"+
					"<img src='/images/trash.svg' alt='Eliminar' width='16' height='16' fill='currentColor' viewBox='0 0 16 16'>"+
					"</button>"+
					"</form>"+
					"</td>'"
				);
		out.print("</tr>");
	}
%>