package tp04.ejercicio1;

public class AreaEmpresa {
    private String area;
    private int tiempo;

    public AreaEmpresa(int tiempo) {
        this.tiempo = tiempo;
    }

    public int getTiempo(){return tiempo;}
    public String getArea() {return area;}

    public void setTiempo (int tiempo){this.tiempo = tiempo;}

    public void setArea (String area){this.area = area;}


}
