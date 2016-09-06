package actions.authentication.redirection;
/**
 * @author Manochehr Rasouli
 */

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.InterceptorRef;
import org.apache.struts2.convention.annotation.ParentPackage;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.convention.annotation.ResultPath;

import com.opensymphony.xwork2.ActionSupport;

@ResultPath(value = "/")
@InterceptorRef(value = "admin")
@ParentPackage(value = "user")
@Action(value = "signupRedirectAction", results = {
		@Result(name = ActionSupport.SUCCESS, location = "authentication/signup/page/sign_up.jsp") })
public class SignupRedirectAction extends ActionSupport {
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
