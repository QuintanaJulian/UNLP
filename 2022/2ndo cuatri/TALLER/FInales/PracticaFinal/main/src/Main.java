public class Main {
    public static void main(String[] args) {

        hijo H1= new hijo(5, "Juan");

        System.out.println (H1.getCompilacion());
        System.out.println(H1.getEdadCalculada());

        director D = new director("juan", 2223, 30, 5)  ;
        //coroSemicircular C1 = new coroSemicircular(D, 4);
        coroHileras C1 = new coroHileras(D, 4);

        /*
        int j = 5;
        for (int i = 0; i < 4; i++) {
            //System.out.println("pasa" + i );
            coristas C = new coristas("alberto", 5666, i, j--);
            C1.agregarCorista(C);
            //System.out.println(C1);
        }
        */


        int j = 5;
        int max = 4;
        for (int i = 0; i < max; i++) {
            //System.out.println("pasa" + i );
            for (int k = 0; k < max; k++) {
                coristas C = new coristas("alberto", 5666, (i*max + k ), j);
                C1.agregarCorista(C);
            }
            j--;
            //System.out.println(C1);
        }




        System.out.println(C1);
        System.out.println("coro bien formado " + C1.coroBienFormado());
        System.out.println("coro lleno " + C1.coroLLeno());


    }
}