<%@page import="ar.org.centro8.curso.especialidad.aplicaciones.web.repositories.interfaces.I_CursoRepository"%>
<%@page import="ar.org.centro8.curso.especialidad.aplicaciones.web.repositories.interfaces.I_AlumnoRepository"%>
<%@page import="ar.org.centro8.curso.especialidad.aplicaciones.web.repositories.jdbc.AlumnoRepository"%>
<%@page import="ar.org.centro8.curso.especialidad.aplicaciones.web.repositories.jdbc.CursoRepository"%>
<%@page import="ar.org.centro8.curso.especialidad.aplicaciones.web.entities.Alumno"%>
<%@page import="ar.org.centro8.curso.especialidad.aplicaciones.web.entities.Curso"%>
<%@page import="java.util.List"%>
<%
	String nombre = request.getParameter("nombre");
	String apellido = request.getParameter("apellido");
	String edad = request.getParameter("edad");
	String curso = "";
	int idCurso = 0;
	
	if(request.getParameter("curso")!=null) curso=request.getParameter("curso");
	I_CursoRepository cr_C=new CursoRepository();
	List<Curso> lista_C=cr_C.getLikeTitulo(curso);
	for(Curso curso_C: lista_C){
		 idCurso = curso_C.getId();
	}
	
	if (nombre != null && apellido != null) {
		I_AlumnoRepository cr_A=new AlumnoRepository();
		Alumno alumno=new Alumno(nombre, apellido, Integer.parseInt(edad), idCurso);
		cr_A.save(alumno);
		if(alumno.getId()>=0){
			out.print("Se guardó Alumno ID nº: " +
					   alumno.getId() + 
					   " -> " +
					   alumno.getNombre() +
					   " " + 
					   alumno.getApellido());
		}else{
			out.print("No se pudo guardar alumno!");
		}
	}
%>