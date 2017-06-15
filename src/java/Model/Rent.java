/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author maged
 */
public class Rent {

    int rent_dauration;
    String rent_startdate ;

    public Rent() {
        this.rent_dauration =0;
        this.rent_startdate ="";
    }
  
    public int getRent_dauration() {
        return rent_dauration;
    }

    public String getRent_startdate() {
        return rent_startdate;
    }
    
    public void addRent(int movie_id, int account_id, String date, int duration,String request) {
        Connection conn = DBConnection.getActiveConnection();
        Statement mys;
        try {
            mys = conn.createStatement();
             String sql = "insert into rent (account_id,movie_id,rent_startdate,rent_dauration,request)values ('" +account_id + "' , '" + movie_id + "', '" + date + "' , '" + duration+"','"+request+ "')";

        mys.executeUpdate(sql);
        
        } catch (SQLException ex) {
            Logger.getLogger(Rent.class.getName()).log(Level.SEVERE, null, ex);
        }
       
    }
  public Rent findRent(int movie_id,int account_id)
  {   
      
      
      Connection conn = DBConnection.getActiveConnection();
       Statement mys;
        try {
             mys = conn.createStatement();
             String sql = "SELECT * FROM Rent where movie_id='"+ movie_id +"' and account_id ='" +account_id+"'" ;
             ResultSet res = mys.executeQuery(sql);
             res.next();
             rent_startdate=res.getString("rent_startdate");
             rent_dauration=res.getInt("rent_dauration");
             
             return this;
             
        } catch (SQLException ex) {
            
           // Logger.getLogger(Rent.class.getName()).log(Level.SEVERE, null, ex);
            return null;
        }
        //return null;    
  }
 
  public void returnMovie(int movie_id, int account_id){
      Connection conn = DBConnection.getActiveConnection();
       Statement mys;
        try {
            mys = conn.createStatement();
            String sql = "DELETE FROM Rent where movie_id='"+ movie_id +"' and account_id ='" +account_id+"'" ;
             mys.executeUpdate(sql);
        } catch (SQLException ex) {
            Logger.getLogger(Rent.class.getName()).log(Level.SEVERE, null, ex);
        }
            
  }
  /*UPDATE Customers
SET City='Hamburg'
WHERE CustomerID=1;*/
 public void returnMovie2(int movie_id,int account_id){
     
     Connection conn = DBConnection.getActiveConnection();
       Statement mys;
        try {
            mys = conn.createStatement();
            String sql = "UPDATE RENT set request='d' where movie_id='"+ movie_id +"' and account_id ='" +account_id+"'" ;
             mys.executeUpdate(sql);
        } catch (SQLException ex) {
            Logger.getLogger(Rent.class.getName()).log(Level.SEVERE, null, ex);
        }
 }  
 
 public void extendDate(int movie_id,int account_id,int duration){
     
     Connection conn = DBConnection.getActiveConnection();
       Statement mys;
        try {
            Rent rent=this.findRent(movie_id,1);
            int sum=duration+rent.rent_dauration;
            mys = conn.createStatement();
            String sql = "UPDATE RENT set rent_dauration='"+sum+"' where movie_id='"+ movie_id +"' and account_id ='" +account_id+"'" ;
             mys.executeUpdate(sql);
        } catch (SQLException ex) {
            Logger.getLogger(Rent.class.getName()).log(Level.SEVERE, null, ex);
        }
 }
 
 
  
}
