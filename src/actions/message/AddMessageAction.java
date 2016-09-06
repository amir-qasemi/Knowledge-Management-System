package actions.message;

import java.util.Map;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.convention.annotation.ResultPath;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

import user.User;
import user.UserManager;

@ResultPath(value = "/")
@Action(value = "addMessage", results = {
		@Result(name = ActionSupport.SUCCESS, location = "dashboard/admin/pages/message_page.jsp"),
		@Result(name = ActionSupport.ERROR, location = "dashboard/admin/pages/message_page.jsp") })
public class AddMessageAction extends ActionSupport {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String userName;
	private String heading;
	private String message;

	@SuppressWarnings("rawtypes")
	public String execute() {
		String result = null;
		Map httpSession = (Map) ActionContext.getContext().get("session");
		User user = (User) httpSession.get("user");
		userName = user.getUserName();
		UserManager management = UserManager.getUserManager();
		boolean messageResult = management.addMessage(message, userName, heading, user.getId());
		if (messageResult == false) {
			addActionError("Error accoure in saving message !");
			result = ERROR;
		} else if (messageResult == true) {
			addActionMessage("Successfuly saved message !");
			result = SUCCESS;
		}
		return result;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getHeading() {
		return heading;
	}

	public void setHeading(String heading) {
		this.heading = heading;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

}
