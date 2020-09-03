/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet(name = "changedetails", urlPatterns = {"/changedetails"})
public class changedetails extends HttpServlet {

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
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            String clickbtn = request.getParameter("reqbtn");
            switch (clickbtn) {
                case "Change Details":
                    String username = request.getParameter("username");
                    String userid = request.getParameter("userid");
                    String fname = request.getParameter("fname");
                    String lname = request.getParameter("lname");
                    String phone = request.getParameter("phone");
                    String email = request.getParameter("email");
                    String u_NICNum = request.getParameter("u_NICNum");
                    String u_SLMCNum = request.getParameter("u_SLMCNum");
                    System.out.println(username + userid + fname + lname + phone + email + u_NICNum + u_SLMCNum);
                    int i = models.usermodel.updatedetails(username, fname, lname, phone, email, u_NICNum, u_SLMCNum, userid);
                    if (i != 0) {
                        response.sendRedirect("allusers.jsp?change=success");
                    } else {
                        response.sendRedirect("allusers.jsp?changew=fail");
                    }
                    break;
                case "Go to All Member panel":
                    response.sendRedirect("admin.jsp");
                    break;
            }

        } catch (SQLException ex) {
            System.out.println("OOPS something happend" + ex);
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
