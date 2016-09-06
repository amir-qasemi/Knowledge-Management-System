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
import exceptions.page_exceptions.PageDoesNotExistsException;
import exceptions.user_exceptions.UserNameDoesNotExistsException;
import user.User;

//location = "wiki/pages/wiki_page.jsp"
@ResultPath(value = "/")
@Action(value = "registerComment", results = { @Result(name = ActionSupport.SUCCESS, location = "wiki/pages/wiki_page.jsp") })
public class AddCommentAction extends ActionSupport {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String comment_page;
	private String comment_content;

	@SuppressWarnings("rawtypes")
	@Override
	public String execute() {
		try {
			database.DatabaseBridge bridge = new DatabaseBridge();
			Map httpSession = (Map) ActionContext.getContext().get("session");
			User user = (User) httpSession.get("user");
			bridge.registerComment(comment_content, user.getUserName(), comment_page);
		} catch (IOException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (PropertyVetoException e) {
			e.printStackTrace();
		} catch (UserNameDoesNotExistsException e) {
			e.printStackTrace();
		} catch (PageDoesNotExistsException e) {
			e.printStackTrace();
		}
		return SUCCESS;
	}

	public String getComment_content() {
		return comment_content;
	}

	public String getComment_page() {
		return comment_page;
	}

	public void setComment_page(String comment_page) {
		this.comment_page = comment_page;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	public void setComment_content(String comment_content) {
		this.comment_content = comment_content;
	}
}
