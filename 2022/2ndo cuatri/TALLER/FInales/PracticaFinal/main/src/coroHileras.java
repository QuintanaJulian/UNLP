import java.util.Arrays;

public class coroHileras extends coros {

    private director Dir;
    private coristas [][] mCoristas;
     private int dimF;
     private int [] dimL;
     private int dimLY;

    public coroHileras(director dir, int largoMax) {
        Dir = dir;
        this.dimF = largoMax - 1;
        mCoristas = new coristas[largoMax][largoMax];
        dimL = new int[largoMax];
        dimLY = 0;
        for (int i = 0; i < largoMax; i++) {
            dimL[i] = -1;
        }
    }

    @Override
    public void agregarCorista(coristas corista) {
        if (dimLY <= dimF){
            dimL[dimLY]++;
            mCoristas[dimLY][dimL[dimLY]] = corista;
            if (dimL[dimLY] == dimF){
                if (dimLY < dimF){
                dimLY++;
                }
            }
        }
    }

    @Override
    public boolean coroLLeno() {
        boolean respuesta = true;
        int posY = 0;
        System.out.println("holaa: " + dimLY + " " + dimF);
        if (dimLY == dimF){

        while (respuesta && (posY <= dimF)){
            if (dimL[posY] != dimF){
                respuesta = false;
            }
            posY++;
        }
        } else respuesta = false;


        return respuesta;
    }

    @Override
    public boolean coroBienFormado() {
        boolean respuesta = true;
        int posY = 0;
        int posX = 0;
        int tonoActual = 9999;
        while (respuesta && (posY <= dimF)){
            System.out.println(posY);
            if (tonoActual <= mCoristas[posY][0].getTono()){
                System.out.println("Es falso en: " + posX + " " + posY);
                respuesta = false;
            } else{
                tonoActual = mCoristas[posY][0].getTono();
                posX = 0;
                while (respuesta && (posX <= dimF)){
                    System.out.println("vuelta " + posX);
                    if (mCoristas[posY][posX++].getTono() != tonoActual){
//                        System.out.println("Es falso dentro: " + posX + " " + posY + mCoristas[posY][posX].getTono()+ " tono actual " + tonoActual);
                        respuesta = false;
                    }

                }
                posY++;
            }

        }
        return respuesta;
    }


    public String toString() {
        String cadena = "El director es" + Dir + ", Coristas ";
        //System.out.println("por aca vamos: " + dimLY + ' ' + dimL[dimLY] + " con un limite ded: " + dimF);

        for (int i = 0; i < dimLY; i++) {
            cadena += "fila " + (i+1) + ": ";
            for (int j = 0; j <= dimL[i]; j++) {
                cadena += mCoristas[i][j] + " - ";

            }
        }

        return cadena;
    }
}
