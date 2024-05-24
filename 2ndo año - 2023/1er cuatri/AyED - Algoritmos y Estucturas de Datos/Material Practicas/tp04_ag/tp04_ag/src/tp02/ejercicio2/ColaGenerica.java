package tp02.ejercicio2;

    public class ColaGenerica<T> {
        private ListaGenerica<T> dato = new ListaEnlazadaGenerica();

        public ColaGenerica() {
        }

        public void encolar(T nuevo) {
            this.dato.agregarFinal(nuevo);
        }

        public T desencolar() {
            T D = this.dato.elemento(1);
            this.dato.eliminarEn(1);
            return D;
        }

        public T tope() {
            return this.dato.elemento(1);
        }

        public boolean esVacia() {
            return this.dato.esVacia();
        }
    }

