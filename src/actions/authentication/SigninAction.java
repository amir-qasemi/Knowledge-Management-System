package actions.authentication;

import java.beans.PropertyVetoException;
import java.io.IOException;
import java.sql.SQLException;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.InterceptorRef;
import org.apache.struts2.convention.annotation.ParentPackage;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.convention.annotation.ResultPath;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

import cookie.CookieManager;
import exceptions.user_exceptions.PasswordIsWrongException;
import exceptions.user_exceptions.UserNameDoesNotExistsException;
import user.Role;
import user.User;
import user.UserManager;

@ResultPath(value = "/")
@InterceptorRef(value = "authenticateUnsignedUsers")
@ParentPackage(value = "unsigned_users")
@Action(value = "signin", results = {
		@Result(name = ActionSupport.ERROR, location = "authentication/signin/ajax/ajax_sign_in_action_message/ajax_sig_in_error_message.jsp"),
		@Result(name = "Admin", location = "authentication/signin/ajax/ajax_sign_in_action_message/ajax_sig_in_succes_message_for_admin.jsp"),
		@Result(name = "User", location = "authentication/signin/ajax/ajax_sign_in_action_message/ajax_sigin_succes_message_for_user.jsp") })
public class SigninAction extends ActionSupport {

	// methods
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String userName;
	private String password;
	private boolean rememberMe;

	// methods
	@SuppressWarnings({ "rawtypes", "unchecked", "finally" })
	public String execute() {
		String result = ERROR;
		try {
			Map httpSession = (Map) ActionContext.getContext().get("session");
			UserManager userManager = UserManager.getUserManager();
			User user;
			user = userManager.signinUser(userName, password);
			Role roll = user.getRole();
			httpSession.put("user", user);
			httpSession.put("isSignedin", true);
			// check the roll for how to connecting the user to the page
			if (user.isBanned() == true) {
				result = ERROR;
				throw new Exception("you are banned !");
			} else if (roll == Role.ADMIN) {
				result = "Admin";
			} else if (roll == Role.USER) {
				result = "User";
			}
			if (rememberMe) {
				String selector = userManager.generateUserPasswordSelector(user.getUserName());
				String validator = userManager.generateNewPasswordValidator();

				CookieManager cookieManager = CookieManager.getInstance();
				String token = cookieManager.generateRememberMeToken(selector, validator);

				userManager.changeUserToken(user, selector, validator);

				sendNewRemeberMeCookie(token);
			}
		} catch (IOException e) {
			addActionError(e.getLocalizedMessage());
		} catch (SQLException e) {
			e.printStackTrace();
			addActionError(e.getLocalizedMessage());
		} catch (PropertyVetoException e) {
			addActionError(e.getLocalizedMessage());
		} catch (UserNameDoesNotExistsException e) {
			addActionError(e.getLocalizedMessage());
		} catch (PasswordIsWrongException e) {
			addActionError(e.getLocalizedMessage());
		} catch (Exception e) {
			addActionError(e.getLocalizedMessage());
		} finally {
			return result;
		}
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	public boolean getRememberMe() {
		return rememberMe;
	}

	public void setRememberMe(boolean rememberMe) {
		this.rememberMe = rememberMe;
	}

	private void sendNewRemeberMeCookie(String token) {
		HttpServletResponse httpServletResponse = ServletActionContext.getResponse();

		Cookie cookie = new Cookie(CookieManager.REMEMBER_ME_COOKIE_NAME, token);

		// TODO: has problems due the incompatibility of the server and client
		// time.
		cookie.setMaxAge(CookieManager.REMEBER_ME_COOKIE_AGE);

		httpServletResponse.addCookie(cookie);
	}

}
