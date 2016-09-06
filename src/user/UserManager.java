package user;

import java.beans.PropertyVetoException;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.security.SecureRandom;
import java.security.spec.InvalidKeySpecException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;

import javax.crypto.SecretKeyFactory;
import javax.crypto.spec.PBEKeySpec;

import org.mindrot.jbcrypt.BCrypt;

import com.lambdaworks.crypto.SCryptUtil;

import content.Message;
import database.DatabaseBridge;
import exceptions.user_exceptions.EmailIsAlreadyRegisteredException;
import exceptions.user_exceptions.PasswordIsWrongException;
import exceptions.user_exceptions.SelectorIsNotRegisterdWithAnyUserException;
import exceptions.user_exceptions.UserDoesNotHaveSelectorRegistered;
import exceptions.user_exceptions.UserIDDoesNotExistsException;
import exceptions.user_exceptions.UserNameDoesNotExistsException;
import exceptions.user_exceptions.UsernameIsAlreadyRegisteredException;
import exceptions.user_exceptions.ValidatorDoesNotMatchExistException;
import file.MyFile;
import util.StringUtility;

public class UserManager {

	private ArrayList<User> users;
	private static UserManager instance = null;
	private DatabaseBridge bridge;
	private PasswordManager passwordManager;

	// Class is singleton
	private UserManager() {
		users = new ArrayList<User>();
		bridge = new DatabaseBridge();
		passwordManager = new PasswordManager(PasswordManager.BCRYPT, 64);

	}

	public static UserManager getUserManager() {
		if (instance == null) {
			instance = new UserManager();
		}
		return instance;
	}

	public User signinUser(String userName, String password) throws IOException, SQLException, PropertyVetoException,
			UserNameDoesNotExistsException, PasswordIsWrongException {

		User user = null;

		String originalPassword = bridge.getUserHashedPassword(userName);
		boolean doesPasswordMatch = passwordManager.doesTwoPasswordMatch(originalPassword, password);

		if (doesPasswordMatch) {
			// Just speeding the process of destroying the references to the
			// password containing objects
			originalPassword = null;
			user = bridge.getUser(userName);

		} else {
			// Just speeding the process of destroying the references to the
			// password containing objects
			originalPassword = null;
			throw new PasswordIsWrongException(userName);
		}

		return user;
	}

	/**
	 * Takes the raw selector and validator and hashes validator and compares it
	 * to the saved validator for the given selector.
	 * 
	 * @param selector
	 *            The selector of the token.
	 * @param validator
	 *            The raw format(not hashed) of the validator of the token.
	 * 
	 * @return the user corresponding to hte given selector and validator.
	 * 
	 * @throws PropertyVetoException
	 * @throws SQLException
	 * @throws IOException
	 * @throws UserIDDoesNotExistsException
	 * @throws SelectorIsNotRegisterdWithAnyUserException
	 * @throws ValidatorDoesNotMatchExistException
	 * @throws Exception
	 * 
	 * 
	 */
	public User signinUserFromToken(String selector, String validator)
			throws IOException, SQLException, PropertyVetoException, UserIDDoesNotExistsException,
			SelectorIsNotRegisterdWithAnyUserException, ValidatorDoesNotMatchExistException, Exception {
		User user = null;

		try {
			String originalValidator = bridge.getUserValidator(selector);

			String hashedValidator = hash("SHA-256", validator);

			if (hashedValidator.equals(originalValidator)) {
				int userID = bridge.getUserIDFromSelector(selector);
				user = bridge.getUser(userID);
			} else {
				throw new ValidatorDoesNotMatchExistException(selector, validator);
			}
		} catch (NoSuchAlgorithmException e) {
			throw new Exception();
		} catch (UserIDDoesNotExistsException e) {
			throw e;
		} catch (SelectorIsNotRegisterdWithAnyUserException e) {
			throw e;
		} catch (ValidatorDoesNotMatchExistException e) {
			throw e;
		}

		return user;
	}

	/**
	 * Generates a random validator.
	 * 
	 * @return the validator.
	 * 
	 * @throws NoSuchAlgorithmException
	 */
	public String generateNewPasswordValidator() throws NoSuchAlgorithmException {
		SecureRandom sr = SecureRandom.getInstance("SHA1PRNG");
		byte[] validator = new byte[64];
		sr.nextBytes(validator);

		return StringUtility.toHex(validator);
	}

