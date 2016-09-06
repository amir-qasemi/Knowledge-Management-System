package actions.authentication;

import java.beans.PropertyVetoException;
import java.io.IOException;
import java.sql.SQLException;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.InterceptorRef;
import org.apache.struts2.convention.annotation.ParentPackage;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.convention.annotation.ResultPath;

import com.opensymphony.xwork2.ActionSupport;

import exceptions.user_exceptions.UserNameDoesNotExistsException;
import user.UserManager;

/**
 * 
 * @author Manochehr Rasouli
 *
 */

@ResultPath(value = "/")
@InterceptorRef(value = "admin")
@ParentPackage(value = "user")
@Action(value = "quiteSignupAction", results = {
		@Result(name = ActionSupport.SUCCESS, location = "authentication/signup/ajax/ajax_quite_sign_up_action_message/ajax_quite_sign_up_success_message.jsp"),
		@Result(name = ActionSupport.ERROR, location = "authentication/signup/ajax/ajax_quite_sign_up_action_message/ajax_quite_sign_up_error_message.jsp") })
public class QuiteSignupAction extends ActionSupport {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String userName;
	private String firstName;
	private String lastName;
	private String birthDate;
	private String phoneNumber;

	@Override
	public String execute() {
		String result = ERROR;
		try {
			UserManager manager = UserManager.getUserManager();
			manager.updateName(firstName, userName);
			manager.updateLastName(lastName, userName);
			manager.updateBirthDate(birthDate, userName);
			manager.updatePhoneNumber(phoneNumber, userName);
			addActionMessage("User successfully registerd !");
			result = SUCCESS;
		} catch (SQLException e) {
			e.printStackTrace();
			addActionError(e.getLocalizedMessage());
		} catch (IOException e) {
			e.printStackTrace();
			addActionError(e.getLocalizedMessage());
		} catch (PropertyVetoException e) {
			e.printStackTrace();
			addActionError(e.getLocalizedMessage());
		} catch (UserNameDoesNotExistsException e) {
			e.printStackTrace();
			addActionError(e.getLocalizedMessage());
		}
		return result;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getFirstName() {
		return firstName;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	public String getLastName() {
		return lastName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
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

}
