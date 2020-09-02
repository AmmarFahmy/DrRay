/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers;

import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import passwordHashing.BCrypt;

/**
 *
 * @author ISK
 */
@WebServlet(name = "login", urlPatterns = {"/login"})
public class login extends HttpServlet {

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
            String UNAME = request.getParameter("uname");
            String UPW = request.getParameter("pw");

            Connection con = dbConnection.getConnection();
            Statement st = con.createStatement();

            String SQL = "SELECT * FROM users WHERE user_name= '" + UNAME + "' or u_Email = '" + UNAME + "'";
            ResultSet rs = st.executeQuery(SQL);

            String fName;
            int user_Status;
            int userID;

            if (rs.first()) {
                String dbPW = rs.getString("u_PW");
                if (BCrypt.checkpw(UPW, dbPW)) {

                    HttpSession session = request.getSession();
                    userID = rs.getInt("userID");
                    fName = rs.getString("u_firstName");
                    user_Status = rs.getInt("u_status");
                    String US = String.valueOf(user_Status);

                    if (user_Status != 0) {
                        session.setAttribute("userID", userID);
                        session.setAttribute("fName", fName);
                        session.setAttribute("US", US);

                        response.sendRedirect("index.jsp?login=success");

                        if (user_Status == 8) {
                            session.setMaxInactiveInterval(10 * 60);
                            session.setAttribute("userStatus", "ClaimAdmin");
                        }
                        else if (user_Status == 9) {
                            session.setMaxInactiveInterval(10 * 60);
                            session.setAttribute("userStatus", "Admin");
                        } else if (user_Status == 10) {
                            session.setMaxInactiveInterval(10 * 60);
                            session.setAttribute("userStatus", "MainAdmin");
                        } else {
                            session.setAttribute("userStatus", "User");
                        }
                    } else {
                        response.sendRedirect("login.jsp?confirm=fail");
                    }
                } else {
                    response.sendRedirect("login.jsp?password=incorrect");
                }

            } else {
                response.sendRedirect("login.jsp?login=fail");
            }
        } catch (Exception e) {
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
