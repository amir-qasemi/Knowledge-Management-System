package actions.redirection;

import java.io.File;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.InterceptorRef;
import org.apache.struts2.convention.annotation.ParentPackage;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.convention.annotation.ResultPath;

import com.opensymphony.xwork2.ActionSupport;

@ResultPath(value = "/")
@InterceptorRef(value="authenticateUnsignedUsers")
@ParentPackage(value ="unsigned_users")
@Action(value = "homePageRedirection", results = { @Result(name = ActionSupport.SUCCESS, location = "home/unsigned_user/page/home_page.jsp") })
public class HomePageRedirection extends ActionSupport {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Override
	public String execute() {
		return SUCCESS;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	public File getCaptchaImage(){
		
		return null;
	}
}
