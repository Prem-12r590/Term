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
public class JobsDao {

    DbConnection dbConnection = new DbConnection();
    private PreparedStatement pst;
    private ResultSet rs;

    public int insertjob(String[] arr) throws SQLException {

//        rwid	JOBCd	jobTitle	jobdept	joblocation	NumOfVacancy	jobExperience	age	salaryfrom	salaryTo	jobType	jobsts	jobstartdt	jobexpdt	jobdesc
        String jobcd = "";
        int flag = 0;
        Connection connection = dbConnection.getConnection();
        try {

            String sql1 = "select concat('JOBN',REPLICATE(0,3-len(isNULL(max(cast(convert(varchar,substring(JOBCd,5,7)) as int)),0)+1)),\n"
                    + "isNULL(max(cast(convert(varchar,substring(JOBCd,5,7)) as int)),0)+1) as cd from jobs";
            PreparedStatement pst = connection.prepareStatement(sql1);
            rs = pst.executeQuery();
            while (rs.next()) {
                jobcd = rs.getString(1);
            }

            String sql = "insert into jobs (JOBCd,jobTitle,jobdept,joblocation,NumOfVacancy,jobExperience,age,salaryfrom,salaryTo,jobType,jobsts,jobstartdt,jobexpdt,jobdesc) values(?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
            pst = connection.prepareStatement(sql);
            pst.setString(1, jobcd);
            pst.setString(2, arr[0]);
            pst.setString(3, arr[1]);
            pst.setString(4, arr[2]);
            pst.setString(5, arr[3]);
            pst.setString(6, arr[4]);
            pst.setString(7, arr[5]);
            pst.setString(8, arr[6]);
            pst.setString(9, arr[7]);
            pst.setString(10, arr[8]);
            pst.setString(11, arr[9]);
            pst.setString(12, arr[10]);
            pst.setString(13, arr[11]);
            pst.setString(14, arr[12]);
            flag = pst.executeUpdate();

        } catch (SQLException e) {
            printSQLException(e);
        } finally {
            connection.commit();
            connection.close();
        }
        return flag;
    }

    public String selectJOb(String id) throws SQLException {

        Connection connection = dbConnection.getConnection();
        String result = "";
        try {

            pst = connection.prepareStatement("select * from jobs where JOBCd=?");
            pst.setString(1, id);
            rs = pst.executeQuery();
            while (rs.next()) {

                String jobTitle = rs.getString("jobTitle");
                String jobdept = rs.getString("jobdept");
                String joblocation = rs.getString("joblocation");
                String NumOfVacancy = rs.getString("NumOfVacancy");
                String jobExperience = rs.getString("jobExperience");
                String age = rs.getString("age");
                String salaryfrom = rs.getString("salaryfrom");
                String salaryTo = rs.getString("salaryTo");
                String jobType = rs.getString("jobType");
                String jobsts = rs.getString("jobsts");
                String jobstartdt = rs.getString("jobstartdt");
                String jobexpdt = rs.getString("jobexpdt");
                String jobdesc = rs.getString("jobdesc");

                result = jobTitle + "#" + jobdept + "#" + joblocation + "#" + NumOfVacancy + "#" + jobExperience + "#" + age + "#" + salaryfrom + "#" + salaryTo + "#" + jobType + "#" + jobsts + "#" + jobstartdt + "#" + jobexpdt + "#" + jobdesc;

            }
        } catch (SQLException e) {
            printSQLException(e);
        } finally {
            connection.close();
        }
        return result;
    }

    public ArrayList< ArrayList<String>> selectAllJob() {
        ArrayList< ArrayList<String>> holidays = new ArrayList< ArrayList<String>>();
        try {
            Connection connection = dbConnection.getConnection();
            pst = connection.prepareStatement("select * from jobs");
            rs = pst.executeQuery();
            while (rs.next()) {
                ArrayList< String> Allholidays = new ArrayList<String>();

                Allholidays.add(rs.getString("JOBCd"));
                Allholidays.add(rs.getString("jobTitle"));
                Allholidays.add(rs.getString("jobdept"));
                Allholidays.add(rs.getString("joblocation"));
                Allholidays.add(rs.getString("NumOfVacancy"));
                Allholidays.add(rs.getString("jobExperience"));
                Allholidays.add(rs.getString("age"));
                Allholidays.add(rs.getString("salaryfrom"));
                Allholidays.add(rs.getString("salaryTo"));
                Allholidays.add(rs.getString("jobType"));
                Allholidays.add(rs.getString("jobsts"));
                Allholidays.add(rs.getString("jobstartdt"));
                Allholidays.add(rs.getString("jobexpdt"));
                Allholidays.add(rs.getString("jobdesc"));
                holidays.add(Allholidays);

            }

        } catch (SQLException e) {
            printSQLException(e);
        }

        return holidays;
    }

    public boolean deletejob(String id) throws SQLException {
        boolean rowDeleted;
        try (Connection connection = dbConnection.getConnection();
                PreparedStatement statement = connection.prepareStatement("delete from jobs where JOBCd=?");) {
            statement.setString(1, id);
            rowDeleted = statement.executeUpdate() > 0;
        }
        return rowDeleted;
    }

    public boolean updatejob(String[] arr) throws SQLException {
        boolean rowUpdated;
        try (Connection connection = dbConnection.getConnection();
                PreparedStatement statement = connection.prepareStatement("update jobs set jobTitle=?,	jobdept=?,	joblocation=?,	NumOfVacancy=?,	jobExperience=?,	age=?,	salaryfrom=?,	salaryTo=?,	jobType=?,	jobsts=?,	jobstartdt=?,	jobexpdt=?,	jobdesc=? where JOBCd=? ");) {
            statement.setString(1, arr[0]);
            statement.setString(2, arr[1]);
            statement.setString(3, arr[2]);
            statement.setString(4, arr[3]);
            statement.setString(5, arr[4]);
            statement.setString(6, arr[5]);
            statement.setString(7, arr[6]);
            statement.setString(8, arr[7]);
            statement.setString(9, arr[8]);
            statement.setString(10, arr[9]);
            statement.setString(11, arr[10]);
            statement.setString(12, arr[11]);
            statement.setString(13, arr[12]);
            statement.setString(14, arr[13]);
            

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
