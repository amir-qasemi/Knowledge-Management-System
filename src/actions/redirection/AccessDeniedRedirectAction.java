package actions.redirection;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.convention.annotation.ResultPath;
import org.apache.struts2.convention.annotation.Results;

import com.opensymphony.xwork2.ActionSupport;

@ResultPath(value="/")
@Action(value = "AccessDenied", results = { @Result(name = "a", location = "errors/access_denied.jsp") })
public class AccessDeniedRedirectAction extends ActionSupport {

	@Override
	public String execute() throws Exception {
		System.out.println("Action inside");
		return "a";
	}
}
