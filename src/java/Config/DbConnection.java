/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Config;

import static java.lang.Class.forName;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.DriverManager;

/**
 *
 * @author https://youtu.be/WmN4Lp4_HpY
 */
public class DbConnection {

    Connection con = null;

    String url = "jdbc:sqlserver://DESKTOP-1ULGF16\\SQL2019:1433;databasename=HRMS;encrypt=false;";
    String username = "sa";
    String pass = "root";

//    String url = "jdbc:sqlserver://DESKTOP-OROTPFV:1433;databasename=ERP_Alder;encrypt=false;";
//    String username = "root";
//    String pass = "Hitouch";
    public Connection getConnection() {
        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            con = DriverManager.getConnection(url, username, pass);
            if (con != null) {
                System.out.println("done");
            } else {
                System.out.println("Something went wrong!!");  
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return con;
    }

    public static void main(String [] args){
        DbConnection con=new DbConnection();
        Connection c=con.getConnection();
        System.out.println("==============="+c);
        
    }
}
//Pawan