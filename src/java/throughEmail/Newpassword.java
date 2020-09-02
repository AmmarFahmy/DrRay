/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package throughEmail;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author ISK
 */
@WebServlet(name = "Newpassword", urlPatterns = {"/Newpassword"})
public class Newpassword extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
   
        
        try (PrintWriter out = response.getWriter()) {
            Connection con = dbConnection.dbConnection.getConnection();
            
            String userName =  request.getParameter("userName");
            String Password = request.getParameter("pw2");
            String hassedPassword = passwordHashing.Hash.Hashed(Password);
      
            String SQL =  "SELECT * FROM users WHERE user_name = '" + userName + "'";
            
            PreparedStatement ps = con.prepareStatement(SQL);
            ResultSet rs = ps.executeQuery();
            
            if (rs.next()) {
                String UpdateSQL = "UPDATE users SET u_PW = ?, u_status = ? WHERE user_name = ?";
                
                PreparedStatement preparedStmt = con.prepareStatement(UpdateSQL);
                
                preparedStmt.setString(1, hassedPassword);
                preparedStmt.setInt(2, 1);
                preparedStmt.setString(3, userName);
                
                preparedStmt.execute();
                
                
                con.close();
                response.sendRedirect("login.jsp?update=success");
            }
            
            else{
                con.close();
                response.sendRedirect("thorughEmail/newPw.jsp?update=fail");
            }
        }
        
        catch(Exception e){
            e.printStackTrace();
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
