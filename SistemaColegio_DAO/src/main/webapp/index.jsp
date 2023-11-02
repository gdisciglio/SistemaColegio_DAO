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
	<%@ include file="/jsp/head.jsp" %>
</head>
<body onload="startTime()">

	<div class="container-lg bg-secondary-subtle">
	
		<%@ include file="/jsp/menu.jsp" %>
	
		<h1 class="text-center text-primary bg-primary-subtle">Sistema de Colegio</h1>
		<img src="/images/colegio.jpg" class="img-fluid" alt="colegio">
	</div>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
		crossorigin="anonymous">
		
	</script>
</body>
</html>