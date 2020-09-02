/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package models;

import static controllers.dbConnection.getConnection;
import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import javax.servlet.ServletException;

/**
 *
 * @author ISK
 */
public class claimdetails {
     public ResultSet allmemberdisplay()throws ServletException, IOException, SQLException {
        
         Statement stmt;
           ResultSet rs;
        
            Connection con = getConnection();
            String queryString = "select * from claimdetails";
            stmt = con.prepareStatement(queryString);
             // query result is in rs object
            rs = stmt.executeQuery(queryString);
             
                              //return "ID = "+userID+ " First Name = "+user_name+" Last Name = "+u_fristName;
			
        return rs;
        
       
    }
}
