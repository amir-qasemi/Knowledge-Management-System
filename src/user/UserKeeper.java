package user;

public class UserKeeper {

	// attribute
	private User user = null;
	private String userName = null;
	private static UserKeeper instance = null;

	// constructor
	private UserKeeper() {
	}

	// methods
	public static UserKeeper getUserKeeper() {
		if (instance == null)
			instance = new UserKeeper();
		return instance;
	}

	public void keepUser(User user) {
		this.user = user;
	}

	public void keepUserName(String userName) {
		this.userName = userName;
	}

	public String getUserName() {
		return userName;
	}

	public User getUser() {
		return user;
	}

	public void reset() {
		instance = null;
	}
}
