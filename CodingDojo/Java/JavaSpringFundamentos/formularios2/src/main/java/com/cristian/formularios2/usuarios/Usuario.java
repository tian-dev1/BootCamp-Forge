package com.cristian.formularios2.usuarios;

import java.util.ArrayList;
import java.util.HashMap;

public class Usuario {
    private String nombre;
    private String apellido;
    private HashMap<String, Float> materias = new HashMap<String, Float>();
    private ArrayList<Float> notas = new ArrayList<Float>();

    public Usuario(){
        nombre = "David";
        apellido = "Osorno";
        materias.put("Matematicas", 3.5f);
        materias.put("Español", 3.5f);
        materias.put("Inglés", 3.5f);
        notas.add(3.1f);
        notas.add(2.1f);
        notas.add(4.5f);
        notas.add(1.8f);

    }

    public String getNombreCompleto(){
        return nombre + " " + apellido;
    }

    public Float getCalcularSalario(){
        return 123.4f;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getApellido() {
        return apellido;
    }

    public void setApellido(String apellido) {
        this.apellido = apellido;
    }

    public HashMap<String, Float> getMaterias() {
        return materias;
    }

    public void setMaterias(HashMap<String, Float> materias) {
        this.materias = materias;
    }

    public ArrayList<Float> getNotas() {
        return notas;
    }

    public void setNotas(ArrayList<Float> notas) {
        this.notas = notas;
    }

    

    



}
