package content.project;

import cookie.CookieManager;
import database.DatabaseBridge;

/**
 * @author AmirH Qasemi <amirghasemi1375@gmail.com>
 * 
 * */

//Singleton Class
public class ProjectManager {
	
	private DatabaseBridge bridge = new DatabaseBridge();
	
	
	/**
	 * The sole instance of this class.
	 * */
	private final static ProjectManager INSTANCE = new ProjectManager();
	
	/**
	 * Is made private because of the "singletonity" of the class.
	 * */
	private ProjectManager(){
		
	}
	
	
	
	/**
	 * The static factory method to get the sole instance of this
	 * singleton class.
	 * @return the only instance of this class.
	 * */
	public static ProjectManager getInstance(){
		return INSTANCE;
	}
	
	
	
	public Project getProject(String key){
		return bridge.getProject(key);
	}
}
