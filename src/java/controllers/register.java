/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers;

import java.io.IOException;
import java.io.PrintWriter;
import java.security.SecureRandom;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Base64;
import java.util.Base64.Encoder;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import passwordChange.EncodeDecodePW;


@WebServlet(name = "register", urlPatterns = {"/register"})
public class register extends HttpServlet {

    
    private String host;
    private String port;
    private String user;
    private String pass;
 
    public void init() {
        // reads SMTP server setting from web.xml file
        ServletContext context = getServletContext();
        host = context.getInitParameter("host");
        port = context.getInitParameter("port");
        user = context.getInitParameter("user");
        pass = context.getInitParameter("pass");
    }
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        try (PrintWriter out = response.getWriter()) {
            
            Connection con = dbConnection.getConnection();
            
            String userFname=request.getParameter("uFname");
            String userLname = request.getParameter("uLname");
            String userEmail=request.getParameter("userEmail");
            String userNIC=request.getParameter("uNICNum");
            String userSLMC=request.getParameter("uSLMC");
            String userPnumber = request.getParameter("uPhoneNum");
            String userName = request.getParameter("userName");
            
            String tmpPw = randomTempPW();
            
            String checkUNameSQL = "SELECT * FROM users WHERE user_name = '" + userName + "' or u_Email = '" + userEmail + "'";
            
            PreparedStatement ps = con.prepareStatement(checkUNameSQL);
            ResultSet rs = ps.executeQuery();
            
            if (!rs.next()) {
                String RegisterSQL = "INSERT INTO users (user_name,u_firstName,u_lastName,u_Phone,u_Email,u_NICNum,u_SLMCNum,u_PW,u_status)" + 
                    "VALUES (?,?,?,?,?,?,?,?,?)";
  
               
                PreparedStatement preparedStmt = con.prepareStatement(RegisterSQL);
                
                preparedStmt.setString (1, userName);
                preparedStmt.setString (2, userFname);
                preparedStmt.setString (3, userLname);
                preparedStmt.setString (4, userPnumber);
                preparedStmt.setString (5, userEmail);
                preparedStmt.setString (6, userNIC);
                preparedStmt.setString (7, userSLMC);
                preparedStmt.setString (8, tmpPw);
                preparedStmt.setInt (9, 0);
                
                preparedStmt.execute();
                
                
                /*Send email verification email*/
                //String subject = "Insurance E-mail verification!!";
                
                //EncodeDecodePW pw= new EncodeDecodePW();
                //String token = pw.encrypt(tmpPw);
                        
                //String link = "http://localhost:8080/XYZ/thorughEmail/newPw.jsp?un="+ userName +"&token="+token;
                
                //String message = "<h1><i>Hello "+userFname+ " " + userLname +" !!!</i></h1>";
               // message += "<h3><b>click here to verify your email</b></h3>";
               // message += "<a style='color:white;font-weight:bold;background-color:#e0c21a;font-size:2em;padding:0.2em 3em 0.2em 3em;text-align:center;cursor: pointer;border-radius:10px;text-decoration: none;' href='"+ link +"'>Verify</a>";
                

               // models.sendEmail.sendEmail(host, port, user, pass, userEmail, subject, message);
                con.close();
                response.sendRedirect("login.jsp?registration=success");
                
            }
            else{
                String uname = rs.getString("user_name");
                String uemail = rs.getString("u_Email");
                if(uname.equals(userName)){
                    response.sendRedirect("registration.jsp?username=already_in_use");
                    con.close();
                }
                
                else if(uemail.equals(userEmail)){
                    response.sendRedirect("registration.jsp?uemail=already_in_use");
                    con.close();
                }
            }

        }
        
        catch (Exception e) { 
            e.printStackTrace(); 
        }
    }
    
    private String randomTempPW(){
        SecureRandom random = new SecureRandom();
        byte bytes[] = new byte[60];
        random.nextBytes(bytes);
        Encoder encoder = Base64.getUrlEncoder().withoutPadding();
        String token = encoder.encodeToString(bytes);
        return token;
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
