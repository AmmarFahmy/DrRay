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

    public static ResultSet outstanding() throws ServletException, IOException, SQLException {

        Statement stmt;
        ResultSet rs;

        Connection con = getConnection();
        String queryString = "select u.UserID,u_firstNAme,user_Name,u_Email, Amount, vehicle_Id, Vehicle_Number, total,paid,payment_id from users u, vehicle_reg v, payment p where u.userID = p.userID and p.vehicle_Id =v.VehicleId";
        stmt = con.prepareStatement(queryString);
        // query result is in rs object
        rs = stmt.executeQuery(queryString);

        //return "ID = "+userID+ " First Name = "+user_name+" Last Name = "+u_fristName;
        return rs;
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

    public static ResultSet display_vehicle_req() throws ServletException, IOException, SQLException {

        Statement stmt;
        ResultSet rs;
        int val = 1;
        Connection con = getConnection();
        String queryString = "select users.user_name,users.userID,users.u_firstName,users.u_lastName,users.u_Email,vehicle_reg.VehicleId,vehicle_reg.total,vehicle_reg.Brand,vehicle_reg.Vehicle_Number from users inner join vehicle_reg on users.userID=vehicle_reg.userID WHERE vehicle_reg.vehicle_status='0'";
        stmt = con.createStatement();
        // query result is in rs object
        rs = stmt.executeQuery(queryString);

        //return "ID = "+userID+ " First Name = "+user_name+" Last Name = "+u_fristName;
        return rs;
    }

    public static int accept_vehicle_request(String id) throws SQLException {
        Statement stmt;
        String val = "1";

        Connection con = getConnection();
        String queryString = "UPDATE `vehicle_reg` SET `vehicle_status`='" + val + "' WHERE `VehicleId`='" + id + "'";

        stmt = con.createStatement();
        int i = stmt.executeUpdate(queryString);   // returns an integer - number of 										// records  added

        return i;
    }

    public static ResultSet outstanding_vereg() throws ServletException, IOException, SQLException {

        Statement stmt;
        ResultSet rs;

        Connection con = getConnection();
        String queryString = "select vehicle_reg.Vehicle_Number,vehicle_reg.total,payment.paid,payment.vehicle_Id,payment.payment_id,payment.Amount from vehicle_reg inner join payment on vehicle_reg.VehicleId=payment.vehicle_Id";
        stmt = con.prepareStatement(queryString);
        // query result is in rs object
        rs = stmt.executeQuery(queryString);

        //return "ID = "+userID+ " First Name = "+user_name+" Last Name = "+u_fristName;
        return rs;
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

    public static ResultSet standdisplay(String un) throws ServletException, IOException, SQLException {

        Statement stmt;
        ResultSet rs;

        Connection con = getConnection();
        String queryString = "select users.user_name,users.u_Phone,users.userID,users.u_firstName,users.u_lastName,users.u_Email,vehicle_reg.VehicleId,vehicle_reg.Type of vehicle,vehicle_reg.total,vehicle_reg.Brand,vehicle_reg.Vehicle_Number from users inner join vehicle_reg on users.userID=vehicle_reg.userID WHERE users.user_name=" + un;
        stmt = con.prepareStatement(queryString);
        // query result is in rs object
        rs = stmt.executeQuery(queryString);

        //return "ID = "+userID+ " First Name = "+user_name+" Last Name = "+u_fristName;
        return rs;

    }

}
