/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package service;


import dao.ClientProjectDao;
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
@WebServlet(name = "ClientProjectServlet", urlPatterns = {"/ClientProjectServlet"})
public class ClientProjectServlet extends HttpServlet {

    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {

        HttpSession session = request.getSession();
        PrintWriter out = response.getWriter();
        String action = request.getParameter("action");
        String[] arr = {request.getParameter("projectName"), request.getParameter("clprcompany"), request.getParameter("startdate"), request.getParameter("enddate"),request.getParameter("prRt"),request.getParameter("prPriority"),request.getParameter("prleader"),request.getParameter("prdesc")};
        String[] arrUpdate = {request.getParameter("projectName"), request.getParameter("clprcompany"), request.getParameter("startdate"), request.getParameter("enddate"),request.getParameter("prRt"),request.getParameter("prPriority"),request.getParameter("prleader"),request.getParameter("prdesc"), request.getParameter("updateprcd")};

        switch (action) {
            case "insert":
                int flag = new ClientProjectDao().insertproject(arr);
                if (flag > 0) {
                    session.setAttribute("msg", "project-list Add Successfully");
                    response.sendRedirect("ViewPages/project-list.jsp");
                }
                break;
            case "delete":
                boolean deleteflag = new ClientProjectDao().deleteproject(request.getParameter("clprjt"));
                if (deleteflag == true) {
                    session.setAttribute("delmsg", "project-list delete Successfully");
                    response.sendRedirect("ViewPages/project-list.jsp");
                }
                break;
            case "update":
                boolean update = new ClientProjectDao().updateProject(arrUpdate);
                if (update == true) {
                    session.setAttribute("updatemsg", "project-list update Successfully");
                    response.sendRedirect("ViewPages/project-list.jsp");
                }
                break;
            case "search":
                String data = new ClientProjectDao().selectproject(request.getParameter("depid"));
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
            Logger.getLogger(ClientProjectServlet.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(ClientProjectServlet.class.getName()).log(Level.SEVERE, null, ex);
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
