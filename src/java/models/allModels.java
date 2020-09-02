/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package models;

import static DBConnection.connectionClass.getConnection;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

/**
 *
 * @author Nirvan zentinal
 */
public class allModels {

    public static ResultSet displayClaimDetails() throws SQLException {
         Statement stmt;
           ResultSet rs;
            Connection con = getConnection();
            String queryString = "SELECT users.userID,users.user_name,claimdetails.userID,claimdetails.reason,claimdetails.claimAmount,claimdetails.paidAmount,claimdetails.status,claimdetails.requestDate,claimdetails.claimedDate FROM users INNER JOIN claimdetails ON users.userID=claimdetails.userID";
            stmt = con.createStatement();
             // query result is in rs object
            rs = stmt.executeQuery(queryString);
        return rs;
    }
    
    public static int updateClaimDetails(String uID,String uName,String reason,String stBox,String reqDate,String claimedDate,String claimedAmount,String paidAmount) throws SQLException{
        
        
        int ca=Integer.parseInt(claimedAmount);
        int pa=Integer.parseInt(paidAmount);
        Statement stmt ;
        Connection con = getConnection();
       String queryString = "UPDATE claimdetails c INNER JOIN users u ON c.userID=u.userID SET reason='"+reason+"',claimAmount="+ca+",paidAmount="+pa+",status='"+stBox+"',requestDate='"+reqDate+"',claimedDate='"+claimedDate+"' WHERE userID='"+uID+"'";
               
       stmt = con.createStatement();
       int i = stmt.executeUpdate(queryString);   // returns an integer - number of 										// records  added
	  
	return i;
    }
    
    
    
     public static ResultSet displayPremiumDetails() throws SQLException {
         Statement stmt;
           ResultSet rs;
            Connection con = getConnection();
            String queryString = "select u.UserID,u_firstNAme,user_Name,u_Email, Amount, vehicle_Id, Vehicle_Number, total,paid,payment_id FROM users u, vehicle_reg v, payment p WHERE u.userID = p.userID AND p.vehicle_Id =v.VehicleId";
            stmt = con.createStatement();
             // query result is in rs object
            rs = stmt.executeQuery(queryString);
        return rs;
    }
     
      public static int updatePremiumDetails(String uID,String uName,String reason,String stBox,String reqDate,String claimedDate,String claimedAmount,String paidAmount) throws SQLException{
        
        
        int ca=Integer.parseInt(claimedAmount);
        int pa=Integer.parseInt(paidAmount);
        Statement stmt ;
        Connection con = getConnection();
       String queryString = "UPDATE vehicle_reg SET reason='"+reason+"',claimAmount="+ca+",paidAmount="+pa+",status='"+stBox+"',requestDate='"+reqDate+"',claimedDate='"+claimedDate+"' WHERE userID='"+uID+"'";
               
       stmt = con.createStatement();
       int i = stmt.executeUpdate(queryString);   // returns an integer - number of 										// records  added
	  
	return i;
    }
    
}
