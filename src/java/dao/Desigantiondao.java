/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import Config.DbConnection;
import entities.Desigantion;
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
public class Desigantiondao {

    DbConnection dbConnection = new DbConnection();
    private PreparedStatement pst;
    private ResultSet rs;

    public int insertDesiganation(Desigantion desigantion) throws SQLException {
        String dsgnid = "";
        int flag = 0;
        Connection connection = dbConnection.getConnection();
        try {

            String sql = "select concat('DSGN',REPLICATE(0,3-len(isNULL(max(cast(convert(varchar,substring(DSGNId,5,7)) as int)),0)+1)),\n"
                    + "isNULL(max(cast(convert(varchar,substring(DSGNId,5,7)) as int)),0)+1) as cd from Designation";
            PreparedStatement pst = connection.prepareStatement(sql);
            rs = pst.executeQuery();
            while (rs.next()) {
                dsgnid = rs.getString(1);
            }

            String INSERT_DEPARTMENTS_SQL = "insert into Designation(DSGNId ,designationName,department) values(?,?,?) ";
            pst = connection.prepareStatement(INSERT_DEPARTMENTS_SQL);
            pst.setString(1, dsgnid);
            pst.setString(2, desigantion.getDesignation());
            pst.setString(3, desigantion.getDepartment());
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
            String SELECT_DEPARTMENT_BY_ID = "select * from Designation where DSGNId=?";
            pst = connection.prepareStatement(SELECT_DEPARTMENT_BY_ID);
            pst.setString(1, id);
            rs = pst.executeQuery();
            while (rs.next()) {

                String designation = rs.getString("designationName");
                String depatment = rs.getString("department");
                result = designation + "#" + depatment;
//              arr.add(designation);
//              arr.add(depatment);

            }
        } catch (SQLException e) {
            printSQLException(e);
        } finally {
            connection.close();
        }
        return result;
    }

    public List< Desigantion> selectAllDesignation() {
        List< Desigantion> designation = new ArrayList<>();
        try {
            Connection connection = dbConnection.getConnection();
            String SELECT_ALL_DEPARTMENTS = "select * from Designation";
            pst = connection.prepareStatement(SELECT_ALL_DEPARTMENTS);
            rs = pst.executeQuery();
            while (rs.next()) {
                String dsgnid = rs.getString("DSGNId");
                String designation1 = rs.getString("designationName");
                String department = rs.getString("department");
                Desigantion department12 = new Desigantion(dsgnid, designation1, department);
                designation.add(department12);

            }

        } catch (SQLException e) {
            printSQLException(e);
        }
        return designation;
    }

    public boolean deleteDepartment(String id) throws SQLException {
        boolean rowDeleted;
        String DELETE_DEPARTMENTS_SQL = "delete from designation where DSGNId=? ";
        try (Connection connection = dbConnection.getConnection();
                PreparedStatement statement = connection.prepareStatement(DELETE_DEPARTMENTS_SQL);) {
            statement.setString(1, id);
            rowDeleted = statement.executeUpdate() > 0;
        }
        return rowDeleted;
    }

    public boolean updateDepartment(Desigantion desigantion) throws SQLException {
        boolean rowUpdated;
        String UPDATE_DEPARTMENTS_SQL = "update designation set designationName = ?  ,department=? where DSGNId = ?; ";
        try (Connection connection = dbConnection.getConnection();
                PreparedStatement statement = connection.prepareStatement(UPDATE_DEPARTMENTS_SQL);) {
            statement.setString(1, desigantion.getDesignation());
            statement.setString(2, desigantion.getDepartment());
            statement.setString(3, desigantion.getDesignationId());
            System.out.println(desigantion.getDepartment());

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
