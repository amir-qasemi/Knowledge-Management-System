package database;

import java.beans.PropertyVetoException;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Date;

import com.mysql.jdbc.Statement;

import content.Comment;
import content.EditType;
import content.Message;
import content.Page;
import content.Title;
import content.project.Project;
import exceptions.page_exceptions.PageDoesNotExistsException;
import exceptions.user_exceptions.EmailIsAlreadyRegisteredException;
import exceptions.user_exceptions.SelectorIsNotRegisterdWithAnyUserException;
import exceptions.user_exceptions.UserDoesNotHaveSelectorRegistered;
import exceptions.user_exceptions.UserIDDoesNotExistsException;
import exceptions.user_exceptions.UserNameDoesNotExistsException;
import exceptions.user_exceptions.UsernameIsAlreadyRegisteredException;
import file.MyFile;
import project.ProjectSummary;
import user.Role;
import user.User;

public class DatabaseBridge {

	public void registerUser(String userName, String hashedPassword, String email, Role role)
			throws SQLException, IOException, PropertyVetoException, UsernameIsAlreadyRegisteredException,
			EmailIsAlreadyRegisteredException {
		// Queries
		final String regiterUserStatementQuery = "INSERT INTO user (user_name,  user_password, user_email, user_touched, user_registration, user_role) VALUES(?,?,?,?,?,?)";

		Connection connection = null;

		// Statements
		PreparedStatement regiterUserPreparedStatement = null;

		try {

			connection = ConnectionManagager.getConnection();
			regiterUserPreparedStatement = connection.prepareStatement(regiterUserStatementQuery);

			if (doesUserNameExists(userName, connection)) {
				throw new UsernameIsAlreadyRegisteredException(userName);
			}

			if (doesEmailExists(email, connection)) {
				throw new EmailIsAlreadyRegisteredException(email);
			}

			connection.setAutoCommit(false);

			Timestamp currentTimeStamp = new Timestamp(new Date().getTime());

			regiterUserPreparedStatement.setString(1, userName);
			regiterUserPreparedStatement.setString(2, hashedPassword);
			regiterUserPreparedStatement.setString(3, email);
			regiterUserPreparedStatement.setTimestamp(4, currentTimeStamp);
			regiterUserPreparedStatement.setTimestamp(5, currentTimeStamp);
			regiterUserPreparedStatement.setString(6, role.name());

			regiterUserPreparedStatement.executeUpdate();
			connection.commit();

		} catch (SQLException e) {
			if (connection != null) {
				connection.rollback();
			}

			if (regiterUserPreparedStatement != null) {
				regiterUserPreparedStatement.close();
			}

			hashedPassword = null;

			throw e;
		} catch (IOException e) {
			hashedPassword = null;

			throw e;
		} catch (PropertyVetoException e) {
			hashedPassword = null;

			throw e;
		} catch (UsernameIsAlreadyRegisteredException e) {
			throw e;
		} catch (EmailIsAlreadyRegisteredException e) {
			throw e;
		} finally {
			if (regiterUserPreparedStatement != null) {
				regiterUserPreparedStatement.close();
			}

			hashedPassword = null;

		}
	}

	public boolean doesUserNameExists(String username, Connection connection)
			throws IOException, SQLException, PropertyVetoException {
		boolean result = false;

		// Queries
		final String getUserNameQuery = "SELECT user_name FROM user WHERE user_name = ?";

		// Statements
		PreparedStatement getUserNamePreparedStatement = null;

		try {
			getUserNamePreparedStatement = connection.prepareStatement(getUserNameQuery);

			getUserNamePreparedStatement.setString(1, username);

			ResultSet getUsernameResultSet = getUserNamePreparedStatement.executeQuery();

			if (getUsernameResultSet.next()) {
				result = true;
			}
		} catch (SQLException e) {
			if (getUserNamePreparedStatement != null) {
				getUserNamePreparedStatement.close();
			}

			throw e;
		} finally {
			if (getUserNamePreparedStatement != null) {
				getUserNamePreparedStatement.close();
			}
		}

		return result;
	}

	public boolean doesEmailExists(String email, Connection connection)
			throws IOException, SQLException, PropertyVetoException {
		boolean result = false;

		// Queries
		final String getEmailQuery = "SELECT user_email FROM user WHERE user_email = ?";

		// Statements
		PreparedStatement getEmailPreparedStatement = null;

		try {
			getEmailPreparedStatement = connection.prepareStatement(getEmailQuery);

			getEmailPreparedStatement.setString(1, email);

			ResultSet getEmailResultSet = getEmailPreparedStatement.executeQuery();

			if (getEmailResultSet.next()) {
				result = true;
			}
		} catch (SQLException e) {
			if (getEmailPreparedStatement != null) {
				getEmailPreparedStatement.close();
			}

			throw e;
		} finally {
			if (getEmailPreparedStatement != null) {
				getEmailPreparedStatement.close();
			}
		}

		return result;
	}

	public String getUserHashedPassword(String userName)
			throws SQLException, UserNameDoesNotExistsException, IOException, PropertyVetoException {
		String userHashedPassword = null;

		// Queries
		final String getUserHashedPasswordQuery = "SELECT user_password FROM user WHERE user_name = ?";

		Connection connection = null;

		// Statements
		PreparedStatement getUserHashedPasswordPreparedStatement = null;

		try {
			connection = ConnectionManagager.getConnection();
			getUserHashedPasswordPreparedStatement = connection.prepareStatement(getUserHashedPasswordQuery);

			getUserHashedPasswordPreparedStatement.setString(1, userName);

			ResultSet resultSet = getUserHashedPasswordPreparedStatement.executeQuery();
			if (resultSet.next()) {
				userHashedPassword = resultSet.getString(1);
			} else {
				throw new UserNameDoesNotExistsException(userName);
			}
		} catch (SQLException ex) {
			if (getUserHashedPasswordPreparedStatement != null) {
				getUserHashedPasswordPreparedStatement.close();
			}
			userHashedPassword = null;

			throw ex;
		} catch (UserNameDoesNotExistsException ex) {
			if (getUserHashedPasswordPreparedStatement != null) {
				getUserHashedPasswordPreparedStatement.close();
			}
			userHashedPassword = null;
			throw ex;
		} catch (IOException ex) {
			throw ex;
		} catch (PropertyVetoException ex) {
			throw ex;
		} finally {
			if (getUserHashedPasswordPreparedStatement != null) {
				getUserHashedPasswordPreparedStatement.close();
			}
		}

		return userHashedPassword;
	}

	public String getUserSelector(String username)
			throws IOException, SQLException, PropertyVetoException, UserDoesNotHaveSelectorRegistered {
		String selector = null;

		// Queries
		String getUserSelectorQuery = "SELECT user_selector FROM user WHERE user_name = ?";

		Connection connection = null;

		// Statements
		PreparedStatement getUserSelectorPreparedStatement = null;

		try {
			connection = ConnectionManagager.getConnection();
			getUserSelectorPreparedStatement = connection.prepareStatement(getUserSelectorQuery);

			connection.setAutoCommit(false);

			getUserSelectorPreparedStatement.setString(1, username);

			ResultSet getUserSelectorResultSet = getUserSelectorPreparedStatement.executeQuery();

			if (getUserSelectorResultSet.next()) {
				selector = getUserSelectorResultSet.getString(1);
			} else {
				throw new UserDoesNotHaveSelectorRegistered(username);
			}

			connection.commit();

		} catch (IOException e) {
			throw e;
		} catch (SQLException e) {
			if (connection != null) {
				connection.rollback();
			}

			if (getUserSelectorPreparedStatement != null) {
				getUserSelectorPreparedStatement.close();
			}

			throw e;

		} catch (PropertyVetoException e) {
			throw e;
		} catch (UserDoesNotHaveSelectorRegistered e) {
			if (connection != null) {
				connection.rollback();
			}

			if (getUserSelectorPreparedStatement != null) {
				getUserSelectorPreparedStatement.close();
			}

			throw e;
		} finally {
			if (getUserSelectorPreparedStatement != null) {
				getUserSelectorPreparedStatement.close();
			}
		}

		return selector;

	}

	public String getUserValidator(String selector) throws IOException, SQLException, PropertyVetoException {
		String validator = null;

		// Queries
		String getUserValidatorQuery = "SELECT user_validator FROM user WHERE user_selector = ?";

		Connection connection = null;

		// Statements
		PreparedStatement getUserValidatorPreparedStatement = null;

		try {
			connection = ConnectionManagager.getConnection();
			getUserValidatorPreparedStatement = connection.prepareStatement(getUserValidatorQuery);

			connection.setAutoCommit(false);

			getUserValidatorPreparedStatement.setString(1, selector);

			ResultSet getUserValidatorResultSet = getUserValidatorPreparedStatement.executeQuery();

			if (getUserValidatorResultSet.next()) {
				validator = getUserValidatorResultSet.getString(1);
			}

			connection.commit();
		} catch (IOException e) {
			throw e;
		} catch (SQLException e) {
			if (connection != null) {
				connection.rollback();
			}

			if (getUserValidatorPreparedStatement != null) {
				getUserValidatorPreparedStatement.close();
			}

			throw e;
		} catch (PropertyVetoException e) {
			throw e;
		} finally {
			if (getUserValidatorPreparedStatement != null) {
				getUserValidatorPreparedStatement.close();
			}
		}

		return validator;
	}

