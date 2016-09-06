package exceptions.page_exceptions;

public class PageDoesNotExistsException extends Exception {
	private String pageTitle;
	
	public String getPageTitle() {
		return pageTitle;
	}
	
	public PageDoesNotExistsException(String pageTitle) {
		this.pageTitle = pageTitle;
	}
	
	@Override
	public String getLocalizedMessage() {
		return "Page with this title does not exist";
	}
}
