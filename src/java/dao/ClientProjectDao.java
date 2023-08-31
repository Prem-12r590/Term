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
public class ClientProjectDao {

    DbConnection dbConnection = new DbConnection();
    private PreparedStatement pst;
    private ResultSet rs;

    public int insertproject(String[] arr) throws SQLException {

//        rwid	ProjectCd	projectName	prClient	prStartDate	prendDate	prRate	prPriority	prLeader	prdesc
        String resigncd = "";
        int flag = 0;
        Connection connection = dbConnection.getConnection();
        try {

            String sql1 = "select concat('CLPR',REPLICATE(0,3-len(isNULL(max(cast(convert(varchar,substring(ProjectCd,5,7)) as int)),0)+1)),\n"
                    + "isNULL(max(cast(convert(varchar,substring(ProjectCd,5,7)) as int)),0)+1) as cd from clientProject";
            PreparedStatement pst = connection.prepareStatement(sql1);
            rs = pst.executeQuery();
            while (rs.next()) {
                resigncd = rs.getString(1);
            }

            String sql = "insert into clientProject (ProjectCd,	projectName,	prClient,	prStartDate	,prendDate,	prRate,	prPriority,	prLeader,	prdesc) values(?,?,?,?,?,?,?,?,?)";
            pst = connection.prepareStatement(sql);
            pst.setString(1, resigncd);
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

    public String selectproject(String id) throws SQLException {

        Connection connection = dbConnection.getConnection();
        String result = "";
        try {

            pst = connection.prepareStatement("select * from clientProject where ProjectCd=?");
            pst.setString(1, id);
            rs = pst.executeQuery();
            while (rs.next()) {

                String projectName = rs.getString("projectName");
                String prClient = rs.getString("prClient");
                String prStartDate = rs.getString("prStartDate");
                String prendDate = rs.getString("prendDate");
                String prRate = rs.getString("prRate");
                String prPriority = rs.getString("prPriority");
                String prLeader = rs.getString("prLeader");
                String prdesc = rs.getString("prdesc");

                result = projectName + "#" + prClient + "#" + prStartDate + "#" + prendDate + "#" + prRate + "#" + prPriority + "#" + prLeader + "#" + prdesc;

            }
        } catch (SQLException e) {
            printSQLException(e);
        } finally {
            connection.close();
        }
        return result;
    }

    public ArrayList< ArrayList<String>> selectAllProject() {
        ArrayList< ArrayList<String>> holidays = new ArrayList< ArrayList<String>>();
        try {
            Connection connection = dbConnection.getConnection();
            pst = connection.prepareStatement("select * from clientProject");
            rs = pst.executeQuery();
            while (rs.next()) {
                ArrayList< String> Allholidays = new ArrayList<String>();

                Allholidays.add(rs.getString("ProjectCd"));
                Allholidays.add(rs.getString("projectName"));
                Allholidays.add(rs.getString("prClient"));
                Allholidays.add(rs.getString("prStartDate"));
                Allholidays.add(rs.getString("prendDate"));
                Allholidays.add(rs.getString("prRate"));
                Allholidays.add(rs.getString("prPriority"));
                Allholidays.add(rs.getString("prLeader"));
                Allholidays.add(rs.getString("prdesc"));
                holidays.add(Allholidays);

            }

        } catch (SQLException e) {
            printSQLException(e);
        }

        return holidays;
    }

    public boolean deleteproject(String id) throws SQLException {
        boolean rowDeleted;
        try (Connection connection = dbConnection.getConnection();
                PreparedStatement statement = connection.prepareStatement("delete from clientProject where ProjectCd=?");) {
            statement.setString(1, id);
            rowDeleted = statement.executeUpdate() > 0;
        }
        return rowDeleted;
    }

    public boolean updateProject(String[] arr) throws SQLException {
        boolean rowUpdated;
        try (Connection connection = dbConnection.getConnection();
                PreparedStatement statement = connection.prepareStatement("update clientProject set projectName=?,	prClient=?,	prStartDate=?,	prendDate=?,	prRate=?,	prPriority=?,	prLeader=?,	prdesc=?  where ProjectCd=? ");) {
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
