<%-- 
    Document   : project-list
    Created on : May 25, 2023, 6:01:34 PM
    Author     : VIVEKJHA
--%>

<%@page import="dao.ClientProjectDao"%>
<%@page import="dao.ClientProjectDao"%>
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
        <title>Projects - HRMS admin template</title>

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

        <link rel="stylesheet" href="assets/css/ckeditor.css">

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
                                <h3 class="page-title">Projects</h3>
                                <ul class="breadcrumb">
                                    <li class="breadcrumb-item"><a href="admin-dashboard.html">Dashboard</a></li>
                                    <li class="breadcrumb-item active">Projects</li>
                                </ul>
                            </div>
                            <div class="col-auto float-end ms-auto">
                                <a href="#" class="btn add-btn" data-bs-toggle="modal" data-bs-target="#create_project"><i class="fa fa-plus"></i> Create Project</a>

                            </div>
                        </div>
                    </div>




                    <div class="row">
                        <div class="col-md-12">
                            <div class="table-responsive">
                                <table class="table table-striped custom-table datatable">
                                    <thead>
                                        <tr>
                                            <th>Project</th>
                                            <th>Project Id</th>
                                            <th>Leader</th>
                                            <th>Deadline</th>
                                            <th>Priority</th>

                                            <th class="text-end">Action</th>
                                        </tr>
                                    </thead>
                                    <%
                                        String clprjt = "";
                                        ClientProjectDao dao = new ClientProjectDao();
                                        ArrayList<ArrayList<String>> arr = dao.selectAllProject();
                                        for (ArrayList<String> d : arr) {
                                            clprjt = d.get(0);
                                    %>
                                    <tbody>
                                        <tr>
                                            <td>
                                                <%=d.get(1)%>
                                            </td>
                                            <td>  <%=d.get(0)%></td>
                                            <td>
                                                <%=d.get(7)%>
                                            </td>

                                            <td>  <%=d.get(4)%> </td>
                                            <td>
                                                <%=d.get(6)%>
                                            </td>

                                            

                                            <td class="text-end">
                                                <div class="dropdown dropdown-action">
                                                    <a href="#" class="action-icon dropdown-toggle" data-bs-toggle="dropdown" aria-expanded="false"><i class="material-icons">more_vert</i></a>
                                                    <div class="dropdown-menu dropdown-menu-right">
                                                        <a class="dropdown-item" href="#" data-bs-toggle="modal" data-bs-target="#edit_project" onclick=getmodeldata('<%=d.get(0)%>');><i class="fa fa-pencil m-r-5"></i> Edit</a>
                                                        <a class="dropdown-item" href="#" data-bs-toggle="modal" data-bs-target="#delete_project"><i class="fa fa-trash-o m-r-5"></i> Delete</a>
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


                <div id="create_project" class="modal custom-modal fade" role="dialog">
                    <div class="modal-dialog modal-dialog-centered modal-lg" role="document">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title">Create Project</h5>
                                <button type="button" class="close" data-bs-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                            </div>
                            <div class="modal-body">
                                <form action="../ClientProjectServlet?action=insert" method="post">
                                    <div class="row">
                                        <div class="col-sm-6">
                                            <div class="form-group">
                                                <label>Project Name</label>
                                                <input class="form-control" type="text" name="projectName">
                                            </div>
                                        </div>
                                        <div class="col-sm-6">
                                            <div class="form-group">
                                                <label>Client</label>
                                                <select class="select" name="clprcompany"> 
                                                    <%
                                                        GetDropDownData GetData = new GetDropDownData();
                                                        ArrayList<String> arrr = new ArrayList<>();
                                                        arrr = GetData.GetEmpDet(new String[]{""}, 6, "");
                                                        for (String ss : arrr) {
                                                            out.println(ss);
                                                        }
                                                    %>
                                                </select>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-sm-6">
                                            <div class="form-group">
                                                <label>Start Date</label>
                                                <div class="cal-icon">
                                                    <input class="form-control datetimepicker" type="text" name="startdate">
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-sm-6">
                                            <div class="form-group">
                                                <label>End Date</label>
                                                <div class="cal-icon">
                                                    <input class="form-control datetimepicker" type="text" name="enddate">
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-sm-6">
                                            <div class="form-group">
                                                <label>Rate</label>
                                                <input placeholder="$50" class="form-control" type="text" name="prRt">
                                            </div>
                                        </div>

                                        <div class="col-sm-6">
                                            <div class="form-group">
                                                <label>Priority</label>
                                                <select class="select" name="prPriority">
                                                    <option value="High">High</option>
                                                    <option value="Medium">Medium</option>
                                                    <option value="Low">Low</option>
                                                </select>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-sm-6">
                                            <div class="form-group">
                                                <label>Add Project Leader</label>
                                                <input class="form-control" type="text" name="prleader">
                                            </div>
                                        </div>

                                    </div>

                                    <div class="form-group">
                                        <label>Description</label>
                                        <textarea class="form-control" rows="4" name="prdesc"></textarea>
                                    </div>

                                    <div class="submit-section">
                                        <button type="submit" class="btn btn-primary submit-btn">Submit</button>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>


                <div id="edit_project" class="modal custom-modal fade" role="dialog">
                    <div class="modal-dialog modal-dialog-centered modal-lg" role="document">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title">Edit Project</h5>
                                <button type="button" class="close" data-bs-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                            </div>
                            <div class="modal-body">
                                <form action="../ClientProjectServlet?action=update" method="post">
                                    <input type="hidden" name="updateprcd" id="updateprcd">
                                    <div class="row">
                                        <div class="col-sm-6">
                                            <div class="form-group">
                                                <label>Project Name</label>
                                                <input class="form-control" type="text" name="projectName" id="projectName">
                                            </div>
                                        </div>
                                        <div class="col-sm-6">
                                            <div class="form-group">
                                                <label>Client</label>
                                                <select class="select" name="clprcompany" id="clprcompany"> 
                                                    <%
                                                        GetDropDownData GetData1 = new GetDropDownData();
                                                        ArrayList<String> arrr1 = new ArrayList<>();
                                                        arrr1 = GetData1.GetEmpDet(new String[]{""}, 6, "");
                                                        for (String ss : arrr1) {
                                                            out.println(ss);
                                                        }
                                                    %>
                                                </select>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-sm-6">
                                            <div class="form-group">
                                                <label>Start Date</label>
                                                <div class="cal-icon">
                                                    <input class="form-control datetimepicker" type="text" name="startdate" id="startdate">
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-sm-6">
                                            <div class="form-group">
                                                <label>End Date</label>
                                                <div class="cal-icon">
                                                    <input class="form-control datetimepicker" type="text" name="enddate" id="enddate">
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-sm-6">
                                            <div class="form-group">
                                                <label>Rate</label>
                                                <input placeholder="$50" class="form-control" type="text" name="prRt" id="prRt">
                                            </div>
                                        </div>

                                        <div class="col-sm-6">
                                            <div class="form-group">
                                                <label>Priority</label>
                                                <select class="select" name="prPriority" id="prPriority">
                                                    <option value="High">High</option>
                                                    <option value="Medium">Medium</option>
                                                    <option value="Low">Low</option>
                                                </select>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-sm-6">
                                            <div class="form-group">
                                                <label>Add Project Leader</label>
                                                <input class="form-control" type="text" name="prleader" id="prleader">
                                            </div>
                                        </div>

                                    </div>

                                    <div class="form-group">
                                        <label>Description</label>
                                        <textarea class="form-control" rows="4" name="prdesc" id="prdesc"></textarea>
                                    </div>

                                    <div class="submit-section">
                                        <button type="submit" class="btn btn-primary submit-btn">Submit</button>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>


                <div class="modal custom-modal fade" id="delete_project" role="dialog">
                    <div class="modal-dialog modal-dialog-centered">
                        <div class="modal-content">
                            <div class="modal-body">
                                <div class="form-header">
                                    <h3>Delete Project</h3>
                                    <p>Are you sure want to delete?</p>
                                </div>
                                <div class="modal-btn delete-action">
                                    <div class="row">
                                        <div class="col-6">
                                            <a href="../ClientProjectServlet?action=delete&clprjt=<%=clprjt%>" class="btn btn-primary continue-btn">Delete</a>
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

        <script src="assets/js/moment.min.js"></script>
        <script src="assets/js/bootstrap-datetimepicker.min.js"></script>

        <script src="assets/js/jquery.dataTables.min.js"></script>
        <script src="assets/js/dataTables.bootstrap4.min.js"></script>

        <script src="assets/js/ckeditor.js"></script>

        <script src="assets/js/layout.js"></script>
        <script src="assets/js/theme-settings.js"></script>
        <script src="assets/js/greedynav.js"></script>

        <script src="assets/js/app.js"></script>

        <script>

                                                            function getmodeldata(id) {

                                                                $.ajax({
                                                                    url: '../ClientProjectServlet?action=search',
                                                                    type: 'POST',
                                                                    data: {'depid': id},
                                                                    success: function (e) {

                                                                        var e1 = e.split("#");
                                                                        document.getElementById("projectName").value = e1[0].trim();
                                                                        document.getElementById("clprcompany").value = e1[1].trim();
                                                                        document.getElementById("startdate").value = e1[2].trim();
                                                                        document.getElementById("enddate").value = e1[3].trim();
                                                                        document.getElementById("prRt").value = e1[4].trim();
                                                                        document.getElementById("prPriority").value = e1[5].trim();
                                                                        document.getElementById("prleader").value = e1[6].trim();
                                                                        document.getElementById("prdesc").value = e1[7].trim();
                                                                        document.getElementById("updateprcd").value = id;
                                                                    }

                                                                })
                                                            }
        </script>
    </body>
</html>