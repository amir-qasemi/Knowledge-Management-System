package content;

import java.util.ArrayList;

/**
 * 
 * @author Manochehr Rasouli
 *
 *         this class provided for transfer project data in the server with out
 *         use pages for transfer this data
 *
 */

public class ProjectController {

	private static ProjectController instance = null;
	public String project_name = null;
	public String project_id = null;
	public static ArrayList<user.User> users = null;

	private ProjectController() {

	}

	public static ProjectController userController() {
		if (instance == null) {
			instance = new ProjectController();
		}
		if (users == null) {
			users = new ArrayList<>();
		}
		return instance;
	}

}
