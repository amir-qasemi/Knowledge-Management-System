package file;

public class MyFile {

	// attribute
	private String fileName, fileLocation, userName, date, heading;

	// constructor
	public MyFile() {
	}

	public MyFile(MyFile file) {
		this.fileName = file.getFileName();
		this.fileLocation = file.getFileLocation();
		this.userName = file.getUserName();
		this.date = file.getDate();
		this.heading = file.getHeading();
	}

	// methods
	public String getFileName() {
		return fileName;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
	}

	public String getFileLocation() {
		return fileLocation;
	}

	public void setFileLocation(String fileLocation) {
		this.fileLocation = fileLocation;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

	public String getHeading() {
		return heading;
	}

	public void setHeading(String heading) {
		this.heading = heading;
	}

}
