package actions.wiki.redirection;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.convention.annotation.ResultPath;

import com.opensymphony.xwork2.ActionSupport;

@ResultPath(value = "/")
@Action(value = "createNewWikiRedirect", results = {
		@Result(name = ActionSupport.SUCCESS, location = "wiki/pages/create_new_wiki_page.jsp") })
public class CreateNewWikiPageRedirect extends ActionSupport {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	public String execute() {
		return SUCCESS;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

}