	public int getUserIDFromSelector(String selector)
			throws IOException, SQLException, PropertyVetoException, SelectorIsNotRegisterdWithAnyUserException {
		int userID = -1;

		// Queries
		String getUserIDQuery = "SELECT user_id FROM user WHERE user_selector = ?";

		Connection connection = null;
		PreparedStatement getUserIDPreparedStatement = null;

		try {
			connection = ConnectionManagager.getConnection();
			getUserIDPreparedStatement = connection.prepareStatement(getUserIDQuery);

			connection.setAutoCommit(false);

			getUserIDPreparedStatement.setString(1, selector);

			ResultSet getUserIDResultSet = getUserIDPreparedStatement.executeQuery();
			if (getUserIDResultSet.next()) {
				userID = getUserIDResultSet.getInt(1);
			} else {
				throw new SelectorIsNotRegisterdWithAnyUserException(selector);
			}
		} catch (IOException e) {
			throw e;
		} catch (SQLException e) {
			if (connection != null) {
				connection.rollback();
			}

			if (getUserIDPreparedStatement != null) {
				getUserIDPreparedStatement.close();
			}

			throw e;
		} catch (PropertyVetoException e) {
			throw e;
		} catch (SelectorIsNotRegisterdWithAnyUserException e) {
			if (connection != null) {
				connection.rollback();
			}

			if (getUserIDPreparedStatement != null) {
				getUserIDPreparedStatement.close();
			}

			throw e;
		} finally {
			if (getUserIDPreparedStatement != null) {
				getUserIDPreparedStatement.close();
			}
		}

		return userID;

	}

	public int getUserIDFromUsername(String username)
			throws IOException, SQLException, PropertyVetoException, UserNameDoesNotExistsException {
		int userID = -1;

		// Queries
		String getUserIDQuery = "SELECT user_id FROM user WHERE user_name = ?";

		Connection connection = null;
		PreparedStatement getUserIDPreparedStatement = null;

		try {
			connection = ConnectionManagager.getConnection();
			getUserIDPreparedStatement = connection.prepareStatement(getUserIDQuery);

			connection.setAutoCommit(false);

			getUserIDPreparedStatement.setString(1, username);

			ResultSet getUserIDResultSet = getUserIDPreparedStatement.executeQuery();
			if (getUserIDResultSet.next()) {
				userID = getUserIDResultSet.getInt(1);
			} else {
				throw new UserNameDoesNotExistsException(username);
			}
		} catch (IOException e) {
			throw e;
		} catch (SQLException e) {
			if (connection != null) {
				connection.rollback();
			}

			if (getUserIDPreparedStatement != null) {
				getUserIDPreparedStatement.close();
			}

			throw e;
		} catch (PropertyVetoException e) {
			throw e;
		} catch (UserNameDoesNotExistsException e) {
			if (connection != null) {
				connection.rollback();
			}

			if (getUserIDPreparedStatement != null) {
				getUserIDPreparedStatement.close();
			}

			throw e;
		} finally {
			if (getUserIDPreparedStatement != null) {
				getUserIDPreparedStatement.close();
			}
		}

		return userID;

	}

	// TODO: add timestamp
	public void updateUserToken(String username, String selector, String validator)
			throws IOException, SQLException, PropertyVetoException {
		// Queries
		String updateUserTokenQuery = "UPDATE user SET user_selector = ?, user_validator = ? WHERE user_name = ?";

		Connection connection = null;

		// Statements
		PreparedStatement updateUserTokenPreparedStatement = null;

		try {
			connection = ConnectionManagager.getConnection();
			updateUserTokenPreparedStatement = connection.prepareStatement(updateUserTokenQuery);

			connection.setAutoCommit(false);

			updateUserTokenPreparedStatement.setString(1, selector);
			updateUserTokenPreparedStatement.setString(2, validator);
			updateUserTokenPreparedStatement.setString(3, username);

			updateUserTokenPreparedStatement.executeUpdate();

			connection.commit();
		} catch (IOException e) {
			throw e;
		} catch (SQLException e) {
			if (connection != null) {
				connection.rollback();

			}

			if (updateUserTokenPreparedStatement != null) {
				updateUserTokenPreparedStatement.close();
			}

			throw e;
		} catch (PropertyVetoException e) {
			throw e;
		} finally {
			if (updateUserTokenPreparedStatement != null) {
				updateUserTokenPreparedStatement.close();
			}
		}
	}

	public void updateUserPasswordSelector(String username, String selector)
			throws IOException, SQLException, PropertyVetoException {
		// Queries
		String updateUserPasswordSelectorQuery = "UPDATE user SET user_selector = ? WHERE user_name = ?";

		Connection connection = null;

		// Statements
		PreparedStatement updateUserPasswordSelectorPreparedStatement = null;

		try {
			connection = ConnectionManagager.getConnection();
			updateUserPasswordSelectorPreparedStatement = connection.prepareStatement(updateUserPasswordSelectorQuery);

			connection.setAutoCommit(false);

			updateUserPasswordSelectorPreparedStatement.setString(1, selector);
			updateUserPasswordSelectorPreparedStatement.setString(2, username);

			updateUserPasswordSelectorPreparedStatement.executeUpdate();

			connection.commit();
		} catch (IOException e) {
			throw e;
		} catch (SQLException e) {
			if (connection != null) {
				connection.rollback();

			}

			if (updateUserPasswordSelectorPreparedStatement != null) {
				updateUserPasswordSelectorPreparedStatement.close();
			}

			throw e;
		} catch (PropertyVetoException e) {
			throw e;
		} finally {
			if (updateUserPasswordSelectorPreparedStatement != null) {
				updateUserPasswordSelectorPreparedStatement.close();
			}
		}
	}

	// public void updateUserValidator(String username, String validator)
	// throws IOException, SQLException, PropertyVetoException {
	// // Queries
	// String updateUserValidatorrQuery = "UPDATE user SET user_validator = ?
	// WHERE user_name = ?";
	//
	// Connection connection = null;
	//
	// // Statements
	// PreparedStatement updateUserValidatorPreparedStatement = null;
	//
	// try {
	// connection = ConnectionManagager.getConnection();
	// updateUserValidatorPreparedStatement =
	// connection.prepareStatement(updateUserValidatorrQuery);
	//
	// connection.setAutoCommit(false);
	//
	// updateUserValidatorPreparedStatement.setString(1, validator);
	// updateUserValidatorPreparedStatement.setString(2, username);
	//
	// updateUserValidatorPreparedStatement.executeUpdate();
	//
	// connection.commit();
	// } catch (IOException e) {
	// throw e;
	// } catch (SQLException e) {
	// if (connection != null) {
	// connection.rollback();
	//
	// }
	//
	// if (updateUserValidatorPreparedStatement != null) {
	// updateUserValidatorPreparedStatement.close();
	// }
	//
	// throw e;
	// } catch (PropertyVetoException e) {
	// throw e;
	// } finally {
	// if (updateUserValidatorPreparedStatement != null) {
	// updateUserValidatorPreparedStatement.close();
	// }
	// }
	// }
	/**
	 * Will work provided that there is a user_password_salt field in DB(There
	 * isn't by default).
	 */
	public byte[] getUserPasswordSalt(String userName)
			throws SQLException, UserNameDoesNotExistsException, IOException, PropertyVetoException {
		byte[] userPasswordSalt = null;

		// Queries
		final String getUserPasswordSaltQuery = "SELECT user_password_salt FROM user WHERE user_name = ?";

		Connection connection = null;

		// Statements
		PreparedStatement getUserPasswordSaltPreparedStatement = null;

		try {
			connection = ConnectionManagager.getConnection();
			getUserPasswordSaltPreparedStatement = connection.prepareStatement(getUserPasswordSaltQuery);

			getUserPasswordSaltPreparedStatement.setString(1, userName);

			ResultSet resultSet = getUserPasswordSaltPreparedStatement.executeQuery();
			if (resultSet.next()) {

				String saltString = resultSet.getString(1);
				System.out.println(saltString);
				userPasswordSalt = new byte[saltString.length()];
				for (int i = 0; i < saltString.length(); i++) {
					userPasswordSalt[i] = (byte) saltString.charAt(i);
				}
				System.out.println(userPasswordSalt);

				byte[] uuserPasswordSalt = new byte[saltString.length()];
				for (int i = 0; i < saltString.length(); i++) {
					uuserPasswordSalt[i] = (byte) saltString.charAt(i);
				}
				System.out.println(uuserPasswordSalt);

			} else {
				throw new UserNameDoesNotExistsException(userName);
			}
		} catch (SQLException ex) {
			if (getUserPasswordSaltPreparedStatement != null) {
				getUserPasswordSaltPreparedStatement.close();
			}
			userPasswordSalt = null;

			throw ex;
		} catch (UserNameDoesNotExistsException ex) {
			if (getUserPasswordSaltPreparedStatement != null) {
				getUserPasswordSaltPreparedStatement.close();
			}
			userPasswordSalt = null;
			throw ex;
		} catch (IOException ex) {
			throw ex;
		} catch (PropertyVetoException ex) {
			throw ex;
		} finally {
			if (getUserPasswordSaltPreparedStatement != null) {
				getUserPasswordSaltPreparedStatement.close();
			}
		}

		return userPasswordSalt;
	}

