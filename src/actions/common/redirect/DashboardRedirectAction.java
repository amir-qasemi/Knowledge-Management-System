package actions.common.redirect;

import java.util.Map;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.convention.annotation.ResultPath;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

import user.User;

@ResultPath(value = "/")
@Action(value = "dashboard", results = {
		@Result(name = "admin", location = "dashboard/admin/pages/admin_page.jsp"),
		@Result(name = "user", location = "dashboard/user/pages/user_page.jsp") })
public class DashboardRedirectAction extends ActionSupport {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@SuppressWarnings("rawtypes")
	public String execute() {
		String result = null;
		Map httpSession = (Map) ActionContext.getContext().get("session");
		user.User thisUser = (User) httpSession.get("user");
		if(thisUser.getRole() == user.Role.ADMIN)
			result = "admin";
		else
			result = "user";
		return result;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}

}
