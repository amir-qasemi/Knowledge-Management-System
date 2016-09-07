package actions.authentication;

import java.util.Date;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.convention.annotation.ResultPath;

import com.opensymphony.xwork2.ActionSupport;

import database.DatabaseBridge;

@ResultPath(value = "/")
@Action(value = "registerRequest", results = {
		@Result(name = ActionSupport.ERROR, location = "authentication/request_for_registeration/ajax/ajax_register_action_message/ajax_register_error_message.jsp"),
		@Result(name = ActionSupport.SUCCESS, location = "authentication/request_for_registeration/ajax/ajax_register_action_message/ajax_register_succes_message.jsp") })
public class RequestAction extends ActionSupport {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String request_content = null;
	private String request_user_name = null;
	private String request_user_email = null;

	public String execute() {
		String result = ERROR;

		try {
			database.DatabaseBridge bridge = new DatabaseBridge();
			bridge.addRequest(request_user_name, request_content, new Date(), request_user_email);
			addActionMessage("Success fully added your request the result send your email !");
			result = SUCCESS;
		} catch (Throwable e) {
			addActionError(e.getLocalizedMessage());
			e.printStackTrace();
		}

		return result;
	}

	public String getRequest_content() {
		return request_content;
	}

	public String getRequest_user_name() {
		return request_user_name;
	}

	public void setRequest_content(String request_content) {
		this.request_content = request_content;
	}

	public void setRequest_user_name(String request_user_name) {
		this.request_user_name = request_user_name;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	public String getRequest_user_email() {
		return request_user_email;
	}

	public void setRequest_user_email(String request_user_email) {
		this.request_user_email = request_user_email;
	}

}
