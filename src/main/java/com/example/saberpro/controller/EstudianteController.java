package com.example.saberpro.controller;

import com.example.saberpro.model.Alumno;
import com.example.saberpro.model.Resultado;
import com.example.saberpro.service.EstudianteService;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
@RequestMapping("/estudiante")
public class EstudianteController {

    @Autowired
    private EstudianteService estudianteService;

    // Dashboard del estudiante con su info y resultados
    @GetMapping("/dashboard")
    public String dashboard(HttpSession session, Model model) {

        // Alumno guardado en sesión por el login manual
        Alumno alumnoSesion = (Alumno) session.getAttribute("usuario");
        if (alumnoSesion == null) {
            // Si no hay alumno en sesión, vuelve al login
            return "redirect:/login";
        }

        // Cargar datos completos del alumno desde la BD
        Alumno alumnoCompleto = estudianteService.obtenerAlumnoPorId(alumnoSesion.getId());
        if (alumnoCompleto == null) {
            model.addAttribute("mensajeError",
                    "No se encontró información del alumno en la base de datos.");
            return "dashboard_estudiante";
        }

        // Alumno para la vista
        model.addAttribute("alumno", alumnoCompleto);

        // Resultados por área desde la tabla resultados
        List<Resultado> resultados =
                estudianteService.obtenerResultadosPorAlumno(alumnoCompleto.getId());
        model.addAttribute("resultados", resultados);

        // Beneficios o indicación de repetir
        String mensajeBeneficio = estudianteService.obtenerMensajeBeneficio(alumnoCompleto);
        model.addAttribute("mensajeBeneficio", mensajeBeneficio);

        // /WEB-INF/views/dashboard_estudiante.jsp
        return "dashboard_estudiante";
    }
}
