package com.example.saberpro.service;

import com.example.saberpro.model.Alumno;
import com.example.saberpro.model.Beneficio;
import com.example.saberpro.model.Resultado;
import com.example.saberpro.repository.AlumnoRepository;
import com.example.saberpro.repository.ResultadoRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class EstudianteService {

    @Autowired
    private AlumnoRepository alumnoRepository;

    @Autowired
    private ResultadoRepository resultadoRepository;

    @Autowired
    private BeneficioService beneficioService;

    // Obtener alumno por ID (sin cargar resultados aquí)
    public Alumno obtenerAlumnoPorId(Long id) {
        return alumnoRepository.findById(id).orElse(null);
    }

    // Obtener alumno por correo (para login)
    public Alumno obtenerAlumnoPorCorreo(String correo) {
        Optional<Alumno> opt = alumnoRepository.findByCorreo(correo);
        return opt.orElse(null);
    }

    // Obtener lista de resultados por alumno (para la tabla del dashboard)
    public List<Resultado> obtenerResultadosPorAlumno(Long alumnoId) {
        return resultadoRepository.findByAlumnoId(alumnoId);
    }

    // Mensaje para el alumno sobre beneficios o repetir examen
    public String obtenerMensajeBeneficio(Alumno alumno) {
        if (alumno == null || alumno.getPuntajeTotal() == null) {
            return "Resultado aún no registrado.";
        }

        if (alumno.getPuntajeTotal() < 80) { // Umbral para repetir
            return "No alcanzó el puntaje mínimo. Debe volver a presentar las pruebas.";
        }

        List<Beneficio> beneficios =
                beneficioService.obtenerBeneficiosPorPuntaje(alumno.getPuntajeTotal());

        if (beneficios.isEmpty()) {
            return "No aplica a ningún beneficio por ahora.";
        }

        StringBuilder sb = new StringBuilder("Beneficios otorgados: ");
        for (Beneficio b : beneficios) {
            sb.append(b.getDescripcion()).append("; ");
        }
        return sb.toString();
    }
}
