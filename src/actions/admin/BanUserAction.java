package actions.admin;

import java.sql.SQLException;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.InterceptorRef;
import org.apache.struts2.convention.annotation.ParentPackage;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.convention.annotation.ResultPath;

import com.opensymphony.xwork2.ActionSupport;

import user.UserManager;

@ResultPath(value = "/")
@InterceptorRef(value = "admin")
@ParentPackage(value = "user")
@Action(value = "Ban", results = {
		@Result(name = ActionSupport.SUCCESS, location = "dashboard/admin/ajax/ajax_edit_action_message/ajax_edit_success_message.jsp"),
		@Result(name = ActionSupport.ERROR, location = "dashboard/admin/ajax/ajax_edit_action_message/ajax_edit_error_message.jsp") })
public class BanUserAction extends ActionSupport {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String userName, ban;

	public String execute() {
		String result = null;
		try {
			UserManager management = UserManager.getUserManager();
			if (ban.equals("1")) {
				management.updateBan(false, userName);
				addActionMessage(userName + "has been successfully banned !");
			} else if (ban.equals("0")) {
				management.updateBan(true, userName);
				addActionMessage(userName + "has been successfully Unbanned !");
			}
			result = SUCCESS;
		} catch (SQLException e) {
			addActionError("Could not connect to database!");
			e.printStackTrace();
			result = ERROR;
		} catch (Exception e) {
			addActionError("Error !");
			e.printStackTrace();
			result = ERROR;
		}
		return result;
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

	public String getBan() {
		return ban;
	}

	public void setBan(String ban) {
		this.ban = ban;
	}
}