	/**
	 * Generates the selector for the given user. In the current implementation
	 * the selector is the ID of the user in the database(Should be changed to
	 * generate a unique selector for every user independent from the user's
	 * ID).
	 * 
	 * @return selector registered with the user.
	 * 
	 * @throws IOException
	 * @throws SQLException
	 * @throws PropertyVetoException
	 * @throws UserNameDoesNotExistsException
	 * 
	 * 
	 */
	public String generateUserPasswordSelector(String username)
			throws IOException, SQLException, PropertyVetoException, UserNameDoesNotExistsException {
		String selector = null;

		// TODO: generate selector in a differente way.(The danger of leaking
		// online user number).
		try {
			selector = bridge.getUserSelector(username);
			if (selector.isEmpty()) {
				int id = bridge.getUserIDFromUsername(username);
				String userID = String.valueOf(id);
				System.out.println("id: " + id + "useID: " + userID);
				bridge.updateUserPasswordSelector(username, userID);
				selector = bridge.getUserSelector(username);
				System.out.println("Selecor: " + selector);
			}

		} catch (IOException e) {
			throw e;
		} catch (SQLException e) {
			throw e;
		} catch (PropertyVetoException e) {
			throw e;
		} catch (UserDoesNotHaveSelectorRegistered e) {
			selector = String.valueOf(bridge.getUserIDFromUsername(username));
			bridge.updateUserPasswordSelector(username, selector);
		}

		return selector;
	}

	/**
	 * changes the value of the user's token, Next time sign in(without entering
	 * user name, password directly) should be done through this token
	 * 
	 * @param username
	 *            the username of the user to update it's token.
	 * @param selector
	 *            the selector of the user's token,
	 * @param validator
	 *            the validator of the user's token.
	 * 
	 * @throws PropertyVetoException
	 * @throws SQLException
	 * @throws IOException
	 * @throws NoSuchAlgorithmException
	 * 
	 */
	public void changeUserToken(User user, String selector, String validator)
			throws IOException, SQLException, PropertyVetoException, NoSuchAlgorithmException {
		bridge.updateUserToken(user.getUserName(), selector, hash("SHA-256", validator));
	}

	/**
	 * A one way hash function.
	 * 
	 * @param algorithmName
	 *            The name of the one-way hashing algorithm.
	 * @param message
	 *            the message to hash.
	 * 
	 * @return the hexadecimal string representation of the digest.
	 * 
	 * @throws NoSuchAlgorithmException
	 * @throws UnsupportedEncodingException
	 */
	public String hash(String algorithmName, String message)
			throws NoSuchAlgorithmException, UnsupportedEncodingException {
		MessageDigest md = MessageDigest.getInstance(algorithmName);
		md.update(message.getBytes("UTF-8")); // Change this to "UTF-16" if
												// needed
		byte[] digest = md.digest();

		return StringUtility.toHex(digest);
	}

	public void registerUser(String userName, String password, String email, Role role)
			throws SQLException, IOException, PropertyVetoException, UsernameIsAlreadyRegisteredException,
			EmailIsAlreadyRegisteredException, NoSuchAlgorithmException, InvalidKeySpecException {

		String hashedAndSaltedPassword = passwordManager.generatePasswordHash(password, null);

		bridge.registerUser(userName, hashedAndSaltedPassword, email, role);

		hashedAndSaltedPassword = null;
	}

	public void Signout(String userName) {
		for (User userss : users) {
			if (userss.getUserName().equals(userName))
				users.remove(userss);
		}
	}

	public void updateName(String name, String userName)
			throws SQLException, IOException, PropertyVetoException, UserNameDoesNotExistsException {

		bridge.updateFirstName(name, userName);

	}

	public void updateLastName(String lastName, String userName)
			throws SQLException, IOException, PropertyVetoException, UserNameDoesNotExistsException {

		bridge.updateLastName(lastName, userName);

	}

	public void updateUserName(String userName, String oldUserName)
			throws SQLException, IOException, PropertyVetoException, UserNameDoesNotExistsException {
		bridge.updateUserName(userName, oldUserName);

	}

	// TODO: hash and salt pass
	public void updatePassword(String password, String userName) {
		// bridge.updatePassword(password, userName);

	}

	// TODO: convert type to date
	public void updateBirthDate(String birthDate, String userName)
			throws SQLException, IOException, PropertyVetoException {
		bridge.updateBirthDate(birthDate, userName);

	}

	public void updateEmail(String email, String userName) throws SQLException, IOException, PropertyVetoException {
		bridge.updateEmail(email, userName);

	}

	public void updatePhoneNumber(String phoneNumber, String userName)
			throws SQLException, IOException, PropertyVetoException {
		bridge.updatePhoneNumber(phoneNumber, userName);

	}

	public void updateRole(Role role, String userName) throws SQLException, IOException, PropertyVetoException {
		bridge.updateRole(role, userName);

	}

	public void updateBan(boolean ban, String userName) throws SQLException, IOException, PropertyVetoException {
		bridge.updateBan(ban, userName);

	}

	public ArrayList<User> getUsers() {
		ArrayList<User> users = null;
		try {
			users = bridge.getUsers();
		} catch (Throwable e) {
			e.printStackTrace();
		}
		return users;
	}

	public User getUser(String userName) throws SQLException, IOException, UserNameDoesNotExistsException {
		User user = null;
		try {
			for (User userss : users) {
				if (userss.getUserName().equals(userName))
					user = userss;
			}
			if (user == null)
				user = bridge.getUser(userName);
		} catch (PropertyVetoException e) {
			e.printStackTrace();
		}
		return user;
	}

