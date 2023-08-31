package dao;

import Config.DbConnection;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.TreeMap;

/**
 *
 * @author kuldeep kumar 25/05/2023
 */
public class GetDropDownData {

    DbConnection dbConnection = new DbConnection();

    PreparedStatement ps;
    ResultSet rs;
    String sql = "";

    public ArrayList<String> GetEmpDet(String cd[], int val, String SelIndex) {
        
        
        Connection con = dbConnection.getConnection();
        ArrayList<String> Gcode = new ArrayList<String>();
        
        try {

            if (val == 1) {
                sql = "select isnull((deptName),'') as deptname from department where deptName!=''";
            } 
            else if (val == 2) {
                sql = "select ISNULL((designationName),'') as designation from Designation where rwid!=''";
            } 
            else if (val == 3) {
                sql = "select trainingType from trainingtype";
            } 
            else if (val == 4) {
                sql = "select concat(TfirstName,' ',TlastName) as tn from Trainer";
            } 
            else if (val == 5) {
                sql = "select concat(FirstName,' ',lastName) as ename from Hremployee";
            } 
            else if (val == 6) {
                sql = "select clientcompany from Client";
            } 
           

            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            String sel;
            Gcode.add("<option value=''></option>");
            while (rs.next()) {
                sel = "";
                if (rs.getString(1).equals(SelIndex)) {
                    sel = "selected";
                }
                Gcode.add("<option " + sel + "  value='" + rs.getString(1) + "' >" + rs.getString(1) + "</option>");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return Gcode;
    }
    
    public int getClient() throws SQLException{
    
        int countproject=0;
         Connection con = dbConnection.getConnection();
          sql = "select count(cliencd) as cnt from Client";
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while(rs.next()){
            countproject=rs.getInt(1);
            }
         
            
            return countproject;
    }
    
    
    public int getProjet() throws SQLException{
    
        int countproject=0;
         Connection con = dbConnection.getConnection();
          sql = "select count(ProjectCd) as cnt from clientproject";
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while(rs.next()){
            countproject=rs.getInt(1);
            }
         
            
            return countproject;
    }
    
    public int getEmployee() throws SQLException{
    
        int countproject=0;
         Connection con = dbConnection.getConnection();
          sql = "select count(empcd) as cnt from Hremployee";
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while(rs.next()){
            countproject=rs.getInt(1);
            }
         
            
            return countproject;
    }
    
     public ArrayList< ArrayList<String>> selectAllClient() {
        ArrayList< ArrayList<String>> holidays = new ArrayList< ArrayList<String>>();
        try {
            Connection connection = dbConnection.getConnection();
            ps = connection.prepareStatement("select * from Client");
            rs = ps.executeQuery();
            while (rs.next()) {
                ArrayList< String> Allholidays = new ArrayList<String>();
                Allholidays.add(rs.getString("cliencd"));
                Allholidays.add(rs.getString("FirstName"));
                Allholidays.add(rs.getString("lastname"));
                Allholidays.add(rs.getString("clientUsername"));
                Allholidays.add(rs.getString("clientemail"));
                Allholidays.add(rs.getString("clientpassword"));
                Allholidays.add(rs.getString("clientPhone"));
                Allholidays.add(rs.getString("clientcompany"));
                holidays.add(Allholidays);

            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return holidays;
    }
     
     public ArrayList< ArrayList<String>> selectAllProject() {
        ArrayList< ArrayList<String>> holidays = new ArrayList< ArrayList<String>>();
        try {
            Connection connection = dbConnection.getConnection();
            ps = connection.prepareStatement("select * from clientProject");
            rs = ps.executeQuery();
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
           e.printStackTrace();
        }

        return holidays;
    }
    
    
}
