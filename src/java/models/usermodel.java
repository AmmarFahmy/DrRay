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
 * @author ASUS
 */
public class usermodel {

    public ResultSet allmemberdisplay() throws ServletException, IOException, SQLException {

        Statement stmt;
        ResultSet rs;

        Connection con = getConnection();
        String queryString = "select * from users";
        stmt = con.prepareStatement(queryString);
        // query result is in rs object
        rs = stmt.executeQuery(queryString);

        //return "ID = "+userID+ " First Name = "+user_name+" Last Name = "+u_fristName;
        return rs;

    }
    
    public ResultSet allmemberdisplays() throws ServletException, IOException, SQLException {

        Statement stmt;
        ResultSet rs;

        Connection con = getConnection();
        String queryString = "select * from users";
        stmt = con.prepareStatement(queryString);
        // query result is in rs object
        rs = stmt.executeQuery(queryString);

        //return "ID = "+userID+ " First Name = "+user_name+" Last Name = "+u_fristName;
        return rs;

    }

    public static ResultSet displaychanged(String userid) throws ServletException, IOException, SQLException {

        Statement stmt;
        ResultSet rs;

        Connection con = getConnection();
        String queryString = "SELECT `userID`, `user_name`, `u_firstName`, `u_lastName`, `u_Phone`, `u_Email`,`u_NICNum`,`u_SLMCNum`,`u_PW` FROM `users` WHERE `userID`=" + userid;
        stmt = con.createStatement();
        // query result is in rs object
        rs = stmt.executeQuery(queryString);

        //return "ID = "+userID+ " First Name = "+user_name+" Last Name = "+u_fristName;
        return rs;

    }

    public static int updatedetails(String username, String fname, String lname, String phone, String email, String u_NICNum, String u_SLMCNum, String id) throws SQLException {
        Statement stmt;

        Connection con = getConnection();
        String queryString = "UPDATE `users` SET `user_name`='" + username + "',`u_firstName`='" + fname + "',`u_lastName`='" + lname + "',`u_Phone`='" + phone + "',`u_Email`='" + email + "',`u_NICNum`='" + u_NICNum + "',`u_SLMCNum`='" + u_SLMCNum + "' WHERE `userID`='" + id + "'";

        stmt = con.createStatement();
        int i = stmt.executeUpdate(queryString);   // returns an integer - number of 										// records  added

        return i;
    }


    public static ResultSet display_user_req() throws ServletException, IOException, SQLException {

        Statement stmt;
        ResultSet rs;
        int val = 0;
        Connection con = getConnection();
        String queryString = "SELECT `userID`, `user_name`, `u_firstName`, `u_lastName`, `u_Phone`, `u_Email`,`u_NICNum`,`u_SLMCNum` FROM `users` WHERE `u_status`=" + val;
        stmt = con.createStatement();
        // query result is in rs object
        rs = stmt.executeQuery(queryString);

        //return "ID = "+userID+ " First Name = "+user_name+" Last Name = "+u_fristName;
        return rs;
    }

    public static int accept_request(String id) throws SQLException {
        Statement stmt;
        String val = "8";

        Connection con = getConnection();
        String queryString = "UPDATE `users` SET `u_status`='" + val + "' WHERE `userID`='" + id + "'";

        stmt = con.createStatement();
        int i = stmt.executeUpdate(queryString);   // returns an integer - number of 										// records  added

        return i;
    }


    public static int deleteuser(String id) throws SQLException {
        Statement stmt;
        int val = 0;

        Connection con = getConnection();
        String queryString = "UPDATE users SET u_status= '" + val + "' WHERE userID='" + id + "'";

        stmt = con.createStatement();
        int i = stmt.executeUpdate(queryString);   // returns an integer - number of 										// records  added

        return i;
    }

    public ResultSet searchAnalysisResult(String patient) throws ServletException, IOException, SQLException {

        Statement stmt;
        ResultSet rs;

        Connection con = getConnection();
        String queryString = "select * from searchanalysis where Patient="+patient;
        stmt = con.prepareStatement(queryString);
        // query result is in rs object
        rs = stmt.executeQuery(queryString);

        //return "ID = "+userID+ " First Name = "+user_name+" Last Name = "+u_fristName;
        return rs;

    }

}
