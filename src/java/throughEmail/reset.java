/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package throughEmail;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import passwordChange.EncodeDecodePW;

/**
 *
 * @author ISK
 */
@WebServlet(name = "reset", urlPatterns = {"/reset"})
public class reset extends HttpServlet {

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
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
           String UEMAIL=request.getParameter("resetReqMail");
           
           Connection con = dbConnection.dbConnection.getConnection();
           Statement st = con.createStatement();
           
           String resetSQL = "SELECT * FROM users WHERE u_Email  = '" + UEMAIL + "'";
            
            ResultSet resetResults = st.executeQuery(resetSQL);
            
            if(resetResults.first()) {
                String uname = resetResults.getString("user_name");
                String upw = resetResults.getString("u_PW");
                
                EncodeDecodePW pw= new EncodeDecodePW();
                String token = pw.encrypt(upw);
                
                String subject = "Insurance password reset!!";
                String link = "http://localhost:8080/XYZ/thorughEmail/newPw.jsp?un="+ uname +"&token="+token;
                
                String message ="<h1><b>click here to reset your password!!</b></h1>";
                message += "<a style='color:white;font-weight:bold;background-color:#e0c21a;font-size:2em;padding:0.2em 3em 0.2em 3em;text-align:center;cursor: pointer;border-radius:10px;text-decoration: none;' href='"+ link +"'>Reset</a>";
                
                models.sendEmail.sendEmail(host, port, user, pass, UEMAIL, subject, message);
                con.close();
                
                response.sendRedirect("login.jsp?reset=success");
            }
            
            else{
                response.sendRedirect("login.jsp?reset=fail");
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
