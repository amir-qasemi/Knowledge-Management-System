package util;

import java.math.BigInteger;


/**
 * @author AmirH Qasemi
 * */

//Noninstantiable utility class
public final class StringUtility {
	
	
	// Suppress default constructor for noninstantiability
	private StringUtility() {
		throw new AssertionError();
	}
	
	
	/**
	 * Converts an byte array to it's string hexadecimal representation.
	 * @param array the array to convert.
	 * @return the string hexadecimal representation of the array.
	 * */
	public static String toHex(byte[] array){
        BigInteger bi = new BigInteger(1, array);
        String hex = bi.toString(16);
        int paddingLength = (array.length * 2) - hex.length();
        if (paddingLength > 0) {
            return String.format("%0" + paddingLength + "d", 0) + hex;
        } else {
            return hex;
        }
    }
}