	public User getUser(String userName)
			throws IOException, SQLException, PropertyVetoException, UserNameDoesNotExistsException {
		User user = new User();

		// Queries
		final String getUserQuery = "SELECT * FROM user WHERE user_name = ?";

		Connection connection = null;

		// Statements
		PreparedStatement getUserPreparedStatement = null;
		try {
			connection = ConnectionManagager.getConnection();
			getUserPreparedStatement = connection.prepareStatement(getUserQuery);
			getUserPreparedStatement.setString(1, userName);

			ResultSet resultSet = getUserPreparedStatement.executeQuery();
			if (resultSet.next()) {
				user.setId(resultSet.getInt(1));
				user.setUserName(resultSet.getString(2));
				user.setFirstName(resultSet.getString(3));
				user.setLastName(resultSet.getString(4));

				String role = resultSet.getString(6);

				if (role.equals(Role.ADMIN.name())) {
					user.setRole(Role.ADMIN);
				} else if (role.equals(Role.USER.name())) {
					user.setRole(Role.USER);
				}

				user.setEmail(resultSet.getString(9));
				user.setRegistrationDate(resultSet.getTimestamp(15).toString());

				if (resultSet.getInt(18) == 1) {
					user.setBanned(false);
				} else if (resultSet.getInt(18) == 0) {
					user.setBanned(true);
				}

				user.setPhoneNumber(resultSet.getString(18));
				if (resultSet.getDate(19) != null) {
					user.setBirthDate(resultSet.getDate(19).toString());
				}
			} else {
				throw new UserNameDoesNotExistsException(userName);
			}
		} catch (SQLException e) {
			if (getUserPreparedStatement != null) {
				getUserPreparedStatement.close();
			}

			throw e;
		} catch (IOException e) {
			throw e;
		} catch (PropertyVetoException e) {
			throw e;
		} catch (UserNameDoesNotExistsException e) {
			if (getUserPreparedStatement != null) {
				getUserPreparedStatement.close();
			}

			throw e;
		} finally {
			if (getUserPreparedStatement != null) {
				getUserPreparedStatement.close();
			}
		}

		return user;
	}

	public User getUser(int userID)
			throws IOException, SQLException, PropertyVetoException, UserIDDoesNotExistsException {
		User user = new User();

		// Queries
		final String getUserQuery = "SELECT * FROM user WHERE user_id = ?";

		Connection connection = null;

		// Statements
		PreparedStatement getUserPreparedStatement = null;
		try {
			connection = ConnectionManagager.getConnection();
			getUserPreparedStatement = connection.prepareStatement(getUserQuery);
			getUserPreparedStatement.setInt(1, userID);

			ResultSet resultSet = getUserPreparedStatement.executeQuery();
			if (resultSet.next()) {
				user.setId(resultSet.getInt(1));
				user.setUserName(resultSet.getString(2));
				user.setFirstName(resultSet.getString(3));
				user.setLastName(resultSet.getString(4));

				String role = resultSet.getString(6);
				if (role.equals(Role.ADMIN.name())) {
					user.setRole(Role.ADMIN);
				} else if (role.equals(Role.USER.name())) {
					user.setRole(Role.USER);
				}

				user.setEmail(resultSet.getString(9));
				user.setRegistrationDate(resultSet.getTimestamp(15).toString());

				if (resultSet.getInt(18) == 1) {
					user.setBanned(true);
				} else if (resultSet.getInt(18) == 0) {
					user.setBanned(false);
				}

				user.setPhoneNumber(resultSet.getString(19));
				if (resultSet.getDate(20) != null) {
					user.setBirthDate(resultSet.getDate(20).toString());
				}

			} else {
				throw new UserIDDoesNotExistsException(userID);
			}
		} catch (SQLException e) {
			if (getUserPreparedStatement != null) {
				getUserPreparedStatement.close();
			}

			throw e;
		} catch (IOException e) {
			throw e;
		} catch (PropertyVetoException e) {
			throw e;
		} catch (UserIDDoesNotExistsException e) {
			if (getUserPreparedStatement != null) {
				getUserPreparedStatement.close();
			}

			throw e;
		} finally {
			if (getUserPreparedStatement != null) {
				getUserPreparedStatement.close();
			}
		}

		return user;
	}

	public ArrayList<User> getUsers() throws Throwable {
		ArrayList<User> users = new ArrayList<>();

		// Queries
		final String getAllUsersQuery = "SELECT * FROM user";

		Connection connection = null;

		// Statements
		PreparedStatement getAllUsersPreparedStatement = null;
		try {
			connection = ConnectionManagager.getConnection();
			getAllUsersPreparedStatement = connection.prepareStatement(getAllUsersQuery);
			ResultSet resultSet = getAllUsersPreparedStatement.executeQuery();
			while (resultSet.next()) {
				User user = new User();
				user.setId(resultSet.getInt(1));
				user.setUserName(resultSet.getString(2));
				user.setFirstName(resultSet.getString(3));
				user.setLastName(resultSet.getString(4));

				String role = resultSet.getString(6);
				if (role.equals(Role.ADMIN.name())) {
					user.setRole(Role.ADMIN);
				} else if (role.equals(Role.USER.name())) {
					user.setRole(Role.USER);
				}

				user.setEmail(resultSet.getString(9));
				user.setRegistrationDate(resultSet.getTimestamp(15).toString());

				if (resultSet.getInt(18) == 1) {
					user.setBanned(true);
				} else if (resultSet.getInt(18) == 0) {
					user.setBanned(false);
				}

				user.setPhoneNumber(resultSet.getString(19));
				if (resultSet.getDate(20) != null) {
					user.setBirthDate(resultSet.getDate(20).toString());
				}

				users.add(new User(user));
			}
		} catch (Throwable e) {
			throw e;
		} finally {
			getAllUsersPreparedStatement.close();

		}

		return users;
	}

	public void updateFirstName(String name, String userName)
			throws SQLException, IOException, PropertyVetoException, UserNameDoesNotExistsException {
		// Queries
		final String updateFirstNameQuery = "UPDATE user SET user_real_first_name = ? WHERE user_name = ?";

		Connection connection = null;

		// Statements
		PreparedStatement updateFirstNamePreparedStatement = null;

		try {
			connection = ConnectionManagager.getConnection();
			updateFirstNamePreparedStatement = connection.prepareStatement(updateFirstNameQuery);

			connection.setAutoCommit(false);

			if (!doesUserNameExists(userName, connection)) {
				throw new UserNameDoesNotExistsException(userName);
			}

			updateFirstNamePreparedStatement.setString(1, name);
			updateFirstNamePreparedStatement.setString(2, userName);
			updateFirstNamePreparedStatement.executeUpdate();
			connection.commit();

		} catch (SQLException e) {
			if (connection != null) {
				connection.rollback();
			}

			if (updateFirstNamePreparedStatement != null) {
				updateFirstNamePreparedStatement.close();
			}

			throw e;
		} catch (IOException e) {
			throw e;
		} catch (PropertyVetoException e) {
			throw e;
		} catch (UserNameDoesNotExistsException e) {
			if (connection != null) {
				connection.rollback();
			}

			if (updateFirstNamePreparedStatement != null) {
				updateFirstNamePreparedStatement.close();
			}

			throw e;
		} finally {
			if (updateFirstNamePreparedStatement != null) {
				updateFirstNamePreparedStatement.close();
			}

		}
	}

