package content.todo;

public class ToDoITem {
	
	private String description;
	private String timeStamp;
	private boolean isCompleted;
	private int projectID;
	private int todoItemID;
	
	
	
	public String getTimeStamp() {
		return timeStamp;
	}
	public void setTimeStamp(String timeStamp) {
		this.timeStamp = timeStamp;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public boolean getIsCompleted() {
		return isCompleted;
	}
	public void setIsCompleted(boolean isCompleted) {
		this.isCompleted = isCompleted;
	}
	public int getProjectID() {
		return projectID;
	}
	public void setProjectID(int projectID) {
		this.projectID = projectID;
	}
	public int getTodoItemID() {
		return todoItemID;
	}
	public void setTodoItemID(int todoItemID) {
		this.todoItemID = todoItemID;
	}
	

}
