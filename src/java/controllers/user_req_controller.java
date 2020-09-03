/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.mail.MessagingException;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import models.usermodel;

/**
 *
 * @author ASUS
 */
@WebServlet(name = "user_req_controller", urlPatterns = {"/user_req_controller"})
public class user_req_controller extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
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
        try {
            String clicbtn = request.getParameter("reqbtn");
            switch (clicbtn) {
                case "Accept Request":
                    String usval = request.getParameter("request");
                    String uname = request.getParameter("namerequest");
                    String userEmail = request.getParameter("emailrequest");
                    int i = usermodel.accept_request(usval);
                    if (i != 0) {
                        response.sendRedirect("userrequest.jsp?accreq=success");
                        String subject = "XYZ DRIVER'S ASSOCIATION account successfull accepted by admin email !!";
                        String message = "<h1><i>Hello " + uname + " your acoont is fuuly accepted by admin now you can add your vehicls to get inshured Thank you !!!</i></h1>";
                        models.sendEmail.sendEmail(host, port, user, pass, userEmail, subject, message);

                    } else {
                        response.sendRedirect("userrequest.jsp?accreqw=fail");
                    }
                    break;
                case "Go to Admin panel":
                    response.sendRedirect("admin.jsp");
            }

        } catch (SQLException ex) {
            System.out.println("somthing happen in user req controller" + ex);

        } catch (MessagingException ex) {
            Logger.getLogger(user_req_controller.class.getName()).log(Level.SEVERE, null, ex);
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
