package cookie;

import java.io.ObjectStreamException;
import java.math.BigInteger;
import java.security.NoSuchAlgorithmException;

/**
 * @author AmirH Qasemi <amirghasemi1375@gmail.com>
 * 
 * */

//Singleton Class
public class CookieManager {
	
	public final static String REMEMBER_ME_COOKIE_NAME = "AUTHORIZEUSERTOKEN";
	public final static int REMEBER_ME_COOKIE_AGE = 60 * 60 * 24 * 30; // 30 days in second
	/**
	 * The sole instance of this class.
	 * */
	private final static CookieManager INSTANCE = new CookieManager();
	
	
	/**
	 * Is made private because of the "singletonity" of the class.
	 * */
	private CookieManager() {
			
	}
	
	
	/**
	 * The static factory method to get the sole instance of this
	 * singleton class.
	 * @return the only instance of this class.
	 * */
	public static CookieManager getInstance(){
		return INSTANCE;
	}
	
	
	
	
	/**
	 * In case that this class gets serialized
	 * (To enforce the "singletonity" of the class).
	 * */
	private Object readResolve() throws ObjectStreamException {
		  return INSTANCE; 
	}
	
	
	
	///////////////////////Authentication part of CookieManager.\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
	
	/**
	 * TOKEN_SEPERATOR is used to separate selector from validator
	 * (It is put between them).
	 * */
	private final static String TOKEN_SEPARATOR = ":";

	
	/**
     * Get the selector part of the given token.
     * @param token the token to get the selector part of it.
     * 
     * @return the selector part of the given token.
     * */
    public String getSelector(String token) {
        String selector = token.substring(0, token.indexOf(TOKEN_SEPARATOR));
        
        return selector;
    }

    /**
     * Get the validator part of the given token.
     * @param token the token to get the validator part of it.
     * 
     * @return the validator part of the given token.
     * */
    public String getValidator(String token) {
        String validator = token.substring(token.indexOf(TOKEN_SEPARATOR) + 1);
        
        return validator;
    }
    
    /**
     * Generates the Token based on the selector and validator seperated by the
     * TOKEN_SEPERATOR (The method only concatenate them).
     * 
     * @param selector the selector part of the token.
     * @param validator The validator part of the token.
     * 
     * @return The generated token.
     * */
    public String generateRememberMeToken(String selector, String validator) {
        return selector + TOKEN_SEPARATOR + validator;
    }

    
    
    //////////////////////End of authentication part of CookieNanager.\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
}
