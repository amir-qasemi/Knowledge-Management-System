package actions.admin.redirection;

import java.util.ArrayList;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.InterceptorRef;
import org.apache.struts2.convention.annotation.ParentPackage;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.convention.annotation.ResultPath;

import com.opensymphony.xwork2.ActionSupport;

import database.DatabaseBridge;

@ResultPath(value = "/")
@InterceptorRef(value = "admin")
@ParentPackage(value = "user")
@Action(value = "dashboardRedirect", results = {
		@Result(name = ActionSupport.SUCCESS, location = "dashboard/admin/pages/admin_page.jsp") })
public class DashboardRedirectAction extends ActionSupport {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private ArrayList<request.Request> requests = null;

	public String execute() {

		try {
			database.DatabaseBridge bridge = new DatabaseBridge();
			requests = bridge.getReceivedRequests();
		} catch (Throwable e) {
			e.printStackTrace();
		}

		return SUCCESS;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	public ArrayList<request.Request> getRequests() {
		return requests;
	}

	public void setRequests(ArrayList<request.Request> requests) {
		this.requests = requests;
	}
}
