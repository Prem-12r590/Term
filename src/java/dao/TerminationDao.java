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
 * @author kuldep kumar 24/05/2023
 */
public class TerminationDao {

    DbConnection dbConnection = new DbConnection();
    private PreparedStatement pst;
    private ResultSet rs;

    public int insertTermination(String[] arr) throws SQLException {

//        TRMCd	TEmployee	TerminationType	TerminationDate	TerminationReason	TerminationNoticeDate
        String Terminationcd = "";
        int flag = 0;
        Connection connection = dbConnection.getConnection();
        try {

            String sql1 = "select concat('TRMN',REPLICATE(0,3-len(isNULL(max(cast(convert(varchar,substring(TRMCd,5,7)) as int)),0)+1)),\n"
                    + "isNULL(max(cast(convert(varchar,substring(TRMCd,5,7)) as int)),0)+1) as cd from termination";
            PreparedStatement pst = connection.prepareStatement(sql1);
            rs = pst.executeQuery();
            while (rs.next()) {
                Terminationcd = rs.getString(1);
            }

            String sql = "insert into termination ( TRMCd,TEmployee,TerminationType,TerminationDate,TerminationReason,TerminationNoticeDate) values(?,?,?,?,?,?)";
            pst = connection.prepareStatement(sql);
            pst.setString(1, Terminationcd);
            pst.setString(2, arr[0]);
            pst.setString(3, arr[1]);
            pst.setString(4, arr[2]);
            pst.setString(5, arr[3]);
            pst.setString(6, arr[4]);
            flag = pst.executeUpdate();

        } catch (SQLException e) {
            printSQLException(e);
        } finally {
            connection.commit();
            connection.close();
        }
        return flag;
    }

    public String selectTermination(String id) throws SQLException {

        Connection connection = dbConnection.getConnection();
        String result = "";
        try {

            pst = connection.prepareStatement("select * from termination where TRMCd=?");
            pst.setString(1, id);
            rs = pst.executeQuery();
            while (rs.next()) {
                String TEmployee = rs.getString("TEmployee");
                String TerminationType = rs.getString("TerminationType");
                String TerminationDate = rs.getString("TerminationDate");
                String TerminationReason = rs.getString("TerminationReason");
                String TerminationNoticeDate = rs.getString("TerminationNoticeDate");

                result = TEmployee + "#" + TerminationType + "#" + TerminationDate + "#" + TerminationReason + "#" + TerminationNoticeDate;

            }
        } catch (SQLException e) {
            printSQLException(e);
        } finally {
            connection.close();
        }
        return result;
    }

    public ArrayList< ArrayList<String>> selectAllTermination() {
        ArrayList< ArrayList<String>> holidays = new ArrayList< ArrayList<String>>();
        try {
            Connection connection = dbConnection.getConnection();
            pst = connection.prepareStatement("select * from termination");
            rs = pst.executeQuery();
            while (rs.next()) {
                ArrayList< String> Allholidays = new ArrayList<String>();

                Allholidays.add(rs.getString("TRMCd"));
                Allholidays.add(rs.getString("TEmployee"));
                Allholidays.add(rs.getString("TerminationType"));
                Allholidays.add(rs.getString("TerminationDate"));
                Allholidays.add(rs.getString("TerminationReason"));
                Allholidays.add(rs.getString("TerminationNoticeDate"));
                holidays.add(Allholidays);

            }

        } catch (SQLException e) {
            printSQLException(e);
        }

        return holidays;
    }

    public boolean deleteTermination(String id) throws SQLException {
        boolean rowDeleted;
        try (Connection connection = dbConnection.getConnection();
                PreparedStatement statement = connection.prepareStatement("delete from termination where TRMCd=?");) {
            statement.setString(1, id);
            rowDeleted = statement.executeUpdate() > 0;
        }
        return rowDeleted;
    }

    public boolean updateTermination(String[] arr) throws SQLException {
        boolean rowUpdated;
        try (Connection connection = dbConnection.getConnection();
                PreparedStatement statement = connection.prepareStatement("update termination set TEmployee=?,TerminationType=?,TerminationDate=?,TerminationReason=?,TerminationNoticeDate=? where TRMCd=? ");) {
            statement.setString(1, arr[0]);
            statement.setString(2, arr[1]);
            statement.setString(3, arr[2]);
            statement.setString(4, arr[3]);
            statement.setString(5, arr[4]);
            statement.setString(6, arr[5]);

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
