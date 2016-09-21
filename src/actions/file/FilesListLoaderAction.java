package actions.file;

import java.util.ArrayList;
import java.util.Map;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.convention.annotation.ResultPath;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

import file.MyFile;
import user.User;
import user.UserManager;

@ResultPath(value = "/")
@Action(value = "seeUploadedFiles", results = {
		@Result(name = "admin", location = "dashboard/admin/pages/display_uploaded_files.jsp"),
		@Result(name = "user", location = "dashboard/user/pages/show_public_files.jsp")})
public class FilesListLoaderAction extends ActionSupport {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private ArrayList<MyFile> files = null;

	public String execute() {
		String result = null;
		try {
			UserManager management = UserManager.getUserManager();
			files = management.getFiles();
			Map httpSession = (Map) ActionContext.getContext().get("session");
			user.User thisUser = (User) httpSession.get("user");
			if (thisUser.getRole() == user.Role.ADMIN)
				result = "admin";
			else
				result = "user";
			return result;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	public ArrayList<MyFile> getFiles() {
		return files;
	}

	public void setFiles(ArrayList<MyFile> files) {
		this.files = files;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}
}
