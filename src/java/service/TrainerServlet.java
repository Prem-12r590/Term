/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package service;

import dao.TrainerDao;
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
@WebServlet(name = "TrainerServlet", urlPatterns = {"/TrainerServlet"})
public class TrainerServlet extends HttpServlet {

   
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {
        

        HttpSession session = request.getSession();
        PrintWriter out = response.getWriter();
        String action = request.getParameter("action");
        String[] arr = {request.getParameter("TFname"), request.getParameter("Tlname"), request.getParameter("Temail"), request.getParameter("tphone"), request.getParameter("tstatus"), request.getParameter("tdesc")};
        String[] arrUpdate = {request.getParameter("TFname"), request.getParameter("Tlname"), request.getParameter("Temail"), request.getParameter("tphone"), request.getParameter("tstatus"), request.getParameter("tdesc"), request.getParameter("uptrncd")};
        System.out.println("===========--------"+request.getParameter("uptrncd"));
        switch (action) {
            case "insert":
                int flag = new TrainerDao().inserTrainer(arr);
                if (flag > 0) {
                    session.setAttribute("msg", "trainers Add Successfully");
                    response.sendRedirect("ViewPages/trainers.jsp");
                }
                break;
            case "delete":
                boolean deleteflag = new TrainerDao().deletetrainer(request.getParameter("resigncd"));
                if (deleteflag == true) {
                    session.setAttribute("delmsg", "trainers delete Successfully");
                    response.sendRedirect("ViewPages/trainers.jsp");
                }
                break;
            case "update":
                boolean update = new TrainerDao().updatetrainer(arrUpdate);
                if (update == true) {
                    session.setAttribute("updatemsg", "trainers update Successfully");
                    response.sendRedirect("ViewPages/trainers.jsp");
                }
                break;
            case "search":
                String data = new TrainerDao().seletTrainer(request.getParameter("depid"));
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
            Logger.getLogger(TrainerServlet.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(TrainerServlet.class.getName()).log(Level.SEVERE, null, ex);
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
