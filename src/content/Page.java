package content;

import java.util.ArrayList;

/**
 * 
 * @author Manochehr Rasouli
 *
 *         this class provide for receiving data about wiki pages from database
 *         and change them to a java class and after use them in search action
 *
 */

public class Page {

	// this content provide from page table on kms database
	private int page_id;
	private String page_title;
	private String page_touched;
	private String page_lang;

	// this content provide from page activity page
	private String page_activity_type;
	private String page_activity_content;
	private String page_activity_timestamp;
	private String page_activity_user;

	// a page have array of the comments
	private ArrayList<Comment> comments = null;

	public Page() {
	}

	public ArrayList<Comment> getComments() {
		return comments;
	}

	public void setComments(ArrayList<Comment> comments) {
		this.comments = comments;
	}

	public int getPage_id() {
		return page_id;
	}

	public void setPage_id(int page_id) {
		this.page_id = page_id;
	}

	public String getPage_title() {
		return page_title;
	}

	public void setPage_title(String page_title) {
		this.page_title = page_title;
	}

	public String getPage_touched() {
		return page_touched;
	}

	public void setPage_touched(String page_touched) {
		this.page_touched = page_touched;
	}

	public String getPage_lang() {
		return page_lang;
	}

	public void setPage_lang(String page_lang) {
		this.page_lang = page_lang;
	}

	public String getPage_activity_type() {
		return page_activity_type;
	}

	public void setPage_activity_type(String page_activity_type) {
		this.page_activity_type = page_activity_type;
	}

	public String getPage_activity_content() {
		return page_activity_content;
	}

	public void setPage_activity_content(String page_activity_content) {
		this.page_activity_content = page_activity_content;
	}

	public String getPage_activity_timestamp() {
		return page_activity_timestamp;
	}

	public void setPage_activity_timestamp(String page_activity_timestamp) {
		this.page_activity_timestamp = page_activity_timestamp;
	}

	public String getPage_activity_user() {
		return page_activity_user;
	}

	public void setPage_activity_user(String page_activity_user) {
		this.page_activity_user = page_activity_user;
	}

}
