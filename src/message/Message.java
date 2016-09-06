package message;

public class Message {

	// attribute
	private String userName, message, date, heading;

	// constructor
	public Message() {
	}

	public Message(Message message) {
		this.message = message.getMessage();
		this.userName = message.getUserName();
		this.date = message.getDate();
		this.heading = message.getHeading();
	}

	// methods
	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

	public String getHeading() {
		return heading;
	}

	public void setHeading(String heading) {
		this.heading = heading;
	}
}
