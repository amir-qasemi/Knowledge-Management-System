package actions.project.content;

import com.opensymphony.xwork2.ActionSupport;

public class ProjectMainPageLoaderAction extends ActionSupport {
		private String key;

		@Override
		public String execute() throws Exception {
			return ActionSupport.SUCCESS;
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
		
		
}
