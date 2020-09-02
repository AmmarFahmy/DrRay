/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package services;

import controllers.dbConnection;
import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.jws.WebService;
import javax.jws.WebMethod;
import javax.jws.WebParam;
import javax.servlet.ServletException;
import passwordHashing.BCrypt;

/**
 *
 * @author ASUS
 */
@WebService(serviceName = "loginService")
public class loginService {

    /**
     * This is a sample web service operation
     */
    @WebMethod(operationName = "login")
    public boolean login(@WebParam(name = "username") String username, @WebParam(name = "password") String password) {
        System.out.println("calling");

        try {
            Connection con = dbConnection.getConnection();
            Statement st = con.createStatement();
            
            String SQL = "SELECT * FROM users WHERE user_name= '" + username + "' or u_Email = '" + username + "'";
            ResultSet rs = st.executeQuery(SQL);
            
            if (rs.first()) {
                String dbPW = rs.getString("u_PW");
                
                if (BCrypt.checkpw(password, dbPW)) {
//                    ResultSet rs2 = models.usermodel.standdisplay(username);
//                    return rs2;
                    udetails(username);
                    return true;
                }
                else{
                    return false;
                }
            } else {
                return false;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }
    public ArrayList<String> udetails( @WebParam(name = "username") String username)   {
        try {
            ResultSet rs2 = models.usermodel.standdisplay(username);
            ArrayList<String> ud=new ArrayList<String>();
            ud.add(rs2.getString("user_Name"));
            ud.add(rs2.getString("u_firstName"));
            ud.add(rs2.getString("u_lastName"));
            ud.add(rs2.getString("u_Phone"));
            ud.add(rs2.getString("u_Email"));
            ud.add(rs2.getString("Vehicle_Number"));
            ud.add(rs2.getString("Brand"));
            ud.add(rs2.getString("Type of vehicle"));
            ud.add(rs2.getString("total"));
              return ud;
        } catch (ServletException ex) {
            Logger.getLogger(loginService.class.getName()).log(Level.SEVERE, null, ex);
        } catch (IOException ex) {
            Logger.getLogger(loginService.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(loginService.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }
}
