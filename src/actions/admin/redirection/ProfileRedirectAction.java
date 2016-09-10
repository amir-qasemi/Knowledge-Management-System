package actions.admin.redirection;

import java.util.Map;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.InterceptorRef;
import org.apache.struts2.convention.annotation.ParentPackage;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.convention.annotation.ResultPath;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

import user.User;

@ResultPath(value = "/")
@InterceptorRef(value = "admin")
@ParentPackage(value = "user")
@Action(value = "ProfileRedirect", results = {
		@Result(name = ActionSupport.SUCCESS, location = "dashboard/admin/pages/user_profile.jsp") })
public class ProfileRedirectAction extends ActionSupport {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private user.User you = null;

	@SuppressWarnings("rawtypes")
	public String execute() {

		try {

			Map httpSession = (Map) ActionContext.getContext().get("session");
			you = (User) httpSession.get("user");

		} catch (Throwable e) {
			e.printStackTrace();
		}

		return SUCCESS;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	public user.User getYou() {
		return you;
	}

	public void setYou(user.User you) {
		this.you = you;
	}

}
