use colegio;

INSERT INTO cursos (titulo, profesor, dia, turno) VALUES
    ('Matemática', 'Profesor A', 'LUNES', 'MAÑANA'),
    ('Historia', 'Profesor B', 'MARTES', 'TARDE'),
    ('Inglés', 'Profesor C', 'MIERCOLES', 'MAÑANA'),
    ('Física', 'Profesor D', 'JUEVES', 'TARDE'),
    ('Química', 'Profesor E', 'VIERNES', 'NOCHE'),
    ('Literatura', 'Profesor F', 'LUNES', 'NOCHE'),
    ('Biología', 'Profesor G', 'MARTES', 'MAÑANA'),
    ('Geografía', 'Profesor H', 'MIERCOLES', 'TARDE'),
    ('Arte', 'Profesor I', 'JUEVES', 'MAÑANA'),
    ('Música', 'Profesor J', 'VIERNES', 'TARDE');
    
INSERT INTO alumnos (nombre, apellido, edad, idCurso) VALUES
    ('Juan', 'Pérez', 20, 1),
    ('María', 'González', 22, 2),
    ('Carlos', 'López', 19, 3),
    ('Laura', 'Rodríguez', 21, 4),
    ('Pedro', 'Martínez', 18, 5),
    ('Ana', 'Hernández', 20, 6),
    ('Luis', 'García', 23, 7),
    ('Sofía', 'Fernández', 19, 8),
    ('Diego', 'Torres', 20, 9),
    ('Elena', 'Sánchez', 21, 10);