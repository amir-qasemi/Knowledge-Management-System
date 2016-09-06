package actions.authentication;
/**
 * @author Manochehr Rasouli
 */

import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.convention.annotation.ResultPath;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

import cookie.CookieManager;
import user.Role;
import user.User;

@ResultPath(value = "/")
@Action(value = "signout", results = {
		@Result(name = ActionSupport.SUCCESS, location = "authentication/signout/ajax/ajax_sign_out_action_message/ajax_sign_out_success_message.jsp"),
		@Result(name = ActionSupport.ERROR, location = "authentication/signout/ajax/ajax_sign_out_action_message/ajax_sign_out_error_message.jsp") })
public class SignoutAction extends ActionSupport {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@SuppressWarnings("rawtypes")
	public String execute() {
		String resault;
		try {
			Map httpSession = (Map) ActionContext.getContext().get("session");
			User user = (User) httpSession.get("user");
			addActionMessage(user.getUserName() + "\n sig out success !");
			httpSession.clear();// clear session and user becomes signed out
			
			HttpServletRequest httpServletRequest = ServletActionContext.getRequest();
			HttpServletResponse httpServletResponse =ServletActionContext.getResponse();
			
			Cookie[] cookies = httpServletRequest.getCookies();
			for (Cookie c : cookies) {
				if (c.getName().equals(CookieManager.REMEMBER_ME_COOKIE_NAME)) {
					c.setMaxAge(0);
					httpServletResponse.addCookie(c);
				}
			}
			resault = SUCCESS;
		} catch (Throwable e) {
			addActionError("and Error");
			e.printStackTrace();
			resault = ERROR;
		}
		return resault;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}
}
