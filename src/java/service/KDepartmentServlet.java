/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package service;

import dao.DepartmentDao;
import entities.Department;
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
@WebServlet(name = "KDepartmentServlet", urlPatterns = {"/KDepartmentServlet"})
public class KDepartmentServlet extends HttpServlet {
    
    private DepartmentDao departmentDao;
   
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {
        PrintWriter out = response.getWriter();
        HttpSession session=request.getSession();
        Department dpModal = new Department();
         Department dpModalupdate = new Department();
        String action = request.getParameter("action");
        dpModal.setName(request.getParameter("department"));
        
        //update department
        dpModalupdate.setName(request.getParameter("deptupdate"));
        dpModalupdate.setDepid(request.getParameter("deptIDupdate"));
        
        System.out.println(dpModal);
        
        switch(action){
            case "insert": 
                        int flag=new DepartmentDao().insertDepartment(dpModal);
                        if(flag>0){session.setAttribute("msg", "Department Add Successfully");   response.sendRedirect("ViewPages/departments.jsp");}
                        break;
            case "delete": 
                      boolean deleteflag=new DepartmentDao().deleteDepartment(request.getParameter("depid"));
                      if(deleteflag==true){
                      session.setAttribute("delmsg", "Department delete Successfully");   response.sendRedirect("ViewPages/departments.jsp");
                      }
                        break;
            case "update":             
                       boolean update= new DepartmentDao().updateDepartment(dpModalupdate);
                        if(update==true){
                         session.setAttribute("updatemsg", "Department update Successfully");   response.sendRedirect("ViewPages/departments.jsp");
                      }
                        break;
            case "search":
                       String data = new DepartmentDao().selectDepartment(request.getParameter("depid"));
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
            Logger.getLogger(KDepartmentServlet.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(KDepartmentServlet.class.getName()).log(Level.SEVERE, null, ex);
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
