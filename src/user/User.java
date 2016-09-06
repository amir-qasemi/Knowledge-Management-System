package user;

public class User {

	// attribute
	private String firstName;
	private String email;
	private String lastName;
	private String birthDate;
	private String phoneNumber;
	private String userName;
	private Role role;
	private String registrationDate;
	private int id;
	private boolean banned;
	public String memberRole;

	// constructor
	public User(int id, String firstName, String lastName, String email, String birthDate, String phoneNumber,
			String userName, String registrationDate, Role role, boolean banned) {
		this.id = id;
		this.firstName = firstName;
		this.lastName = lastName;
		this.email = email;
		this.birthDate = birthDate;
		this.phoneNumber = phoneNumber;
		this.userName = userName;
		this.registrationDate = registrationDate;
		this.banned = banned;
		this.role = role;
	}

	public User() {
	}

	public User(User user) {
		this.firstName = user.getFirstName();
		this.lastName = user.getLastName();
		this.birthDate = user.getBirthDate();
		this.phoneNumber = user.getPhoneNumber();
		this.email = user.getEmail();
		this.userName = user.getUserName();
		this.role = user.getRole();
		this.id = user.getId();
		this.banned = user.isBanned();
	}

	// methods
	public String getFirstName() {
		return firstName;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	public String getLastName() {
		return lastName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getBirthDate() {
		return birthDate;
	}

	public void setBirthDate(String birthDate) {
		this.birthDate = birthDate;
	}

	public String getPhoneNumber() {
		return phoneNumber;
	}

	public void setPhoneNumber(String phoneNumber) {
		this.phoneNumber = phoneNumber;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public Role getRole() {
		return role;
	}

	public void setRole(Role role) {
		this.role = role;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getRegistrationDate() {
		return registrationDate;
	}

	public void setRegistrationDate(String registrationDate) {
		this.registrationDate = registrationDate;
	}

	public boolean isBanned() {
		return banned;
	}

	public void setBanned(boolean ban) {
		this.banned = ban;
	}

}
