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
        String Mean = request.getParameter("Mean");
        String Variance = request.getParameter("Variance");
        String Standard_Deviation = request.getParameter("Standard_Deviation");
        String Entropy = request.getParameter("Entropy");
        String Skewness = request.getParameter("Skewness");
        String Contrast = request.getParameter("Contrast");
        String Homogeneity = request.getParameter("Homogeneity");
        String Dissimilarity = request.getParameter("Dissimilarity");
        String Correlation = request.getParameter("Correlation");
        javax.servlet.http.Part part = request.getPart("file");
        if (part != null) {
            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                con = DriverManager.getConnection(connectionURL,user,pass);
                PreparedStatement ps = con.prepareStatement("insert into searchanalysis (patient, Cancer_Site, Tumour_Type, Sex, Mean, Variance, Standard_Deviation, Entropy, Skewness, Contrast, Homogeneity, Dissimilarity, Correlation, image) values (?,?,?,?,?,?,?,?,?,?,?,?,?,?)");
                InputStream is = part.getInputStream();
                ps.setString(1, patient);
                ps.setString(2, Cancer_Site);
                ps.setString(3, Tumour_Type);
                ps.setString(4, Sex);
                ps.setString(5, Mean);
                ps.setString(6, Variance);
                ps.setString(7, Standard_Deviation);
                ps.setString(8, Entropy);
                ps.setString(9, Skewness);
                ps.setString(10, Contrast);
                ps.setString(11, Homogeneity);
                ps.setString(12, Dissimilarity);
                ps.setString(13, Correlation);
                ps.setBlob(14, is);
                
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
