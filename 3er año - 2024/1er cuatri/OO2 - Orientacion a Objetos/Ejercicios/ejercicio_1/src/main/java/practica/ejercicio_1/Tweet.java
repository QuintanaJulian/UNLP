package practica.ejercicio_1;

public class Tweet extends Publicacion{

	private String text;
	
	public Tweet(String text, String owner) {
		super(owner);
		this.text = text;
	}
	
	public String getText() {
		return text;
	}
	
}
