package com.example.saberpro.model;

import jakarta.persistence.*;

@Entity
@Table(name = "beneficios")
public class Beneficio {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private String descripcion;  // Descripción del beneficio (ej. Exoneración, beca parcial)
    
    private Double minimoPuntaje;  // Puntaje mínimo para acceder a este beneficio

    // Getters y setters
    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public Double getMinimoPuntaje() {
        return minimoPuntaje;
    }

    public void setMinimoPuntaje(Double minimoPuntaje) {
        this.minimoPuntaje = minimoPuntaje;
    }
}
