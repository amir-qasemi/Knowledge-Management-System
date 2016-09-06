package actions.message;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.convention.annotation.ResultPath;

import com.opensymphony.xwork2.ActionSupport;

@ResultPath(value = "/")
@Action(value = "sendMessageRedirect", results = {
		@Result(name = ActionSupport.SUCCESS, location = "dashboard/admin/pages/message_page.jsp") })
public class SendMessageRedirectAction extends ActionSupport {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	public String execute() {
		return SUCCESS;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}
}
