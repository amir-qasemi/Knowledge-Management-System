package exceptions.user_exceptions;

public class UsernameIsAlreadyRegisteredException extends Exception {
	private String username;

	public UsernameIsAlreadyRegisteredException(String username) {
		this.username = username;
	}

	public String getUsername() {
		return username;
	}

	@Override
	public String getLocalizedMessage() {
		return "username " + username + " is already registered";
	}

}
