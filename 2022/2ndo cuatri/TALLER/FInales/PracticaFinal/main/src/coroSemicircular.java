public class coroSemicircular extends coros{

    private director Dir;
    private coristas [] aCoristas;
    private int dimL;
    private int dimF;

    public coroSemicircular(director dir, int cantCoristas) {
        Dir = dir;
        dimF = cantCoristas - 1;
        dimL = -1;
        aCoristas = new coristas[cantCoristas];
    }


    @Override
    public void agregarCorista(coristas corista) {
        if (dimL < dimF) {
            //System.out.println(dimL + "F " + dimF);
            aCoristas[++dimL] = corista;
        }
    }

    @Override
    public boolean coroLLeno() {
        boolean respuesta = false;
        if (dimL == dimF){
            respuesta = true;
        }
        return respuesta;
    }

    @Override
    public boolean coroBienFormado() {
        boolean respuesta = true;
        int tonoActual = aCoristas[0].getTono();
        int i = 0;
        System.out.println(dimF + " L " + dimL);
        if (dimL == dimF){

        while ((respuesta) && (i < dimF)){
            System.out.println( "i " + i );
            if (tonoActual < aCoristas[i++].getTono()){
                respuesta = false;
            }
            //i++;
        }
        } else respuesta = false;

        return respuesta;
    }

    @Override
    public String toString() {
        String cadena = "El coro esta dirigido por " + Dir.toString()  + ", los coristas son: ";

        for (int i=0; i<dimL; i++){
            cadena+= aCoristas[i].toString() + " - ";
        }


        return cadena;
    }
}
