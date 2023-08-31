<%-- 
    Document   : employees-list
    Created on : May 11, 2023, 10:28:40 AM
    Author     : VIVEKJHA
--%>

<%@page import="dao.EmployeeDao"%>
<%@page import="dao.GetDropDownData"%>
<%@page import="java.util.ArrayList"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
﻿<!DOCTYPE html>
<html lang="en" data-layout="vertical" data-topbar="light" data-sidebar="dark" data-sidebar-size="lg" data-sidebar-image="none">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0">
        <meta name="description" content="Smarthr - Bootstrap Admin Template">
        <meta name="keywords" content="admin, estimates, bootstrap, business, corporate, creative, management, minimal, modern, accounts, invoice, html5, responsive, CRM, Projects">
        <meta name="author" content="Dreamguys - Bootstrap Admin Template">
        <meta name="robots" content="noindex, nofollow">
        <title>Employees - HRMS admin template</title>

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
                                <h3 class="page-title">Employee</h3>
                                <ul class="breadcrumb">
                                    <li class="breadcrumb-item"><a href="admin-dashboard.html">Dashboard</a></li>
                                    <li class="breadcrumb-item active">Employee</li>
                                </ul>
                            </div>
                            <div class="col-auto float-end ms-auto">
                                <a href="#" class="btn add-btn" data-bs-toggle="modal" data-bs-target="#add_employee"><i class="fa fa-plus"></i> Add Employee</a>
                            </div>
                        </div>
                    </div>


                 

                    <div class="row">
                        <div class="col-md-12">
                            <div class="table-responsive">
                                <table class="table table-striped custom-table datatable">
                                    <thead>
                                        <tr>
                                            <th>Name</th>
                                            <th>Employee ID</th>
                                            <th>Email</th>
                                            <th>Mobile</th>
                                            <th class="text-nowrap">Join Date</th>
                                            <th>Role</th>
                                            <th class="text-end no-sort">Action</th>
                                        </tr>
                                    </thead>
                                     <%      
                                           String empcd="";
                                            EmployeeDao dao=new EmployeeDao();
                                            ArrayList<ArrayList<String>> arr=dao.selectAllEmployee();
                                            for(ArrayList<String> d : arr){
                                              empcd=d.get(0);
                                    %>
                                    <tbody>
                                        <tr>
                                            <td>
                                                <%=d.get(1)+" "+d.get(2)%> 
                                            </td>
                                            <td><%=d.get(0)%></td>
                                            <td><%=d.get(4)%></td>
                                            <td><%=d.get(7)%></td>
                                            <td><%=d.get(6)%></td>
                                            <td><%=d.get(10)%></td>
                                            <td class="text-end">
                                                <div class="dropdown dropdown-action">
                                                    <a href="#" class="action-icon dropdown-toggle" data-bs-toggle="dropdown" aria-expanded="false"><i class="material-icons">more_vert</i></a>
                                                    <div class="dropdown-menu dropdown-menu-right">
                                                        <a class="dropdown-item" href="#" data-bs-toggle="modal" data-bs-target="#edit_employee"onclick=getmodeldata('<%=d.get(0)%>');><i class="fa fa-pencil m-r-5"></i> Edit</a>
                                                        <a class="dropdown-item" href="#" data-bs-toggle="modal" data-bs-target="#delete_employee"><i class="fa fa-trash-o m-r-5"></i> Delete</a>
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


                <div id="add_employee" class="modal custom-modal fade" role="dialog">
                    <div class="modal-dialog modal-dialog-centered modal-lg" role="document">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title">Add Employee</h5>
                                <button type="button" class="close" data-bs-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                            </div>
                            <div class="modal-body">
                                <form action="../EmployeeServlet?action=insert" method="post">
                                    <div class="row">
                                        <div class="col-sm-6">
                                            <div class="form-group">
                                                <label class="col-form-label">First Name <span class="text-danger">*</span></label>
                                                <input class="form-control" type="text" name="fname">
                                            </div>
                                        </div>
                                        <div class="col-sm-6">
                                            <div class="form-group">
                                                <label class="col-form-label">Last Name</label>
                                                <input class="form-control" type="text"name="lname">
                                            </div>
                                        </div>
                                        <div class="col-sm-6">
                                            <div class="form-group">
                                                <label class="col-form-label">Username <span class="text-danger">*</span></label>
                                                <input class="form-control" type="text" name="uname">
                                            </div>
                                        </div>
                                        <div class="col-sm-6">
                                            <div class="form-group">
                                                <label class="col-form-label">Email <span class="text-danger">*</span></label>
                                                <input class="form-control" type="email" name="uemail">
                                            </div>
                                        </div>
                                        <div class="col-sm-6">
                                            <div class="form-group">
                                                <label class="col-form-label">Password</label>
                                                <input class="form-control" type="password" name="upassword">
                                            </div>
                                        </div>
                                        <div class="col-sm-6">
                                            <div class="form-group">
                                                <label class="col-form-label">Confirm Password</label>
                                                <input class="form-control" type="password" name="uconfirmpass" id="uconfirmpass">
                                            </div>
                                        </div>
                                        <div class="col-sm-6">
                                            <div class="form-group">
                                                <label class="col-form-label">Joining Date <span class="text-danger">*</span></label>
                                                <div class="cal-icon"><input class="form-control datetimepicker" type="text" name="ujoinDate"></div>
                                            </div>
                                        </div>
                                        <div class="col-sm-6">
                                            <div class="form-group">
                                                <label class="col-form-label">Phone </label>
                                                <input class="form-control" type="text" name="uphone">
                                            </div>
                                        </div>
                                        <div class="col-sm-6">
                                            <div class="form-group">
                                                <label class="col-form-label">Company</label>
                                                <select class="select" name="ucompany">
                                                    <option value="Global Technologies">Global Technologies</option>
                                                    <option value="Delta Infotech">Delta Infotech</option>
                                                </select>
                                            </div>
                                        </div>
                                        <div class="col-md-6 mt-3">
                                            <div class="form-group">
                                                <label>Department <span class="text-danger">*</span></label>
                                                <select class="select" name="udepartment">
                                                    <%
                                                        GetDropDownData GetData = new GetDropDownData();
                                                        ArrayList<String> arrr = new ArrayList<>();
                                                        arrr = GetData.GetEmpDet(new String[]{""}, 1, "");
                                                        for (String ss : arrr) {
                                                            out.println(ss);
                                                        }
                                                    %>
                                                </select>
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label>Designation <span class="text-danger">*</span></label>
                                                <select class="select" name="udesignation">
                                                    <%
                                                    
                                                    arrr = GetData.GetEmpDet(new String[]{""}, 2, "");
                                                        for (String ss : arrr) {
                                                            out.println(ss);
                                                        }
                                                    %>
                                                </select>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="submit-section">
                                        <button  type="submit" class="btn btn-primary submit-btn">Submit</button>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>


                <!--============================================================================update employee================================================================================-->

                <div id="edit_employee" class="modal custom-modal fade" role="dialog">
                    <div class="modal-dialog modal-dialog-centered modal-lg" role="document">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title">Edit Employee</h5>
                                <button type="button" class="close" data-bs-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                            </div>
                            <div class="modal-body">
                                 <form action="../EmployeeServlet?action=update" method="post">
                                     <input type="hidden" name="updateempcd" id="updateempcd">
                                    <div class="row">
                                        <div class="col-sm-6">
                                            <div class="form-group">
                                                <label class="col-form-label">First Name <span class="text-danger">*</span></label>
                                                <input class="form-control" type="text" name="fname" id="fname">
                                            </div>
                                        </div>
                                        <div class="col-sm-6">
                                            <div class="form-group">
                                                <label class="col-form-label">Last Name</label>
                                                <input class="form-control" type="text"name="lname" id="lname">
                                            </div>
                                        </div>
                                        <div class="col-sm-6">
                                            <div class="form-group">
                                                <label class="col-form-label">Username <span class="text-danger">*</span></label>
                                                <input class="form-control" type="text" name="uname" id="uname">
                                            </div>
                                        </div>
                                        <div class="col-sm-6">
                                            <div class="form-group">
                                                <label class="col-form-label">Email <span class="text-danger">*</span></label>
                                                <input class="form-control" type="email" name="uemail" id="uemail">
                                            </div>
                                        </div>
                                        <div class="col-sm-6">
                                            <div class="form-group">
                                                <label class="col-form-label">Password</label>
                                                <input class="form-control" type="password" name="upassword" id="upassword">
                                            </div>
                                        </div>
                                        <div class="col-sm-6">
                                            <div class="form-group">
                                                <label class="col-form-label">Confirm Password</label>
                                                <input class="form-control" type="password" name="uconfirmpass" id="uconfirmpass">
                                            </div>
                                        </div>
                                        <div class="col-sm-6">
                                            <div class="form-group">
                                                <label class="col-form-label">Joining Date <span class="text-danger">*</span></label>
                                                <div class="cal-icon"><input class="form-control datetimepicker" type="text" name="ujoinDate" id="ujoinDate"></div>
                                            </div>
                                        </div>
                                        <div class="col-sm-6">
                                            <div class="form-group">
                                                <label class="col-form-label">Phone </label>
                                                <input class="form-control" type="text" name="uphone" id="uphone">
                                            </div>
                                        </div>
                                        <div class="col-sm-6">
                                            <div class="form-group">
                                                <label class="col-form-label">Company</label>
                                                <select class="select" name="ucompany" id="ucompany">
                                                    <option value="Global Technologies">Global Technologies</option>
                                                    <option value="Delta Infotech">Delta Infotech</option>
                                                </select>
                                            </div>
                                        </div>
                                        <div class="col-md-6 mt-3">
                                            <div class="form-group">
                                                <label>Department <span class="text-danger">*</span></label>
                                                <select class="select" name="udepartment" id="udepartment">
                                                    <%
                                                        GetDropDownData GetData1 = new GetDropDownData();
                                                        ArrayList<String> arrr1 = new ArrayList<>();
                                                        arrr1 = GetData1.GetEmpDet(new String[]{""}, 1, "");
                                                        for (String ss : arrr1) {
                                                            out.println(ss);
                                                        }
                                                    %>
                                                </select>
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label>Designation <span class="text-danger">*</span></label>
                                                <select class="select" name="udesignation" id="udesignation">
                                                    <%
                                                    
                                                        arrr1 = GetData1.GetEmpDet(new String[]{""}, 2, "");
                                                        for (String ss : arrr1) {
                                                            out.println(ss);
                                                        }
                                                    %>
                                                </select>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="submit-section">
                                        <button  type="submit" class="btn btn-primary submit-btn">Submit</button>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>

                <!--============================================================================Delete employee================================================================================-->

                <div class="modal custom-modal fade" id="delete_employee" role="dialog">
                    <div class="modal-dialog modal-dialog-centered">
                        <div class="modal-content">
                            <div class="modal-body">
                                <div class="form-header">
                                    <h3>Delete Employee</h3>
                                    <p>Are you sure want to delete?</p>
                                </div>
                                <div class="modal-btn delete-action">
                                    <div class="row">
                                        <div class="col-6">
                                            <a href="../EmployeeServlet?action=delete&empcd=<%=empcd%>" class="btn btn-primary continue-btn">Delete</a>
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
        <!--============================================================================delete employees end================================================================================-->

        <%@include file="Customization.jsp" %>

        <script data-cfasync="false" src="../../cdn-cgi/scripts/5c5dd728/cloudflare-static/email-decode.min.js"></script><script src="assets/js/jquery-3.6.0.min.js"></script>

        <script src="assets/js/bootstrap.bundle.min.js"></script>

        <script src="assets/js/jquery.slimscroll.min.js"></script>

        <script src="assets/js/select2.min.js"></script>

        <script src="assets/js/moment.min.js"></script>
        <script src="assets/js/bootstrap-datetimepicker.min.js"></script>

        <script src="assets/js/jquery.dataTables.min.js"></script>
        <script src="assets/js/dataTables.bootstrap4.min.js"></script>

        <script src="assets/js/layout.js"></script>
        <script src="assets/js/theme-settings.js"></script>
        <script src="assets/js/greedynav.js"></script>

        <script src="assets/js/app.js"></script>
        
          <script>

                                                           function getmodeldata(id) {

                                                               $.ajax({
                                                                   url: '../EmployeeServlet?action=search',
                                                                   type: 'POST',
                                                                   data: {'depid': id},
                                                                   success: function (e) {
                                                                      
                                                                       var e1  =e.split("#");
                                                                       var newvalu=e1[4].trim();
                                                                       document.getElementById("fname").value = e1[0].trim();
                                                                       document.getElementById("lname").value = e1[1].trim();
                                                                       document.getElementById("uname").value = e1[2].trim();
                                                                       document.getElementById("uemail").value = e1[3].trim();
                                                                       document.getElementById("upassword").value = newvalu;
                                                                       document.getElementById("uconfirmpass").value = newvalu;
                                                                       document.getElementById("ujoinDate").value = e1[5].trim();
                                                                       document.getElementById("uphone").value = e1[6].trim();
                                                                       document.getElementById("ucompany").value = e1[7].trim();
                                                                       $("#ucompany").change();
                                                                       document.getElementById("udepartment").value = e1[8].trim();
                                                                       $("#udepartment").change();
                                                                       document.getElementById("udesignation").value = e1[9].trim();
                                                                       $("#udesignation").change();
                                                                       document.getElementById("updateempcd").value = id;
                                                                   }

                                                               })
                                                           }
                                                           
                                                           
                                                           
                                                                </script>
                                                                
                                                                 <script>

                                                           function getmodeldata(id) {

                                                               $.ajax({
                                                                   url: '../EmployeeServlet?action=searchViaValue',
                                                                   type: 'POST',
                                                                   data: {'depid': id},
                                                                   success: function (e) {
                                                                      
                                                                       var e1  =e.split("#");
                                                                       var newvalu=e1[4].trim();
                                                                       document.getElementById("fname").value = e1[0].trim();
                                                                       document.getElementById("lname").value = e1[1].trim();
                                                                       document.getElementById("uname").value = e1[2].trim();
                                                                       document.getElementById("uemail").value = e1[3].trim();
                                                                       document.getElementById("upassword").value = newvalu;
                                                                       document.getElementById("uconfirmpass").value = newvalu;
                                                                       document.getElementById("ujoinDate").value = e1[5].trim();
                                                                       document.getElementById("uphone").value = e1[6].trim();
                                                                       document.getElementById("ucompany").value = e1[7].trim();
                                                                       $("#ucompany").change();
                                                                       document.getElementById("udepartment").value = e1[8].trim();
                                                                       $("#udepartment").change();
                                                                       document.getElementById("udesignation").value = e1[9].trim();
                                                                       $("#udesignation").change();
                                                                       document.getElementById("updateempcd").value = id;
                                                                   }

                                                               })
                                                           }
                                                           
                                                           
                                                           
                                                                </script>
    </body>
</html>