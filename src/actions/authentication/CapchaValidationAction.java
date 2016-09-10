package actions.authentication;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.InterceptorRef;
import org.apache.struts2.convention.annotation.ParentPackage;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.convention.annotation.ResultPath;

import com.opensymphony.xwork2.ActionSupport;

@ResultPath(value = "/")
@InterceptorRef(value = "authenticateUnsignedUsers")
@ParentPackage(value = "unsigned_users")
@Action(value = "captchaValidation", results = {
		@Result(name = ActionSupport.ERROR, location = "authentication/signin/ajax/ajax_sign_in_action_message/ajax_sig_in_error_message.jsp"),
		@Result(name = ActionSupport.SUCCESS, location = "authentication/signin/ajax/ajax_sign_in_action_message/ajax_sig_in_error_message.jsp") })
public class CapchaValidationAction extends ActionSupport {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String userName;
	private String password;
	private boolean rememberMe;
	private boolean isRobot;

	// methods
	public String execute() {
		String result = ERROR;
		if (isRobot == false)
			addActionError("The entered security code is not correct !");
		else
			result = SUCCESS;
		return result;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	public boolean getRememberMe() {
		return rememberMe;
	}

	public void setRememberMe(boolean rememberMe) {
		this.rememberMe = rememberMe;
	}

	public boolean isRobot() {
		return isRobot;
	}

	public void setRobot(boolean isRobot) {
		this.isRobot = isRobot;
	}
}
