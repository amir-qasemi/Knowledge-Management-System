package actions.wiki.redirection;

import java.beans.PropertyVetoException;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.convention.annotation.ResultPath;

import com.opensymphony.xwork2.ActionSupport;

import database.DatabaseBridge;

@ResultPath(value = "/")
@Action(value = "wikiPage", results = {
		@Result(name = ActionSupport.SUCCESS, location = "wiki/pages/wiki_start_page.jsp") })
public class WikiPageRedirect extends ActionSupport {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private ArrayList<content.Title> titles = null;

	public String execute() {
		try {
			database.DatabaseBridge bridge = new DatabaseBridge();
			titles = bridge.getAllPageTitles();
		} catch (IOException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (PropertyVetoException e) {
			e.printStackTrace();
		}
		return SUCCESS;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	public ArrayList<content.Title> getTitels() {
		return titles;
	}

	public void setTitels(ArrayList<content.Title> titels) {
		this.titles = titels;
	}
}
