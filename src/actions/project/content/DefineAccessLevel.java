package actions.project.content;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.convention.annotation.ResultPath;

import com.opensymphony.xwork2.ActionSupport;

import content.ProjectController;
import database.DatabaseBridge;

@ResultPath(value = "/")
@Action(value = "defineAccessLevel", results = {
		@Result(name = ActionSupport.SUCCESS, location = "project/pages/define_new_project_success_message.jsp") })
public class DefineAccessLevel extends ActionSupport {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String accessLevel = null;

	public String execute() {
		String result = ERROR;
		String project_id;
		try {
			content.ProjectController controller = ProjectController.userController();
			project_id = controller.project_id;
			database.DatabaseBridge bridge = new DatabaseBridge();
			bridge.define_project_access_level(accessLevel, Integer.parseInt(project_id));
			result = SUCCESS;
		} catch (Throwable e) {
			e.printStackTrace();
		}
		return result;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	public String getAccessLevel() {
		return accessLevel;
	}

	public void setAccessLevel(String accessLevel) {
		this.accessLevel = accessLevel;
	}

}
