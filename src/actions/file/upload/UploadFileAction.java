package actions.file.upload;

import java.io.File;
import java.util.Map;

import org.apache.commons.io.FileUtils;
import org.apache.struts2.convention.annotation.ResultPath;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

import user.User;
import user.UserManager;

@ResultPath(value = "/")
public class UploadFileAction extends ActionSupport {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String userName = null;
	private String heading = null;
	private File fileUploaded = null;
	private String saveDirectory = null;
	private String fileName = null;

	@SuppressWarnings("rawtypes")
	public String execute() {
		String result = null;
		boolean result2 = false;
		try {
			Map httpSession = (Map) ActionContext.getContext().get("session");
			User user = (User) httpSession.get("user");
			userName = user.getUserName();
			File file = new File(saveDirectory + fileName);
			FileUtils.copyFile(fileUploaded, file);
			UserManager management = UserManager.getUserManager();
			result2 = management.uploadFile(fileName, saveDirectory + fileName, userName, heading, user.getId());
			if (result2)
				result = "success";
			else
				result = "error";
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	public String getFileName() {
		return fileName;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
	}

	public String getSaveDirectory() {
		return saveDirectory;
	}

	public void setSaveDirectory(String saveDirectory) {
		this.saveDirectory = saveDirectory;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getHeading() {
		return heading;
	}

	public void setHeading(String heading) {
		this.heading = heading;
	}

	public File getFileUploaded() {
		return fileUploaded;
	}

	public void setFileUploaded(File fileUploaded) {
		this.fileUploaded = fileUploaded;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}
}
