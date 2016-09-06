package exceptions.user_exceptions;

public class EmailIsAlreadyRegisteredException extends Exception {
	private String email;

	public EmailIsAlreadyRegisteredException(String email) {
		this.email = email;
	}

	public String getUsername() {
		return email;
	}

	@Override
	public String getLocalizedMessage() {
		return "email " + email + " is already registered";
	}

}
