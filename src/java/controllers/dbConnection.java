package controllers;

import java.sql.*;
import java.sql.DriverManager;

public class dbConnection {
     
    
    public static Connection getConnection(){
        Connection connection = null;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/drray?useTimezone=true&serverTimezone=UTC","root","");
        } 
        
        catch (Exception e) {
            System.out.println("ooops somthing happen "+e);
        }
        
        return connection;
    }
}