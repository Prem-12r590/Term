<%-- 
    Document   : designations
    Created on : May 11, 2023, 11:18:23 AM
    Author     : VIVEKJHA
--%>

<%@page import="java.util.List"%>
<%@page import="entities.Desigantion"%>
<%@page import="dao.Desigantiondao"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%><!DOCTYPE html>
<html lang="en" data-layout="vertical" data-topbar="light" data-sidebar="dark" data-sidebar-size="lg" data-sidebar-image="none">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0">
        <meta name="description" content="Smarthr - Bootstrap Admin Template">
        <meta name="keywords" content="admin, estimates, bootstrap, business, corporate, creative, management, minimal, modern, accounts, invoice, html5, responsive, CRM, Projects">
        <meta name="author" content="Dreamguys - Bootstrap Admin Template">
        <meta name="robots" content="noindex, nofollow">
        <title>Designations - HRMS admin template</title>

        <link rel="shortcut icon" type="image/x-icon" href="assets/img/favicon.png">

        <link rel="stylesheet" href="assets/css/bootstrap.min.css">

        <link rel="stylesheet" href="assets/plugins/fontawesome/css/fontawesome.min.css">
        <link rel="stylesheet" href="assets/plugins/fontawesome/css/all.min.css">

        <link rel="stylesheet" href="assets/css/line-awesome.min.css">
        <link rel="stylesheet" href="assets/css/material.css">

        <link rel="stylesheet" href="assets/css/font-awesome.min.css">

        <link rel="stylesheet" href="assets/css/line-awesome.min.css">

        <link rel="stylesheet" href="assets/css/select2.min.css">

        <link rel="stylesheet" href="assets/css/dataTables.bootstrap4.min.css">

        <link rel="stylesheet" href="assets/css/style.css">
    </head>
    <body>

        <div class="main-wrapper">

            <%@include file="Header.jsp" %>
            <%@include file="Sidebar.jsp" %>


            


            <div class="page-wrapper">

                <div class="content container-fluid">

                    <div class="page-header">
                        <div class="row align-items-center">
                            <div class="col">
                                <h3 class="page-title">Designations</h3>
                                <ul class="breadcrumb">
                                    <li class="breadcrumb-item"><a href="admin-dashboard.jsp">Dashboard</a></li>
                                    <li class="breadcrumb-item active">Designations</li>
                                </ul>
                            </div>
                            <div class="col-auto float-end ms-auto">
                                <a href="#" class="btn add-btn" data-bs-toggle="modal" data-bs-target="#add_designation"><i class="fa fa-plus"></i> Add Designation</a>
                            </div>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-md-12">
                            <div class="table-responsive">
                                <table class="table table-striped custom-table mb-0 datatable">
                                    <thead>
                                        <tr>
                                            <th >#</th>
                                            <th>Designation </th>
                                            <th>Department </th>
                                            <th class="text-end">Action</th>
                                        </tr>
                                    </thead>
                                     <%  String deptid = "";
                                        Desigantiondao depdao = new Desigantiondao();
                                        List<Desigantion> desigantion = depdao.selectAllDesignation();
                                        for (Desigantion d : desigantion) {
                                            deptid = d.getDesignationId();

                                    %>
                                    <tbody>
                                        <tr>
                                            <td><%= d.getDesignationId()%></td>
                                            <td><%= d.getDesignation()%></td>
                                            <td><%= d.getDepartment()%></td>
                                            <td class="text-end">
                                                <div class="dropdown dropdown-action">
                                                    <a href="#" class="action-icon dropdown-toggle" data-bs-toggle="dropdown" aria-expanded="false"><i class="material-icons">more_vert</i></a>
                                                    <div class="dropdown-menu dropdown-menu-right">
                                                        <a class="dropdown-item" href="#" data-bs-toggle="modal" data-bs-target="#edit_designation"onclick=getmodeldata('<%=d.getDesignationId()%>');><i class="fa fa-pencil m-r-5"></i> Edit</a>
                                                        <a class="dropdown-item" href="#" data-bs-toggle="modal" data-bs-target="#delete_designation"><i class="fa fa-trash-o m-r-5"></i> Delete</a>
                                                    </div>
                                                </div>
                                            </td>
                                        </tr>
                                        
                                    </tbody>
                                        <%}%>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>


                <div id="add_designation" class="modal custom-modal fade" role="dialog">
                    <div class="modal-dialog modal-dialog-centered" role="document">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title">Add Designation</h5>
                                <button type="button" class="close" data-bs-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                            </div>
                            <div class="modal-body">
                                <form action="../DesignationServlet?action=insert" method="post">
                                    <div class="form-group">
                                        <label>Designation Name <span class="text-danger">*</span></label>
                                        <input class="form-control" type="text" name="designation" id="designation">
                                    </div>
                                    <div class="form-group">
                                        <label>Department <span class="text-danger">*</span></label>
                                        <select class="select" id="department" name="department">
                                            <option value="Web Development">Web Development</option>
                                            <option value="IT Management">IT Management</option>
                                            <option value="Marketing"> Marketing</option>
                                        </select>
                                    </div>
                                    <div class="submit-section">
                                        <button class="btn btn-primary submit-btn">Submit</button>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>


                <div id="edit_designation" class="modal custom-modal fade" role="dialog">
                    <div class="modal-dialog modal-dialog-centered" role="document">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title">Edit Designation</h5>
                                <button type="button" class="close" data-bs-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                            </div>
                            <div class="modal-body">
                              <form action="../DesignationServlet?action=update" method="post">
                                    <div class="form-group">
                                        <label>Designation Name <span class="text-danger">*</span></label>
                                        <input class="form-control" value="Web Developer" type="text" name="updatedesig" id="updatedesig"> 
                                         <input type="hidden" class="form-control" id="dsgnid" name="dsgnid" value="" type="text">
                                    </div>
                                    <div class="form-group">
                                        <label>Department <span class="text-danger">*</span></label>
                                        <select class="select" name="udpatedepartment" id="udpatedepartment">
                                           <option value="Web Development">Web Development</option>
                                            <option value="IT Management">IT Management</option>
                                            <option value="Marketing"> Marketing</option>
                                        </select>
                                    </div>
                                    <div class="submit-section">
                                        <button type="submit"class="btn btn-primary submit-btn">Save</button>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>


                <div class="modal custom-modal fade" id="delete_designation" role="dialog">
                    <div class="modal-dialog modal-dialog-centered">
                        <div class="modal-content">
                            <div class="modal-body">
                                <div class="form-header">
                                    <h3>Delete Designation</h3>
                                    <p>Are you sure want to delete?</p>
                                </div>
                                <div class="modal-btn delete-action">
                                    <div class="row">
                                        <div class="col-6">
                                            <a href="../DesignationServlet?action=delete&depid=<%=deptid%>"  class="btn btn-primary continue-btn">Delete</a>
                                        </div>
                                        <div class="col-6">
                                            <a href="javascript:void(0);" data-bs-dismiss="modal" class="btn btn-primary cancel-btn">Cancel</a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

            </div>

        </div>
        <%@include file="Customization.jsp" %>

        <script src="assets/js/jquery-3.6.0.min.js"></script>

        <script src="assets/js/bootstrap.bundle.min.js"></script>

        <script src="assets/js/jquery.slimscroll.min.js"></script>

        <script src="assets/js/select2.min.js"></script>

        <script src="assets/js/jquery.dataTables.min.js"></script>
        <script src="assets/js/dataTables.bootstrap4.min.js"></script>

        <script src="assets/js/layout.js"></script>
        <script src="assets/js/theme-settings.js"></script>
        <script src="assets/js/greedynav.js"></script>

        <script src="assets/js/app.js"></script>
        
          <script>

                                                           function getmodeldata(id) {

                                                               $.ajax({
                                                                   url: '../DesignationServlet?action=search',
                                                                   type: 'POST',
                                                                   data: {'depid': id},
                                                                   success: function (e) {
                                                                      
                                                                       var e1  =e.split("#");
                                                                       document.getElementById("updatedesig").value = e1[0].trim();
                                                                       document.getElementById("udpatedepartment").value = e1[1].trim();
                                                                       $("#udpatedepartment").change();
                                                                       document.getElementById("dsgnid").value = id;
                                                                   }

                                                               })
                                                           }

        </script>
    </body>
</html>