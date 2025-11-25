package com.example.saberpro.service;

import com.example.saberpro.model.Alumno;
import com.example.saberpro.model.Beneficio;
import com.example.saberpro.repository.AlumnoRepository;
import com.example.saberpro.service.BeneficioService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CoordinadorService {

    @Autowired
    private AlumnoRepository alumnoRepository;

    @Autowired
    private BeneficioService beneficioService;

    // Listar todos los alumnos
    public List<Alumno> listarAlumnos() {
        return alumnoRepository.findAll();
    }

    // Guardar alumno (nuevo o editar)
    public void guardarAlumno(Alumno alumno) {
        alumnoRepository.save(alumno);
    }

    // Obtener alumno por id
    public Alumno obtenerAlumnoPorId(Long id) {
        return alumnoRepository.findById(id).orElse(null);
    }

    // Eliminar alumno por id
    public void eliminarAlumno(Long id) {
        alumnoRepository.deleteById(id);
    }

    // Contar total alumnos
    public long countAlumnos() {
        return alumnoRepository.count();
    }

    // Promedio de puntaje total de alumnos
    public double promedioPuntajeAlumnos() {
        List<Alumno> alumnos = alumnoRepository.findAll();
        return alumnos.stream()
                .mapToDouble(a -> a.getPuntajeTotal() != null ? a.getPuntajeTotal() : 0)
                .average()
                .orElse(0);
    }

    // Obtener beneficios aplicables para un alumno según puntaje total
    public List<Beneficio> obtenerBeneficiosAlumno(Alumno alumno) {
        if (alumno.getPuntajeTotal() == null) return List.of();
        return beneficioService.obtenerBeneficiosPorPuntaje(alumno.getPuntajeTotal());
    }
}
