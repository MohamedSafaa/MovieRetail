/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import Model.DBConnection;
import Model.movie;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Calendar;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author ALi
 */
//@WebServlet(urlPatterns = {"/AddMovie"})
public class AddMovie extends HttpServlet {

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
            throws ServletException, IOException, SQLException {
        response.setContentType("text/html;charset=UTF-8");

        Connection conn = DBConnection.getActiveConnection();
        String actor1 = request.getParameter("actor1");
        String actor2 = request.getParameter("actor2");
        String actor3 = request.getParameter("actor3");

        String name = request.getParameter("name");
        String price = request.getParameter("price");
        String description = request.getParameter("description");
        String year = request.getParameter("year");
        String rentCount = request.getParameter("rentCount");
        String rate = request.getParameter("rate");
        String image_url = request.getParameter("image_url");
        String insertActor1 = "insert into Actor(Actor_name )  values('" + actor1 + "')";
        String insertActor2 = "insert into Actor (Actor_name ) values('" + actor2 + "')";
        String insertActor3 = "insert into Actor (Actor_name ) values('" + actor3 + "')";
        /*String getActor1 = "select Actor_id from Actor where Actor_name='"+actor1+"'";
         String getActor2 = "select Actor_id from Actor where Actor_name='"+actor2+"'";
         String getActor3 = "select Actor_id from Actor where Actor_name='"+actor3+"'";*/
        Statement sm = conn.createStatement();
        sm.executeUpdate(insertActor1);
        sm.executeUpdate(insertActor2);
        sm.executeUpdate(insertActor3);

        String search = "select Actor_id from actor where Actor_name='" + actor1 + "' or Actor_name='" + actor2 + "' or Actor_name='" + actor3 + "'";

        ResultSet r = sm.executeQuery(search);
        int[] arr = new int[3];
        int i = 0;
        r.next();
        while (i<3) {  
            arr[i] = r.getInt("Actor_id");
            r.next();
            i++;
        }

        String sql = "Insert into movie (movie_name,movie_year,movie_price,movie_rentCount,movie_rate,movie_imgPath,movie_description) VALUES ('" + name + "'," + year + ",'" + price + "'," + rentCount + "," + rate + ",'" + image_url + "','" + description + "')";
        PreparedStatement stmt;
        stmt = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
        int movie = stmt.executeUpdate();
        System.out.print("Done");

        String searchMovie = "select Movie_id from Movie where Movie_name='" + name + "'";
        r = sm.executeQuery(searchMovie);
        r.next();
        int movieid = r.getInt("Movie_id");

        String insertAct1 = "insert into act (Actor_id , Movie_id) values('" + arr[0] + "','" + movieid + "')";
        String insertAct2 = "insert into act (Actor_id , Movie_id) values('" + arr[1] + "','" + movieid + "')";
        String insertAct3 = "insert into act (Actor_id , Movie_id) values('" + arr[2] + "','" + movieid + "')";

        sm.executeUpdate(insertAct1);
        sm.executeUpdate(insertAct2);
        sm.executeUpdate(insertAct3);
        response.sendRedirect("/ProjectView/pages/add-movie.jsp");

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
        } catch (SQLException ex) {
            Logger.getLogger(AddMovie.class.getName()).log(Level.SEVERE, null, ex);
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
        } catch (SQLException ex) {
            Logger.getLogger(AddMovie.class.getName()).log(Level.SEVERE, null, ex);
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