	public void updateLastName(String lastName, String userName)
			throws SQLException, IOException, PropertyVetoException, UserNameDoesNotExistsException {
		// Queries
		final String updateLastNameQuery = "UPDATE user SET user_real_last_name = ? WHERE user_name = ?";

		Connection connection = null;

		// Statements
		PreparedStatement updateLastNamePreparedStatement = null;

		try {
			connection = ConnectionManagager.getConnection();
			updateLastNamePreparedStatement = connection.prepareStatement(updateLastNameQuery);

			connection.setAutoCommit(false);

			if (!doesUserNameExists(userName, connection)) {
				throw new UserNameDoesNotExistsException(userName);
			}

			updateLastNamePreparedStatement.setString(1, lastName);
			updateLastNamePreparedStatement.setString(2, userName);
			updateLastNamePreparedStatement.executeUpdate();

			connection.commit();
		} catch (SQLException e) {
			if (connection != null) {
				connection.rollback();
			}

			if (updateLastNamePreparedStatement != null) {
				updateLastNamePreparedStatement.close();
			}

			throw e;
		} catch (IOException e) {
			throw e;
		} catch (PropertyVetoException e) {
			throw e;
		} catch (UserNameDoesNotExistsException e) {
			if (connection != null) {
				connection.rollback();
			}

			if (updateLastNamePreparedStatement != null) {
				updateLastNamePreparedStatement.close();
			}

			throw e;
		} finally {
			if (updateLastNamePreparedStatement != null) {
				updateLastNamePreparedStatement.close();
			}

		}
	}

	public void updateUserName(String userName, String oldUserName)
			throws SQLException, IOException, PropertyVetoException, UserNameDoesNotExistsException {
		// Queries
		final String updateUsernameQuery = "UPDATE user SET user_name = ? WHERE user_name = ?";

		Connection connection = null;

		// Statements
		PreparedStatement updateUsernamePreparedStatement = null;

		try {
			connection = ConnectionManagager.getConnection();
			updateUsernamePreparedStatement = connection.prepareStatement(updateUsernameQuery);

			connection.setAutoCommit(false);

			if (!doesUserNameExists(userName, connection)) {
				throw new UserNameDoesNotExistsException(userName);
			}

			updateUsernamePreparedStatement.setString(1, userName);
			updateUsernamePreparedStatement.setString(2, oldUserName);
			updateUsernamePreparedStatement.executeUpdate();

			connection.commit();
		} catch (SQLException e) {
			if (connection != null) {
				connection.rollback();
			}

			if (updateUsernamePreparedStatement != null) {
				updateUsernamePreparedStatement.close();
			}

			throw e;
		} catch (IOException e) {
			throw e;
		} catch (PropertyVetoException e) {
			throw e;
		} catch (UserNameDoesNotExistsException e) {
			if (connection != null) {
				connection.rollback();
			}

			if (updateUsernamePreparedStatement != null) {
				updateUsernamePreparedStatement.close();
			}

			throw e;
		} finally {
			if (updateUsernamePreparedStatement != null) {
				updateUsernamePreparedStatement.close();
			}
		}
	}

	public void updatePassword(String password, String userName)
			throws SQLException, IOException, PropertyVetoException {
		// Queries
		final String updatePasswordQuery = "UPDATE user SET user_password = ? WHERE user_name = ?";

		Connection connection = null;

		// Statements
		PreparedStatement updatePasswordPreparedStatement = null;
		try {
			connection = ConnectionManagager.getConnection();
			updatePasswordPreparedStatement = connection.prepareStatement(updatePasswordQuery);

			connection.setAutoCommit(false);

			updatePasswordPreparedStatement.setString(1, password);
			updatePasswordPreparedStatement.setString(2, userName);

			updatePasswordPreparedStatement.executeUpdate();

			connection.commit();

		} catch (SQLException e) {
			if (connection != null) {
				connection.rollback();
			}

			if (updatePasswordPreparedStatement != null) {
				updatePasswordPreparedStatement.close();
			}

			throw e;
		} catch (IOException e) {
			throw e;
		} catch (PropertyVetoException e) {
			throw e;
		} finally {
			if (updatePasswordPreparedStatement != null) {
				updatePasswordPreparedStatement.close();
			}

		}
	}

	// TODO: change parameter type to date
	public void updateBirthDate(String birthDate, String userName)
			throws SQLException, IOException, PropertyVetoException {
		final String updateBirthDateQuery = "UPDATE user SET user_birth_date = ? WHERE user_name = ?";

		PreparedStatement statement = null;
		Connection connection = null;

		try {
			connection = ConnectionManagager.getConnection();
			connection.setAutoCommit(false);
			statement = connection.prepareStatement(updateBirthDateQuery);
			statement.setString(1, birthDate);
			statement.setString(2, userName);
			statement.executeUpdate();
			connection.commit();

		} catch (SQLException e) {
			connection.rollback();
			throw e;
		} catch (IOException e) {
			throw e;
		} catch (PropertyVetoException e) {
			throw e;
		} finally {
			statement.close();
		}
	}

	public void updateEmail(String email, String userName) throws SQLException, IOException, PropertyVetoException {
		// Queries
		final String updateEmailQuery = "UPDATE user SET user_email = ? WHERE user_name = ?";

		Connection connection = null;

		// Statements
		PreparedStatement updateEmailPreparedStatement = null;

		try {
			connection = ConnectionManagager.getConnection();
			updateEmailPreparedStatement = connection.prepareStatement(updateEmailQuery);

			connection.setAutoCommit(false);

			updateEmailPreparedStatement.setString(1, email);
			updateEmailPreparedStatement.setString(2, userName);
			updateEmailPreparedStatement.executeUpdate();

			connection.commit();

		} catch (SQLException e) {
			if (connection != null) {
				connection.rollback();
			}

			if (updateEmailPreparedStatement != null) {
				updateEmailPreparedStatement.close();
			}

			throw e;
		} catch (IOException e) {
			throw e;
		} catch (PropertyVetoException e) {
			throw e;
		} finally {
			if (updateEmailPreparedStatement != null) {
				updateEmailPreparedStatement.close();
			}
		}
	}

	public void updatePhoneNumber(String phoneNumber, String userName)
			throws SQLException, IOException, PropertyVetoException {
		// Queries
		final String updatePhoneNumberQuery = "UPDATE user SET user_phone_number = ? WHERE user_name = ?";

		Connection connection = null;

		// Statements
		PreparedStatement updatePhoneNumberPreparedStatement = null;
		try {
			connection = ConnectionManagager.getConnection();
			updatePhoneNumberPreparedStatement = connection.prepareStatement(updatePhoneNumberQuery);

			connection.setAutoCommit(false);

			updatePhoneNumberPreparedStatement.setString(1, phoneNumber);
			updatePhoneNumberPreparedStatement.setString(2, userName);

			updatePhoneNumberPreparedStatement.executeUpdate();

			connection.commit();

		} catch (SQLException e) {
			if (connection != null) {
				connection.rollback();
			}

			if (updatePhoneNumberPreparedStatement != null) {
				updatePhoneNumberPreparedStatement.close();
			}

			throw e;
		} catch (IOException e) {
			throw e;
		} catch (PropertyVetoException e) {
			throw e;
		} finally {
			if (updatePhoneNumberPreparedStatement != null) {
				updatePhoneNumberPreparedStatement.close();
			}

		}
	}

	public void updateRole(Role role, String userName) throws SQLException, IOException, PropertyVetoException {
		// Queries
		String updateRoleQuery = "UPDATE user SET user_role = ? WHERE user_name = ?";

		Connection connection = null;

		// Statements
		PreparedStatement updateRolePreparedStatement = null;
		try {
			connection = ConnectionManagager.getConnection();
			updateRolePreparedStatement = connection.prepareStatement(updateRoleQuery);

			connection.setAutoCommit(false);

			updateRolePreparedStatement.setString(1, role.name());
			updateRolePreparedStatement.setString(2, userName);

			updateRolePreparedStatement.executeUpdate();

			connection.commit();

		} catch (SQLException e) {
			if (connection != null) {
				connection.rollback();
			}

			if (updateRolePreparedStatement != null) {
				updateRolePreparedStatement.close();
			}

			throw e;
		} catch (IOException e) {
			throw e;
		} catch (PropertyVetoException e) {
			throw e;
		} finally {
			if (updateRolePreparedStatement != null) {
				updateRolePreparedStatement.close();
			}
		}
	}

	public void updateBan(boolean ban, String userName) throws SQLException, IOException, PropertyVetoException {
		// Queries
		String updateBanQuery = "UPDATE user SET user_ban = ? WHERE user_name = ?";

		Connection connection = null;

		// Statements
		PreparedStatement updateBanPreparedStatement = null;

		try {
			connection = ConnectionManagager.getConnection();
			updateBanPreparedStatement = connection.prepareStatement(updateBanQuery);

			connection.setAutoCommit(false);

			if (ban) {
				updateBanPreparedStatement.setInt(1, 1);
			} else {
				updateBanPreparedStatement.setInt(1, 0);
			}
			updateBanPreparedStatement.setString(2, userName);

			updateBanPreparedStatement.executeUpdate();

			connection.commit();

		} catch (SQLException e) {
			if (connection != null) {
				connection.rollback();
			}

			if (updateBanPreparedStatement != null) {
				updateBanPreparedStatement.close();
			}

			throw e;
		} catch (IOException e) {
			throw e;
		} catch (PropertyVetoException e) {
			throw e;
		} finally {
			if (updateBanPreparedStatement != null) {
				updateBanPreparedStatement.close();
			}
		}
	}

