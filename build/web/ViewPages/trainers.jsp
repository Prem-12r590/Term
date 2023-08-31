<%-- 
    Document   : trainers
    Created on : May 25, 2023, 2:54:21 PM
    Author     : VIVEKJHA
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="dao.TrainerDao"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>﻿<!DOCTYPE html>
<html lang="en" data-layout="vertical" data-topbar="light" data-sidebar="dark" data-sidebar-size="lg" data-sidebar-image="none">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0">
        <meta name="description" content="Smarthr - Bootstrap Admin Template">
        <meta name="keywords" content="admin, estimates, bootstrap, business, corporate, creative, management, minimal, modern, accounts, invoice, html5, responsive, CRM, Projects">
        <meta name="author" content="Dreamguys - Bootstrap Admin Template">
        <meta name="robots" content="noindex, nofollow">
        <title>Trainers - HRMS admin template</title>

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
        
          <style>
            
            tr th{
                
                text-align: center;
            }
            
            
            tr td{
                
                text-align: center;
            }
        </style>
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
                                <h3 class="page-title">Trainers</h3>
                                <ul class="breadcrumb">
                                    <li class="breadcrumb-item"><a href="admin-dashboard.html">Dashboard</a></li>
                                    <li class="breadcrumb-item active">Trainers</li>
                                </ul>
                            </div>
                            <div class="col-auto float-end ms-auto">
                                <a href="#" class="btn add-btn" data-bs-toggle="modal" data-bs-target="#add_trainer"><i class="fa fa-plus"></i> Add New</a>
                            </div>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-md-12">
                            <div class="table-responsive">
                                <table class="table table-striped custom-table mb-0 datatable">
                                    <thead>
                                        <tr>
                                            <th >ID</th>
                                            <th>Name </th>
                                            <th>Contact Number </th>
                                            <th>Email </th>
                                            <th>Description </th>
                                            <th>Status </th>
                                            <th class="text-end">Action</th>
                                        </tr>
                                    </thead>
                                     <%      
                                           String trncd="";
                                            TrainerDao dao=new TrainerDao();
                                            ArrayList<ArrayList<String>> arr=dao.selectAllTrainer();
                                            for(ArrayList<String> d : arr){
                                              trncd=d.get(0);
                                    %>
                                    <tbody>
                                        <tr>
                                            <td><%=d.get(0)%></td>
                                            <td>
                                               <%=d.get(1)+" "+ d.get(2)%>
                                            </td>
                                            <td><%=d.get(4)%></td>
                                            <td><%=d.get(3)%></td>
                                            <td><%=d.get(6)%></td>
                                            <td>
                                                <%=d.get(5)%>
                                            </td>
                                            <td class="text-end">
                                                <div class="dropdown dropdown-action">
                                                    <a href="#" class="action-icon dropdown-toggle" data-bs-toggle="dropdown" aria-expanded="false"><i class="material-icons">more_vert</i></a>
                                                    <div class="dropdown-menu dropdown-menu-right">
                                                        <a class="dropdown-item" href="#" data-bs-toggle="modal" data-bs-target="#edit_type" onclick=getmodeldata('<%=d.get(0)%>'); ><i class="fa fa-pencil m-r-5"></i> Edit</a>
                                                        <a class="dropdown-item" href="#" data-bs-toggle="modal" data-bs-target="#delete_type"><i class="fa fa-trash-o m-r-5"></i> Delete</a>
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


                <div id="add_trainer" class="modal custom-modal fade" role="dialog">
                    <div class="modal-dialog modal-dialog-centered" role="document">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title">Add New Trainer</h5>
                                <button type="button" class="close" data-bs-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                            </div>
                            <div class="modal-body">
                                 <form action="../TrainerServlet?action=insert" method="post">
                                    <div class="row">
                                        <div class="col-sm-6">
                                            <div class="form-group">
                                                <label class="col-form-label">First Name <span class="text-danger">*</span></label>
                                                <input class="form-control" type="text" name="TFname">
                                            </div>
                                        </div>
                                        <div class="col-sm-6">
                                            <div class="form-group">
                                                <label class="col-form-label">Last Name</label>
                                                <input class="form-control" type="text" name="Tlname">
                                            </div>
                                        </div>
                                       
                                        <div class="col-sm-6">
                                            <div class="form-group">
                                                <label class="col-form-label">Email <span class="text-danger">*</span></label>
                                                <input class="form-control" type="email" name="Temail">
                                            </div>
                                        </div>
                                        <div class="col-sm-6">
                                            <div class="form-group">
                                                <label class="col-form-label">Phone </label>
                                                <input class="form-control" type="text" name="tphone">
                                            </div>
                                        </div>
                                        <div class="col-sm-6">
                                            <div class="form-group">
                                                <label class="col-form-label">Status</label>
                                                <select class="select" name="tstatus">
                                                    <option value="Active">Active</option>
                                                    <option value="Inactive">Inactive</option>
                                                </select>
                                            </div>
                                        </div>
                                        <div class="col-sm-12">
                                            <div class="form-group">
                                                <label>Description <span class="text-danger">*</span></label>
                                                <textarea class="form-control" rows="4" name="tdesc"></textarea>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="submit-section">
                                        <button type="submit" class="btn btn-primary submit-btn">Submit</button>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>


                <div id="edit_type" class="modal custom-modal fade" role="dialog">
                    <div class="modal-dialog modal-dialog-centered" role="document">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title">Edit Trainer</h5>
                                <button type="button" class="close" data-bs-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                            </div>
                            <div class="modal-body">
                                 <form action="../TrainerServlet?action=update" method="post">
                                     <input type="hidden" name="uptrncd" id="uptrncd">
                                    <div class="row">
                                        <div class="col-sm-6">
                                            <div class="form-group">
                                                <label class="col-form-label">First Name <span class="text-danger">*</span></label>
                                                <input class="form-control" type="text" name="TFname" id="TFname">
                                            </div>
                                        </div>
                                        <div class="col-sm-6">
                                            <div class="form-group">
                                                <label class="col-form-label">Last Name</label>
                                                <input class="form-control" type="text" name="Tlname" id="Tlname">
                                            </div>
                                        </div>
                                       
                                        <div class="col-sm-6">
                                            <div class="form-group">
                                                <label class="col-form-label">Email <span class="text-danger">*</span></label>
                                                <input class="form-control" type="email" name="Temail" id="Temail">
                                            </div>
                                        </div>
                                        <div class="col-sm-6">
                                            <div class="form-group">
                                                <label class="col-form-label">Phone </label>
                                                <input class="form-control" type="text" name="tphone" id="tphone">
                                            </div>
                                        </div>
                                        <div class="col-sm-6">
                                            <div class="form-group">
                                                <label class="col-form-label">Status</label>
                                                <select class="select" name="tstatus" id="tstatus">
                                                    <option value="Active">Active</option>
                                                    <option value="Inactive">Inactive</option>
                                                </select>
                                            </div>
                                        </div>
                                        <div class="col-sm-12">
                                            <div class="form-group">
                                                <label>Description <span class="text-danger">*</span></label>
                                                <textarea class="form-control" rows="4" name="tdesc" id="tdesc"></textarea>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="submit-section">
                                        <button type="submit" class="btn btn-primary submit-btn">Submit</button>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>


                <div class="modal custom-modal fade" id="delete_type" role="dialog">
                    <div class="modal-dialog modal-dialog-centered">
                        <div class="modal-content">
                            <div class="modal-body">
                                <div class="form-header">
                                    <h3>Delete Trainers List</h3>
                                    <p>Are you sure want to delete?</p>
                                </div>
                                <div class="modal-btn delete-action">
                                    <div class="row">
                                        <div class="col-6">
                                            <a href="../TrainerServlet?action=delete&resigncd=<%=trncd%>" class="btn btn-primary continue-btn">Delete</a>
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

        <script data-cfasync="false" src="../../cdn-cgi/scripts/5c5dd728/cloudflare-static/email-decode.min.js"></script><script src="assets/js/jquery-3.6.0.min.js"></script>

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
                                                                   url: '../TrainerServlet?action=search',
                                                                   type: 'POST',
                                                                   data: {'depid': id},
                                                                   success: function (e) {
                                                                      
                                                                       var e1  =e.split("#");
                                                                       document.getElementById("TFname").value = e1[0].trim();
                                                                       document.getElementById("Tlname").value = e1[1].trim();
                                                                       document.getElementById("Temail").value = e1[2].trim();
                                                                       document.getElementById("tphone").value = e1[3].trim();
                                                                       document.getElementById("tstatus").value = e1[4].trim();
                                                                       $("#tstatus").change();
                                                                       document.getElementById("tdesc").value = e1[5].trim();
                                                                       document.getElementById("uptrncd").value = id;
                                                                       
                                                                   }

                                                               })
                                                           }
                                                                </script>
        
    </body>
</html>