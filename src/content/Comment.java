package content;

import java.text.SimpleDateFormat;
import java.util.Date;

import user.User;

public class Comment {
	private String content;
	private String pageTitleBelongingTo;
	private User user;
	private String userName;
	private Date writtenDate;

	public Comment(String content, String pageTitleBelongingTo, User user, Date writtenDate) {
		this.content = content;
		this.pageTitleBelongingTo = pageTitleBelongingTo;
		this.user = user;
		this.writtenDate = writtenDate;
	}

	/**
	 * @return the content
	 */
	public String getContent() {
		return content;
	}

	/**
	 * @param content
	 *            the content to set
	 */
	public void setContent(String content) {
		this.content = content;
	}

	/**
	 * @return the pageTitleBelongingTo
	 */
	public String getPageTitleBelongingTo() {
		return pageTitleBelongingTo;
	}

	/**
	 * @param pageTitleBelongingTo
	 *            the pageTitleBelongingTo to set
	 */
	public void setPageTitleBelongingTo(String pageTitleBelongingTo) {
		this.pageTitleBelongingTo = pageTitleBelongingTo;
	}

	/**
	 * @return the user
	 */
	public User getUser() {
		return user;
	}

	/**
	 * @param user
	 *            the user to set
	 */
	public void setUser(User user) {
		this.user = user;
	}

	/**
	 * @return the writtenDate
	 */
	public Date getWrittenDate() {
		return writtenDate;
	}

	/**
	 * @param writtenDate
	 *            the writtenDate to set
	 */
	public void setWrittenDate(Date writtenDate) {
		this.writtenDate = writtenDate;
	}

	public String getWrittenDate(String pattern) throws IllegalArgumentException {
		String dateString = new SimpleDateFormat(pattern).format(writtenDate);
		return dateString;
	}

	private final static String DEFAULT_DATE_PATTERN = "yyyy-MM-dd HH:mm:ss";

	public String getWrittenDateInDefaultPattern() {
		String dateString = new SimpleDateFormat(DEFAULT_DATE_PATTERN).format(writtenDate);
		return dateString;
	}

	public String getDefaultDatePattern() {
		return DEFAULT_DATE_PATTERN;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

}
