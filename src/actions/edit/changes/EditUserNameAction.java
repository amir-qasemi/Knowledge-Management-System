package actions.edit.changes;

import java.sql.SQLException;

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
@Action(value = "editUserName", results = {
		@Result(name = ActionSupport.SUCCESS, location = "dashboard/admin/pages/edite_users.jsp") })
public class EditUserNameAction extends ActionSupport {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private User user;
	private String name = null;
	private String lastName = null;
	private String email = null;
	private String birthDate = null;
	private String phoneNumber = null;
	private String userName = null;
	private user.Role role = null;

	private String newUserName = null;

	public String execute() {
		try {
			UserManager management = UserManager.getUserManager();
			user = management.getUser(userName);
			name = user.getFirstName();
			lastName = user.getLastName();
			userName = user.getUserName();
			email = user.getEmail();
			birthDate = user.getBirthDate();
			phoneNumber = user.getPhoneNumber();
			role = user.getRole();
			management.updateUserName(userName, newUserName);
			userName = newUserName;

		} catch (SQLException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return ActionSupport.SUCCESS;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getLastName() {
		return lastName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getBirthDate() {
		return birthDate;
	}

	public void setBirthDate(String birthDate) {
		this.birthDate = birthDate;
	}

	public String getPhoneNumber() {
		return phoneNumber;
	}

	public void setPhoneNumber(String phoneNumber) {
		this.phoneNumber = phoneNumber;
	}

	public user.Role getRole() {
		return role;
	}

	public void setRole(user.Role role) {
		this.role = role;
	}

	public String getNewUserName() {
		return newUserName;
	}

	public void setNewUserName(String newUserName) {
		this.newUserName = newUserName;
	}
}
