package project;

public class ProjectSummary {

	private String project_name = null;
	private String project_id = null;

	public ProjectSummary(String project_name, String project_id) {
		this.project_name = project_name;
		this.project_id = project_id;
	}

	public String getProject_id() {
		return project_id;
	}

	public String getProject_name() {
		return project_name;
	}

	public void setProject_id(String project_id) {
		this.project_id = project_id;
	}

	public void setProject_name(String project_name) {
		this.project_name = project_name;
	}

}
