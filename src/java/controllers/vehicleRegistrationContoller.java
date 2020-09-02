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
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import models.vehicleRegistration;

/**
 *
 * @author Primary Office
 */
@WebServlet(name = "vehicleRegistrationContoller", urlPatterns = {"/vehicleRegistrationContoller"})
public class vehicleRegistrationContoller extends HttpServlet {

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
       
         try {

            vehicleRegistration reg = new vehicleRegistration();

            reg.setUserID((String) request.getParameter("userID"));
            reg.setBrand((String) request.getParameter("brand"));
//            reg.setBrand((String) request.getParameter("vehicleNumber")); 
            reg.setChassisnumber((String) request.getParameter("chassis"));
            reg.setEngineNumber((String) request.getParameter("engine"));
            reg.setTypeOfVehicle((String) request.getParameter("selectedcake"));
            reg.setManufactureYear((String) request.getParameter("filling"));
            reg.setFloodCover(((String) request.getParameter("includeFlood")));
            reg.setPassengerCover(((String) request.getParameter("includeinscription")));
            reg.setUserID((String) request.getParameter("userId"));
            reg.setTotal(Double.parseDouble((String) request.getParameter("total")));
            reg.setVehicleNumber((String) request.getParameter("vehicleNumber"));
            
            reg.saveRegistration();

//            response.sendRedirect("Member.jsp");
            request.setAttribute("total", (String) request.getParameter("total"));//parse total to member jsp page
            request.getRequestDispatcher("index.jsp").forward(request, response);

        } catch (SQLException ex) {
             System.out.println("sql error"+ex);;
        } catch (ClassNotFoundException ex) {
             System.out.println("error"+ex);;
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
