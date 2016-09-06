package actions.file;

import java.util.ArrayList;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.convention.annotation.ResultPath;

import com.opensymphony.xwork2.ActionSupport;

import file.MyFile;
import user.UserManager;

@ResultPath(value = "/")
@Action(value = "seeUploadedFiles", results = {
		@Result(name = ActionSupport.SUCCESS, location = "dashboard/admin/pages/display_uploaded_files.jsp") })
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
			result = SUCCESS;
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
