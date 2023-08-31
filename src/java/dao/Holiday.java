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
import java.util.List;

/**
 *
 * @author VIVEKJHA
 */
public class Holiday {

    DbConnection dbConnection = new DbConnection();

    private PreparedStatement pst;
    private ResultSet rs;

    public int insertHoliday(String[] arr) throws SQLException {
        String departmentid = "";
        int flag = 0;
        Connection connection = dbConnection.getConnection();
        try {

            String sql = "insert into holiday (holidayName,HolidayDate) values(?,?)";
            pst = connection.prepareStatement(sql);
            pst.setString(1, arr[0]);
            pst.setString(2, arr[1]);
            flag = pst.executeUpdate();

        } catch (SQLException e) {
            printSQLException(e);
        } finally {
            connection.commit();
            connection.close();
        }
        return flag;
    }

    public String selectDepartment(String id) throws SQLException {

        Connection connection = dbConnection.getConnection();
        String result = "";
        try {

            pst = connection.prepareStatement("select * from holiday where rwid=?");
            pst.setString(1, id);
            rs = pst.executeQuery();
            while (rs.next()) {
                String hname = rs.getString("holidayName");
                String hdate = rs.getString("HolidayDate");
                result = hname + "#" + hdate;

            }
        } catch (SQLException e) {
            printSQLException(e);
        } finally {
            connection.close();
        }
        return result;
    }

    public ArrayList< ArrayList<String>> selectAllHoliday() {
        ArrayList< ArrayList<String>> holidays = new ArrayList< ArrayList<String>>();
        try {
            Connection connection = dbConnection.getConnection();
            pst = connection.prepareStatement("select * from holiday order by rwid");
            rs = pst.executeQuery();
            while (rs.next()) {
                ArrayList< String> Allholidays = new ArrayList<String>();
                Allholidays.add(Integer.toString(rs.getInt("rwid")));
                Allholidays.add(rs.getString("holidayName"));
                Allholidays.add(rs.getString("HolidayDate"));
                holidays.add(Allholidays);

            }

        } catch (SQLException e) {
            printSQLException(e);
        }

        return holidays;
    }

    public boolean deleteholiday(String id) throws SQLException {
        boolean rowDeleted;
        try (Connection connection = dbConnection.getConnection();
                PreparedStatement statement = connection.prepareStatement("delete from holiday where rwid=?");) {

            int rwid = Integer.parseInt(id);
            statement.setInt(1, rwid);
            rowDeleted = statement.executeUpdate() > 0;
        }
        return rowDeleted;
    }

    public boolean updateHoliday(String[] arr) throws SQLException {
        boolean rowUpdated;
        try (Connection connection = dbConnection.getConnection();
                PreparedStatement statement = connection.prepareStatement("update holiday set holidayName=? ,HolidayDate=? where rwid=? ");) {
            statement.setString(1, arr[0]);
            statement.setString(2, arr[1]);
            statement.setString(3, arr[2]);

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
