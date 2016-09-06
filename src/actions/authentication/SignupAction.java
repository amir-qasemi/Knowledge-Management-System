package actions.authentication;

import java.beans.PropertyVetoException;
import java.io.IOException;
import java.security.NoSuchAlgorithmException;
import java.security.spec.InvalidKeySpecException;
import java.sql.SQLException;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.InterceptorRef;
import org.apache.struts2.convention.annotation.ParentPackage;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.convention.annotation.ResultPath;

import com.opensymphony.xwork2.ActionSupport;

import exceptions.user_exceptions.EmailIsAlreadyRegisteredException;
import exceptions.user_exceptions.UsernameIsAlreadyRegisteredException;
import user.Role;
import user.UserManager;

@ResultPath(value = "/")
@InterceptorRef(value = "admin")
@ParentPackage(value = "user")
@Action(value = "signup", results = {
		@Result(name = ActionSupport.SUCCESS, location = "authentication/signup/ajax/ajax_sign_up_action_message/ajax_sign_up_success_message.jsp"),
		@Result(name = ActionSupport.ERROR, location = "authentication/signup/ajax/ajax_sign_up_action_message/ajax_sign_up_error_message.jsp") })
public class SignupAction extends ActionSupport {

	// attribute
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String userName;
	private String password;
	private String confirmPassword;
	private String email;
	private Role role;

	// methods

	@SuppressWarnings("finally")
	@Override
	public String execute() {
		String resault = ERROR;
		try {
			/**
			 * in this section we check the confirm password and password and if
			 * it is default we add error and not allow to continue
			 */
			if (!confirmPassword.equals(password)) {
				throw new Exception("password and confirm password is default");
			} else {
				UserManager.getUserManager().registerUser(userName, password, email, role);
				addActionMessage("Successfully created user !");
				resault = SUCCESS;
			}
		} catch (NoSuchAlgorithmException e) {
			addActionError(e.getLocalizedMessage());
		} catch (InvalidKeySpecException e) {
			addActionError(e.getLocalizedMessage());
		} catch (SQLException e) {
			addActionError(e.getLocalizedMessage());
		} catch (IOException e) {
			addActionError(e.getLocalizedMessage());
		} catch (PropertyVetoException e) {
			addActionError(e.getLocalizedMessage());
		} catch (UsernameIsAlreadyRegisteredException e) {
			addActionError(e.getLocalizedMessage());
		} catch (EmailIsAlreadyRegisteredException e) {
			addActionError(e.getLocalizedMessage());
		} catch (Exception e) {
			addActionError(e.getLocalizedMessage());
		}

		finally {
			return resault;
		}
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
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

	public String getConfirmPassword() {
		return confirmPassword;
	}

	public void setConfirmPassword(String confirmPassword) {
		this.confirmPassword = confirmPassword;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	public Role getRole() {
		return role;
	}

	public void setRole(Role role) {
		this.role = role;
	}
}