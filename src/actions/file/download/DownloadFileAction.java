package actions.file.download;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.InputStream;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.ResultPath;
import org.apache.struts2.convention.annotation.Result;

import com.opensymphony.xwork2.ActionSupport;

@ResultPath(value = "/")
public class DownloadFileAction extends ActionSupport {

	// attribute
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String fileLocation = null;
	private InputStream inputStream = null;
	private long contentLength;
	private String fileName;

	// methods
	/*
	 * @Action(value = "downloadFile", results = { @Result(name = "success",
	 * type = "stream", params = { "contentType", "application/octet-stream",
	 * "bufferSize", "1024" }) })
	 */
	@Action(value = "downloadFile", results = { @Result(name = "success", type = "stream", params = { "contentType",
			"application/octet-stream", "inputName", "inputStream", "bufferSize", "1024", "contentDisposition",
			"filename=\"${fileName}\"" }) })
	@Override
	public String execute() {
		String result = null;
		try {
			File file = new File(fileLocation);
			inputStream = new FileInputStream(file);
			fileName = file.getName();
			contentLength = file.length();
			return SUCCESS;
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		}
		return result;
	}

	public String getFileLocation() {
		return fileLocation;
	}

	public void setFileLocation(String fileLocation) {
		this.fileLocation = fileLocation;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	public long getContentLength() {
		return contentLength;
	}

	public InputStream getInputStream() {
		return inputStream;
	}

	public void setContentLength(long contentLength) {
		this.contentLength = contentLength;
	}

	public void setInputStream(InputStream inputStream) {
		this.inputStream = inputStream;
	}

	public String getFileName() {
		return fileName;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
	}
}
