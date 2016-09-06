package actions.wiki;

import java.beans.PropertyVetoException;
import java.io.IOException;
import java.sql.SQLException;
import java.util.Map;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.convention.annotation.ResultPath;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

import database.DatabaseBridge;
import exceptions.user_exceptions.UserNameDoesNotExistsException;
import user.User;

@ResultPath(value = "/")
@Action(value = "createNewWikiPage", results = {
		@Result(name = ActionSupport.SUCCESS, location = "wiki/pages/create_new_wiki_page.jsp") })
public class CreatePageAction extends ActionSupport {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String title;
	private String editor1;
	private String userName;

	@SuppressWarnings("rawtypes")
	public String execute() {
		try {
			database.DatabaseBridge bridge = new DatabaseBridge();
			Map httpSession = (Map) ActionContext.getContext().get("session");
			User user = (User) httpSession.get("user");
			userName = user.getUserName();
			bridge.savePage(title, userName, editor1, content.EditType.CREATE);
		} catch (IOException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (PropertyVetoException e) {
			e.printStackTrace();
		} catch (UserNameDoesNotExistsException e) {
			e.printStackTrace();
		}
		return SUCCESS;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	public String getEditor1() {
		return editor1;
	}

	public String getTitle() {
		return title;
	}

	public void setEditor1(String editor1) {
		this.editor1 = editor1;
	}

	public void setTitle(String title) {
		this.title = title;
	}
}
