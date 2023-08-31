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
 * @author KULDEEP KUMAR
 */
public class SalaryDAO {

    DbConnection dbConnection = new DbConnection();

    private PreparedStatement pst;
    private ResultSet rs;

//    employeeName	NetSalary	Ebasic	Eda	hra	conveyance	allowance	medicalAllowance
//    otherEarning	Etds	esi	pf	leave	proTax	labourwelfair	otherLoss
    public int insertSalary(String[] arr) throws SQLException {
        String salaryid = "";
        int flag = 0;
        Connection connection = dbConnection.getConnection();
        try {

            String otid = "select concat('EMPS',REPLICATE(0,3-len(isNULL(max(cast(convert(varchar,substring(salaryid,5,7)) as int)),0)+1)),\n"
                    + "isNULL(max(cast(convert(varchar,substring(salaryid,5,7)) as int)),0)+1) as cd from EmployeSalary";
            PreparedStatement pst = connection.prepareStatement(otid);
            rs = pst.executeQuery();
            while (rs.next()) {
                salaryid = rs.getString(1);
            }

            String sql = "insert into EmployeSalary (SalaryID,employeeName,NetSalary,Ebasic,Eda,hra,conveyance,allowance,medicalAllowance,otherEarning,Etds,esi,pf,leave,proTax,labourwelfair,otherLoss) values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
            pst = connection.prepareStatement(sql);
            pst.setString(1, salaryid);
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
            pst.setString(15, arr[13]);
            pst.setString(16, arr[14]);
            pst.setString(17, arr[15]);
            flag = pst.executeUpdate();

        } catch (SQLException e) {
            printSQLException(e);
        } finally {
            connection.commit();
            connection.close();
        }
        return flag;
    }

    public String selectSalary(String id) throws SQLException {

        Connection connection = dbConnection.getConnection();
        String result = "";
        try {

            pst = connection.prepareStatement("select * from EmployeSalary where SalaryID=?");
            pst.setString(1, id);
            rs = pst.executeQuery();
            while (rs.next()) {

                String SalaryID = rs.getString("SalaryID");
                String employeeName = rs.getString("employeeName");
                String NetSalary = rs.getString("NetSalary");
                String Ebasic = rs.getString("Ebasic");
                String Eda = rs.getString("Eda");
                String hra = rs.getString("hra");
                String conveyance = rs.getString("conveyance");
                String allowance = rs.getString("allowance");
                String medicalAllowance = rs.getString("medicalAllowance");
                String otherEarning = rs.getString("otherEarning");
                String Etds = rs.getString("Etds");
                String esi = rs.getString("esi");
                String pf = rs.getString("pf");
                String leave = rs.getString("leave");
                String proTax = rs.getString("proTax");
                String labourwelfair = rs.getString("labourwelfair");
                String otherLoss = rs.getString("otherLoss");
                result = employeeName + "#" + NetSalary + "#" + Ebasic + "#" + Eda + "#" + hra + "#" + conveyance + "#" + allowance + "#" + medicalAllowance + "#" + otherEarning + "#" + Etds + "#" + esi + "#" + pf + "#" + leave + "#" + proTax + "#" + labourwelfair + "#" + otherLoss;

            }
        } catch (SQLException e) {
            printSQLException(e);
        } finally {
            connection.close();
        }
        return result;
    }

    public ArrayList< ArrayList<String>> selectAllSalary() {
        ArrayList< ArrayList<String>> holidays = new ArrayList< ArrayList<String>>();
        try {
            Connection connection = dbConnection.getConnection();
            pst = connection.prepareStatement("select * from EmployeSalary ");
            rs = pst.executeQuery();
            int earning = 0;
            int loss = 0;
            int total = 0;

            while (rs.next()) {
                ArrayList< String> Allholidays = new ArrayList<String>();

                earning = Integer.parseInt(rs.getString("NetSalary")) + Integer.parseInt(rs.getString("Ebasic")) + Integer.parseInt(rs.getString("Eda")) + Integer.parseInt(rs.getString("hra")) + Integer.parseInt(rs.getString("conveyance")) + Integer.parseInt(rs.getString("allowance")) + Integer.parseInt(rs.getString("medicalAllowance")) + Integer.parseInt(rs.getString("otherEarning"));
                loss = Integer.parseInt(rs.getString("Etds")) + Integer.parseInt(rs.getString("esi")) + Integer.parseInt(rs.getString("pf")) + Integer.parseInt(rs.getString("leave")) + Integer.parseInt(rs.getString("proTax")) + Integer.parseInt(rs.getString("labourwelfair")) + Integer.parseInt(rs.getString("otherLoss"));
                total = (earning - loss);
                String result = Integer.toString(total);
                Allholidays.add(rs.getString("SalaryID"));
                Allholidays.add(result);
                holidays.add(Allholidays);

            }

        } catch (SQLException e) {
            printSQLException(e);
        }

        return holidays;
    }

    public boolean deletesalary(String id) throws SQLException {
        boolean rowDeleted;
        try (Connection connection = dbConnection.getConnection();
                PreparedStatement statement = connection.prepareStatement("delete from EmployeSalary where SalaryID=?");) {
            statement.setString(1, id);
            rowDeleted = statement.executeUpdate() > 0;
        }
        return rowDeleted;
    }

    public boolean updatesalary(String[] arr) throws SQLException {
        boolean rowUpdated = false;

        try (Connection connection = dbConnection.getConnection();
                PreparedStatement statement = connection.prepareStatement("update EmployeSalary set employeeName=?,NetSalary=?,Ebasic=?,Eda=?,hra=?,conveyance=?,allowance=?,medicalAllowance=?,otherEarning=?,Etds=?,esi=?,pf=?,leave=?,proTax=?,labourwelfair=?,otherLoss=? where SalaryID=? ");) {
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
            statement.setString(15, arr[14]);
            statement.setString(16, arr[15]);
            statement.setString(17, arr[16]);
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
