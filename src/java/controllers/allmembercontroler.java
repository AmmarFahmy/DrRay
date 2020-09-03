/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers;

import java.io.IOException;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import models.usermodel;


@WebServlet(name = "allmembercontroler", urlPatterns = {"/allmembercontroler"})
public class allmembercontroler extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     * @throws java.sql.SQLException
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {
        response.setContentType("text/html;charset=UTF-8");
     
            try {
            HttpSession ses = request.getSession();

            String usID = request.getParameter("uid");
           String usval = request.getParameter("uname");

            ses.setAttribute("sessionID", usID);

            String aID = (String)ses.getAttribute("sessionID");
            System.out.println("userid is "+usID);
                                     
            switch(usval){
                case "Change Details":
                    response.sendRedirect("changedetails.jsp?userID=" +usID);
                break;
                case  "Deactivate":
                    int i=usermodel.deleteuser(aID);
                    if(i!=0){
                    response.sendRedirect("allusers.jsp?Deactivate=success");
                    }
                    else{
                    response.sendRedirect("allusers.jsp?Deactivate=fail");    
                    }
                
                break;
                
             
            }
            } catch (SQLException ex) {
                Logger.getLogger(allmembercontroler.class.getName()).log(Level.SEVERE, null, ex);
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
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(allmembercontroler.class.getName()).log(Level.SEVERE, null, ex);
        }
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
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(allmembercontroler.class.getName()).log(Level.SEVERE, null, ex);
        }
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
    