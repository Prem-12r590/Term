/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package service;

import dao.ClientDao;
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
@WebServlet(name = "ClientServlet", urlPatterns = {"/ClientServlet"})
public class ClientServlet extends HttpServlet {

  
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {

        HttpSession session = request.getSession();
        PrintWriter out = response.getWriter();
        String action = request.getParameter("action");
        String[] arr = {request.getParameter("fname"), request.getParameter("lname"), request.getParameter("userName"), request.getParameter("clientEmail"),request.getParameter("clientpass"),request.getParameter("clientPhone"),request.getParameter("clientCompany")};
        String[] arrUpdate = {request.getParameter("fname"), request.getParameter("lname"), request.getParameter("userName"), request.getParameter("clientEmail"),request.getParameter("clientpass"),request.getParameter("clientPhone"),request.getParameter("clientCompany"), request.getParameter("clntid")};
        System.out.println(" request.getParameter(\"updateClientId\") request.getParameter(\"updateClientId\")         ="+ request.getParameter("updateClientId"));
        switch (action) {
            case "insert":
                int flag = new ClientDao().inserClient(arr);
                if (flag > 0) {
                    session.setAttribute("msg", "clients-list Add Successfully");
                    response.sendRedirect("ViewPages/clients-list.jsp");
                }
                break;
            case "delete":
                boolean deleteflag = new ClientDao().deleteClient(request.getParameter("clientcd"));
                if (deleteflag == true) {
                    session.setAttribute("delmsg", "clients-list delete Successfully");
                    response.sendRedirect("ViewPages/clients-list.jsp");
                }
                break;
            case "update":
                boolean update = new ClientDao().updateClient(arrUpdate);
                if (update == true) {
                    session.setAttribute("updatemsg", "clients-list update Successfully");
                    response.sendRedirect("ViewPages/clients-list.jsp");
                }
                break;
            case "search":
                String data = new ClientDao().selectClient(request.getParameter("depid"));
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
            Logger.getLogger(ClientServlet.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(ClientServlet.class.getName()).log(Level.SEVERE, null, ex);
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
