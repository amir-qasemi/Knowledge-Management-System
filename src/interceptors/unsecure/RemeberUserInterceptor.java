package interceptors.unsecure;

import java.beans.PropertyVetoException;
import java.io.IOException;
import java.sql.SQLException;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.Interceptor;

import cookie.CookieManager;
import exceptions.user_exceptions.SelectorIsNotRegisterdWithAnyUserException;
import exceptions.user_exceptions.UserIDDoesNotExistsException;
import exceptions.user_exceptions.ValidatorDoesNotMatchExistException;
import user.Role;
import user.User;
import user.UserManager;

public class RemeberUserInterceptor implements Interceptor {

	@Override
	public void destroy() {

	}

	@Override
	public void init() {

	}

	@Override
	public String intercept(ActionInvocation actionInvocation) throws Exception {

		try {
			String result;
			HttpServletRequest httpServletRequest = ServletActionContext.getRequest();

			Cookie[] cookies = httpServletRequest.getCookies();

			CookieManager cookieManager = CookieManager.getInstance();
			UserManager userManager = UserManager.getUserManager();

			for (Cookie c : cookies) {
				if (c.getName().equals(CookieManager.REMEMBER_ME_COOKIE_NAME)) {
					String token = c.getValue();

					String selector = cookieManager.getSelector(token);
					String validator = cookieManager.getValidator(token);

					User user;
					user = userManager.signinUserFromToken(selector, validator);
					Map httpSession = (Map) ActionContext.getContext().get("session");
					int i;

					if (user.getRole().equals(Role.ADMIN)) {
						result = "admin_home_page";

						httpSession.put("user", user);
					} else if (user.getRole().equals(Role.USER)) {
						result = "user_home_page";

						httpSession.put("user", user);
					} else {
						return actionInvocation.invoke();
					}
					
					//Generating the new remeber me's parts for the cookie.
					String newSelector = userManager.generateUserPasswordSelector(user.getUserName());
					String newValidator = userManager.generateNewPasswordValidator();
					
					
					userManager.changeUserToken(user, newSelector, newValidator);
					
					sendNewRemeberMeCookie(cookieManager.generateRememberMeToken(newSelector, newValidator));
					
					return result;

				}
			}
		} catch (IOException e) {
			return actionInvocation.invoke();
		} catch (SQLException e) {
			return actionInvocation.invoke();
		} catch (PropertyVetoException e) {
			return actionInvocation.invoke();
		} catch (UserIDDoesNotExistsException e) {
			return actionInvocation.invoke();
		} catch (SelectorIsNotRegisterdWithAnyUserException e) {
			return actionInvocation.invoke();
		} catch (ValidatorDoesNotMatchExistException e) {
			return actionInvocation.invoke();
		} catch (Exception e) {
			throw e;
		}

		
		return actionInvocation.invoke();
	}
	
	private void sendNewRemeberMeCookie(String token){
		HttpServletResponse httpServletResponse = ServletActionContext.getResponse();
		
		Cookie cookie = new Cookie(CookieManager.REMEMBER_ME_COOKIE_NAME, token);
		
		//TODO: has problems due the incompatibility of the server and client time.
		cookie.setMaxAge(CookieManager.REMEBER_ME_COOKIE_AGE);
		
		httpServletResponse.addCookie(cookie);
	}

}
