package actions.project.redirect;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.InterceptorRef;
import org.apache.struts2.convention.annotation.ParentPackage;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.convention.annotation.ResultPath;

import com.opensymphony.xwork2.ActionSupport;

@ResultPath(value = "/")
@InterceptorRef(value = "admin")
@ParentPackage(value = "user")
@Action(value = "projectRedirect", results = {
		@Result(name = ActionSupport.SUCCESS, location = "project/pages/project_home_page.jsp") })

public class ProjectHomePageRedirectAction extends ActionSupport {

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
