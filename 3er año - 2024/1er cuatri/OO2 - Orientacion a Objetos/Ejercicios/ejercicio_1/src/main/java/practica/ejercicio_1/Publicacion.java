package practica.ejercicio_1;

public abstract class Publicacion {

	private String owner;
	
	public Publicacion(String owner) {
		this.owner = owner;
	}
	public String getOwner() {
		return owner;
	}
	
}
