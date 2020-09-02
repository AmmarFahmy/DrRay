/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import models.allModels;

/**
 *
 * @author Nirvan zentinal
 */
@WebServlet(name = "updateClaim", urlPatterns = {"/updateClaim"})
public class updateClaim extends HttpServlet {

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
        response.setContentType("text/html;charset=UTF-8");
        try{
        String idnaem = request.getParameter("idname");
        String username = request.getParameter("userName");
        String reason = request.getParameter("reason");
        String statusbox = request.getParameter("statusBox");
        String reqdate = request.getParameter("reqDate");
        String claimeddate = request.getParameter("claimeddate");
        String claimeamount = request.getParameter("claimeAmount");
        String paidamount = request.getParameter("paidAmount");
        
        int i=allModels.updateClaimDetails(idnaem, username, reason, statusbox, reqdate, claimeddate, claimeamount, paidamount);
        
        if(i!=0){
            response.sendRedirect("claimDetails.jsp?updatea=success");
        }else{
            response.sendRedirect("claimDetails.jsp?updatea=fail");
        }
//        response.sendRedirect("mainPage.jsp");
        }catch(Exception g){
            System.out.println("G ="+g);        }
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
