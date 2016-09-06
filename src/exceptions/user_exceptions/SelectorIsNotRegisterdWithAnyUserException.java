package exceptions.user_exceptions;

public class SelectorIsNotRegisterdWithAnyUserException extends Exception {
	private String selector;
	
	public String getSelector() {
		return selector;
	}
	
	public SelectorIsNotRegisterdWithAnyUserException(String selector) {
		this.selector = selector;
	}
	
	@Override
	public String getLocalizedMessage() {
		return "The given selector is not registered with any user";
	}
	
}
