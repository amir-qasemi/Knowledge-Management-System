package exceptions.user_exceptions;

public class UserNameDoesNotExistsException extends Exception {
	private String userName;
	
	public UserNameDoesNotExistsException(String userName) {
		super();
		this.userName = userName;
	}
	
	public String getUserName() {
		return userName;
	}
	
	@Override
	public String getLocalizedMessage() {
		return "Not a user with this username exists!";
	}
}
