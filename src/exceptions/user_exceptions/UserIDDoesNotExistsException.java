package exceptions.user_exceptions;

public class UserIDDoesNotExistsException extends Exception {
	private int userID;
	
	public UserIDDoesNotExistsException(int userID) {
		super();
		this.userID = userID;
	}
	
	public int getUserName() {
		return userID;
	}
	
	@Override
	public String getLocalizedMessage() {
		return "Not a user with this ID exists!";
	}
}
