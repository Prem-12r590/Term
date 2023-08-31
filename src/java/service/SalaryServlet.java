/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package service;

import dao.Holiday;
import dao.SalaryDAO;
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
 * @author VIVEKJHA
 */
@WebServlet(name = "SalaryServlet", urlPatterns = {"/SalaryServlet"})
public class SalaryServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {

        HttpSession session = request.getSession();
        PrintWriter out = response.getWriter();
        String action = request.getParameter("action");
        String[] arr = {request.getParameter("employee"), request.getParameter("netsalary"),
                        request.getParameter("basicsalary"), request.getParameter("basicDa"),
                        request.getParameter("Hra"), request.getParameter("conveyance"),
                        request.getParameter("earingallowance"), request.getParameter("medicalallowance"),
                        request.getParameter("otherEarning"), request.getParameter("TDS"),
                        request.getParameter("ESI"), request.getParameter("PF"),
                        request.getParameter("Leave"), request.getParameter("PRoTax"),
                        request.getParameter("welfare"), request.getParameter("otherLoss"),};
        
        String[] arrUpdate = {request.getParameter("updateemployee"), request.getParameter("updatenetsalary"),
                            request.getParameter("updatebasicsalary"), request.getParameter("updatebasicDa"),
                            request.getParameter("updateHra"), request.getParameter("updateconveyance"),
                            request.getParameter("updateearingallowance"), request.getParameter("updatemedicalallowance"),
                            request.getParameter("updateotherEarning"), request.getParameter("updateTDS"),
                            request.getParameter("updateESI"), request.getParameter("updatePF"),
                            request.getParameter("updateLeave"), request.getParameter("updatePRoTax"),
                            request.getParameter("updatewelfare"), request.getParameter("updateotherLoss"),request.getParameter("updatesalaryID")};
        

        switch (action) {
            case "insert":
                int flag = new SalaryDAO().insertSalary(arr);
                if (flag > 0) {
                    session.setAttribute("msg", "salary Add Successfully");
                    response.sendRedirect("ViewPages/salary.jsp");
                }
                break;
            case "delete":
                boolean deleteflag = new SalaryDAO().deletesalary(request.getParameter("salaryID"));
                if (deleteflag == true) {
                    session.setAttribute("delmsg", "salary delete Successfully");
                    response.sendRedirect("ViewPages/salary.jsp");
                }
                break;
            case "update":
                boolean update = new SalaryDAO().updatesalary(arrUpdate);
                if (update == true) {
                    session.setAttribute("updatemsg", "salary update Successfully");
                    response.sendRedirect("ViewPages/salary.jsp");
                }
                break;
            case "search":
                String data = new SalaryDAO().selectSalary(request.getParameter("salaryID"));
                out.println(data);
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
            Logger.getLogger(SalaryServlet.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(SalaryServlet.class.getName()).log(Level.SEVERE, null, ex);
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
