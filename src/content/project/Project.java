package content.project;

public class Project {
	
	//Corresponds to the ID of the project
	private String key;
	private String name;
	private String description;
	
	
	
	
	
	
	
	
	public Project(String key, String name, String description) {
		this.key = key;
		this.name = name;
		this.description = description;
	}
	/**
	 * @return the key
	 */
	public String getKey() {
		return key;
	}
	/**
	 * @param key the key to set
	 */
	public void setKey(String key) {
		this.key = key;
	}
	/**
	 * @return the name
	 */
	public String getName() {
		return name;
	}
	/**
	 * @param name the name to set
	 */
	public void setName(String name) {
		this.name = name;
	}
	/**
	 * @return the description
	 */
	public String getDescription() {
		return description;
	}
	/**
	 * @param description the description to set
	 */
	public void setDescription(String description) {
		this.description = description;
	}
	

}
