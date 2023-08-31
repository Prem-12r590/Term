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
public class TraingTypeDao {
    
    
    
    DbConnection dbConnection = new DbConnection();
    private PreparedStatement pst;
    private ResultSet rs;
    
        public int insertTraining(String[] arr) throws SQLException {
         
//       rwid	
        String traintypecd = "";
        int flag = 0;
        Connection connection = dbConnection.getConnection();
        try {
            
             String sql1 = "select concat('TTYP',REPLICATE(0,3-len(isNULL(max(cast(convert(varchar,substring(trntypecd,5,7)) as int)),0)+1)),\n"
                    + "isNULL(max(cast(convert(varchar,substring(trntypecd,5,7)) as int)),0)+1) as cd from trainingType";
            PreparedStatement pst = connection.prepareStatement(sql1);
            rs = pst.executeQuery();
            while (rs.next()) {
                traintypecd = rs.getString(1);
            }
            
            String sql = "insert into trainingType (trntypecd,trainingType,trainingdesc,trainingstatus) values(?,?,?,?)";
            pst = connection.prepareStatement(sql);
            pst.setString(1, traintypecd);
            pst.setString(2, arr[0]);
            pst.setString(3, arr[1]);
            pst.setString(4, arr[2]);
        
            flag = pst.executeUpdate();

        } catch (SQLException e) {
            printSQLException(e);
        } finally {
            connection.commit();
            connection.close();
        }
        return flag;
    }

    public String selectTraining(String id) throws SQLException {

        Connection connection = dbConnection.getConnection();
        String result = "";
        try {

            pst = connection.prepareStatement("select * from trainingType where trntypecd=?");
            pst.setString(1, id);
            rs = pst.executeQuery();
            while (rs.next()) {
                String trainingType = rs.getString("trainingType");
                String trainingdesc = rs.getString("trainingdesc");
                String trainingstatus = rs.getString("trainingstatus");
                
                
                result = trainingType + "#" + trainingdesc+ "#" + trainingstatus;

            }
        } catch (SQLException e) {
            printSQLException(e);
        } finally {
            connection.close();
        }
        return result;
    }

    public ArrayList< ArrayList<String>> selectAllTraining() {
        ArrayList< ArrayList<String>> holidays = new ArrayList< ArrayList<String>>();
        try {
            Connection connection = dbConnection.getConnection();
            pst = connection.prepareStatement("select * from trainingType");
            rs = pst.executeQuery();
            while (rs.next()) {
                ArrayList< String> Allholidays = new ArrayList<String>();
                
                
                
                Allholidays.add(rs.getString("trntypecd"));
                Allholidays.add(rs.getString("trainingType"));
                Allholidays.add(rs.getString("trainingdesc"));
                Allholidays.add(rs.getString("trainingstatus"));
                
                holidays.add(Allholidays);

            }

        } catch (SQLException e) {
            printSQLException(e);
        }

        return holidays;
    }

    public boolean deleteTraining(String id) throws SQLException {
        boolean rowDeleted;
        try (Connection connection = dbConnection.getConnection();
                PreparedStatement statement = connection.prepareStatement("delete from trainingType where trntypecd=?");) {
             statement.setString(1, id);
            rowDeleted = statement.executeUpdate() > 0;
        }
        return rowDeleted;
    }

    public boolean updateTraining(String[] arr) throws SQLException {
        boolean rowUpdated;
        try (Connection connection = dbConnection.getConnection();
                PreparedStatement statement = connection.prepareStatement("update trainingType set trainingType=?,trainingdesc=?,trainingstatus=? where trntypecd=? ");) {
            statement.setString(1, arr[0]);
            statement.setString(2, arr[1]);
            statement.setString(3, arr[2]);
            statement.setString(4, arr[3]);
            

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
