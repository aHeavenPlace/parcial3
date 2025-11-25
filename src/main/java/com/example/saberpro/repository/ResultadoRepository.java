package com.example.saberpro.repository;

import com.example.saberpro.model.Resultado;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface ResultadoRepository extends JpaRepository<Resultado, Long> {

    List<Resultado> findByAlumnoId(Long alumnoId);
}
