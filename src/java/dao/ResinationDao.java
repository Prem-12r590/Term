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
 * @author kuldeep kumar
 */
public class ResinationDao {
    
    DbConnection dbConnection = new DbConnection();
    private PreparedStatement pst;
    private ResultSet rs;
    
        public int insertResign(String[] arr) throws SQLException {
         
//         rwid	RGNCD	RGNEmployee	NOticedate	RGNadate	reason
        String resigncd = "";
        int flag = 0;
        Connection connection = dbConnection.getConnection();
        try {
            
             String sql1 = "select concat('REGN',REPLICATE(0,3-len(isNULL(max(cast(convert(varchar,substring(RGNCD,5,7)) as int)),0)+1)),\n"
                    + "isNULL(max(cast(convert(varchar,substring(RGNCD,5,7)) as int)),0)+1) as cd from resigation";
            PreparedStatement pst = connection.prepareStatement(sql1);
            rs = pst.executeQuery();
            while (rs.next()) {
                resigncd = rs.getString(1);
            }
            
            String sql = "insert into resigation (RGNCD,RGNEmployee,NOticedate,RGNadate,reason) values(?,?,?,?,?)";
            pst = connection.prepareStatement(sql);
            pst.setString(1, resigncd);
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

    public String selectResign(String id) throws SQLException {

        Connection connection = dbConnection.getConnection();
        String result = "";
        try {

            pst = connection.prepareStatement("select * from resigation where RGNCD=?");
            pst.setString(1, id);
            rs = pst.executeQuery();
            while (rs.next()) {
                String RGNEmployee = rs.getString("RGNEmployee");
                String NOticedate = rs.getString("NOticedate");
                String RGNadate = rs.getString("RGNadate");
                String reason = rs.getString("reason");
                
                result = RGNEmployee + "#" + NOticedate+ "#" + RGNadate+ "#" + reason;

            }
        } catch (SQLException e) {
            printSQLException(e);
        } finally {
            connection.close();
        }
        return result;
    }

    public ArrayList< ArrayList<String>> selectAllResign() {
        ArrayList< ArrayList<String>> holidays = new ArrayList< ArrayList<String>>();
        try {
            Connection connection = dbConnection.getConnection();
            pst = connection.prepareStatement("select * from resigation");
            rs = pst.executeQuery();
            while (rs.next()) {
                ArrayList< String> Allholidays = new ArrayList<String>();
                
                
                
                Allholidays.add(rs.getString("RGNCD"));
                Allholidays.add(rs.getString("RGNEmployee"));
                Allholidays.add(rs.getString("NOticedate"));
                Allholidays.add(rs.getString("RGNadate"));
                Allholidays.add(rs.getString("reason"));
                holidays.add(Allholidays);

            }

        } catch (SQLException e) {
            printSQLException(e);
        }

        return holidays;
    }

    public boolean deleteResign(String id) throws SQLException {
        boolean rowDeleted;
        try (Connection connection = dbConnection.getConnection();
                PreparedStatement statement = connection.prepareStatement("delete from resigation where RGNCD=?");) {
             statement.setString(1, id);
            rowDeleted = statement.executeUpdate() > 0;
        }
        return rowDeleted;
    }

    public boolean updateResign(String[] arr) throws SQLException {
        boolean rowUpdated;
        try (Connection connection = dbConnection.getConnection();
                PreparedStatement statement = connection.prepareStatement("update resigation set RGNEmployee=?,NOticedate=?,RGNadate=?,reason=? where RGNCD=? ");) {
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
