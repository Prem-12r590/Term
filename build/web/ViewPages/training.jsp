<%-- 
    Document   : training
    Created on : May 25, 2023, 2:53:00 PM
    Author     : VIVEKJHA
--%>

<%@page import="dao.TrainingStatusDao"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dao.GetDropDownData"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%><!DOCTYPE html>
<html lang="en" data-layout="vertical" data-topbar="light" data-sidebar="dark" data-sidebar-size="lg" data-sidebar-image="none">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0">
        <meta name="description" content="Smarthr - Bootstrap Admin Template">
        <meta name="keywords" content="admin, estimates, bootstrap, business, corporate, creative, management, minimal, modern, accounts, invoice, html5, responsive, CRM, Projects">
        <meta name="author" content="Dreamguys - Bootstrap Admin Template">
        <meta name="robots" content="noindex, nofollow">
        <title>Training - HRMS admin template</title>

        <link rel="shortcut icon" type="image/x-icon" href="assets/img/favicon.png">

        <link rel="stylesheet" href="assets/css/bootstrap.min.css">

        <link rel="stylesheet" href="assets/plugins/fontawesome/css/fontawesome.min.css">
        <link rel="stylesheet" href="assets/plugins/fontawesome/css/all.min.css">

        <link rel="stylesheet" href="assets/css/line-awesome.min.css">
        <link rel="stylesheet" href="assets/css/material.css">

        <link rel="stylesheet" href="assets/css/font-awesome.min.css">

        <link rel="stylesheet" href="assets/css/line-awesome.min.css">

        <link rel="stylesheet" href="assets/css/select2.min.css">

        <link rel="stylesheet" href="assets/css/bootstrap-datetimepicker.min.css">

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
                                <h3 class="page-title">Training</h3>
                                <ul class="breadcrumb">
                                    <li class="breadcrumb-item"><a href="admin-dashboard.html">Dashboard</a></li>
                                    <li class="breadcrumb-item active">Training</li>
                                </ul>
                            </div>
                            <div class="col-auto float-end ms-auto">
                                <a href="#" class="btn add-btn" data-bs-toggle="modal" data-bs-target="#add_training"><i class="fa fa-plus"></i> Add New </a>
                            </div>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-md-12">
                            <div class="table-responsive">
                                <table class="table table-striped custom-table mb-0 datatable">
                                    <thead>
                                        <tr>
                                            <th>Id</th>
                                            <th>Training Type</th>
                                            <th>Trainer</th>
                                            <th>Employee</th>
                                            <th>Time Duration</th>
                                            <th>Description </th>
                                            <th>Cost </th>
                                            <th>Status </th>
                                            <th class="text-end">Action</th>
                                        </tr>
                                    </thead>
                                    
                                    <%      
                                           String tstatuscd="";
                                            TrainingStatusDao dao=new TrainingStatusDao();
                                            ArrayList<ArrayList<String>> arr=dao.selectAllTstatus();
                                            for(ArrayList<String> d : arr){
                                              tstatuscd=d.get(0);
                                    %>
                                    <tbody>
                                        <tr>
                                            <td><%= d.get(0)%></td>
                                            <td><%= d.get(1)%></td>
                                            <td>
                                                <%= d.get(2)%>
                                            </td>
                                            <td>
                                                <%= d.get(3)%>
                                            </td>
                                            <td><%= d.get(5)+" - " +d.get(6)%></td>
                                            <td><%= d.get(7)%></td>
                                            <td><%= d.get(4)%></td>
                                            <td>
                                               <%= d.get(8)%>
                                            </td>
                                            <td class="text-end">
                                                <div class="dropdown dropdown-action">
                                                    <a href="#" class="action-icon dropdown-toggle" data-bs-toggle="dropdown" aria-expanded="false"><i class="material-icons">more_vert</i></a>
                                                    <div class="dropdown-menu dropdown-menu-right">
                                                        <a class="dropdown-item" href="#" data-bs-toggle="modal" data-bs-target="#edit_training" onclick=getmodeldata('<%=d.get(0)%>'); ><i class="fa fa-pencil m-r-5"></i> Edit</a>
                                                        <a class="dropdown-item" href="#" data-bs-toggle="modal" data-bs-target="#delete_training"><i class="fa fa-trash-o m-r-5"></i> Delete</a>
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


                <div id="add_training" class="modal custom-modal fade" role="dialog">
                    <div class="modal-dialog modal-dialog-centered" role="document">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title">Add New Training</h5>
                                <button type="button" class="close" data-bs-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                            </div>
                            <div class="modal-body">
                              <form action="../trainingstatusServlet?action=insert" method="post">
                                    <div class="row">
                                        <div class="col-sm-6">
                                            <div class="form-group">
                                                <label class="col-form-label">Training Type</label>
                                                <select class="select" name="trainingType">
                                                    <%
                                                        GetDropDownData GetData = new GetDropDownData();
                                                        ArrayList<String> arrr = new ArrayList<>();
                                                        arrr = GetData.GetEmpDet(new String[]{""}, 3, "");
                                                        for (String ss : arrr) {
                                                            out.println(ss);
                                                        }
                                                    %>
                                                </select>
                                            </div>
                                        </div>
                                        <div class="col-sm-6">
                                            <div class="form-group">
                                                <label class="col-form-label">Trainer</label>
                                                <select  class="select" name="trainerName">
                                                     <%
                                                   
                                                   
                                                        arrr = GetData.GetEmpDet(new String[]{""}, 4, "");
                                                        for (String ss : arrr) {
                                                            out.println(ss);
                                                        }
                                                    %>
                                                </select>
                                            </div>
                                        </div>
                                        <div class="col-sm-6">
                                            <div class="form-group">
                                                <label class="col-form-label">Employees</label>
                                                <select class="select" name="TEmployee">
                                                  <%
                                                   
                                                   
                                                        arrr = GetData.GetEmpDet(new String[]{""}, 5, "");
                                                        for (String ss : arrr) {
                                                            out.println(ss);
                                                        }
                                                    %>
                                                </select>
                                            </div>
                                        </div>
                                        <div class="col-sm-6">
                                            <div class="form-group">
                                                <label class="col-form-label">Training Cost <span class="text-danger">*</span></label>
                                                <input class="form-control" type="text" name="trainingCost">
                                            </div>
                                        </div>
                                        <div class="col-sm-6">
                                            <div class="form-group">
                                                <label>Start Date <span class="text-danger">*</span></label>
                                                <div class="cal-icon"><input class="form-control datetimepicker" type="text" name="strdate"></div>
                                            </div>
                                        </div>
                                        <div class="col-sm-6">
                                            <div class="form-group">
                                                <label>End Date <span class="text-danger">*</span></label>
                                                <div class="cal-icon"><input class="form-control datetimepicker" type="text" name="endDate"></div>
                                            </div>
                                        </div>
                                        <div class="col-sm-12">
                                            <div class="form-group">
                                                <label>Description <span class="text-danger">*</span></label>
                                                <textarea class="form-control" rows="4" name="trdesc"></textarea>
                                            </div>
                                        </div>
                                        <div class="col-sm-12">
                                            <div class="form-group">
                                                <label class="col-form-label">Status</label>
                                                <select class="select" name="tstatus">
                                                    <option>Active</option>
                                                    <option>Inactive</option>
                                                </select>
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


                <div id="edit_training" class="modal custom-modal fade" role="dialog">
                    <div class="modal-dialog modal-dialog-centered" role="document">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title">Edit Training List</h5>
                                <button type="button" class="close" data-bs-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                            </div>
                            <div class="modal-body">
                                 <form action="../trainingstatusServlet?action=update" method="post">
                                     <input type="hidden" name="updateID" id="updateID">
                                    <div class="row">
                                        <div class="col-sm-6">
                                            <div class="form-group">
                                                <label class="col-form-label">Training Type</label>
                                                <select class="select" name="trainingType" id="trainingType">
                                                    <%
                                                        GetDropDownData GetData1 = new GetDropDownData();
                                                        ArrayList<String> arrr1 = new ArrayList<>();
                                                        arrr1 = GetData1.GetEmpDet(new String[]{""}, 3, "");
                                                        for (String ss : arrr1) {
                                                            out.println(ss);
                                                        }
                                                    %>
                                                </select>
                                            </div>
                                        </div>
                                        <div class="col-sm-6">
                                            <div class="form-group">
                                                <label class="col-form-label">Trainer</label>
                                                <select  class="select" name="trainerName" id="trainerName">
                                                     <%
                                                   
                                                   
                                                        arrr1 = GetData1.GetEmpDet(new String[]{""}, 4, "");
                                                        for (String ss : arrr1) {
                                                            out.println(ss);
                                                        }
                                                    %>
                                                </select>
                                            </div>
                                        </div>
                                        <div class="col-sm-6">
                                            <div class="form-group">
                                                <label class="col-form-label">Employees</label>
                                                <select class="select" name="TEmployee" id="TEmployee" >
                                                  <%
                                                   
                                                   
                                                        arrr1 = GetData1.GetEmpDet(new String[]{""}, 5, "");
                                                        for (String ss : arrr1) {
                                                            out.println(ss);
                                                        }
                                                    %>
                                                </select>
                                            </div>
                                        </div>
                                        <div class="col-sm-6">
                                            <div class="form-group">
                                                <label class="col-form-label">Training Cost <span class="text-danger">*</span></label>
                                                <input class="form-control" type="text" name="trainingCost" id="trainingCost">
                                            </div>
                                        </div>
                                        <div class="col-sm-6">
                                            <div class="form-group">
                                                <label>Start Date <span class="text-danger">*</span></label>
                                                <div class="cal-icon"><input class="form-control datetimepicker" type="text" name="strdate" id="strdate"></div>
                                            </div>
                                        </div>
                                        <div class="col-sm-6">
                                            <div class="form-group">
                                                <label>End Date <span class="text-danger">*</span></label>
                                                <div class="cal-icon"><input class="form-control datetimepicker" type="text" name="endDate" id="endDate"></div>
                                            </div>
                                        </div>
                                        <div class="col-sm-12">
                                            <div class="form-group">
                                                <label>Description <span class="text-danger">*</span></label>
                                                <textarea class="form-control" rows="4" name="trdesc" id="trdesc"></textarea>
                                            </div>
                                        </div>
                                        <div class="col-sm-12">
                                            <div class="form-group">
                                                <label class="col-form-label">Status</label>
                                                <select class="select" name="tstatus" id="tstatus">
                                                    <option>Active</option>
                                                    <option>Inactive</option>
                                                </select>
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


                <div class="modal custom-modal fade" id="delete_training" role="dialog">
                    <div class="modal-dialog modal-dialog-centered">
                        <div class="modal-content">
                            <div class="modal-body">
                                <div class="form-header">
                                    <h3>Delete Training List</h3>
                                    <p>Are you sure want to delete?</p>
                                </div>
                                <div class="modal-btn delete-action">
                                    <div class="row">
                                        <div class="col-6">
                                            <a href="../trainingstatusServlet?action=delete&tstatuscd=<%=tstatuscd%>" class="btn btn-primary continue-btn">Delete</a>
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
                                                                   url: '../trainingstatusServlet?action=search',
                                                                   type: 'POST',
                                                                   data: {'depid': id},
                                                                   success: function (e) {
                                                                      
                                                                       var e1  =e.split("#");
                                                                       document.getElementById("trainingType").value = e1[0].trim();
                                                                       $("#trainingType").change();
                                                                       document.getElementById("trainerName").value = e1[1].trim();
                                                                       $("#trainerName").change();
                                                                       document.getElementById("TEmployee").value = e1[2].trim();
                                                                       $("#TEmployee").change();
                                                                       document.getElementById("trainingCost").value = e1[3].trim();
                                                                       document.getElementById("strdate").value = e1[4].trim();
                                                                       document.getElementById("endDate").value = e1[5].trim();
                                                                       document.getElementById("trdesc").value = e1[6].trim();
                                                                       document.getElementById("tstatus").value = e1[7].trim();
                                                                       $("#tstatus").change();
                                                                       document.getElementById("updateID").value = id;
                                                                   }

                                                               })
                                                           }
                                                                </script>
    </body>
</html>


