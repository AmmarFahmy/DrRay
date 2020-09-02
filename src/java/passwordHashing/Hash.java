package passwordHashing;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author ISK
 */
public class Hash {
    public static String Hashed(String input){
        String hashed = BCrypt.hashpw(input, BCrypt.gensalt()); 
        return hashed;
    }
}
