package interceptors.secure.admin;

import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.Interceptor;

import user.Role;
import user.User;

public class AdminVerificationInterceptor implements Interceptor {

	@Override
	public void destroy() {

	}

	@Override
	public void init() {

	}

	@Override
	public String intercept(ActionInvocation actionInvocation) throws Exception {

		boolean isUserAdmin = false;
		Map httpSession = (Map) ActionContext.getContext().get("session");
		User user = (User) httpSession.get("user");

		if (user != null) {
			if (user.getRole().equals(Role.ADMIN)) {
				isUserAdmin = true;
			}
		}

		if (isUserAdmin) {
			return actionInvocation.invoke();
		} else {
			return "AccessDeniedResult";
		}
	}

}