	@SuppressWarnings({ "null" })
	public boolean addMessage(String userName, String message, String heading, String date, int user_id)
			throws IOException, SQLException, PropertyVetoException {
		boolean result = false;
		PreparedStatement statement = null;
		Connection connection = null;
		try {
			connection = ConnectionManagager.getConnection();
			connection.setAutoCommit(false);
			statement = connection.prepareStatement(
					"INSERT INTO public_message (public_message_user_id,public_message_message,public_message_user_name,public_message_date,public_message_heading) VALUES (?,?,?,?,?)");
			statement.setInt(1, user_id);
			statement.setString(2, message);
			statement.setString(3, userName);
			statement.setString(4, date);
			statement.setString(5, heading);
			statement.executeUpdate();
			connection.commit();
			result = true;
		} catch (IOException e) {
			connection.rollback();
			throw e;
		} catch (SQLException e) {
			e.printStackTrace();
			throw e;
		} catch (PropertyVetoException e) {
			connection.rollback();
			throw e;
		} finally {
			statement.close();
		}
		return result;
	}

	@SuppressWarnings("null")
	public ArrayList<Message> getMessage() throws IOException, SQLException, PropertyVetoException {
		ArrayList<Message> messages = new ArrayList<>();
		Message message = null;
		Connection connection = null;
		PreparedStatement statement = null;
		ResultSet resultSet = null;
		try {
			connection = ConnectionManagager.getConnection();
			connection.setAutoCommit(false);
			statement = connection.prepareStatement("SELECT * FROM public_message");
			resultSet = statement.executeQuery();
			while (resultSet.next()) {
				message = new Message();
				message.setMessage(resultSet.getString("public_message_message"));
				message.setUserName(resultSet.getString("public_message_user_name"));
				message.setDate(resultSet.getString("public_message_date"));
				message.setHeading(resultSet.getString("public_message_heading"));
				messages.add(new Message(message));
			}
			connection.commit();
		} catch (IOException e) {
			connection.rollback();
			throw e;
		} catch (SQLException e) {
			connection.rollback();
			throw e;
		} catch (PropertyVetoException e) {
			connection.rollback();
			throw e;
		} finally {
			statement.close();
		}
		return messages;
	}

	@SuppressWarnings("null")
	public boolean uploadFile(String fileName, String fileLocation, String userName, String date, String heading,
			int user_id) throws IOException, SQLException, PropertyVetoException {
		boolean result = false;
		Connection connection = null;
		PreparedStatement statement = null;
		try {
			connection = ConnectionManagager.getConnection();
			connection.setAutoCommit(false);
			statement = connection.prepareStatement(
					"INSERT INTO public_file (public_file_user_id,public_file_name,public_file_location,public_file_user_name,public_file_date,public_file_heading) VALUES(?,?,?,?,?,?)");
			statement.setInt(1, user_id);
			statement.setString(2, fileName);
			statement.setString(3, fileLocation);
			statement.setString(4, userName);
			statement.setString(5, date);
			statement.setString(6, heading);
			statement.executeUpdate();
			connection.commit();
			result = true;
		} catch (IOException e) {
			connection.rollback();
			throw e;
		} catch (SQLException e) {
			connection.rollback();
			throw e;
		} catch (PropertyVetoException e) {
			connection.rollback();
			throw e;
		} finally {
			statement.close();
		}
		return result;
	}

	public ArrayList<MyFile> getFiles() throws Exception {
		ArrayList<MyFile> files = new ArrayList<>();
		MyFile file = null;
		Connection connection = null;
		PreparedStatement statement = null;
		ResultSet resultSet = null;
		try {
			connection = ConnectionManagager.getConnection();
			connection.setAutoCommit(false);
			statement = connection.prepareStatement("SELECT * FROM public_file");
			resultSet = statement.executeQuery();
			while (resultSet.next()) {
				file = new MyFile();
				file.setFileName(resultSet.getString("public_file_name"));
				file.setFileLocation(resultSet.getString("public_file_location"));
				file.setUserName(resultSet.getString("public_file_user_name"));
				file.setDate(resultSet.getString("public_file_date"));
				file.setHeading(resultSet.getString("public_file_heading"));
				files.add(new MyFile(file));
			}
			connection.commit();
		} catch (IOException | SQLException | PropertyVetoException e) {
			connection.rollback();
			throw e;
		} finally {
			statement.close();
		}
		return files;
	}

	public boolean registerComment(String content, String userName, String pageTitle) throws IOException, SQLException,
			PropertyVetoException, UserNameDoesNotExistsException, PageDoesNotExistsException {
		boolean result = false;

		// Queries
		String getUserIDQuery = "SELECT user_id FROM user WHERE user_name = ?";
		String getPageIDQuery = "SELECT page_id FROM page WHERE page_title = ?";
		String registerPageQuery = "INSERT INTO comment (comment_page, comment_user, comment_content, comment_timestamp) VALUES(?, ?, ?, ?)";

		Connection connection = null;

		// Statements
		PreparedStatement getUserIDPreparedStatement = null;
		PreparedStatement getPageIDPreparedStatement = null;
		PreparedStatement registerCommentPreparedStatement = null;

		try {
			connection = ConnectionManagager.getConnection();

			getUserIDPreparedStatement = connection.prepareStatement(getUserIDQuery);
			getPageIDPreparedStatement = connection.prepareStatement(getPageIDQuery);
			registerCommentPreparedStatement = connection.prepareStatement(registerPageQuery);

			// getting the user_id
			int userID;
			getUserIDPreparedStatement.setString(1, userName);
			ResultSet userIDResultSet = getUserIDPreparedStatement.executeQuery();
			if (userIDResultSet.next()) {
				userID = userIDResultSet.getInt(1);
			} else {
				throw new UserNameDoesNotExistsException(userName);
			}

			// getting the page_id
			int pageID;
			getPageIDPreparedStatement.setString(1, pageTitle);
			ResultSet pageIDResultSet = getPageIDPreparedStatement.executeQuery();
			if (pageIDResultSet.next()) {
				pageID = pageIDResultSet.getInt(1);
			} else {
				throw new PageDoesNotExistsException(pageTitle);
			}

			connection.setAutoCommit(false);

			Timestamp currentTimeStamp = new Timestamp(new Date().getTime());

			// registering the comment
			registerCommentPreparedStatement.setInt(1, pageID);
			registerCommentPreparedStatement.setInt(2, userID);
			registerCommentPreparedStatement.setString(3, content);
			registerCommentPreparedStatement.setTimestamp(4, currentTimeStamp);

			registerCommentPreparedStatement.executeUpdate();

			connection.commit();
			result = true;

		} catch (IOException e) {
			throw e;
		} catch (SQLException e) {
			if (getUserIDPreparedStatement != null) {
				getUserIDPreparedStatement.close();
			}

			if (getPageIDPreparedStatement != null) {
				getPageIDPreparedStatement.close();
			}

			if (registerCommentPreparedStatement != null) {
				registerCommentPreparedStatement.close();
			}

			throw e;
		} catch (PropertyVetoException e) {
			throw e;
		} catch (UserNameDoesNotExistsException e) {

			if (getUserIDPreparedStatement != null) {
				getUserIDPreparedStatement.close();
			}

			if (getPageIDPreparedStatement != null) {
				getPageIDPreparedStatement.close();
			}

			if (registerCommentPreparedStatement != null) {
				registerCommentPreparedStatement.close();
			}

			throw e;
		} catch (PageDoesNotExistsException e) {

			if (getUserIDPreparedStatement != null) {
				getUserIDPreparedStatement.close();
			}

			if (getPageIDPreparedStatement != null) {
				getPageIDPreparedStatement.close();
			}

			if (registerCommentPreparedStatement != null) {
				registerCommentPreparedStatement.close();
			}

			throw e;
		} finally {

			if (getUserIDPreparedStatement != null) {
				getUserIDPreparedStatement.close();
			}

			if (getPageIDPreparedStatement != null) {
				getPageIDPreparedStatement.close();
			}

			if (registerCommentPreparedStatement != null) {
				registerCommentPreparedStatement.close();
			}
		}

		return result;
	}

