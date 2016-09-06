package exceptions.user_exceptions;

public class PasswordIsWrongException extends Exception {
	private String userName;

	public PasswordIsWrongException(String userName) {
		super();
		this.userName = userName;
	}

	public String getUserName() {
		return userName;
	}

	@Override
	public String getLocalizedMessage() {
		return "Password is wrong";
	}
}