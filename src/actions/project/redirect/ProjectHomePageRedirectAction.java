package actions.project.redirect;

import java.util.ArrayList;
import java.util.Map;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.InterceptorRef;
import org.apache.struts2.convention.annotation.ParentPackage;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.convention.annotation.ResultPath;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

import database.DatabaseBridge;
import user.User;

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
	private ArrayList<project.ProjectSummary> projectNames = null;

	@SuppressWarnings("rawtypes")
	public String execute() {
		try {
			database.DatabaseBridge bridge = new DatabaseBridge();
			Map httpSession = (Map) ActionContext.getContext().get("session");
			User user = (User) httpSession.get("user");
			projectNames = bridge.getProjectsNames(user.getId());
		} catch (Throwable e) {
			e.printStackTrace();
		}
		return SUCCESS;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	public ArrayList<project.ProjectSummary> getProjectNames() {
		return projectNames;
	}

	public void setProjectNames(ArrayList<project.ProjectSummary> projectNames) {
		this.projectNames = projectNames;
	}

}
