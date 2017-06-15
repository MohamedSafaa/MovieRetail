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
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpSession;

/**
 *
 * @author MO
 */
public class Account {

    float balance;
    int account_id;
    String account_userName, account_emial , account_name , picPath;
    int accountType , account_cridetCard;

    public float getBalance() {
        return balance;
    }

    public int getAccount_id() {
        return account_id;
    }

    public Account() {
    }

    public String getAccount_userName() {
        return account_userName;
    }

    public String getAccount_emial() {
        return account_emial;
    }

    public int getAccount_cridetCard() {
        return account_cridetCard;
    }

    public String getAccount_name() {
        return account_name;
    }

    public String getPicPath() {
        return picPath;
    }

    public int getAccountType() {
        return accountType;
    }

    public Account login(String userName, String userPassword) {
        Connection conn = DBConnection.getActiveConnection();
        System.out.println("2abl el query");
        System.out.println("name  : " + userName);
        System.out.println("password  : " + userPassword);
        
        String selectQuery = "select * from account where account.account_username = '" + userName + "'and account.account_password = '" + userPassword + "'";
        Statement statement = null;
        ResultSet selectResults = null;
        try {
            statement = conn.createStatement();
            selectResults = statement.executeQuery(selectQuery);
            System.out.println("2abl el if");
            if (selectResults.next()) {
                System.out.println("gowa el if");
                this.account_emial = selectResults.getString("account_mail");
                this.account_name = selectResults.getString("account_name");
                this.account_cridetCard = selectResults.getInt("account_cridetCard");
                this.account_id = selectResults.getInt("account_id");
                this.balance = selectResults.getFloat("balance");
                this.accountType = selectResults.getInt("account_type");
                this.picPath = selectResults.getString("account_picPath");
                return this;
            }
        } catch (SQLException ex) {
            System.out.println("Error query");
        }
        return null ;
    }
    
    public Account accountBalance(int id)
    {
       Connection conn = DBConnection.getActiveConnection();
       Statement mys;
       Account acc=new Account();
        try {
            mys = conn.createStatement();
            String sql = "SELECT * FROM account WHERE account_id='" + id + "'";
            ResultSet res = mys.executeQuery(sql);
            res.next();
            acc.balance=res.getFloat("balance");
            return acc;
            
        } catch (SQLException ex) {
            Logger.getLogger(Account.class.getName()).log(Level.SEVERE, null, ex);
        }

       return acc;
    }
    public void withdrawFromAccount(int id ,float movie_price)
    {
        Connection conn=DBConnection.getActiveConnection();
        Account account=accountBalance(id);
        try {
            Statement mys=conn.createStatement();
            float newBalance=account.balance-movie_price;
            String sql = "UPDATE account set balance='"+newBalance+"' where account_id='"+ id +"'" ;
             mys.executeUpdate(sql);
            
        } catch (SQLException ex) {
            Logger.getLogger(Account.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        
        
        
    }
}
