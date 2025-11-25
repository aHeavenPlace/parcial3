package com.example.saberpro.repository;

import com.example.saberpro.model.Alumno;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.Optional;

@Repository
public interface AlumnoRepository extends JpaRepository<Alumno, Long> {

    // Buscar alumno por correo (campo debe llamarse 'correo' en la entidad Alumno)
    Optional<Alumno> findByCorreo(String correo);
}
