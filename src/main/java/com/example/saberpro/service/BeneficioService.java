package com.example.saberpro.service;

import com.example.saberpro.model.Beneficio;
import com.example.saberpro.repository.BeneficioRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class BeneficioService {

    @Autowired
    private BeneficioRepository beneficioRepository;

    // Listar todos los beneficios
    public List<Beneficio> listarBeneficios() {
        return beneficioRepository.findAll();
    }

    // Obtener beneficios para un puntaje dado
    public List<Beneficio> obtenerBeneficiosPorPuntaje(Double puntaje) {
        // Filtrar beneficios cuyo mínimo puntaje sea menor o igual al puntaje dado
        return beneficioRepository.findAll().stream()
                .filter(b -> puntaje >= b.getMinimoPuntaje())
                .toList();
    }
}
