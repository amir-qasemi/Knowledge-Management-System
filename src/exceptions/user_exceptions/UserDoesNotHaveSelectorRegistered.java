package exceptions.user_exceptions;

public class UserDoesNotHaveSelectorRegistered extends Exception{
	
	String username;
	
	public String getSelector() {
		return username;
	}
	
	public UserDoesNotHaveSelectorRegistered(String username) {
		this.username = username;
	}
	
	@Override
	public String getLocalizedMessage() {
		return "User does not have any selector registered with it.";
	}

}
