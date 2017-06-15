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
import java.time.Clock;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author maged
 */
public class movie {

    private int movie_id = 0;
    private String movie_name = "Suicide Squad";
    private int movie_year = 2016;
    private float movie_price = (float) 8.5;
    private int movie_rentcount = 0;
    private float movie_rate = (float) 7.0;
    private String movie_imgpath = "images/suicid-squad.jpg";
    private String movie_description = "bad movie";

    // Connection conn=connection.getconConnection();
    public String getMovie_name() {
        return movie_name;
    }

    public int getMovie_year() {
        return movie_year;
    }

    public float getMovie_price() {
        return movie_price;
    }

    public int getMovie_rentcount() {
        return movie_rentcount;
    }

    public float getMovie_rate() {
        return movie_rate;
    }

    public String getMovie_imgpath() {
        return movie_imgpath;
    }

    public String getMovie_description() {
        return movie_description;
    }

    public int getMovie_movie_id() {
        return movie_id;
    }

    public void insert_movie() {
        Connection conn = DBConnection.getActiveConnection();
        try {
            Statement mys = conn.createStatement();
            String sql = "insert into MOVIE (movie_name,movie_year,movie_price,movie_rentcount,movie_rate,movie_imgpath,movie_description)values ('" + movie_name + "' , '" + movie_year + "', '" + movie_price + "' , '" + movie_rentcount + "','" + movie_rate + "','" + movie_imgpath + "','" + movie_description + "')";

            if (mys.executeUpdate(sql) == 1) {
                System.out.print("movie added");
            }

        } catch (SQLException ex) {
            Logger.getLogger(movie.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public ArrayList<movie> retrive_movies() {
        Connection conn = DBConnection.getActiveConnection();
        ArrayList<movie> allMovies = new ArrayList<movie>();
        try {

            Statement mys = conn.createStatement();

            String sql = "SELECT * FROM MOVIE ";

            ResultSet res = mys.executeQuery(sql);

            while (res.next()) {
                movie temp = new movie();
                /*private String movie_name="Suicide Squad";
                 private int movie_year=2016;
                 private float movie_price=(float)8.5;
                 private int movie_rentcount=0;
                 private float movie_rate=(float)7.0;
                 private String movie_imgpath="images/suicid-squad.jpg";
                 private String movie_description="bad movie";*/
                System.out.print("da5al");
                temp.movie_id=res.getInt("movie_id");
                temp.movie_name = res.getString("movie_name");
                temp.movie_year = res.getInt("movie_year");
                temp.movie_price = res.getFloat("movie_price");
                temp.movie_rate = res.getFloat("movie_rate");
                temp.movie_imgpath = res.getString("movie_imgpath");
                temp.movie_description = res.getString("movie_description");
                
                allMovies.add(temp);
            }

        } catch (SQLException ex) {
            Logger.getLogger(movie.class.getName()).log(Level.SEVERE, null, ex);
        }

        return allMovies;
    }

    public ArrayList<movie> retrive_moviesByMethod(String method, String movie) {
        Connection conn = DBConnection.getActiveConnection();
        ArrayList<movie> allMovies = new ArrayList<movie>();
        Statement mys = null;
        ResultSet res = null;
        String sql = "";
        if (method.equals("Actor")) {
            String actorId = "";
            String innerSql = "select Actor_id from Actor where Actor_name='" + movie + "'";
            try {
                mys = conn.createStatement();
                res = mys.executeQuery(innerSql);
                while (res.next()) {
                    actorId = "" + res.getInt("Actor_id");
                    System.out.println(actorId);
                }
            } catch (SQLException ex) {
                System.out.println("Error in search el actor id");
                Logger.getLogger(movie.class.getName()).log(Level.SEVERE, null, ex);
            }
            sql = "SELECT * from Movie Inner join Act "
                    + "on Act.Movie_ID = Movie.Movie_ID "
                    + "where Act.Actor_Id='" + actorId + "'";
        } else {
            sql = "SELECT * FROM MOVIE where Movie_" + method + "='" + movie + "'";
        }
        mys = null;
        try {
            mys = conn.createStatement();
            res = mys.executeQuery(sql);
            while (res.next()) {
                movie temp = new movie();
                temp.movie_name = res.getString("movie_name");
                temp.movie_year = res.getInt("movie_year");
                temp.movie_price = res.getFloat("movie_price");
                temp.movie_rate = res.getFloat("movie_rate");
                temp.movie_imgpath = res.getString("movie_imgpath");
                temp.movie_description = res.getString("movie_description");
                temp.movie_id = res.getInt("movie_id");
                allMovies.add(temp);
            }

        } catch (SQLException ex) {
            System.out.println("Error in search by method");
            Logger.getLogger(movie.class.getName()).log(Level.SEVERE, null, ex);
        }
        return allMovies;
    }

    public movie getMovieDetails(int id) {
        Connection conn = DBConnection.getActiveConnection();
        movie temp = new movie();
        try {

            Statement mys = conn.createStatement();

            String sql = "SELECT * FROM MOVIE WHERE movie_id='" + id + "'";

            ResultSet res = mys.executeQuery(sql);
            if (res.next()) {
                temp.movie_name = res.getString("movie_name");
                temp.movie_year = res.getInt("movie_year");
                temp.movie_price = res.getFloat("movie_price");
                temp.movie_rate = res.getFloat("movie_rate");
                temp.movie_imgpath = res.getString("movie_imgpath");
                temp.movie_description = res.getString("movie_description");
                temp.movie_id = res.getInt("movie_id");
                temp.movie_rentcount = res.getInt("movie_rentcount");
            }
        } catch (SQLException ex) {
            Logger.getLogger(movie.class.getName()).log(Level.SEVERE, null, ex);
        }

        return temp;
    }

    public void updateRentCount(int id, int val) {

        Connection conn = DBConnection.getActiveConnection();
        Statement mys;
        try {

            movie mov = getMovieDetails(id);
            int sum = mov.movie_rentcount + val;
            if (sum < 0) {
                sum = 0;
            }
            mys = conn.createStatement();
            String sql = "UPDATE MOVIE set movie_rentcount='" + sum + "' where movie_id='" + id + "'";
            mys.executeUpdate(sql);
        } catch (SQLException ex) {
            Logger.getLogger(Rent.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    

}
