package javaapplication1;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
//import PaqueteLectura.Lector;

/**
 *
 * @author Juli
 */
public class Main {
    
    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        Proyecto p = new Proyecto("manhattan", 123, "Pablito patas cortas");
        
        Investigador inv1 = new Investigador("floricienta",1,"analisis de cocaina");
        Investigador inv2 = new Investigador("luisito",2,"aspirar la cocaina");
        Investigador inv3 = new Investigador("rokefeler",3,"distribucion");
        
        p.agregarInvestigador(inv1);
        p.agregarInvestigador(inv2);
        p.agregarInvestigador(inv3);
        
        Subsidio sub1 = new Subsidio(50000, "luisito nos dejo sin cocaina");
        Subsidio sub2 = new Subsidio(150, "cumple de floricienta");
        Subsidio sub3 = new Subsidio(2000, "cambio de cubierta");
        Subsidio sub4 = new Subsidio(9000, "se rompio el microonas");
        Subsidio sub5 = new Subsidio(15, "tengo hambre");
        Subsidio sub6 = new Subsidio(8000, "nueva ,aquina de analisis");
        
        sub1.setOtorgado();
        sub2.setOtorgado();
        
        
        inv1.agregarSubsidio(sub1);
        inv1.agregarSubsidio(sub2);
        
        inv2.agregarSubsidio(sub3);
        inv2.agregarSubsidio(sub4);
        
        inv3.agregarSubsidio(sub5);
        inv3.agregarSubsidio(sub6);
        
        System.out.println(p.toString());
        
    }
    
}
