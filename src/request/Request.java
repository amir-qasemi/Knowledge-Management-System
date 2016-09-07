package request;

public class Request {

	private int request_id;
	private String request_user_name;
	private String request_content;
	private String request_date;
	private String request_user_email;

	public Request() {
	}

	public String getRequest_user_name() {
		return request_user_name;
	}

	public void setRequest_user_name(String request_user_name) {
		this.request_user_name = request_user_name;
	}

	public String getRequest_content() {
		return request_content;
	}

	public void setRequest_content(String request_content) {
		this.request_content = request_content;
	}

	public String getRequest_date() {
		return request_date;
	}

	public void setRequest_date(String request_date) {
		this.request_date = request_date;
	}

	public String getRequest_user_email() {
		return request_user_email;
	}

	public void setRequest_user_email(String request_user_email) {
		this.request_user_email = request_user_email;
	}

	public int getRequest_id() {
		return request_id;
	}

	public void setRequest_id(int request_id) {
		this.request_id = request_id;
	}
}
