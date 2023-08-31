/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package service;


import dao.ResinationDao;
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
@WebServlet(name = "ResignationServlet", urlPatterns = {"/ResignationServlet"})
public class ResignationServlet extends HttpServlet {

    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {

        HttpSession session = request.getSession();
        PrintWriter out = response.getWriter();
        String action = request.getParameter("action");
        String[] arr = {request.getParameter("REmployee"), request.getParameter("Noticedate"), request.getParameter("ResignDate"), request.getParameter("ResignReason")};
        String[] arrUpdate = {request.getParameter("updateREmployee"), request.getParameter("updateNoticedate"), request.getParameter("updateResignDate"), request.getParameter("updateResignReason"), request.getParameter("UpdateResigncd")};

        switch (action) {
            case "insert":
                int flag = new ResinationDao().insertResign(arr);
                if (flag > 0) {
                    session.setAttribute("msg", "resignation Add Successfully");
                    response.sendRedirect("ViewPages/resignation.jsp");
                }
                break;
            case "delete":
                boolean deleteflag = new ResinationDao().deleteResign(request.getParameter("resigncd"));
                if (deleteflag == true) {
                    session.setAttribute("delmsg", "resignation delete Successfully");
                    response.sendRedirect("ViewPages/resignation.jsp");
                }
                break;
            case "update":
                boolean update = new ResinationDao().updateResign(arrUpdate);
                if (update == true) {
                    session.setAttribute("updatemsg", "resignation update Successfully");
                    response.sendRedirect("ViewPages/resignation.jsp");
                }
                break;
            case "search":
                String data = new ResinationDao().selectResign(request.getParameter("depid"));
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
            Logger.getLogger(ResignationServlet.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(ResignationServlet.class.getName()).log(Level.SEVERE, null, ex);
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
