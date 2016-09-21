package actions.message;

import java.util.ArrayList;
import java.util.Map;

import user.User;
import user.UserManager;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.convention.annotation.ResultPath;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

import content.Message;

@ResultPath(value = "/")
@Action(value = "seeMesaages", results = {
		@Result(name = "admin", location = "dashboard/admin/pages/display_sended_messages.jsp"),
		@Result(name = "user", location="dashboard/user/pages/show_public_messages.jsp")})
public class SeeMessageAction extends ActionSupport {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	ArrayList<Message> messages = null;

	public String execute() {
		String result = null;
		UserManager management = UserManager.getUserManager();
		messages = management.getMessages();
		Map httpSession = (Map) ActionContext.getContext().get("session");
		user.User thisUser = (User) httpSession.get("user");
		if (thisUser.getRole() == user.Role.ADMIN)
			result = "admin";
		else
			result = "user";
		return result;
	}

	public ArrayList<Message> getMessages() {
		return messages;
	}

	public void setMessages(ArrayList<Message> messages) {
		this.messages = messages;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

}
