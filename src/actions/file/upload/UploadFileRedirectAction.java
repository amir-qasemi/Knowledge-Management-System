package actions.file.upload;

import java.util.Map;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.convention.annotation.ResultPath;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

import user.User;

@ResultPath(value = "/")
@Action(value = "sendFileRedirect", results = {
		@Result(name = "admin", location = "dashboard/admin/pages/upload_file_page.jsp"),
		@Result(name = "user", location = "dashboard/user/pages/send_public_file.jsp") })
public class UploadFileRedirectAction extends ActionSupport {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	public String execute() {
		String result = null;
		Map httpSession = (Map) ActionContext.getContext().get("session");
		user.User thisUser = (User) httpSession.get("user");
		if (thisUser.getRole() == user.Role.ADMIN)
			result = "admin";
		else
			result = "user";
		return result;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}
}
