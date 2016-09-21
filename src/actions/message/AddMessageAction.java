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
		@Result(name = "adminSuccess", location = "dashboard/admin/pages/message_page.jsp"),
		@Result(name = "adminError", location = "dashboard/admin/pages/message_page.jsp"),
		@Result(name = "userSuccess", location = "dashboard/user/pages/send_public_message.jsp"),
		@Result(name = "userError", location = "dashboard/user/pages/send_public_message.jsp") })
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
		User thisUser = (User) httpSession.get("user");
		userName = thisUser.getUserName();
		UserManager management = UserManager.getUserManager();
		boolean messageResult = management.addMessage(message, userName, heading, thisUser.getId());
		if (thisUser.getRole() == user.Role.ADMIN) {
			if (messageResult == false) {
				addActionError("Error accoure in saving message !");
				result = "adminError";
			} else if (messageResult == true) {
				addActionMessage("Successfuly saved message !");
				result = "adminSuccess";
			}
		} else {
			if (messageResult == false) {
				addActionError("Error accoure in saving message !");
				result = "userError";
			} else if (messageResult == true) {
				addActionMessage("Successfuly saved message !");
				result = "userSuccess";
			}
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
