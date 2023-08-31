<%-- 
    Document   : salary
    Created on : May 12, 2023, 12:22:52 PM
    Author     : VIVEKJHA
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="dao.SalaryDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>﻿<!DOCTYPE html>
<html lang="en" data-layout="vertical" data-topbar="light" data-sidebar="dark" data-sidebar-size="lg" data-sidebar-image="none">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0">
        <meta name="description" content="Smarthr - Bootstrap Admin Template">
        <meta name="keywords" content="admin, estimates, bootstrap, business, corporate, creative, management, minimal, modern, accounts, invoice, html5, responsive, CRM, Projects">
        <meta name="author" content="Dreamguys - Bootstrap Admin Template">
        <meta name="robots" content="noindex, nofollow">
        <title>Salary - HRMS admin template</title>

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
                                <h3 class="page-title">Employee Salary</h3>
                                <ul class="breadcrumb">
                                    <li class="breadcrumb-item"><a href="admin-dashboard.html">Dashboard</a></li>
                                    <li class="breadcrumb-item active">Salary</li>
                                </ul>
                            </div>
                            <div class="col-auto float-end ms-auto">
                                <a href="#" class="btn add-btn" data-bs-toggle="modal" data-bs-target="#add_salary"><i class="fa fa-plus"></i> Add Salary</a>
                            </div>
                        </div>
                    </div>


                    

                    <div class="row">
                        <div class="col-md-12">
                            <div class="table-responsive">
                                <table class="table table-striped custom-table datatable">
                                    <thead>
                                        <tr>
                                            <th>Employee</th>
                                            <th>Employee ID</th>
                                            <th>Email</th>
                                            <th>Join Date</th>
                                            <th>Role</th>
                                            <th>Salary</th>
                                            <th>Payslip</th>
                                            <th class="text-end">Action</th>
                                        </tr>
                                    </thead>
                                    <%
                                        String salaryId = "";
                                        SalaryDAO dao = new SalaryDAO();
                                        ArrayList<ArrayList<String>> arr = dao.selectAllSalary();
                                        for (ArrayList<String> d : arr) {
                                            salaryId = d.get(0);
                                    %>
                                    <tbody>
                                        <tr>
                                            <td>
                                                rahul
                                            </td>
                                            <td>FT-0001</td>
                                            <td>rahul@gmail.com</td>
                                            <td>1 Jan 2013</td>
                                            <td>web developer</td>
                                            <td><%= d.get(1)%></td>
                                            <td><a class="btn btn-sm btn-primary" href="salary-view.html">Generate Slip</a></td>
                                            <td class="text-end">
                                                <div class="dropdown dropdown-action">
                                                    <a href="#" class="action-icon dropdown-toggle" data-bs-toggle="dropdown" aria-expanded="false"><i class="material-icons">more_vert</i></a>
                                                    <div class="dropdown-menu dropdown-menu-right">
                                                        <a class="dropdown-item" href="#" data-bs-toggle="modal" data-bs-target="#edit_salary"onclick=getmodeldata('<%=d.get(0)%>');><i class="fa fa-pencil m-r-5"></i> Edit</a>
                                                        <a class="dropdown-item" href="#" data-bs-toggle="modal" data-bs-target="#delete_salary"><i class="fa fa-trash-o m-r-5"></i> Delete</a>
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


                <div id="add_salary" class="modal custom-modal fade" role="dialog">
                    <div class="modal-dialog modal-dialog-centered modal-lg" role="document">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title">Add Staff Salary</h5>
                                <button type="button" class="close" data-bs-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                            </div>
                            <div class="modal-body">
                                <form action="../SalaryServlet?action=insert" method="post">
                                    <div class="row">
                                        <div class="col-sm-6">
                                            <div class="form-group">
                                                <label>Select Staff</label>
                                                <select class="select" name="employee">
                                                    <option value="John Doe">John Doe</option>
                                                    <option value="Richard Miles">Richard Miles</option>
                                                </select>
                                            </div>
                                        </div>
                                        <div class="col-sm-6">
                                            <label>Net Salary</label>
                                            <input class="form-control" type="text" name="netsalary">
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-sm-6">
                                            <h4 class="text-primary">Earnings</h4>
                                            <div class="form-group">
                                                <label>Basic</label>
                                                <input class="form-control" type="text" name="basicsalary">
                                            </div>
                                            <div class="form-group">
                                                <label>DA(40%)</label>
                                                <input class="form-control" type="text" name="basicDa">
                                            </div>
                                            <div class="form-group">
                                                <label>HRA(15%)</label>
                                                <input class="form-control" type="text" name="Hra">
                                            </div>
                                            <div class="form-group">
                                                <label>Conveyance</label>
                                                <input class="form-control" type="text" name="conveyance">
                                            </div>
                                            <div class="form-group">
                                                <label>Allowance</label>
                                                <input class="form-control" type="text" name="earingallowance">
                                            </div>
                                            <div class="form-group">
                                                <label>Medical Allowance</label>
                                                <input class="form-control" type="text" name="medicalallowance">
                                            </div>
                                            <div class="form-group">
                                                <label>Others</label>
                                                <input class="form-control" type="text" name="otherEarning">
                                            </div>

                                        </div>

                                        <div class="col-sm-6">
                                            <h4 class="text-primary">Deductions</h4>
                                            <div class="form-group">
                                                <label>TDS</label>
                                                <input class="form-control" type="text" name="TDS">
                                            </div>
                                            <div class="form-group">
                                                <label>ESI</label>
                                                <input class="form-control" type="text" name="ESI">
                                            </div>
                                            <div class="form-group">
                                                <label>PF</label>
                                                <input class="form-control" type="text" name="PF">
                                            </div>
                                            <div class="form-group">
                                                <label>Leave</label>
                                                <input class="form-control" type="text" name="Leave">
                                            </div>
                                            <div class="form-group">
                                                <label>Prof. Tax</label>
                                                <input class="form-control" type="text"name="PRoTax">
                                            </div>
                                            <div class="form-group">
                                                <label>Labour Welfare</label>
                                                <input class="form-control" type="text" name="welfare">
                                            </div>
                                            <div class="form-group">
                                                <label>Others</label>
                                                <input class="form-control" type="text" name="otherLoss">
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


                <div id="edit_salary" class="modal custom-modal fade" role="dialog">
                    <div class="modal-dialog modal-dialog-centered modal-md" role="document">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title">Edit Staff Salary</h5>
                                <button type="button" class="close" data-bs-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                            </div>
                            <div class="modal-body">
                                <form action="../SalaryServlet?action=update" method="post">
                                    <div class="row">
                                        <div class="col-sm-6">
                                            <div class="form-group">
                                                
                                                <input type="hidden" name="updatesalaryID" id="updatesalaryID">
                                                <label>Select Staff</label>
                                                <select class="select" name="updateemployee" id="updateemployee">
                                                    <option value="John Doe">John Doe</option>
                                                    <option value="Richard Miles">Richard Miles</option>
                                                </select>
                                            </div>
                                        </div>
                                        <div class="col-sm-6">
                                            <label>Net Salary</label>
                                            <input class="form-control" type="text" name="updatenetsalary" id="updatenetsalary">
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-sm-6">
                                            <h4 class="text-primary">Earnings</h4>
                                            <div class="form-group">
                                                <label>Basic</label>
                                                <input class="form-control" type="text" name="updatebasicsalary" id="updatebasicsalary">
                                            </div>
                                            <div class="form-group">
                                                <label>DA(40%)</label>
                                                <input class="form-control" type="text" name="updatebasicDa" id="updatebasicDa">
                                            </div>
                                            <div class="form-group">
                                                <label>HRA(15%)</label>
                                                <input class="form-control" type="text" name="updateHra" id="updateHra">
                                            </div>
                                            <div class="form-group">
                                                <label>Conveyance</label>
                                                <input class="form-control" type="text" name="updateconveyance" id="updateconveyance">
                                            </div>
                                            <div class="form-group">
                                                <label>Allowance</label>
                                                <input class="form-control" type="text" name="updateearingallowance" id="updateearingallowance">
                                            </div>
                                            <div class="form-group">
                                                <label>Medical Allowance</label>
                                                <input class="form-control" type="text" name="updatemedicalallowance" id="updatemedicalallowance">
                                            </div>
                                            <div class="form-group">
                                                <label>Others</label>
                                                <input class="form-control" type="text" name="updateotherEarning" id="updateotherEarning">
                                            </div>

                                        </div>

                                        <div class="col-sm-6">
                                            <h4 class="text-primary">Deductions</h4>
                                            <div class="form-group">
                                                <label>TDS</label>
                                                <input class="form-control" type="text" name="updateTDS" id="updateTDS">
                                            </div>
                                            <div class="form-group">
                                                <label>ESI</label>
                                                <input class="form-control" type="text" name="updateESI" id="updateESI">
                                            </div>
                                            <div class="form-group">
                                                <label>PF</label>
                                                <input class="form-control" type="text" name="updatePF" id="updatePF">
                                            </div>
                                            <div class="form-group">
                                                <label>Leave</label>
                                                <input class="form-control" type="text" name="updateLeave" id="updateLeave">
                                            </div>
                                            <div class="form-group">
                                                <label>Prof. Tax</label>
                                                <input class="form-control" type="text"name="updatePRoTax" id="updatePRoTax">
                                            </div>
                                            <div class="form-group">
                                                <label>Labour Welfare</label>
                                                <input class="form-control" type="text" name="updatewelfare" id="updatewelfare">
                                            </div>
                                            <div class="form-group">
                                                <label>Others</label>
                                                <input class="form-control" type="text" name="updateotherLoss" id="updateotherLoss">
                                            </div>

                                        </div>
                                    </div>
                                    <div class="submit-section">
                                        <button type="submit" class="btn btn-primary submit-btn">Save</button>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>


                <div class="modal custom-modal fade" id="delete_salary" role="dialog">
                    <div class="modal-dialog modal-dialog-centered">
                        <div class="modal-content">
                            <div class="modal-body">
                                <div class="form-header">
                                    <h3>Delete Salary</h3>
                                    <p>Are you sure want to delete?</p>
                                </div>
                                <div class="modal-btn delete-action">
                                    <div class="row">
                                        <div class="col-6">
                                            <a href="../SalaryServlet?action=delete&salaryID=<%=salaryId%>" class="btn btn-primary continue-btn">Delete</a>
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
                                                                   url: '../SalaryServlet?action=search',
                                                                   type: 'POST',
                                                                   data: {'salaryID': id},
                                                                   success: function (e) {
                                                                       alert(e)
                                                                       var e1 = e.split("#");
                                                                       document.getElementById("updateemployee").value = e1[0].trim();
                                                                       $("#updateemployee").change();
                                                                       document.getElementById("updatenetsalary").value = e1[1].trim();
                                                                       document.getElementById("updatebasicsalary").value = e1[2].trim();
                                                                       document.getElementById("updatebasicDa").value = e1[3].trim();
                                                                       document.getElementById("updateHra").value = e1[4].trim();
                                                                       document.getElementById("updateconveyance").value = e1[5].trim();
                                                                       document.getElementById("updateearingallowance").value = e1[6].trim();
                                                                       document.getElementById("updatemedicalallowance").value = e1[7].trim();
                                                                       document.getElementById("updateotherEarning").value = e1[8].trim();
                                                                       document.getElementById("updateTDS").value = e1[9].trim();
                                                                       document.getElementById("updateESI").value = e1[10].trim();
                                                                       document.getElementById("updatePF").value = e1[11].trim();
                                                                       document.getElementById("updateLeave").value = e1[12].trim();
                                                                       document.getElementById("updatePRoTax").value = e1[13].trim();
                                                                       document.getElementById("updatewelfare").value = e1[14].trim();
                                                                       document.getElementById("updateotherLoss").value = e1[15].trim();
                                                                       document.getElementById("updatesalaryID").value = id;
                                                                   }

                                                               })
                                                           }
        </script>
    </body>
</html>
