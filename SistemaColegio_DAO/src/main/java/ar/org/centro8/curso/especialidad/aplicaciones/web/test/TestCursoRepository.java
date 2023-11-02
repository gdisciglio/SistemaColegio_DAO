package ar.org.centro8.curso.especialidad.aplicaciones.web.test;

import ar.org.centro8.curso.especialidad.aplicaciones.web.entities.Curso;
import ar.org.centro8.curso.especialidad.aplicaciones.web.enums.Dia;
import ar.org.centro8.curso.especialidad.aplicaciones.web.enums.Turno;
import ar.org.centro8.curso.especialidad.aplicaciones.web.repositories.interfaces.I_CursoRepository;
import ar.org.centro8.curso.especialidad.aplicaciones.web.repositories.jdbc.CursoRepository;

public class TestCursoRepository {
    public static void main(String[] args) {
        I_CursoRepository cr=new CursoRepository();

        System.out.println("-- .save() --");
        Curso curso=new Curso("HTML", "Sosa", Dia.JUEVES, Turno.MAÑANA);
        cr.save(curso);
        System.out.println(curso);

        System.out.println("-- .remove() --");
        cr.remove(cr.getById(20));

        System.out.println("-- .getAll() --");
        cr.getAll().forEach(System.out::println);
        
        System.out.println("-- .getCantidadAlumnos() --");
        System.out.println(cr.getCantidadAlumnos(cr.getById(1)));
        
    }
}