	public ArrayList<Comment> getComments(int page_id)
			throws IOException, SQLException, PropertyVetoException, UserIDDoesNotExistsException {
		ArrayList<Comment> comments = new ArrayList<>();

		// Queries
		String getCommentsQuery = "SELECT * FROM comment WHERE comment_page = ?";

		Connection connection = null;

		// Statements
		PreparedStatement getCommentsPreparedStatement = null;

		try {
			connection = ConnectionManagager.getConnection();
			getCommentsPreparedStatement = connection.prepareStatement(getCommentsQuery);
			getCommentsPreparedStatement.setInt(1, page_id);

			ResultSet commentsResultSet = getCommentsPreparedStatement.executeQuery();
			while (commentsResultSet.next()) {
				String content = commentsResultSet.getString(4);
				User user = getUser(commentsResultSet.getInt(3));
				Date writtenDate = commentsResultSet.getTimestamp(5);
				String pageTitleBelongingTo = getPageTitle(commentsResultSet.getInt(2));

				Comment comment = new Comment(content, pageTitleBelongingTo, user, writtenDate);
				comment.setUserName(user.getUserName());
				comments.add(comment);
			}
		} catch (IOException e) {
			throw e;
		} catch (SQLException e) {

			if (getCommentsPreparedStatement != null) {
				getCommentsPreparedStatement.close();
			}

			throw e;
		} catch (PropertyVetoException e) {
			throw e;
		} catch (UserIDDoesNotExistsException e) {
			throw e;
		} finally {

			if (getCommentsPreparedStatement != null) {
				getCommentsPreparedStatement.close();
			}

		}

		return comments;
	}

	public String getPageTitle(int pageID) throws IOException, SQLException, PropertyVetoException {
		String pageTitle = null;

		// Queries
		String getPageTitleQuery = "SELECT page_title FROM page WHERE page_id = ?";

		Connection connection = null;

		// Statements
		PreparedStatement getPageTitlePreparedStatement = null;

		try {
			connection = ConnectionManagager.getConnection();
			getPageTitlePreparedStatement = connection.prepareStatement(getPageTitleQuery);

			getPageTitlePreparedStatement.setInt(1, pageID);
			ResultSet pageTitleResultSet = getPageTitlePreparedStatement.executeQuery();

			if (pageTitleResultSet.next()) {
				pageTitle = pageTitleResultSet.getString(1);
			} else {
				// TODO: replace it with an exception.
				pageTitle = "Non-Existent";
			}
		} catch (IOException e) {
			throw e;
		} catch (SQLException e) {

			if (getPageTitlePreparedStatement != null) {
				getPageTitlePreparedStatement.close();
			}

			throw e;
		} catch (PropertyVetoException e) {
			throw e;
		} finally {
			if (getPageTitlePreparedStatement != null) {
				getPageTitlePreparedStatement.close();
			}
		}

		return pageTitle;
	}

	public String getPageLatestContent(String pageTitle) throws IOException, SQLException, PropertyVetoException {
		String pageContent = null;

		// Queries
		String getPageIDQuey = "SELECT page_id FROM page WHERE page_title = ?";
		String getPageLatestPageActivityIDQuery = "SELECT MAX(page_activity_id) FROM page_activity WHERE page_activity_page = ?";
		String getPageContentQuery = "SELECT page_activity_content FROM page_activity WHERE page_activity_id = ?";

		Connection connection = null;

		// Statements
		PreparedStatement getPageIDPreparedStatement = null;
		PreparedStatement getPageLatestPageActivityIDPreparedStatement = null;
		PreparedStatement getPageContentPreparedStatement = null;

		try {
			connection = ConnectionManagager.getConnection();
			getPageIDPreparedStatement = connection.prepareStatement(getPageIDQuey);
			getPageLatestPageActivityIDPreparedStatement = connection
					.prepareStatement(getPageLatestPageActivityIDQuery);
			getPageContentPreparedStatement = connection.prepareStatement(getPageContentQuery);

			int pageID = 0;
			ResultSet pageIDResultSet = getPageIDPreparedStatement.executeQuery();
			if (pageIDResultSet.next()) {
				pageID = pageIDResultSet.getInt(1);
			} else {
				// TODO: throw an exception.
			}

			int activityID = 0;
			getPageLatestPageActivityIDPreparedStatement.setInt(1, pageID);
			ResultSet pageLatestPageActivityIDResultSet = getPageLatestPageActivityIDPreparedStatement.executeQuery();
			if (pageLatestPageActivityIDResultSet.next()) {
				activityID = pageLatestPageActivityIDResultSet.getInt(1);
			} else {
				// TODO: throw exception.
			}

			getPageContentPreparedStatement.setInt(1, activityID);
			ResultSet pageContentResultSet = getPageContentPreparedStatement.executeQuery();
			if (pageContentResultSet.next()) {
				pageContent = pageContentResultSet.getString(1);
			} else {
				// TODO: throw exception.
			}

		} catch (IOException e) {
			throw e;
		} catch (SQLException e) {
			if (getPageIDPreparedStatement != null) {
				getPageIDPreparedStatement.close();
			}
			if (getPageLatestPageActivityIDPreparedStatement != null) {
				getPageLatestPageActivityIDPreparedStatement.close();
			}
			if (getPageContentPreparedStatement != null) {
				getPageContentPreparedStatement.close();
			}
			throw e;
		} catch (PropertyVetoException e) {
			throw e;
		} finally {
			if (getPageIDPreparedStatement != null) {
				getPageIDPreparedStatement.close();
			}
			if (getPageLatestPageActivityIDPreparedStatement != null) {
				getPageLatestPageActivityIDPreparedStatement.close();
			}
			if (getPageContentPreparedStatement != null) {
				getPageContentPreparedStatement.close();
			}
		}

		return pageContent;
	}

	public ArrayList<content.Title> getAllPageTitles() throws IOException, SQLException, PropertyVetoException {
		ArrayList<content.Title> pageTitles = new ArrayList<>();

		// Queries
		String getAllPageTitlesQuery = "SELECT page_title FROM page";

		Connection connection = null;

		// Statements
		PreparedStatement getAllPageTitlesPreparedStatement = null;

		try {
			connection = ConnectionManagager.getConnection();
			getAllPageTitlesPreparedStatement = connection.prepareStatement(getAllPageTitlesQuery);

			ResultSet allPageTitlesResultSet = getAllPageTitlesPreparedStatement.executeQuery();
			while (allPageTitlesResultSet.next()) {
				content.Title title = new Title();
				title.setPageTitle(allPageTitlesResultSet.getString(1));
				pageTitles.add(title);
			}
		} catch (IOException e) {
			throw e;
		} catch (SQLException e) {
			if (getAllPageTitlesPreparedStatement != null) {
				getAllPageTitlesPreparedStatement.close();
			}

			throw e;
		} catch (PropertyVetoException e) {

			throw e;
		} finally {
			if (getAllPageTitlesPreparedStatement != null) {
				getAllPageTitlesPreparedStatement.close();
			}
		}

		return pageTitles;
	}

