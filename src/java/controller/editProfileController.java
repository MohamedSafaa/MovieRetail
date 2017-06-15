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
import java.util.ArrayList;
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
public class editProfileController extends HttpServlet {

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
            
                
            Cookie []cookies ;
            String userID  = "";
            cookies = request.getCookies();
            for(Cookie cookie : cookies)
                if(cookie.getName().toString().equals("user")){
                    userID = cookie.getValue().toString();
                    break ;
                }
           
            if(!userID.equals("")){
                 
                Class.forName("com.mysql.jdbc.Driver");
                Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/", "root","000000");
                
                Statement statement = connection.createStatement();
                
                String selectQuery = "select * from ia_project.account where ia_project.account.account_id = '"+userID+"'";
                
                ResultSet result = statement.executeQuery(selectQuery);
                result.first();
                
                String userName = result.getString("account_username");
                String userRealName = result.getString("account_name");
                String userPassword = result.getString("account_password");
                int userType = result.getInt("account_type") ;
                String userMail = result.getString("account_mail");
                String userPicture = result.getString("account_picPath");
                int cridetCard = result.getInt("account_cridetCard");
                float userBalance = result.getFloat("balance");
                
                out.print(userID); out.print("</br>");
                out.print(userName); out.print("</br>");
                out.print(userRealName); out.print("</br>");
                out.print(userPassword); out.print("</br>");
                out.print(userType); out.print("</br>");
                out.print(userMail); out.print("</br>");
                out.print(userPicture); out.print("</br>");
                out.print(cridetCard); out.print("</br>");
                out.print(userBalance); out.print("</br>");
                
                
                
                
                ArrayList<String> results = new ArrayList<String>();
                results.add(userID);
                results.add(userName);
                results.add(userRealName);
                results.add(userPassword);
                results.add(""+userType);
                results.add(userMail);
                results.add(userPicture);
                results.add(""+cridetCard);
                results.add(""+userBalance);
              
                for(String item : results)
                    out.print(item +"</br>");
                
                
            response.setContentType("text/html");  
            request.setAttribute("AccountInfo",results);
      //      response.sendRedirect("editProfile.jsp");            
            request.getRequestDispatcher("editProfile.jsp").forward(request, response);
           
            
            
            } else{
                out.print("No cookie Found"); out.print("</br>");
                
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
            Logger.getLogger(editProfileController.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(editProfileController.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(editProfileController.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(editProfileController.class.getName()).log(Level.SEVERE, null, ex);
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
