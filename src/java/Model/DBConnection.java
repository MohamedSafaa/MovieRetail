/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Mohamed
 */
public class DBConnection {

    private static Connection connection = null;

    /**
     * establish the connection to the database or the openshift
     *
     * @return
     */
    public static Connection getActiveConnection() {
        try {
            Class.forName("com.mysql.jdbc.Driver");

            System.out.println("class is passed.... ");
            connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/ia_project", "root",
                    "000000");
            System.out.println("connesction is passed.... ");
            return connection;

        } catch (ClassNotFoundException ex) {
            System.out.println("class driver has problem .... ");
            Logger.getLogger(DBConnection.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException e) {
            System.out.println("connection failed .... ");
            e.printStackTrace();
        }
        return null;
    }
}