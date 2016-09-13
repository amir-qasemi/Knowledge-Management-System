package actions.project.redirect;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.ParentPackage;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.convention.annotation.ResultPath;

import com.opensymphony.xwork2.ActionSupport;

@ResultPath(value = "/")
@ParentPackage(value = "user")
@Action(value = "defineAccessLevelRedirect", results = {
		@Result(name = ActionSupport.SUCCESS, location = "project/pages/define_new_project_access_level_define.jsp") })
public class DefineAccessLevelRedirectAction extends ActionSupport {

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
