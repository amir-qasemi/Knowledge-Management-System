package actions.project.content;

import java.util.Map;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.InterceptorRef;
import org.apache.struts2.convention.annotation.ParentPackage;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.convention.annotation.ResultPath;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

import content.ProjectController;
import database.DatabaseBridge;
import user.User;

@ResultPath(value = "/")
@InterceptorRef(value = "admin")
@ParentPackage(value = "user")
@Action(value = "createNewProject", results = {
		@Result(name = ActionSupport.SUCCESS, location = "project/pages/define_new_project_add_member_page.jsp") })
public class CreateNewProjectAction extends ActionSupport {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	public String projectName = null;
	public String projectDescription = null;
	public String wikiName = null;

	@SuppressWarnings("rawtypes")
	public String execute() {
		String result = ERROR;
		try {
			DatabaseBridge bridge = new DatabaseBridge();
			Map httpSession = (Map) ActionContext.getContext().get("session");
			User user = (User) httpSession.get("user");
			bridge.createProject(projectDescription, projectName, wikiName, user.getUserName());
			ProjectController controller = ProjectController.userController();
			controller.project_name = projectName;
			controller.project_id = bridge.getProjectid(projectName);
			result = SUCCESS;
		} catch (Throwable e) {
			e.printStackTrace();
		}
		return result;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

}
