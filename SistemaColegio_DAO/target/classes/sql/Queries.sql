-- 1- Obtener todos los cursos:
SELECT * FROM cursos;

-- 2- Obtener los nombres y apellidos de los alumnos junto con el título del curso al que están inscritos:
SELECT a.nombre, a.apellido, c.titulo
	FROM alumnos a
	INNER JOIN cursos c ON a.idCurso = c.id;

-- 3- Obtener los cursos que se imparten los martes:
SELECT * FROM cursos WHERE dia = 'MARTES';

-- 4- Obtener el número de alumnos por curso:
SELECT c.titulo, COUNT(a.id) AS cantidad_alumnos
	FROM cursos c
	LEFT JOIN alumnos a ON c.id = a.idCurso
	GROUP BY c.titulo;

-- 5- Obtener los cursos que tienen más de 20 alumnos inscritos:
SELECT c.titulo, COUNT(a.id) AS cantidad_alumnos
	FROM cursos c
	LEFT JOIN alumnos a ON c.id = a.idCurso
	GROUP BY c.titulo
	HAVING COUNT(a.id) > 20;