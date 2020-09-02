/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package models;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

/**
 *
 * @author ISK
 */
public class checkInputsfromDB {
    public static boolean checkTmpPW(String userName,String tempPw) throws Exception{
        
        try{
            
            Connection con = dbConnection.dbConnection.getConnection();
            Statement st = con.createStatement();
            
            String checkTMPSQL = "SELECT * FROM users WHERE user_name = '" + userName + "' AND u_PW = '" + tempPw + "'";
            
            ResultSet rs = st.executeQuery(checkTMPSQL);
            
            if(rs.first()) {
                return true;
            }
            
            else{
                return false;
            }
        }
        
        catch(Exception e){
            
        }
        return false;
    }
}
