/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.mail.MessagingException;
import javax.mail.Part;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author ammar
 */

@WebServlet("/uploadImages")
@MultipartConfig(maxFileSize = 16177216) //upto 16 MB

//@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, // 2MB
//        maxFileSize = 1024 * 1024 * 10, // 10MB
//        maxRequestSize = 1024 * 1024 * 50)

public class uploadImage extends HttpServlet {
    

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, ClassNotFoundException, SQLException, MessagingException {
        
        PrintWriter out;
        
        String connectionURL = "jdbc:mysql://localhost:3306/drray?useTimezone=true&serverTimezone=UTC";
        String user = "root";
        String pass = "";
        out = response.getWriter();
        int result = 0;
        Connection con = null;
        
        String patient = request.getParameter("patient");
        String Cancer_Site = request.getParameter("Cancer_Site");
        String Tumour_Type = request.getParameter("Tumour_Type");
        String Sex = request.getParameter("Sex");
        javax.servlet.http.Part part = request.getPart("file");
        if (part != null) {
            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                con = DriverManager.getConnection(connectionURL,user,pass);
                PreparedStatement ps = con.prepareStatement("insert into searchanalysis (patient, Cancer_Site, Tumour_Type, Sex, image) values (?,?,?,?,?)");
                InputStream is = part.getInputStream();
                ps.setString(1, patient);
                ps.setString(2, Cancer_Site);
                ps.setString(3, Tumour_Type);
                ps.setString(4, Sex);
                ps.setBlob(5, is);
                
                result = ps.executeUpdate();
                if (result > 0) {
                    response.sendRedirect("uploadMRI.jsp?upload=success");
                } else {
                    response.sendRedirect("uploadMRI.jsp?confirm=fail");
                }
                
            } catch (Exception e) {
                out.println("<h3>an error</h3> "+e);
            }
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
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(uploadImage.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(uploadImage.class.getName()).log(Level.SEVERE, null, ex);
        } catch (MessagingException ex) {
            Logger.getLogger(uploadImage.class.getName()).log(Level.SEVERE, null, ex);
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
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(uploadImage.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(uploadImage.class.getName()).log(Level.SEVERE, null, ex);
        } catch (MessagingException ex) {
            Logger.getLogger(uploadImage.class.getName()).log(Level.SEVERE, null, ex);
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
