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
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import Model.DBConnection;


/**
 *
 * @author MO
 */
public class signUpController extends HttpServlet {

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
                
                String userName = request.getParameter("username");
                String userRealName = request.getParameter("realname");
                String userMail = request.getParameter("email");
                String userPassword = request.getParameter("password");
                String cridetCard = request.getParameter("creditcard");
                String userBalance = request.getParameter("amount");
                
                out.print(userName);out.print("</br>");
                out.print(userRealName);out.print("</br>");
                out.print(userMail);out.print("</br>");
                out.print(userPassword);out.print("</br>");
                out.print(cridetCard);out.print("</br>");
                out.print(userBalance);out.print("</br>");
                
                Statement statement = connection.createStatement() ;
                Statement statement2 = connection.createStatement() ;
                
               
                String insertQuery = "insert into ia_project.account (account_username,account_name,account_password,account_type,account_mail,account_picPath,account_cridetCard,balance)";
                       insertQuery+= " values ('"+userName+"','"+userRealName+"','"+userPassword+"','1','"+userMail+"','C','"+cridetCard+"','"+userBalance+"')";
      
                String selectQuery = "select ia_project.account.account_id from ia_project.account where account_username = '"+userName+"' and account_password = '"+userPassword+"'";
                
                
                int affectedRows = statement.executeUpdate(insertQuery);
                
                if(affectedRows == 1){
                    ResultSet resultSet = statement2.executeQuery(selectQuery);
                    resultSet.first();
                    String userID = resultSet.getString("account_id");
                    
                    HttpSession session = request.getSession() ;
                    session.setAttribute("user",userID);
                    Cookie cookie = new Cookie("user",userID);
                    response.addCookie(cookie);
                    response.sendRedirect("Controller");
                } else {
                    out.print(affectedRows); out.print("</br>");
                    out.print(insertQuery);out.print("</br>");
                    out.print(selectQuery);out.print("</br>");
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
            Logger.getLogger(signUpController.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(signUpController.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(signUpController.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(signUpController.class.getName()).log(Level.SEVERE, null, ex);
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
