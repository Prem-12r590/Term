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
public class TrainingStatusDao {
    
    
    
    DbConnection dbConnection = new DbConnection();
    private PreparedStatement pst;
    private ResultSet rs;
    
        public int inserTriningSatatus(String[] arr) throws SQLException {
         
//         rwid	TRNSTSCd	trainingType	trainerName	trainerEmployee	trainingCost	trainingstartDate	trainingEndDate	trainingDesc	trainingstatus
        String trnstscd = "";
        int flag = 0;
        Connection connection = dbConnection.getConnection();
        try {
            
             String sql1 = "select concat('TRNS',REPLICATE(0,3-len(isNULL(max(cast(convert(varchar,substring(TRNSTSCd,5,7)) as int)),0)+1)),\n"
                    + "isNULL(max(cast(convert(varchar,substring(TRNSTSCd,5,7)) as int)),0)+1) as cd from trainingStatus";
            PreparedStatement pst = connection.prepareStatement(sql1);
            rs = pst.executeQuery();
            while (rs.next()) {
                trnstscd = rs.getString(1);
            }
            
            String sql = "insert into trainingStatus (TRNSTSCd,trainingType,trainerName,trainerEmployee,trainingCost,trainingstartDate,trainingEndDate,trainingDesc,trainingstatus) values(?,?,?,?,?,?,?,?,?)";
            pst = connection.prepareStatement(sql);
            pst.setString(1, trnstscd);
            pst.setString(2, arr[0]);
            pst.setString(3, arr[1]);
            pst.setString(4, arr[2]);
            pst.setString(5, arr[3]);
            pst.setString(6, arr[4]);
            pst.setString(7, arr[5]);
            pst.setString(8, arr[6]);
            pst.setString(9, arr[7]);
            
            
            
            flag = pst.executeUpdate();

        } catch (SQLException e) {
            printSQLException(e);
        } finally {
            connection.commit();
            connection.close();
        }
        return flag;
    }

    public String seletcTStatus(String id) throws SQLException {

        Connection connection = dbConnection.getConnection();
        String result = "";
        try {

            pst = connection.prepareStatement("select * from trainingStatus where TRNSTSCd=?");
            pst.setString(1, id);
            rs = pst.executeQuery();
            while (rs.next()) {
               					
                String trainingType = rs.getString("trainingType");
                String trainerName = rs.getString("trainerName");
                String trainerEmployee = rs.getString("trainerEmployee");
                String trainingCost = rs.getString("trainingCost");
                String trainingstartDate = rs.getString("trainingstartDate");
                String trainingEndDate = rs.getString("trainingEndDate");
                String trainingDesc = rs.getString("trainingDesc");
                String trainingstatus = rs.getString("trainingstatus");
                result = trainingType + "#" + trainerName+ "#" + trainerEmployee+ "#" + trainingCost+ "#" + trainingstartDate+ "#" + trainingEndDate+ "#" + trainingDesc+ "#" + trainingstatus;

            }
        } catch (SQLException e) {
            printSQLException(e);
        } finally {
            connection.close();
        }
        return result;
    }

    public ArrayList< ArrayList<String>> selectAllTstatus() {
        ArrayList< ArrayList<String>> holidays = new ArrayList< ArrayList<String>>();
        try {
            Connection connection = dbConnection.getConnection();
            pst = connection.prepareStatement("select * from trainingStatus");
            rs = pst.executeQuery();
            while (rs.next()) {
                ArrayList< String> Allholidays = new ArrayList<String>();
                Allholidays.add(rs.getString("TRNSTSCd"));
                Allholidays.add(rs.getString("trainingType"));
                Allholidays.add(rs.getString("trainerName"));
                Allholidays.add(rs.getString("trainerEmployee"));
                Allholidays.add(rs.getString("trainingCost"));
                Allholidays.add(rs.getString("trainingstartDate"));
                Allholidays.add(rs.getString("trainingEndDate"));
                Allholidays.add(rs.getString("trainingDesc"));
                Allholidays.add(rs.getString("trainingstatus"));
                holidays.add(Allholidays);

            }

        } catch (SQLException e) {
            printSQLException(e);
        }

        return holidays;
    }

    public boolean deleteTstatus(String id) throws SQLException {
        boolean rowDeleted;
        try (Connection connection = dbConnection.getConnection();
                PreparedStatement statement = connection.prepareStatement("delete from trainingStatus where TRNSTSCd=?");) {
             statement.setString(1, id);
            rowDeleted = statement.executeUpdate() > 0;
        }
        return rowDeleted;
    }

    public boolean updateTstatus(String[] arr) throws SQLException {
        boolean rowUpdated;
        try (Connection connection = dbConnection.getConnection();
                PreparedStatement statement = connection.prepareStatement("update trainingStatus set trainingType=?,trainerName=?,trainerEmployee=?,trainingCost=? ,trainingstartDate=?,trainingEndDate=?,trainingDesc=?,trainingstatus=? where TRNSTSCd=? ");) {
            statement.setString(1, arr[0]);
            statement.setString(2, arr[1]);
            statement.setString(3, arr[2]);
            statement.setString(4, arr[3]);
            statement.setString(5, arr[4]);
            statement.setString(6, arr[5]);
            statement.setString(7, arr[6]);
            statement.setString(8, arr[7]);
            statement.setString(9, arr[8]);

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
