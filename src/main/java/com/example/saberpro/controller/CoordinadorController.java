package com.example.saberpro.controller;

import com.example.saberpro.model.Alumno;
import com.example.saberpro.service.CoordinadorService;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
@RequestMapping("/coordinador")
public class CoordinadorController {

    @Autowired
    private CoordinadorService coordinadorService;

    // Dashboard con estadísticas y listado completo de alumnos
    @GetMapping("/dashboard")
    public String dashboard(HttpSession session, Model model) {

        // Opcional: validar que haya sesión de coordinador
        String rol = (String) session.getAttribute("rol");
        if (rol == null || !"COORDINADOR".equals(rol)) {
            return "redirect:/login";
        }

        // Estadísticas
        long totalAlumnos = coordinadorService.countAlumnos();
        double promedioPuntaje = coordinadorService.promedioPuntajeAlumnos();

        model.addAttribute("totalAlumnos", totalAlumnos);
        model.addAttribute("promedioPuntaje", promedioPuntaje);

        // Listado de alumnos para la tabla del dashboard
        List<Alumno> alumnos = coordinadorService.listarAlumnos();
        model.addAttribute("alumnos", alumnos);

        // /WEB-INF/views/dashboard_coordinador.jsp
        return "dashboard_coordinador";
    }

    // Redirigir listado a la misma pantalla de dashboard
    @GetMapping("/alumnos")
    public String listarAlumnos() {
        return "redirect:/coordinador/dashboard";
    }

    // Formulario nuevo alumno
    @GetMapping("/alumnos/nuevo")
    public String formularioCrearAlumno(Model model) {
        model.addAttribute("alumno", new Alumno());
        return "alumno_form";
    }

    // Guardar alumno
    @PostMapping("/alumnos")
    public String guardarAlumno(@ModelAttribute Alumno alumno) {
        coordinadorService.guardarAlumno(alumno);
        return "redirect:/coordinador/dashboard";
    }

    // Formulario editar alumno
    @GetMapping("/alumnos/editar/{id}")
    public String formularioEditarAlumno(@PathVariable Long id, Model model) {
        Alumno alumno = coordinadorService.obtenerAlumnoPorId(id);
        model.addAttribute("alumno", alumno);
        return "alumno_form";
    }

    // Eliminar alumno
    @GetMapping("/alumnos/eliminar/{id}")
    public String eliminarAlumno(@PathVariable Long id) {
        coordinadorService.eliminarAlumno(id);
        return "redirect:/coordinador/dashboard";
    }

    // Informe detallado del alumno con beneficios
    @GetMapping("/alumnos/informe/{id}")
    public String informeAlumno(@PathVariable Long id, Model model) {
        Alumno alumno = coordinadorService.obtenerAlumnoPorId(id);
        model.addAttribute("alumno", alumno);
        model.addAttribute("beneficios", coordinadorService.obtenerBeneficiosAlumno(alumno));
        return "alumno_informe";
    }
}
