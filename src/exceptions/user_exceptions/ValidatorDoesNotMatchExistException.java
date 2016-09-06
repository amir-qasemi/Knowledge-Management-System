package exceptions.user_exceptions;

public class ValidatorDoesNotMatchExistException extends Exception {
	private String selector;
	private String validator;

	public String getSelector() {
		return selector;
	}

	public String getValidator() {
		return validator;
	}

	
	public ValidatorDoesNotMatchExistException(String selector, String validator) {
		this.selector = selector;
		this.validator = validator;
	}
	
	@Override
	public String getLocalizedMessage() {
		return "Validator does not match to the user's registered selector";
	}
}
