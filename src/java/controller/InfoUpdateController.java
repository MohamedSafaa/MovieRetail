/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author MO
 */
public class InfoUpdateController extends HttpServlet {

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
            throws ServletException, IOException, ClassNotFoundException, SQLException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {
            
               Class.forName("com.mysql.jdbc.Driver");
                Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/", "root","000000");
                Statement statement = connection.createStatement();
                Cookie[] cookies ;
                cookies = request.getCookies() ;
                String userID = "";
                for( Cookie cookie : cookies)
                    if(cookie.getName().toString().equals("user") == true){
                       userID = cookie.getValue().toString();
                       break ;
                }
                
                
              
                String userName = request.getParameter("username");
                String userRealName = request.getParameter("realname");
                int cridetCard = Integer.parseInt(request.getParameter("creditcard"));
                float userBalance = Float.parseFloat(request.getParameter("creditcardAmount"));
                String userMail = request.getParameter("email");
                String userPassword = request.getParameter("newPassword");
                
                String updateQueryPassword = "update ia_project.account set account_username = '"+userName+"' , ";
                       updateQueryPassword += "account_name =  '"+userRealName+"' , account_password = '"+userPassword+"' , ";
                       updateQueryPassword +="account_mail = '"+userMail+"' , account_cridetCard = '"+cridetCard+"' , ";
                       updateQueryPassword +="balance = '"+userBalance+"' where account_id = '"+userID+"' ";
                
                
                
                String updateQuery = "update ia_project.account set account_username = '"+userName+"' , ";
                       updateQuery += "account_name =  '"+userRealName+"' , ";
                       updateQuery +="account_mail = '"+userMail+"' , account_cridetCard = '"+cridetCard+"' , ";
                       updateQuery +="balance = '"+userBalance+"' where account_id = '"+userID+"' ";
                
                if(userPassword.equals("")){
                    
                    out.print(updateQuery);
                    statement.executeUpdate(updateQuery);
                    
                    response.sendRedirect("profile.jsp");

                } else {
                    out.print(updateQueryPassword);
                    statement.executeUpdate(updateQueryPassword);
                    response.sendRedirect("profile.jsp");
                }
                

        } finally {
            out.close();
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
            Logger.getLogger(InfoUpdateController.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(InfoUpdateController.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(InfoUpdateController.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(InfoUpdateController.class.getName()).log(Level.SEVERE, null, ex);
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
