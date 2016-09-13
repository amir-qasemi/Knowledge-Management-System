package project;

public class ProjectSummary {

	private String project_name = null;
	private String project_id = null;
	private String project_access_level;
	private String project_description;

	public ProjectSummary(String project_name, String project_id, String project_access_level,
			String project_description) {
		this.project_name = project_name;
		this.project_id = project_id;
		this.project_access_level = project_access_level;
		this.project_description = project_description;
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

	public String getProject_access_level() {
		return project_access_level;
	}

	public void setProject_access_level(String project_access_level) {
		this.project_access_level = project_access_level;
	}

	public String getProject_description() {
		return project_description;
	}

	public void setProject_description(String project_description) {
		this.project_description = project_description;
	}

}
