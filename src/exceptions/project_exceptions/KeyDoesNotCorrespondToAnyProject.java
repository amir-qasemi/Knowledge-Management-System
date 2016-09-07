package exceptions.project_exceptions;

public class KeyDoesNotCorrespondToAnyProject extends Exception {
	private String key;
	
	public KeyDoesNotCorrespondToAnyProject(String key) {
		this.key = key;
	}

	
	@Override
	public String getLocalizedMessage() {
		// TODO Auto-generated method stub
		return super.getLocalizedMessage();
	}
}
