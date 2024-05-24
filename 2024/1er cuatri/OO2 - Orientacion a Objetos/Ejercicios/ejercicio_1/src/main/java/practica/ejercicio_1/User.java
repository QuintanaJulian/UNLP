package practica.ejercicio_1;

import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

public class User {

	private String screenName;
	private ArrayList<Publicacion> publicaciones;
	

	public User(String screenName) {
		this.screenName = screenName;
		publicaciones = new ArrayList<Publicacion>();
	}
	
	public String getScreenName() {
		return screenName;
	}

	public void newTweet (String text) {
		
		publicaciones.add(new Tweet(text, this.screenName));
	}
	
	public void newRetweet (Tweet T) {
		publicaciones.add(new Retweet(T));
		
	}
	
	public void deleteTweets() {
		publicaciones.removeAll(publicaciones);
		
	}

	public void deleteRetweet(String eraseName) {
		
		//1
		//List<Publicacion> borrar= publicaciones.stream().filter( p -> p.getOwner().equals(eraseName)).collect(Collectors.toList());
		//publicaciones.removeAll(borrar);
		
		//2
		//List<Publicacion> borrar= publicaciones.stream().filter( p -> p.getOwner().equals(eraseName)).collect(Collectors.toList());
		//borrar.forEach( p -> publicaciones.remove(p));
		
		//3
		publicaciones.removeIf(p -> p.getOwner().equals(eraseName));
	}

}
