/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package service;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import dao.Desigantiondao;
import entities.Desigantion;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author VIVEKJHA
 */
@WebServlet(name = "DesignationServlet", urlPatterns = {"/DesignationServlet"})
public class DesignationServlet extends HttpServlet {

    private Desigantiondao desigantiondao;

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {
        PrintWriter out = response.getWriter();

        HttpSession session = request.getSession();
        Desigantion dpModal = new Desigantion();
        Desigantion dpModalupdate = new Desigantion();
        String action = request.getParameter("action");
        dpModal.setDesignation(request.getParameter("designation"));
        dpModal.setDepartment(request.getParameter("department"));

        //update department
        dpModalupdate.setDesignation(request.getParameter("updatedesig"));
        dpModalupdate.setDepartment(request.getParameter("udpatedepartment"));
        dpModalupdate.setDesignationId(request.getParameter("dsgnid"));

        switch (action) {
            case "insert":
                int flag = new Desigantiondao().insertDesiganation(dpModal);
                if (flag > 0) {
                    session.setAttribute("msg", "Department Add Successfully");
                    response.sendRedirect("ViewPages/designations.jsp");
                }
                break;
            case "delete":
                boolean deleteflag = new Desigantiondao().deleteDepartment(request.getParameter("depid"));
                if (deleteflag == true) {
                    session.setAttribute("delmsg", "Department delete Successfully");
                    response.sendRedirect("ViewPages/designations.jsp");
                }
                break;
            case "update":
                boolean update = new Desigantiondao().updateDepartment(dpModalupdate);
                if (update == true) {
                    session.setAttribute("updatemsg", "Department update Successfully");
                    response.sendRedirect("ViewPages/designations.jsp");
                }
                break;
            case "search":
                String data = new Desigantiondao().selectDepartment(request.getParameter("depid"));
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
            Logger.getLogger(DesignationServlet.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(DesignationServlet.class.getName()).log(Level.SEVERE, null, ex);
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
