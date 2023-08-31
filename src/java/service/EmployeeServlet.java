/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package service;

import dao.EmployeeDao;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author kuldeep kumar
 */
@WebServlet(name = "EmployeeServlet", urlPatterns = {"/EmployeeServlet"})
public class EmployeeServlet extends HttpServlet {

   
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {

        HttpSession session = request.getSession();
        PrintWriter out = response.getWriter();
        String action = request.getParameter("action");
        String[] arr = {request.getParameter("fname"), request.getParameter("lname"), request.getParameter("uname"), request.getParameter("uemail"),request.getParameter("upassword"),request.getParameter("ujoinDate"),request.getParameter("uphone"),request.getParameter("ucompany"),request.getParameter("udepartment"),request.getParameter("udesignation")};
        String[] arrUpdate = {request.getParameter("fname"), request.getParameter("lname"), request.getParameter("uname"), request.getParameter("uemail"),request.getParameter("upassword"),request.getParameter("ujoinDate"),request.getParameter("uphone"),request.getParameter("ucompany"),request.getParameter("udepartment"),request.getParameter("udesignation"), request.getParameter("updateempcd")};

        switch (action) {
            case "insert":
                int flag = new EmployeeDao().insertEmployee(arr);
                if (flag > 0) {
                    session.setAttribute("msg", "employees-list Add Successfully");
                    response.sendRedirect("ViewPages/employees-list.jsp");
                }
                break;
            case "delete":
                boolean deleteflag = new EmployeeDao().deletEMployee(request.getParameter("empcd"));
                if (deleteflag == true) {
                    session.setAttribute("delmsg", "employees-list delete Successfully");
                    response.sendRedirect("ViewPages/employees-list.jsp");
                }
                break;
            case "update":
                boolean update = new EmployeeDao().updateEmployee(arrUpdate);
                if (update == true) {
                    session.setAttribute("updatemsg", "employees-list update Successfully");
                    response.sendRedirect("ViewPages/employees-list.jsp");
                }
                break;
            case "search":
                String data = new EmployeeDao().selectEmployee(request.getParameter("depid"));
                out.println(data);
                break;
            case "searchViaValue":
                String data1 = new EmployeeDao().selectEMployeeViaValue(request.getParameter("depid"),request.getParameter("depid"),request.getParameter("depid"));
                out.println(data1);
                break;
            default:
                System.out.println("yes this default");
                break;

        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(EmployeeServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(EmployeeServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
