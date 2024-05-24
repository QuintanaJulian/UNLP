public class OBJET {
        private int altura;
        private String nombre;

        public void setAltura(int altura) {
            this.altura = altura;
        }

        public int getAltura() {
            return altura;
        }

        public String getNombre() {
            return nombre;
        }

        public void setNombre(String nombre) {
            this.nombre = nombre;
        }

    public OBJET() {
    }


    public OBJET (int a, String n){
            setNombre(n);
            setAltura(a);
        }

        @Override
        public String toString() {
            return "OBJET{" +
                    "altura=" + altura +
                    ", nombre='" + nombre + '\'' +
                    '}';
        }

 /*   public static boolean agregar(<T>) {
        return false;
    }*/
    }