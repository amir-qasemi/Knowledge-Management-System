package content;

import java.io.Serializable;

public class Title implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String pageTitle;

	public String getPageTitle() {
		return pageTitle;
	}

	public void setPageTitle(String pageTitle) {
		this.pageTitle = pageTitle;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

}
