package actions.todo;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.convention.annotation.ResultPath;

import com.opensymphony.xwork2.ActionSupport;

@ResultPath(value = "/")
@Action(value = "addTodo", results = { @Result(name = ActionSupport.SUCCESS),
		@Result(name = ActionSupport.ERROR, location = "project/todoList/todo_error_message.jsp") })
public class AddToDoItemAction extends ActionSupport {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private String description;
	private String projectID;

	public String execute() {
		try {
			database.DatabaseBridge bridge = new database.DatabaseBridge();
			bridge.addTodoList(projectID, description, new java.util.Date().toString(), false);
			return SUCCESS;
		} catch (Throwable e) {
			e.printStackTrace();
			return ERROR;
		}

		
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getProjectId() {
		return projectID;
	}

	public void setProjectId(String projectId) {
		this.projectID = projectId;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

}
