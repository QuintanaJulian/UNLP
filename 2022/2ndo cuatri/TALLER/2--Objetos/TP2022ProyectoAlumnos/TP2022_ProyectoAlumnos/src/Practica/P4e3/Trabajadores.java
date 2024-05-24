/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Practica.P4e3;

/**
 *
 * @author juliq
 */
public class Trabajadores extends Personas {
    private String Tarea;

    public Trabajadores(String Tarea, String Nombre, int DNI, int Edad) {
        super(Nombre, DNI, Edad);
        this.Tarea = Tarea;
    }

    public String getTarea() {
        return Tarea;
    }

    public void setTarea(String Tarea) {
        this.Tarea = Tarea;
    }

    @Override
    public String toString() {
        return "Trabajador "+ super.toString() + ", Tarea=" + Tarea;
    }
    
    
    
}