	@SuppressWarnings("finally")
	public boolean addMessage(String message, String userName, String heading, int user_id) {
		boolean result = false;
		Date date = null;
		try {
			date = new Date();
			String dateKeaper = date.toString();
			result = bridge.addMessage(userName, message, heading, dateKeaper, user_id);
		} catch (IOException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (PropertyVetoException e) {
			e.printStackTrace();
		} finally {
			return result;
		}
	}

	public ArrayList<Message> getMessages() {
		try {
			return bridge.getMessage();
		} catch (IOException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (PropertyVetoException e) {
			e.printStackTrace();
		}
		return null;
	}

	public boolean uploadFile(String fileName, String fileLocation, String userName, String heading, int user_id) {
		boolean result = false;
		Date date = null;
		try {
			date = new Date();
			String nowTime = date.toString();
			result = bridge.uploadFile(fileName, fileLocation, userName, nowTime, heading, user_id);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	public ArrayList<MyFile> getFiles() {
		try {
			return bridge.getFiles();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	/**
	 * @author Amir Qasemi
	 */
	private class PasswordManager {

		// Encrypting Algorithms:
		public final static int PBKDF2 = 0;
		public final static int SCRYPT = 1;
		public final static int BCRYPT = 2;

		private int hashingAlgorithm;
		private int saltLenght;

		/**
		 * The hashingAlgorithm values can be: PBKDF2 SCRYPT BCRYPT
		 * 
		 * The saltLenght is not used in the following algorithms: SCRYPT
		 */
		public PasswordManager(int hashingAlgorithm, int saltLenght) {
			this.hashingAlgorithm = hashingAlgorithm;
			this.saltLenght = saltLenght;

		}

		public int getSaltLenght() {
			return saltLenght;
		}

		public String getHashingAlgorithmName() {
			String hashingAlgorithmName;
			switch (hashingAlgorithm) {
			case PBKDF2:
				hashingAlgorithmName = "PBKDF2";
				break;

			case SCRYPT:
				hashingAlgorithmName = "SCrypt";
				break;

			case BCRYPT:
				hashingAlgorithmName = "BCrypt";
				break;

			default:
				hashingAlgorithmName = "PBKDF2";
				break;
			}

			return hashingAlgorithmName;
		}

		/**
		 * Generates a hashed password depending on the choosen algorithm when
		 * instanciating the class.
		 * 
		 * If the SCrypt xor BCrypt algorithm is choosen as the encrypting
		 * algorithm, the salt parameter will not be used and can be passed null
		 * when calling this method.
		 */
		public String generatePasswordHash(String password, byte[] salt)
				throws NoSuchAlgorithmException, InvalidKeySpecException {
			String hashedAndSaltedPassword;

			switch (hashingAlgorithm) {
			case PBKDF2:
				hashedAndSaltedPassword = generatePBKDF2PasswordHash(password, salt);
				break;

			case SCRYPT:
				hashedAndSaltedPassword = generateSCryptPasswordHash(password);
				break;

			case BCRYPT:
				hashedAndSaltedPassword = generateBCryptPasswordHash(password);
				break;

			default:
				hashedAndSaltedPassword = generatePBKDF2PasswordHash(password, salt);
				break;
			}

			return hashedAndSaltedPassword;
		}

		private String generateBCryptPasswordHash(String password) {
			return BCrypt.hashpw(password, BCrypt.gensalt(12));
		}

		private String generateSCryptPasswordHash(String password) {
			return SCryptUtil.scrypt(password, 16, 16, 16);
		}

		private String generatePBKDF2PasswordHash(String password, byte[] salt)
				throws NoSuchAlgorithmException, InvalidKeySpecException {
			int iterations = 10000;
			char[] chars = password.toCharArray();

			PBEKeySpec spec = new PBEKeySpec(chars, salt, iterations, 64 * 8);
			SecretKeyFactory skf = SecretKeyFactory.getInstance("PBKDF2WithHmacSHA1");
			byte[] hash = skf.generateSecret(spec).getEncoded();
			return StringUtility.toHex(salt) + StringUtility.toHex(hash);

		}

		public byte[] getSalt() throws NoSuchAlgorithmException {
			SecureRandom sr = SecureRandom.getInstance("SHA1PRNG");
			byte[] salt = new byte[saltLenght];
			sr.nextBytes(salt);
			return salt;
		}

		public boolean doesTwoPasswordMatch(String firstPassword, String secondPassword) {
			boolean result;

			switch (hashingAlgorithm) {
			case PBKDF2:
				result = firstPassword.equals(secondPassword);
				break;

			case SCRYPT:
				result = SCryptUtil.check(secondPassword, firstPassword);
				break;

			case BCRYPT:
				result = BCrypt.checkpw(secondPassword, firstPassword);
				break;

			default:
				result = firstPassword.equals(secondPassword);
				break;
			}

			return result;
		}

	}

}
