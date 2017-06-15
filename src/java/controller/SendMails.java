/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.io.PrintWriter;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.*;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import javax.servlet.*;
import java.util.Date;
import Model.SendEmail ;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Samir
 */
//@WebServlet(urlPatterns = {"/SendMails"})
public class SendMails extends HttpServlet {

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
            throws ServletException, IOException, ParseException {
        response.setContentType("text/html;charset=UTF-8");

        PrintWriter out = response.getWriter();
        boolean b = false;
        try {
            String Password = "000000", DBName = "ia_project";
            Date currentDate = new Date();
            Connection conn = null;
            Class.forName("com.mysql.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/" + DBName, "root", Password);
            String sql = "select * from rent where rent_late_return_mail = 0;";
            PreparedStatement stmt = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
            ResultSet result = stmt.executeQuery();
            while (result.next()) {
                int accountId = result.getInt("account_id");
                int movieId = result.getInt("movie_id");
                Date date = result.getDate("rent_startdate");
                int rentDuration = result.getInt("rent_dauration");
                long diff = currentDate.getTime() - date.getTime();
                long diffDays = diff / (24 * 60 * 60 * 1000);
                System.out.println(diffDays);
                if (diffDays > rentDuration) {
                    b = true;
                    sql = "select account_mail from account where account_id = " + accountId + ";";
                    PreparedStatement stmt1 = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
                    ResultSet result1 = stmt1.executeQuery();
                    result1.first();
                    String mail = result1.getString("account_mail");
                    SendEmail sendEmail = new SendEmail(mail);

                    sql = "update rent set rent_late_return_mail = 1 where account_id = " + accountId + " and movie_id = " + movieId + ";";
                    PreparedStatement stmt2 = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
                    stmt2.executeUpdate();
                }
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        if(b)
            response.sendRedirect("/ProjectView/pages/send-email.jsp?b=true");
        else
            response.sendRedirect("/ProjectView/pages/send-email.jsp?b=false");

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
        } catch (ParseException ex) {
            Logger.getLogger(SendMails.class.getName()).log(Level.SEVERE, null, ex);
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
        } catch (ParseException ex) {
            Logger.getLogger(SendMails.class.getName()).log(Level.SEVERE, null, ex);
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
