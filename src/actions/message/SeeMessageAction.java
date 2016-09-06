package actions.message;

import java.util.ArrayList;

import user.UserManager;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.convention.annotation.ResultPath;

import com.opensymphony.xwork2.ActionSupport;

import content.Message;

@ResultPath(value = "/")
@Action(value = "seeMesaages", results = {
		@Result(name = ActionSupport.SUCCESS, location = "dashboard/admin/pages/display_sended_messages.jsp") })
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
		result = SUCCESS;
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
