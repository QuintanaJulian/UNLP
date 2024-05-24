package practica.ejercicio_1;

import java.util.ArrayList;

public class Twitter {

	private ArrayList<User> usuarios;
	
	public Twitter() {
		usuarios = new ArrayList<User>();
	}
	
	public boolean newUsuarios(String screenName) {
		
		boolean encontrado = usuarios.stream().anyMatch( U -> U.getScreenName().equals(screenName));
		if (encontrado) {
			return false;
		}
		User user =  new User(screenName);
		this.usuarios.add(user);
		return true;
	}
	
	public boolean deleteUser (String screenName) {
		User U = usuarios.stream().filter(u -> u.getScreenName().equals(screenName)).findFirst().orElse(null);
		
		if (U != null) {
			U.deleteTweets();
			usuarios.forEach(u -> u.deleteRetweet(screenName));
			usuarios.remove(U);
		}
		
		
		return false;
	}
}
