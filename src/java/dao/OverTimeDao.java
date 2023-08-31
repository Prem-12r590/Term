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
 * @author VIVEKJHA
 */
public class OverTimeDao {

    DbConnection dbConnection = new DbConnection();
    private PreparedStatement pst;
    private ResultSet rs;

    public int insertOvertime(String[] arr) throws SQLException {
        String OTID = "";
        int flag = 0;
        Connection connection = dbConnection.getConnection();
        try {
            
             String otid = "select concat('OT00',REPLICATE(0,3-len(isNULL(max(cast(convert(varchar,substring(OTid,5,7)) as int)),0)+1)),\n"
                    + "isNULL(max(cast(convert(varchar,substring(OTid,5,7)) as int)),0)+1) as cd from Overtime";
            PreparedStatement pst = connection.prepareStatement(otid);
            rs = pst.executeQuery();
            while (rs.next()) {
                OTID = rs.getString(1);
            }

            String sql = "insert into Overtime (OTid,EmpName,OTDate,OThours,OTDesc) values(?,?,?,?,?)";
            pst = connection.prepareStatement(sql);
            pst.setString(1, OTID);
            pst.setString(2, arr[0]);
            pst.setString(3, arr[1]);
            pst.setString(4, arr[2]);
            pst.setString(5, arr[3]);
            flag = pst.executeUpdate();

        } catch (SQLException e) {
            printSQLException(e);
        } finally {
            connection.commit();
            connection.close();
        }
        return flag;
    }

    public String selectOvertime(String id) throws SQLException {

        Connection connection = dbConnection.getConnection();
        String result = "";
        try {

            pst = connection.prepareStatement("select * from Overtime where OTID=?");
            pst.setString(1, id);
            rs = pst.executeQuery();
            while (rs.next()) {
                
                
                String EmpName = rs.getString("EmpName");
                String OTDate = rs.getString("OTDate");
                String OThours = rs.getString("OThours");
                String OTDesc = rs.getString("OTDesc");
                result = EmpName + "#" + OTDate+"#"+OThours+"#"+OTDesc;

            }
        } catch (SQLException e) {
            printSQLException(e);
        } finally {
            connection.close();
        }
        return result;
    }

    public ArrayList< ArrayList<String>> selectAllOvertime() {
        ArrayList< ArrayList<String>> holidays = new ArrayList< ArrayList<String>>();
        try {
            Connection connection = dbConnection.getConnection();
            pst = connection.prepareStatement("select * from Overtime ");
            rs = pst.executeQuery();
            while (rs.next()) {
                ArrayList< String> Allholidays = new ArrayList<String>();
                Allholidays.add(rs.getString("OTID"));
                Allholidays.add(rs.getString("EmpName"));
                Allholidays.add(rs.getString("OTDate"));
                Allholidays.add(rs.getString("OThours"));
                Allholidays.add(rs.getString("OTDesc"));
                holidays.add(Allholidays);

            }

        } catch (SQLException e) {
            printSQLException(e);
        }

        return holidays;
    }

    public boolean deleteOverTime(String id) throws SQLException {
        boolean rowDeleted;
        try (Connection connection = dbConnection.getConnection();
                PreparedStatement statement = connection.prepareStatement("delete from Overtime where OTID=?");) {
                statement.setString(1, id);
            rowDeleted = statement.executeUpdate() > 0;
        }
        return rowDeleted;
    }

    public boolean updateOvertime(String[] arr) throws SQLException {
        boolean rowUpdated;
        try (Connection connection = dbConnection.getConnection();
                PreparedStatement statement = connection.prepareStatement("update Overtime set EmpName=?,OTDate=?,OThours=?,OTDesc=? where OTid=? ");) {
            statement.setString(1, arr[0]);
            statement.setString(2, arr[1]);
            statement.setString(3, arr[2]);
            statement.setString(4, arr[3]);
            statement.setString(5, arr[4]);
            
            
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
