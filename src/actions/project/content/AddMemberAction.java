package actions.project.content;

import java.util.ArrayList;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.convention.annotation.ResultPath;

import com.opensymphony.xwork2.ActionSupport;

import content.ProjectController;
import database.DatabaseBridge;

@ResultPath(value = "/")
@Action(value = "addMember", results = {
		@Result(name = ActionSupport.SUCCESS, location = "project/pages/define_new_project_add_member_page.jsp") })
public class AddMemberAction extends ActionSupport {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	public String user_name;
	public String user_role;
	public ArrayList<user.User> users = null;

	@SuppressWarnings("static-access")
	@Override
	public String execute() {
		String result = ERROR;
		String project_id;
		user.User user;

		try {
			content.ProjectController controller = ProjectController.userController();
			project_id = controller.project_id;
			database.DatabaseBridge bridge = new DatabaseBridge();
			user = bridge.getUser(user_name);
			bridge.addMember(user.getId(), Integer.parseInt(project_id), user_role);
			users = controller.users;
			users.add(user);
			controller.users = users;
			result = SUCCESS;
		} catch (Throwable e) {
			e.printStackTrace();
		}
		return result;
	}

}