	public void savePage(String pageTitle, String actorUserName, String contentOfPage, EditType editType)
			throws IOException, SQLException, PropertyVetoException, UserNameDoesNotExistsException {

		// Queries
		String getPageWithPageTitleQuery = "SELECT * FROM page WHERE page_title = ?";
		String createNewPageQuery = "INSERT INTO page (page_title,page_touched,page_lang) VALUES(?, ?, ?)";
		String createNewPageActivityQuery = "INSERT INTO page_activity (page_activity_page,page_activity_type,page_activity_content, page_activity_timestamp, page_activity_user) VALUES(?,?,?,?,?)";
		String updatePageLatestPageActivityQuery = "UPDATE page SET page_touched = ? WHERE page_title = ?";

		Connection connection = null;

		// Statements
		PreparedStatement createNewPagePreparedStatement = null;
		PreparedStatement getPageWithPageTitlePreparedStatement = null;
		PreparedStatement createNewPageActivityPreparedStatement = null;
		PreparedStatement updatePageLatestPageActivityPreparedStatement = null;

		try {
			connection = ConnectionManagager.getConnection();
			getPageWithPageTitlePreparedStatement = connection.prepareStatement(getPageWithPageTitleQuery);
			createNewPageActivityPreparedStatement = connection.prepareStatement(createNewPageActivityQuery,
					Statement.RETURN_GENERATED_KEYS);
			updatePageLatestPageActivityPreparedStatement = connection
					.prepareStatement(updatePageLatestPageActivityQuery);
			createNewPagePreparedStatement = connection.prepareStatement(createNewPageQuery,
					Statement.RETURN_GENERATED_KEYS);

			// Determining whether the page exists or not.
			boolean pageExists = false;
			int pageID = -1;
			getPageWithPageTitlePreparedStatement.setString(1, pageTitle);
			ResultSet pageWithPageTitleResultSet = getPageWithPageTitlePreparedStatement.executeQuery();
			if (pageWithPageTitleResultSet.next()) {
				pageExists = true;
				pageID = pageWithPageTitleResultSet.getInt(1);
			}

			connection.setAutoCommit(false);

			if (pageExists && editType == EditType.CREATE) {
				// TODO: throw an exception.
			} else if (pageExists && editType != EditType.CREATE) {
				// Creating new page activity
				createNewPageActivityPreparedStatement.setInt(1, pageID);
				createNewPageActivityPreparedStatement.setString(2, editType.name());
				createNewPageActivityPreparedStatement.setString(3, contentOfPage);
				createNewPageActivityPreparedStatement.setTimestamp(4, new Timestamp(new Date().getTime()));
				createNewPageActivityPreparedStatement.setInt(5, getUser(actorUserName).getId());
				createNewPageActivityPreparedStatement.executeUpdate();

				ResultSet createNewPageActivityTablesKey = createNewPageActivityPreparedStatement.getGeneratedKeys();
				createNewPageActivityTablesKey.next();

				// Updating the page info related to the new page activity.
				updatePageLatestPageActivityPreparedStatement.setTimestamp(1, new Timestamp(new Date().getTime()));
				updatePageLatestPageActivityPreparedStatement.setString(2, pageTitle);
				updatePageLatestPageActivityPreparedStatement.executeUpdate();
			} else if (!(pageExists) && editType == EditType.CREATE) {
				// Creating the new page
				createNewPagePreparedStatement.setString(1, pageTitle);
				createNewPagePreparedStatement.setTimestamp(2, new Timestamp(new Date().getTime()));
				createNewPagePreparedStatement.setString(3, "en");
				createNewPagePreparedStatement.executeUpdate();

				ResultSet createNewPageTablesKey = createNewPagePreparedStatement.getGeneratedKeys();
				createNewPageTablesKey.next();

				createNewPageActivityPreparedStatement.setInt(1, createNewPageTablesKey.getInt(1));
				createNewPageActivityPreparedStatement.setString(2, editType.name());
				createNewPageActivityPreparedStatement.setString(3, contentOfPage);
				createNewPageActivityPreparedStatement.setTimestamp(4, new Timestamp(new Date().getTime()));
				createNewPageActivityPreparedStatement.setInt(5, getUser(actorUserName).getId());
				createNewPageActivityPreparedStatement.executeUpdate();

			} else {
				// TODO: throw an exception.
			}

			connection.commit();

		} catch (IOException e) {
			throw e;
		} catch (SQLException e) {
			if (connection != null) {
				connection.rollback();
			}

			if (createNewPagePreparedStatement != null) {
				createNewPagePreparedStatement.close();
			}

			if (getPageWithPageTitlePreparedStatement != null) {
				getPageWithPageTitlePreparedStatement.close();
			}

			if (createNewPageActivityPreparedStatement != null) {
				getPageWithPageTitlePreparedStatement.close();
			}
			if (updatePageLatestPageActivityPreparedStatement != null) {
				updatePageLatestPageActivityPreparedStatement.close();
			}

			throw e;
		} catch (PropertyVetoException e) {
			throw e;
		} catch (UserNameDoesNotExistsException e) {
			throw e;
		} finally {
			if (createNewPagePreparedStatement != null) {
				createNewPagePreparedStatement.close();
			}

			if (getPageWithPageTitlePreparedStatement != null) {
				getPageWithPageTitlePreparedStatement.close();
			}

			if (createNewPageActivityPreparedStatement != null) {
				getPageWithPageTitlePreparedStatement.close();
			}
			if (updatePageLatestPageActivityPreparedStatement != null) {
				updatePageLatestPageActivityPreparedStatement.close();
			}
		}
	}

	public void updatePageLatestPageActivity(String pageTitle, int pageActivityID)
			throws IOException, SQLException, PropertyVetoException {

		// Queries
		String updatePageLatestPageActivityQuery = "UPDATE page SET page_latest = ? WHERE page_title = ?";

		Connection connection = null;

		// Statements
		PreparedStatement updatePageLatestPageActivityPreparedStatement = null;

		try {
			connection = ConnectionManagager.getConnection();
			updatePageLatestPageActivityPreparedStatement = connection
					.prepareStatement(updatePageLatestPageActivityQuery);

			connection.setAutoCommit(false);

			updatePageLatestPageActivityPreparedStatement.setInt(1, pageActivityID);
			updatePageLatestPageActivityPreparedStatement.setString(2, pageTitle);

			updatePageLatestPageActivityPreparedStatement.executeUpdate();

			connection.commit();
		} catch (IOException e) {
			throw e;
		} catch (SQLException e) {
			if (updatePageLatestPageActivityPreparedStatement != null) {
				updatePageLatestPageActivityPreparedStatement.close();
			}

			throw e;
		} catch (PropertyVetoException e) {
			throw e;
		} finally {
			if (updatePageLatestPageActivityPreparedStatement != null) {
				updatePageLatestPageActivityPreparedStatement.close();
			}
		}
	}

	// search the pages with page title
	public content.Page searchPage(String pageTitle) throws IOException, SQLException, PropertyVetoException,
			PageDoesNotExistsException, UserIDDoesNotExistsException {
		boolean pageExisted = false;

		// Queries
		String getPageWithPageTitleQuery = "SELECT * FROM page WHERE page_title = ?";
		String getPageWithPageIDQuery = "SELECT * FROM page_activity WHERE page_activity_page = ?";

		// statement
		PreparedStatement getPageWithPageTitlePreparedStatement = null;
		PreparedStatement getPageWithPageIDPreparedStatement = null;

		// ResultSet sets for the statements
		ResultSet resultSetForGetPageWithTitle = null;
		ResultSet resultSetForPageActivity = null;

		// connection
		Connection connection = null;

		content.Page page = null;

		try {
			connection = ConnectionManagager.getConnection();
			connection.setAutoCommit(false);

			// the first statement for read the page table
			getPageWithPageTitlePreparedStatement = connection.prepareStatement(getPageWithPageTitleQuery,
					Statement.RETURN_GENERATED_KEYS);
			getPageWithPageTitlePreparedStatement.setString(1, pageTitle);
			resultSetForGetPageWithTitle = getPageWithPageTitlePreparedStatement.executeQuery();

			if (resultSetForGetPageWithTitle.next()) {
				page = new Page();
				pageExisted = true;
				page.setPage_id(resultSetForGetPageWithTitle.getInt("page_id"));
				page.setPage_title(resultSetForGetPageWithTitle.getString("page_title"));
				page.setPage_touched(resultSetForGetPageWithTitle.getString("page_touched"));
				page.setPage_lang(resultSetForGetPageWithTitle.getString("page_lang"));
			} else {
				throw new exceptions.page_exceptions.PageDoesNotExistsException(pageTitle);
			}

			// second statement for read page other attribute from page_activity
			// table
			if (pageExisted) {
				getPageWithPageIDPreparedStatement = connection.prepareStatement(getPageWithPageIDQuery);
				getPageWithPageIDPreparedStatement.setInt(1, page.getPage_id());

				// TODO: this dive throw the null point exception !
				resultSetForPageActivity = getPageWithPageIDPreparedStatement.executeQuery();

				if (resultSetForPageActivity.next()) {
					page.setPage_activity_type(resultSetForPageActivity.getString("page_activity_type"));
					page.setPage_activity_content(resultSetForPageActivity.getString("page_activity_content"));
					page.setPage_activity_timestamp(resultSetForPageActivity.getString("page_activity_timestamp"));
					page.setPage_activity_user(resultSetForPageActivity.getString("page_activity_user"));
				}
			}

			// OK in this section i wont to read page comments from the comment
			// table
			page.setComments(getComments(page.getPage_id()));

			connection.commit();
		} catch (IOException e) {
			throw e;
		} catch (SQLException e) {
			connection.rollback();
			throw e;
		} catch (PropertyVetoException e) {
			throw e;
		} catch (PageDoesNotExistsException e) {
			throw e;
		} finally {
			// after read data closing the statement
			getPageWithPageTitlePreparedStatement.close();
			getPageWithPageIDPreparedStatement.close();
		}
		return page;
	}

	// this method provided to get the WIKI page id for create project
	public int getWikiid(String project_wiki_name) throws Throwable {
		int id = 0;

		// query
		String getWikiPageidQuery = "SELECT * FROM page WHERE page_title = ?";

		// prepared Statement
		PreparedStatement getWikiPageidStatment = null;

		// result set
		ResultSet getWikiPageidSet = null;

		// connection
		Connection connetion = null;

		try {
			connetion = ConnectionManagager.getConnection();
			connetion.setAutoCommit(false);
			getWikiPageidStatment = connetion.prepareStatement(getWikiPageidQuery);
			getWikiPageidStatment.setString(1, project_wiki_name);
			getWikiPageidSet = getWikiPageidStatment.executeQuery();

			if (getWikiPageidSet.next()) {
				id = getWikiPageidSet.getInt("page_id");
			}

			connetion.commit();

		} catch (Throwable e) {
			connetion.rollback();
			throw e;
		}
		return id;
	}

