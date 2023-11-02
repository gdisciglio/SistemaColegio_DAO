<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page
	import="ar.org.centro8.curso.especialidad.aplicaciones.web.connectors.Connector"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/jsp/head.jsp"%>
<script src="/js/main.js"></script>
</head>
<body onload="startTime()">

	<div class="container-lg bg-secondary-subtle">

		<%@ include file="/jsp/menu.jsp"%>

		<h1 class="text-center text-primary bg-primary-subtle">Registro de cursos</h1>
		<form>
			<div class="p-2 m-1">
				<!-- control curso  -->
				<div class="mb-3 row">
					<label for="titulo" class="col-sm-3 col-form-label text-primary">Título</label>
					<div class="col-sm-9">
						<input type="text" class="form-control text-primary" required
							minlength="3" maxlength="20" name="titulo" id="titulo">
					</div>
				</div>
			</div>
			<div class="p-2 m-1">
				<!-- control profesor  -->
				<div class="mb-3 row">
					<label for="profesor" class="col-sm-3 col-form-label text-primary">Profesor</label>
					<div class="col-sm-9">
						<input type="text" class="form-control text-primary" required
							minlength="3" maxlength="20" name="profesor" id="profesor">
					</div>
				</div>
			</div>
			<div class="p-2 m-1">
				<!-- control select día  -->
				<div class="mb-3 row">
					<label for="dia" class="col-sm-3 col-form-label text-primary">Día</label>
					<div class="col-sm-9">
						<select class="form-select text-primary" name="dia" id="dia">
							<option value="LUNES">Lunes</option>
							<option value="MARTES">Martes</option>
							<option value="MIERCOLES">Miércoles</option>
							<option value="JUEVES">Jueves</option>
							<option value="VIERNES">Viernes</option>
						</select>
					</div>
				</div>
			</div>
			<div class="p-2 m-1">
				<!-- control select turno  -->
				<div class="mb-3 row">
					<label for="turno" class="col-sm-3 col-form-label text-primary">Turno</label>
					<div class="col-sm-9">
						<select class="form-select text-primary" name="turno" id="turno">
							<option value="MAÑANA">Mañana</option>
							<option value="TARDE">Tarde</option>
							<option value="NOCHE">Noche</option>
						</select>
					</div>
				</div>
			</div>
			<div class="p-2 m-1">
				<!-- control información  -->
				<div class="mb-3 row">
					<label for="informacion"
						class="col-sm-3 col-form-label text-primary">Información</label>
					<div class="col-sm-9">
						<input type="text" readonly class="form-control text-primary"
							id="informacion"
							value='<%@ include file="/jsp/cursosInsert.jsp" %>'>
					</div>
				</div>
			</div>
			<!-- botones -->
			<div class="mb-3 row">
				<button type="reset" class="btn btn-danger col-sm-3 m-2">Borrar</button>
				<button type="submit" class="btn btn-success col-sm-3 m-2">Guardar</button>
			</div>
		</form>
		<div>
			<table class="table table-striped">
				<thead>
					<tr>
						<th scope="col">ID</th>
						<th scope="col">Curso</th>
						<th scope="col">Profesor</th>
						<th scope="col">Día</th>
						<th scope="col">Turno</th>
						<th scope="col">NºAlumnos</th>
						<th scope="col">Borrar</th>
					</tr>
				</thead>
				<tbody>
					<%@ include file="/jsp/cursosTable.jsp"%>
				</tbody>
			</table>
		</div>


	</div>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
		crossorigin="anonymous">
		
	</script>
</body>
</html>