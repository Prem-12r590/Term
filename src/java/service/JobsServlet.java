/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package service;

import dao.JobsDao;
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
@WebServlet(name = "JobsServlet", urlPatterns = {"/JobsServlet"})
public class JobsServlet extends HttpServlet {

    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {

        HttpSession session = request.getSession();
        PrintWriter out = response.getWriter();
        String action = request.getParameter("action");
        String[] arr = {request.getParameter("jobtitle"), request.getParameter("jobdept"), request.getParameter("joblocation"), request.getParameter("NoOFVacancy"),request.getParameter("jobexp"),request.getParameter("ageForJob"),request.getParameter("salaryFrom"),request.getParameter("salaryTo"),request.getParameter("jobtype"),request.getParameter("jobstatus"),request.getParameter("jobstartdt"),request.getParameter("jobexpdt"),request.getParameter("jobdesc")};
        String[] arrUpdate = {request.getParameter("jobtitle"), request.getParameter("jobdept"), request.getParameter("joblocation"), request.getParameter("NoOFVacancy"),request.getParameter("jobexp"),request.getParameter("ageForJob"),request.getParameter("salaryFrom"),request.getParameter("salaryTo"),request.getParameter("jobtype"),request.getParameter("jobstatus"),request.getParameter("jobstartdt"),request.getParameter("jobexpdt"),request.getParameter("jobdesc"), request.getParameter("updatejobcd")};

        switch (action) {
            case "insert":
                int flag = new JobsDao().insertjob(arr);
                if (flag > 0) {
                    session.setAttribute("msg", "jobs Add Successfully");
                    response.sendRedirect("ViewPages/jobs.jsp");
                }
                break;
            case "delete":
                boolean deleteflag = new JobsDao().deletejob(request.getParameter("resigncd"));
                if (deleteflag == true) {
                    session.setAttribute("delmsg", "jobs delete Successfully");
                    response.sendRedirect("ViewPages/jobs.jsp");
                }
                break;
            case "update":
                boolean update = new JobsDao().updatejob(arrUpdate);
                if (update == true) {
                    session.setAttribute("updatemsg", "jobs update Successfully");
                    response.sendRedirect("ViewPages/jobs.jsp");
                }
                break;
            case "search":
                String data = new JobsDao().selectJOb(request.getParameter("depid"));
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
            Logger.getLogger(JobsServlet.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(JobsServlet.class.getName()).log(Level.SEVERE, null, ex);
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
