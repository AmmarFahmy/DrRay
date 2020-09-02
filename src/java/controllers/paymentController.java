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
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import models.paymentRegistration;
import models.vehicleRegistration;

/**
 *
 * @author Primary Office
 */
public class paymentController extends HttpServlet {

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
            vehicleRegistration vehicleReg = new vehicleRegistration();//this object for set paid vehicle
            paymentRegistration payment = new paymentRegistration();//object

            payment.setCardNumber(Long.parseLong((String) request.getParameter("cardno")));
            payment.setAmount(Double.parseDouble((String) request.getParameter("amount")));
            payment.setCsv(Integer.parseInt((String) request.getParameter("csv")));
            payment.setDateOfExpire((String) request.getParameter("doe"));
            payment.setNameOnTheCard((String) request.getParameter("cardname"));
            payment.setUserID((String) request.getParameter("getuid"));
            payment.setVehicle_Id((String) request.getParameter("vehicle_id"));

            //get total
            Double total = Double.parseDouble((String) request.getParameter("total"));
            //get amount
            Double amount = Double.parseDouble((String) request.getParameter("amount"));

            if (total.equals(amount)) {
                payment.setPaid(1);
                vehicleReg.makePaidVehicle((String) request.getParameter("vehicle_id"));
                vehicleReg.addNewBalance((String) request.getParameter("vehicle_id"), "0");
            } else {
                payment.setPaid(0);
                total = total - amount;
                vehicleReg.addNewBalance((String) request.getParameter("vehicle_id"), "" + total);
            }
            if(payment.savePayment()<0){
//               
                response.sendRedirect("pyamentfail.jsp");
            }else{
                response.sendRedirect("pyamentsuccess.jsp");// 
            }

            

        } catch (SQLException ex) {
            System.out.println("sql error" + ex);
        } catch (ClassNotFoundException ex) {
            System.out.println(" error" + ex);
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
