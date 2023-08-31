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
public class EmployeeDao {

    DbConnection dbConnection = new DbConnection();
    private PreparedStatement pst;
    private ResultSet rs;

    public int insertEmployee(String[] arr) throws SQLException {

//        rwid	empcd	FirstName	lastname	Username	useremail	userpassword	joiningDate	userPhone	usercompany	userDepartment	userDesignation
        String empcd = "";
        int flag = 0;
        Connection connection = dbConnection.getConnection();
        try {

            String sql1 = "select concat('EMP0',REPLICATE(0,3-len(isNULL(max(cast(convert(varchar,substring(empcd,5,7)) as int)),0)+1)),\n"
                    + "isNULL(max(cast(convert(varchar,substring(empcd,5,7)) as int)),0)+1) as cd from Hremployee";
            PreparedStatement pst = connection.prepareStatement(sql1);
            rs = pst.executeQuery();
            while (rs.next()) {
                empcd = rs.getString(1);
            }

            String sql = "insert into Hremployee (empcd,FirstName,lastname,Username,useremail,userpassword,joiningDate,userPhone,usercompany,userDepartment,userDesignation) values(?,?,?,?,?,?,?,?,?,?,?)";
            pst = connection.prepareStatement(sql);
            pst.setString(1, empcd);
            pst.setString(2, arr[0]);
            pst.setString(3, arr[1]);
            pst.setString(4, arr[2]);
            pst.setString(5, arr[3]);
            pst.setString(6, arr[4]);
            pst.setString(7, arr[5]);
            pst.setString(8, arr[6]);
            pst.setString(9, arr[7]);
            pst.setString(10, arr[8]);
            pst.setString(11, arr[9]);
            flag = pst.executeUpdate();

        } catch (SQLException e) {
            printSQLException(e);
        } finally {
            connection.commit();
            connection.close();
        }
        return flag;
    }

    public String selectEmployee(String id) throws SQLException {

        Connection connection = dbConnection.getConnection();
        String result = "";
        try {

            pst = connection.prepareStatement("select * from Hremployee where empcd=?");
            pst.setString(1, id);
            rs = pst.executeQuery();
            while (rs.next()) {

                String FirstName = rs.getString("FirstName");
                String lastname = rs.getString("lastname");
                String Username = rs.getString("Username");
                String useremail = rs.getString("useremail");
                String userpassword = rs.getString("userpassword");
                String joiningDate = rs.getString("joiningDate");
                String userPhone = rs.getString("userPhone");
                String usercompany = rs.getString("usercompany");
                String userDepartment = rs.getString("userDepartment");
                String userDesignation = rs.getString("userDesignation");

                result = FirstName + "#" + lastname + "#" + Username + "#" + useremail + "#" + userpassword + "#" + joiningDate + "#" + userPhone + "#" + usercompany + "#" + userDepartment + "#" + userDesignation;

            }
        } catch (SQLException e) {
            printSQLException(e);
        } finally {
            connection.close();
        }
        return result;
    }

    
    public String selectEMployeeViaValue(String empname ,String id, String designation) throws SQLException {

        Connection connection = dbConnection.getConnection();
        String result = "";
        try {
            String sql="";
            pst = connection.prepareStatement("select * from Hremployee where empcd=?");
            pst.setString(1, id);
            rs = pst.executeQuery();
            while (rs.next()) {

                String FirstName = rs.getString("FirstName");
                String lastname = rs.getString("lastname");
                String Username = rs.getString("Username");
                String useremail = rs.getString("useremail");
                String userpassword = rs.getString("userpassword");
                String joiningDate = rs.getString("joiningDate");
                String userPhone = rs.getString("userPhone");
                String usercompany = rs.getString("usercompany");
                String userDepartment = rs.getString("userDepartment");
                String userDesignation = rs.getString("userDesignation");

                result = FirstName + "#" + lastname + "#" + Username + "#" + useremail + "#" + userpassword + "#" + joiningDate + "#" + userPhone + "#" + usercompany + "#" + userDepartment + "#" + userDesignation;

            }
        } catch (SQLException e) {
            printSQLException(e);
        } finally {
            connection.close();
        }
        return result;
    }
    
    
    public ArrayList< ArrayList<String>> selectAllEmployee() {
        ArrayList< ArrayList<String>> holidays = new ArrayList< ArrayList<String>>();
        try {
            Connection connection = dbConnection.getConnection();
            pst = connection.prepareStatement("select * from Hremployee");
            rs = pst.executeQuery();
            while (rs.next()) {
                ArrayList< String> Allholidays = new ArrayList<String>();

                Allholidays.add(rs.getString("empcd"));
                Allholidays.add(rs.getString("FirstName"));
                Allholidays.add(rs.getString("lastname"));
                Allholidays.add(rs.getString("Username"));
                Allholidays.add(rs.getString("useremail"));
                Allholidays.add(rs.getString("userpassword"));
                Allholidays.add(rs.getString("joiningDate"));
                Allholidays.add(rs.getString("userPhone"));
                Allholidays.add(rs.getString("usercompany"));
                Allholidays.add(rs.getString("userDepartment"));
                Allholidays.add(rs.getString("userDesignation"));
                holidays.add(Allholidays);

            }

        } catch (SQLException e) {
            printSQLException(e);
        }

        return holidays;
    }

    public boolean deletEMployee(String id) throws SQLException {
        boolean rowDeleted;
        try (Connection connection = dbConnection.getConnection();
                PreparedStatement statement = connection.prepareStatement("delete from Hremployee where empcd=?");) {
            statement.setString(1, id);
            rowDeleted = statement.executeUpdate() > 0;
        }
        return rowDeleted;
    }

    public boolean updateEmployee(String[] arr) throws SQLException {
        boolean rowUpdated;
        try (Connection connection = dbConnection.getConnection();
                PreparedStatement statement = connection.prepareStatement("update Hremployee set FirstName=?,	lastname=?,	Username=?,	useremail=?,	userpassword=?,	joiningDate=?,	userPhone=?,	usercompany=?,	userDepartment=?,	userDesignation=? where empcd=? ");) {
            statement.setString(1, arr[0]);
            statement.setString(2, arr[1]);
            statement.setString(3, arr[2]);
            statement.setString(4, arr[3]);
            statement.setString(5, arr[4]);
            statement.setString(6, arr[5]);
            statement.setString(7, arr[6]);
            statement.setString(8, arr[7]);
            statement.setString(9, arr[8]);
            statement.setString(10, arr[9]);
            statement.setString(11, arr[10]);

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
