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
public class TrainerDao {

    DbConnection dbConnection = new DbConnection();
    private PreparedStatement pst;
    private ResultSet rs;

    public int inserTrainer(String[] arr) throws SQLException {

//       rwid	TRNCD	TfirstName	TlastName	TEmail	Tphone	Tstatus	Tdesc
        String resigncd = "";
        int flag = 0;
        Connection connection = dbConnection.getConnection();
        try {

            String sql1 = "select concat('TRNR',REPLICATE(0,3-len(isNULL(max(cast(convert(varchar,substring(TRNCD,5,7)) as int)),0)+1)),\n"
                    + "isNULL(max(cast(convert(varchar,substring(TRNCD,5,7)) as int)),0)+1) as cd from Trainer";
            PreparedStatement pst = connection.prepareStatement(sql1);
            rs = pst.executeQuery();
            while (rs.next()) {
                resigncd = rs.getString(1);
            }

            String sql = "insert into Trainer (TRNCD,TfirstName,TlastName,TEmail,Tphone,Tstatus,Tdesc) values(?,?,?,?,?,?,?)";
            pst = connection.prepareStatement(sql);
            pst.setString(1, resigncd);
            pst.setString(2, arr[0]);
            pst.setString(3, arr[1]);
            pst.setString(4, arr[2]);
            pst.setString(5, arr[3]);
            pst.setString(6, arr[4]);
            pst.setString(7, arr[5]);
            flag = pst.executeUpdate();

        } catch (SQLException e) {
            printSQLException(e);
        } finally {
            connection.commit();
            connection.close();
        }
        return flag;
    }

    public String seletTrainer(String id) throws SQLException {

        Connection connection = dbConnection.getConnection();
        String result = "";
        try {

            pst = connection.prepareStatement("select * from Trainer where TRNCD=?");
            pst.setString(1, id);
            rs = pst.executeQuery();
            while (rs.next()) {
                String TfirstName = rs.getString("TfirstName");
                String TlastName = rs.getString("TlastName");
                String TEmail = rs.getString("TEmail");
                String Tphone = rs.getString("Tphone");
                String Tstatus = rs.getString("Tstatus");
                String Tdesc = rs.getString("Tdesc");

                result = TfirstName + "#" + TlastName + "#" + TEmail + "#" + Tphone + "#" + Tstatus + "#" + Tdesc;

            }
        } catch (SQLException e) {
            printSQLException(e);
        } finally {
            connection.close();
        }
        return result;
    }

    public ArrayList< ArrayList<String>> selectAllTrainer() {
        ArrayList< ArrayList<String>> holidays = new ArrayList< ArrayList<String>>();
        try {
            Connection connection = dbConnection.getConnection();
            pst = connection.prepareStatement("select * from Trainer");
            rs = pst.executeQuery();
            while (rs.next()) {
                ArrayList< String> Allholidays = new ArrayList<String>();

                Allholidays.add(rs.getString("TRNCD"));
                Allholidays.add(rs.getString("TfirstName"));
                Allholidays.add(rs.getString("TlastName"));
                Allholidays.add(rs.getString("TEmail"));
                Allholidays.add(rs.getString("Tphone"));
                Allholidays.add(rs.getString("Tstatus"));
                Allholidays.add(rs.getString("Tdesc"));
                holidays.add(Allholidays);

            }

        } catch (SQLException e) {
            printSQLException(e);
        }

        return holidays;
    }

    public boolean deletetrainer(String id) throws SQLException {
        boolean rowDeleted;
        try (Connection connection = dbConnection.getConnection();
                PreparedStatement statement = connection.prepareStatement("delete from Trainer where TRNCD=?");) {
            statement.setString(1, id);
            rowDeleted = statement.executeUpdate() > 0;
        }
        return rowDeleted;
    }

    public boolean updatetrainer(String[] arr) throws SQLException {
        boolean rowUpdated;
        try (Connection connection = dbConnection.getConnection();
                PreparedStatement statement = connection.prepareStatement("update Trainer set TfirstName=?,	TlastName=?,	TEmail=?,	Tphone=?,	Tstatus=?,	Tdesc=? where TRNCD=? ");) {
            statement.setString(1, arr[0]);
            statement.setString(2, arr[1]);
            statement.setString(3, arr[2]);
            statement.setString(4, arr[3]);
            statement.setString(5, arr[4]);
            statement.setString(6, arr[5]);
            statement.setString(7, arr[6]);
            System.out.println("========"+arr[6]);
            System.out.println("========"+arr[5]);

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