	public String getProjectid(String project_name) throws Throwable {
		String id = "null";

		// query
		String getProjectidQuery = "SELECT * FROM project WHERE project_name = ?";

		// statements
		PreparedStatement getProjectidStatment = null;

		// result set for get project id
		ResultSet getProjectidSet = null;

		// connection
		Connection connection = null;

		try {
			connection = ConnectionManagager.getConnection();
			getProjectidStatment = connection.prepareStatement(getProjectidQuery);
			getProjectidStatment.setString(1, project_name);
			getProjectidSet = getProjectidStatment.executeQuery();

			if (getProjectidSet.next()) {
				id = getProjectidSet.getInt("project_id") + "";
			}
		} catch (Throwable e) {
			connection.rollback();
			throw e;
		}

		return id;
	}

	public boolean createProject(String project_description, String project_name, String project_wiki_name,
			String user_name) throws Throwable {
		boolean result = false;
		String wikiPageid = null;
		String project_id = null;

		// query
		String addProjectOnProjectTableQuery = "INSERT INTO project (project_description,project_name) VALUES (?,?)";
		String createConnetionBetweenWikiAndProjectQuery = "INSERT INTO page_project (page_project_page_id,page_project_project_id) VALUE (?,?)";

		// statements
		PreparedStatement addProjectStamtment = null;
		PreparedStatement createConnetionBetweenWikiAndProjectStatement = null;

		// connection
		Connection addProjectconnection = null;
		Connection wikiConnection = null;

		try {
			addProjectconnection = ConnectionManagager.getConnection();
			addProjectconnection.setAutoCommit(false);
			addProjectStamtment = addProjectconnection.prepareStatement(addProjectOnProjectTableQuery,
					Statement.RETURN_GENERATED_KEYS);
			addProjectStamtment.setString(1, project_description);
			addProjectStamtment.setString(2, project_name);
			addProjectStamtment.executeUpdate();
			addProjectconnection.commit();

			// this statement provided to create this project WIKI name
			savePage(project_wiki_name, user_name, "<p> your project wiki here ! edit this .</p>",
					content.EditType.CREATE);

			// this statement provided to receive created project id
			wikiPageid = getWikiid(project_wiki_name) + "";

			// this statement for get project_id
			project_id = getProjectid(project_name);

			// this statement create connection between WIKI page and project
			wikiConnection = ConnectionManagager.getConnection();
			wikiConnection.setAutoCommit(false);
			createConnetionBetweenWikiAndProjectStatement = wikiConnection
					.prepareStatement(createConnetionBetweenWikiAndProjectQuery);
			createConnetionBetweenWikiAndProjectStatement.setString(1, wikiPageid);
			createConnetionBetweenWikiAndProjectStatement.setString(2, project_id);
			createConnetionBetweenWikiAndProjectStatement.executeUpdate();
			wikiConnection.commit();

			result = true;

		} catch (Throwable e) {
			addProjectconnection.rollback();
			wikiConnection.rollback();
			throw e;
		}
		return result;
	}

	public void addMember(int membership_user_id, int membership_project_id, String role) throws Throwable {
		// query
		String addMembershipQuery = "INSERT INTO membership (membership_user_id,membership_project_id,membership_role) VALUES (?,?,?)";
		// statement
		PreparedStatement addMembershipStatement = null;
		// connection
		Connection connection = null;
		// code
		try {
			connection = ConnectionManagager.getConnection();
			connection.setAutoCommit(false);
			addMembershipStatement = connection.prepareStatement(addMembershipQuery);
			addMembershipStatement.setInt(1, membership_user_id);
			addMembershipStatement.setInt(2, membership_project_id);
			addMembershipStatement.setString(3, role);
			addMembershipStatement.executeUpdate();
			connection.commit();
		} catch (Throwable e) {
			connection.rollback();
			throw e;
		}
	}

	public ArrayList<user.User> getMembers(int membership_project_id) throws Throwable {
		ArrayList<user.User> members = new ArrayList<>();

		// query
		String getMembersQuery = "SELECT * FROM membership WHERE membership_project_id = ?";

		// statement
		PreparedStatement getMembersStatement = null;

		// result set
		ResultSet getMembersSet = null;

		// connection
		Connection connection = null;

		try {

			connection = ConnectionManagager.getConnection();
			getMembersStatement = connection.prepareStatement(getMembersQuery);
			getMembersStatement.setInt(1, membership_project_id);

			getMembersSet = getMembersStatement.executeQuery();

			while (getMembersSet.next()) {

				User user = getUser(membership_project_id);
				// the three item in table in member role in project
				user.memberRole = getMembersSet.getString(3);
				members.add(user);

			}

		} catch (Throwable e) {
			throw e;
		}
		return members;
	}
	
	public String getProjectName(String key){
		return null;
		
	}
	
	public Project getProject(String key){
		Project project = null;
		
		//Queries
		String getProjectDetailsQuery = "SELECT * FROM project WHERE project_id = ? ";
		
		Connection connection = null;
		
		//Statements
		PreparedStatement getProjectDetailsPreparedStatement = null;
		
		
		try {
			connection = ConnectionManagager.getConnection();
			getProjectDetailsPreparedStatement = connection.prepareStatement(getProjectDetailsQuery);
			
			getProjectDetailsPreparedStatement.setString(1, key);
			
			ResultSet projectDetailsResultSet = getProjectDetailsPreparedStatement.executeQuery();
			
			if(projectDetailsResultSet.next()){
				project = new Project(String.valueOf(projectDetailsResultSet.getInt(1)), projectDetailsResultSet.getString(2), projectDetailsResultSet.getString(3));
			} else {
				
			}
			
			
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (PropertyVetoException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		
		
		return project;
	}

	// this method provided to receive a list of project that this user has with
	// them
	public ArrayList<project.ProjectSummary> getProjectsNames(int user_id) throws Throwable {
		ArrayList<project.ProjectSummary> projects = new ArrayList<>();

		// query
		String getProjectidQuery = "SELECT * FROM membership WHERE membership_user_id = ?";

		// statement
		PreparedStatement getProjectidStatement = null;

		// result set
		ResultSet resultSet = null;

		// connection
		Connection connection;

		try {
			connection = ConnectionManagager.getConnection();
			getProjectidStatement = connection.prepareStatement(getProjectidQuery);
			getProjectidStatement.setInt(1, user_id);
			resultSet = getProjectidStatement.executeQuery();

			while (resultSet.next()) {

				String project_id = resultSet.getInt("membership_project_id") + "";
				String project_name = getProjectName(Integer.parseInt(project_id));
				project.ProjectSummary summary = new ProjectSummary(project_name, project_id);
				projects.add(summary);

			}

		} catch (Throwable e) {
			throw e;
		}

		return projects;
	}

	public String getProjectName(int project_id) throws Throwable {
		String project_name = null;

		// query
		String getProjectNameQuery = "SELECT * FROM project WHERE project_id = ?";

		// statements
		PreparedStatement getProjectNameStatment = null;

		// result set for get project id
		ResultSet getProjectNameSet = null;

		// connection
		Connection connection = null;

		try {
			connection = ConnectionManagager.getConnection();
			getProjectNameStatment = connection.prepareStatement(getProjectNameQuery);
			getProjectNameStatment.setInt(1, project_id);
			getProjectNameSet = getProjectNameStatment.executeQuery();

			if (getProjectNameSet.next()) {
				project_name = getProjectNameSet.getString("project_name");
			}
		} catch (Throwable e) {
			connection.rollback();
			throw e;
		}

		return project_name;
	}

	// this method return a project complete with their files and other after
	// click on them in the page
	public void getProject(int project_id) {

	}

	public boolean addRequest(String request_user_name, String request_content, Date request_date,
			String request_user_email) throws Throwable {
		boolean result = false;

		// query
		String addRequestQuery = "INSERT INTO request (request_content,request_user_name,request_date, request_user_email) VALUES (?,?,?,?)";

		// statement
		PreparedStatement addRequestStatment = null;

		// connection
		Connection connection = null;

		try {
			connection = ConnectionManagager.getConnection();
			connection.setAutoCommit(false);
			addRequestStatment = connection.prepareStatement(addRequestQuery);
			addRequestStatment.setString(1, request_content);
			addRequestStatment.setString(2, request_user_name);
			addRequestStatment.setDate(3, (java.sql.Date) request_date);
			addRequestStatment.setString(4, request_user_email);
			connection.commit();
			result = true;
		} catch (Throwable e) {
			connection.rollback();
			throw e;
		}
		return result;
	}

	// public ArrayList<request.Request>
}