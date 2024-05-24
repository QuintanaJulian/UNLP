/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ppe16;

/**
 *
 * @author juliq
 */
public class PPe16 {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        Minoristas Mino1 = new Minoristas( true, 20 , 3);
        Mayoristas Mayo1 = new Mayoristas( 20184, 12, 2);
        
        
        Mino1.agregarCompras(3, 2, 40);
        Mayo1.agregarCompras(3, 2, 4);
        Mino1.agregarCompras(1, 5, 30);
        Mayo1.agregarCompras(0, 0, 2);  
        
        System.out.println(Mino1.toString());
        System.out.println(Mayo1.toString());
        
                
        
    }
    
}
