package dao;

import Config.DbConnection;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import entities.Department;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class DepartmentDao {

    DbConnection dbConnection = new DbConnection();
    private PreparedStatement pst;
    private ResultSet rs;

    private static final String INSERT_DEPARTMENTS_SQL = "INSERT INTO department" + "  (depid,deptName) VALUES " + " (?,?);";
    private static final String SELECT_DEPARTMENT_BY_ID = "select depid,deptName from department where depid =?";
    private static final String SELECT_ALL_DEPARTMENTS = "select * from department";
    private static final String DELETE_DEPARTMENTS_SQL = "delete from department where depid = ?;";
    private static final String UPDATE_DEPARTMENTS_SQL = "update department set deptName = ? where depid = ?;";

    public int insertDepartment(Department department) throws SQLException {
        String departmentid = "";
        int flag = 0;
        Connection connection = dbConnection.getConnection();
        try {

            String sql = "select concat('DEPT',REPLICATE(0,3-len(isNULL(max(cast(convert(varchar,substring(depid,5,7)) as int)),0)+1)),\n"
                    + "isNULL(max(cast(convert(varchar,substring(depid,5,7)) as int)),0)+1) as cd from department";
            PreparedStatement pst = connection.prepareStatement(sql);
            rs = pst.executeQuery();
            while (rs.next()) {
                departmentid = rs.getString(1);
            }
            pst = connection.prepareStatement(INSERT_DEPARTMENTS_SQL);
            pst.setString(1, departmentid);
            pst.setString(2, department.getName());
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
        String depName = "";
        try {

            pst = connection.prepareStatement(SELECT_DEPARTMENT_BY_ID);
            pst.setString(1, id);
            rs = pst.executeQuery();
            while (rs.next()) {
                depName = rs.getString("deptName");

            }
        } catch (SQLException e) {
            printSQLException(e);
        } finally {
            connection.close();
        }
        return depName;
    }

    public List< Department> selectAllDepartments() {
        List< Department> departments = new ArrayList<>();
        try {
            Connection connection = dbConnection.getConnection();
            pst = connection.prepareStatement(SELECT_ALL_DEPARTMENTS);
            rs = pst.executeQuery();
            while (rs.next()) {
                String depid = rs.getString("depid");
                String depName = rs.getString("deptName");
                Department department = new Department(depid, depName);
                departments.add(department);

            }

        } catch (SQLException e) {
            printSQLException(e);
        }
        return departments;
    }

    public boolean deleteDepartment(String id) throws SQLException {
        boolean rowDeleted;
        try (Connection connection = dbConnection.getConnection();
                PreparedStatement statement = connection.prepareStatement(DELETE_DEPARTMENTS_SQL);) {
            statement.setString(1, id);
            rowDeleted = statement.executeUpdate() > 0;
        }
        return rowDeleted;
    }

    public boolean updateDepartment(Department department) throws SQLException {
        boolean rowUpdated;
        try (Connection connection = dbConnection.getConnection();
                PreparedStatement statement = connection.prepareStatement(UPDATE_DEPARTMENTS_SQL);) {
            statement.setString(1, department.getName());
            statement.setString(2, department.getDepid());

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
