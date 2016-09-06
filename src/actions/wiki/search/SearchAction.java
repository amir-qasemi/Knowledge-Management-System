package actions.wiki.search;

import java.beans.PropertyVetoException;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.convention.annotation.ResultPath;

import com.opensymphony.xwork2.ActionSupport;

import content.Page;
import database.DatabaseBridge;
import exceptions.page_exceptions.PageDoesNotExistsException;
import exceptions.user_exceptions.UserIDDoesNotExistsException;

@ResultPath(value = "/")
@Action(value = "serachAction", results = {
		@Result(name = ActionSupport.SUCCESS, location = "wiki/pages/wiki_page.jsp") })
public class SearchAction extends ActionSupport {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String search;
	private content.Page page = null;
	private ArrayList<content.Comment> comments = null;

	public String execute() {
		try {
			database.DatabaseBridge bridge = new DatabaseBridge();
			page = bridge.searchPage(search);
			String userId = page.getPage_activity_user();
			String userName = bridge.getUser(Integer.parseInt(userId)).getUserName();
			page.setPage_activity_user(userName);
			comments = page.getComments();
		} catch (IOException e) {
			e.printStackTrace();
			page = new Page();
			page.setPage_activity_content(e.getLocalizedMessage());
		} catch (SQLException e) {
			e.printStackTrace();
			page.setPage_activity_content(e.getLocalizedMessage());
		} catch (PropertyVetoException e) {
			e.printStackTrace();
			page.setPage_activity_content(e.getLocalizedMessage());
		} catch (PageDoesNotExistsException e) {
			e.printStackTrace();
			page.setPage_activity_content(e.getLocalizedMessage());
		} catch (NumberFormatException e) {
			page.setPage_activity_content(e.getLocalizedMessage());
		} catch (UserIDDoesNotExistsException e) {
			page.setPage_activity_content(e.getLocalizedMessage());
		}
		return SUCCESS;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	public String getSearch() {
		return search;
	}

	public void setSearch(String search) {
		this.search = search;
	}

	public content.Page getPage() {
		return page;
	}

	public void setPage(content.Page page) {
		this.page = page;
	}

	public ArrayList<content.Comment> getComments() {
		return comments;
	}

	public void setComments(ArrayList<content.Comment> comments) {
		this.comments = comments;
	}

}
