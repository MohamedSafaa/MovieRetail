/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import Model.Account;
import Model.Rent;
import Model.movie;
import javax.servlet.http.HttpSession;

/**
 *
 * @author maged
 */
@WebServlet(name = "RentController", urlPatterns = {"/RentController"})
public class RentController extends HttpServlet {

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
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {
            /* TODO output your page here. You may use following sample code. */
           /* out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet RentController</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet RentController at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");*/
               

String date =request.getParameter("date");
            int duration=Integer.parseInt(request.getParameter("duration"));
            int movie_id=Integer.parseInt(request.getParameter("movie_id"));
            
            
            Rent rent=new Rent();
            HttpSession se=request.getSession();
            String id=(String)se.getAttribute("user");
            int userID=Integer.parseInt(id);
            Rent rentcheck=new Rent();
            Rent rentcheck2=rentcheck.findRent(movie_id,userID);
            if(rentcheck2==null){
            rent.addRent(movie_id,userID, date, duration,"r");
            movie mov=new movie();
            mov.updateRentCount(movie_id,1);
            movie temp=mov.getMovieDetails(movie_id);
           float movie_price=(float)temp.getMovie_price();
            Account account=new Account();
            account.withdrawFromAccount(1,movie_price);
            }
            
            request.getRequestDispatcher("MovieController").forward(request, response);
           
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
