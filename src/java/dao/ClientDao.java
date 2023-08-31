/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import Config.DbConnection;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 *
 * @author kuldeep kumar 25/05/2023
 */
public class ClientDao {
     DbConnection dbConnection = new DbConnection();
    private PreparedStatement pst;
    private ResultSet rs;
    
        public int inserClient(String[] arr) throws SQLException {
         
//        rwid	cliencd	FirstName	lastname	clientUsername	clientemail	clientpassword	clientPhone	clientcompany
        String clientcd = "";
        int flag = 0;
        Connection connection = dbConnection.getConnection();
        try {
            
             String sql1 = "select concat('CLNT',REPLICATE(0,3-len(isNULL(max(cast(convert(varchar,substring(cliencd,5,7)) as int)),0)+1)),\n"
                    + "isNULL(max(cast(convert(varchar,substring(cliencd,5,7)) as int)),0)+1) as cd from Client";
            PreparedStatement pst = connection.prepareStatement(sql1);
            rs = pst.executeQuery();
            while (rs.next()) {
                clientcd = rs.getString(1);
            }
            
            String sql = "insert into Client (cliencd,FirstName,lastname,clientUsername,clientemail,clientpassword,	clientPhone,	clientcompany) values(?,?,?,?,?,?,?,?)";
            pst = connection.prepareStatement(sql);
            pst.setString(1, clientcd);
            pst.setString(2, arr[0]);
            pst.setString(3, arr[1]);
            pst.setString(4, arr[2]);
            pst.setString(5, arr[3]);
            pst.setString(6, arr[4]);
            pst.setString(7, arr[5]);
            pst.setString(8, arr[6]);
            flag = pst.executeUpdate();

        } catch (SQLException e) {
            printSQLException(e);
        } finally {
            connection.commit();
            connection.close();
        }
        return flag;
    }

    public String selectClient(String id) throws SQLException {

        Connection connection = dbConnection.getConnection();
        String result = "";
        try {

            pst = connection.prepareStatement("select * from Client where cliencd=?");
            pst.setString(1, id);
            rs = pst.executeQuery();
            while (rs.next()) {
                String FirstName = rs.getString("FirstName");
                String lastname = rs.getString("lastname");
                String clientUsername = rs.getString("clientUsername");
                String clientemail = rs.getString("clientemail");
                String clientpassword = rs.getString("clientpassword");
                String clientPhone = rs.getString("clientPhone");
                String clientcompany = rs.getString("clientcompany");
                
                result = FirstName + "#" + lastname+ "#" + clientUsername+ "#" + clientemail+ "#" + clientpassword+ "#" + clientPhone+ "#" + clientcompany;

            }
        } catch (SQLException e) {
            printSQLException(e);
        } finally {
            connection.close();
        }
        return result;
    }

    public ArrayList< ArrayList<String>> selectAllClient() {
        ArrayList< ArrayList<String>> holidays = new ArrayList< ArrayList<String>>();
        try {
            Connection connection = dbConnection.getConnection();
            pst = connection.prepareStatement("select * from Client");
            rs = pst.executeQuery();
            while (rs.next()) {
                ArrayList< String> Allholidays = new ArrayList<String>();
                Allholidays.add(rs.getString("cliencd"));
                Allholidays.add(rs.getString("FirstName"));
                Allholidays.add(rs.getString("lastname"));
                Allholidays.add(rs.getString("clientUsername"));
                Allholidays.add(rs.getString("clientemail"));
                Allholidays.add(rs.getString("clientpassword"));
                Allholidays.add(rs.getString("clientPhone"));
                Allholidays.add(rs.getString("clientcompany"));
                holidays.add(Allholidays);

            }

        } catch (SQLException e) {
            printSQLException(e);
        }

        return holidays;
    }

    public boolean deleteClient(String id) throws SQLException {
        boolean rowDeleted;
        try (Connection connection = dbConnection.getConnection();
                PreparedStatement statement = connection.prepareStatement("delete from Client where cliencd=?");) {
             statement.setString(1, id);
            rowDeleted = statement.executeUpdate() > 0;
        }
        return rowDeleted;
    }

    public boolean updateClient(String[] arr) throws SQLException {
        boolean rowUpdated;
        
        
        try (Connection connection = dbConnection.getConnection();
                PreparedStatement statement = connection.prepareStatement("update Client set FirstName=?,	lastname=?,	clientUsername=?,	clientemail=?,	clientpassword=?,	clientPhone=?,	clientcompany=? where cliencd=? ");) {
            statement.setString(1, arr[0]);
            statement.setString(2, arr[1]);
            statement.setString(3, arr[2]);
            statement.setString(4, arr[3]);
            statement.setString(5, arr[4]);
            statement.setString(6, arr[5]);
            statement.setString(7, arr[6]);
            statement.setString(8, arr[7]);
System.out.println("============"+arr[6]);
            rowUpdated = statement.executeUpdate() > 0;
        }
        return rowUpdated;
    }

    private void printSQLException(SQLException ex) {
        for (Throwable e : ex) {
            if (e instanceof SQLException) {
                e.printStackTrace(System.err);
                System.err.println("SQLState: " + ((SQLException) e).getSQLState());
                System.err.println("Error Code: " + ((SQLException) e).getErrorCode());
                System.err.println("Message: " + e.getMessage());
                Throwable t = ex.getCause();
                while (t != null) {
                    System.out.println("Cause: " + t);
                    t = t.getCause();
                }
            }
        }
    }
}
