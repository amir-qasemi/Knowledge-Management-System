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
@InterceptorRef(value="authenticateUnsignedUsers")
@ParentPackage(value ="unsigned_users")
@Action(value = "signinRedirectAction", results = { @Result(name = ActionSupport.SUCCESS, location = "authentication/signin/page/sign_in.jsp") })
public class SigninRedirectAction extends ActionSupport{
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
