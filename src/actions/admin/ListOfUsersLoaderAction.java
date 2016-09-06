package actions.admin;

import java.util.ArrayList;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.InterceptorRef;
import org.apache.struts2.convention.annotation.ParentPackage;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.convention.annotation.ResultPath;

import com.opensymphony.xwork2.ActionSupport;

import user.User;
import user.UserManager;

@ResultPath(value = "/")
@InterceptorRef(value = "admin")
@ParentPackage(value = "user")
@Action(value = "seeList", results = {
		@Result(name = ActionSupport.SUCCESS, location = "dashboard/admin/pages/display_users.jsp") })
public class ListOfUsersLoaderAction extends ActionSupport {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private ArrayList<User> users;

	public String execute() {
		try {
			UserManager management = UserManager.getUserManager();
			users = management.getUsers();
			return SUCCESS;
		} catch (Throwable e) {
			e.printStackTrace();
			return null;
		}
	}

	public ArrayList<User> getUsers() {
		return users;
	}

	public void setUsers(ArrayList<User> users) {
		this.users = users;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}
}
