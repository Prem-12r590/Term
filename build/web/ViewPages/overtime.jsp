<%-- 
    Document   : overtime
    Created on : May 11, 2023, 11:20:26 AM
    Author     : VIVEKJHA
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="dao.OverTimeDao"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%><!DOCTYPE html>
<html lang="en" data-layout="vertical" data-topbar="light" data-sidebar="dark" data-sidebar-size="lg" data-sidebar-image="none">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0">
        <meta name="description" content="Smarthr - Bootstrap Admin Template">
        <meta name="keywords" content="admin, estimates, bootstrap, business, corporate, creative, management, minimal, modern, accounts, invoice, html5, responsive, CRM, Projects">
        <meta name="author" content="Dreamguys - Bootstrap Admin Template">
        <meta name="robots" content="noindex, nofollow">
        <title>Overtime - HRMS admin template</title>

        <link rel="shortcut icon" type="image/x-icon" href="assets/img/favicon.png">

        <link rel="stylesheet" href="assets/css/bootstrap.min.css">

        <link rel="stylesheet" href="assets/plugins/fontawesome/css/fontawesome.min.css">
        <link rel="stylesheet" href="assets/plugins/fontawesome/css/all.min.css">

        <link rel="stylesheet" href="assets/css/line-awesome.min.css">
        <link rel="stylesheet" href="assets/css/material.css">

        <link rel="stylesheet" href="assets/css/font-awesome.min.css">

        <link rel="stylesheet" href="assets/css/line-awesome.min.css">

        <link rel="stylesheet" href="assets/css/dataTables.bootstrap4.min.css">

        <link rel="stylesheet" href="assets/css/select2.min.css">

        <link rel="stylesheet" href="assets/css/bootstrap-datetimepicker.min.css">

        <link rel="stylesheet" href="assets/css/style.css">

        <style>
            tr th{

                text-align:center;
            }

            tr td{

                text-align:center;
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
                                <h3 class="page-title">Overtime</h3>
                                <ul class="breadcrumb">
                                    <li class="breadcrumb-item"><a href="admin-dashboard.html">Dashboard</a></li>
                                    <li class="breadcrumb-item active">Overtime</li>
                                </ul>
                            </div>
                            <div class="col-auto float-end ms-auto">
                                <a href="#" class="btn add-btn" data-bs-toggle="modal" data-bs-target="#add_overtime"><i class="fa fa-plus"></i> Add Overtime</a>
                            </div>
                        </div>
                    </div>


                    <div class="row">
                        <div class="col-md-6 col-sm-6 col-lg-6 col-xl-3">
                            <div class="stats-info">
                                <h6>Overtime Employee</h6>
                                <h4>12 <span>this month</span></h4>
                            </div>
                        </div>
                        <div class="col-md-6 col-sm-6 col-lg-6 col-xl-3">
                            <div class="stats-info">
                                <h6>Overtime Hours</h6>
                                <h4>118 <span>this month</span></h4>
                            </div>
                        </div>
                        <div class="col-md-6 col-sm-6 col-lg-6 col-xl-3">
                            <div class="stats-info">
                                <h6>Pending Request</h6>
                                <h4>23</h4>
                            </div>
                        </div>
                        <div class="col-md-6 col-sm-6 col-lg-6 col-xl-3">
                            <div class="stats-info">
                                <h6>Rejected</h6>
                                <h4>5</h4>
                            </div>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-md-12">
                            <div class="table-responsive">
                                <table class="table table-striped custom-table mb-0 datatable">
                                    <thead>
                                        <tr>
                                            <th>OT ID</th>
                                            <th>Name</th>
                                            <th>OT Date</th>
                                            <th class="text-center">OT Hours</th>
                                            <th>OT Type</th>
                                            <th>Description</th>

                                            <th>Approved by</th>
                                            <th class="text-end">Actions</th>
                                        </tr>
                                    </thead>

                                    <%
                                        String overtimeid = "";
                                        OverTimeDao dao = new OverTimeDao();
                                        ArrayList<ArrayList<String>> arr = dao.selectAllOvertime();
                                        for (ArrayList<String> d : arr) {
                                            overtimeid = d.get(0);
                                    %>
                                    <tbody>
                                        <tr>
                                            <td><%= d.get(0)%></td>
                                            <td> <%= d.get(1)%></td>
                                            <td><%= d.get(2)%></td>
                                            <td class="text-center"><%= d.get(3)%></td>
                                            <td>Normal day OT 1.5x</td>
                                            <td><%= d.get(4)%></td>
                                            <td>
                                                <h2 class="table-avatar">
                                                    <a href="profile.html" class="avatar avatar-xs"><img src="assets/img/profiles/avatar-09.jpg" alt=""></a>
                                                    <a href="#">Richard Miles</a>
                                                </h2>
                                            </td>
                                            <td class="text-end">
                                                <div class="dropdown dropdown-action">
                                                    <a href="#" class="action-icon dropdown-toggle" data-bs-toggle="dropdown" aria-expanded="false"><i class="material-icons">more_vert</i></a>
                                                    <div class="dropdown-menu dropdown-menu-right">
                                                        <a class="dropdown-item" href="#" data-bs-toggle="modal" data-bs-target="#edit_overtime" onclick=getmodeldata('<%=d.get(0)%>'); ><i class="fa fa-pencil m-r-5"></i> Edit</a>
                                                        <a class="dropdown-item" href="#" data-bs-toggle="modal" data-bs-target="#delete_overtime"><i class="fa fa-trash-o m-r-5"></i> Delete</a>
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


                <div id="add_overtime" class="modal custom-modal fade" role="dialog">
                    <div class="modal-dialog modal-dialog-centered" role="document">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title">Add Overtime</h5>
                                <button type="button" class="close" data-bs-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                            </div>
                            <div class="modal-body">
                                <form action="../OvertimeServlet?action=insert" method="post">
                                    <div class="form-group">
                                        <label>Select Employee <span class="text-danger">*</span></label>
                                        <select class="select" name="employee">
                                            <option value="John Doe">John Doe</option>
                                            <option value="Richard Miles">Richard Miles</option>
                                            <option value="John Smith">John Smith</option>

                                        </select>
                                    </div>
                                    <div class="form-group">
                                        <label>Overtime Date <span class="text-danger">*</span></label>
                                        <div class="cal-icon">
                                            <div class="form-outline">
                                            </div>
                                            <input class="form-control datetimepicker" type="text" name="otdate">
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label>Overtime Hours <span class="text-danger">*</span></label>
                                        <input class="form-control" type="number" name="othours">
                                    </div>
                                    <div class="form-group">
                                        <label>Description <span class="text-danger">*</span></label>
                                        <textarea rows="4" class="form-control" name="otdesc"></textarea>
                                    </div>
                                    <div class="submit-section">
                                        <button type="submit" class="btn btn-primary submit-btn">Submit</button>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>


                <div id="edit_overtime" class="modal custom-modal fade" role="dialog">
                    <div class="modal-dialog modal-dialog-centered" role="document">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title">Edit Overtime</h5>
                                <button type="button" class="close" data-bs-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                            </div>
                            <div class="modal-body">
                                <form action="../OvertimeServlet?action=update" method="post">
                                    <div class="form-group">
                                        <label>Select Employee <span class="text-danger">*</span></label>
                                        <select class="select" name="updateEmployee" id="updateEmployee">
                                            <option>-</option>
                                            <option>John Doe</option>
                                            <option>Richard Miles</option>
                                            <option>John Smith</option>
                                        </select>
                                    </div>
                                    <div class="form-group">
                                        <label>Overtime Date <span class="text-danger">*</span></label>
                                        <div class="cal-icon">
                                            <input class="form-control datetimepicker" type="text" name="updateDate" id="updateDate">
                                            <input class="form-control datetimepicker" type="hidden" name="updateID" id="updateID">
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label>Overtime Hours <span class="text-danger">*</span></label>
                                        <input class="form-control" type="number" name="updateHour" id="updateHour">
                                    </div>
                                    <div class="form-group">
                                        <label>Description <span class="text-danger">*</span></label>
                                        <textarea rows="4" class="form-control" name="updateDesc" id="updateDesc"></textarea>
                                    </div>
                                    <div class="submit-section">
                                        <button class="btn btn-primary submit-btn">Submit</button>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>


                <div class="modal custom-modal fade" id="delete_overtime" role="dialog">
                    <div class="modal-dialog modal-dialog-centered">
                        <div class="modal-content">
                            <div class="modal-body">
                                <div class="form-header">
                                    <h3>Delete Overtime</h3>
                                    <p>Are you sure want to Cancel this?</p>
                                </div>
                                <div class="modal-btn delete-action">
                                    <div class="row">
                                        <div class="col-6">
                                            <a href="../OvertimeServlet?action=delete&updateID=<%=overtimeid%>" class="btn btn-primary continue-btn">Delete</a>
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

        <script src="assets/js/moment.min.js"></script>
        <script src="assets/js/bootstrap-datetimepicker.min.js"></script>

        <script src="assets/js/layout.js"></script>
        <script src="assets/js/theme-settings.js"></script>
        <script src="assets/js/greedynav.js"></script>

        <script src="assets/js/app.js"></script>
        <script>

   function getmodeldata(id) {

       $.ajax({
           url: '../OvertimeServlet?action=search',
           type: 'POST',
           data: {'depid': id},
           success: function (e) {

               var e1 = e.split("#");
               document.getElementById("updateEmployee").value = e1[0].trim();
               $("#updateEmployee").change();
               document.getElementById("updateDate").value = e1[1].trim();
               document.getElementById("updateHour").value = e1[2].trim();
               document.getElementById("updateDesc").value = e1[3].trim();
               document.getElementById("updateID").value = id;
           }

       })
   }
        </script>
    </body>
</html>