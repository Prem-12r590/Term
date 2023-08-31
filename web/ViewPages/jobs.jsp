<%-- 
    Document   : jobs
    Created on : May 25, 2023, 5:09:15 PM
    Author     : VIVEKJHA
--%>

<%@page import="dao.GetDropDownData"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dao.JobsDao"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%><!DOCTYPE html>
<html lang="en" data-layout="vertical" data-topbar="light" data-sidebar="dark" data-sidebar-size="lg" data-sidebar-image="none">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0">
        <meta name="description" content="Smarthr - Bootstrap Admin Template">
        <meta name="keywords" content="admin, estimates, bootstrap, business, corporate, creative, management, minimal, modern, accounts, invoice, html5, responsive, CRM, Projects">
        <meta name="author" content="Dreamguys - Bootstrap Admin Template">
        <meta name="robots" content="noindex, nofollow">
        <title>Jobs - HRMS admin template</title>

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
                                <h3 class="page-title">Jobs</h3>
                                <ul class="breadcrumb">
                                    <li class="breadcrumb-item"><a href="admin-dashboard.html">Dashboard</a></li>
                                    <li class="breadcrumb-item active">Jobs</li>
                                </ul>
                            </div>
                            <div class="col-auto float-end ms-auto">
                                <a href="#" class="btn add-btn" data-bs-toggle="modal" data-bs-target="#add_job"><i class="fa fa-plus"></i> Add Job</a>
                            </div>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-md-12">
                            <div class="table-responsive">
                                <table class="table table-striped custom-table mb-0 datatable">
                                    <thead>
                                        <tr>
                                            <th>Job ID</th>
                                            <th>Job Title</th>
                                            <th>Department</th>
                                            <th>Start Date</th>
                                            <th>Expire Date</th>
                                            <th class="text-center">Job Type</th>
                                            <th class="text-center">Status</th>
                                            
                                            <th class="text-end">Actions</th>
                                        </tr>
                                    </thead>
                                     <%      
                                           String jobcd="";
                                            JobsDao dao=new JobsDao();
                                            ArrayList<ArrayList<String>> arr=dao.selectAllJob();
                                            for(ArrayList<String> d : arr){
                                              jobcd=d.get(0);
                                    %>
                                    <tbody>
                                        <tr>
                                            <td><%=d.get(0)%></td>
                                            <td><%=d.get(1)%></td>
                                            <td><%=d.get(2)%></td>
                                            <td><%=d.get(7)%></td>
                                            <td><%=d.get(8)%></td>
                                            <td class="text-center">
                                               <%=d.get(9)%>
                                            </td>
                                            <td class="text-center">
                                                <%=d.get(10)%>
                                            </td>
                                            <td class="text-end">
                                                <div class="dropdown dropdown-action">
                                                    <a href="#" class="action-icon dropdown-toggle" data-bs-toggle="dropdown" aria-expanded="false"><i class="material-icons">more_vert</i></a>
                                                    <div class="dropdown-menu dropdown-menu-right">
                                                        <a href="#" class="dropdown-item" data-bs-toggle="modal" data-bs-target="#edit_job" onclick=getmodeldata('<%=d.get(0)%>'); ><i class="fa fa-pencil m-r-5"></i> Edit</a>
                                                        <a href="#" class="dropdown-item" data-bs-toggle="modal" data-bs-target="#delete_job"><i class="fa fa-trash-o m-r-5"></i> Delete</a>
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


                <div id="add_job" class="modal custom-modal fade" role="dialog">
                    <div class="modal-dialog modal-dialog-centered modal-lg" role="document">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title">Add Job</h5>
                                <button type="button" class="close" data-bs-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                            </div>
                            <div class="modal-body">
                               <form action="../JobsServlet?action=insert" method="post">
                                    <div class="row">
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label>Job Title</label>
                                                <input class="form-control" type="text" name="jobtitle">
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label>Department</label>
                                                <select class="select" name="jobdept">
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
                                    </div>
                                    <div class="row">
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label>Job Location</label>
                                                <input class="form-control" type="text" name="joblocation">
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label>No of Vacancies</label>
                                                <input class="form-control" type="text" name="NoOFVacancy">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label>Experience</label>
                                                <input class="form-control" type="text" name="jobexp">
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label>Age</label>
                                                <input class="form-control" type="text" name="ageForJob">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label>Salary From</label>
                                                <input type="text" class="form-control" name="salaryFrom">
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label>Salary To</label>
                                                <input type="text" class="form-control" name="salaryTo">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label>Job Type</label>
                                                <select class="select"name="jobtype">
                                                    <option value="Full Time">Full Time</option>
                                                    <option value="Part Time">Part Time</option>
                                                    <option value="Internship">Internship</option>
                                                    <option value="Remote">Remote</option>
                                                    
                                                </select>
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label>Status</label>
                                                <select class="select" name="jobstatus">
                                                    <option value="Open">Open</option>
                                                    <option value="Closed">Closed</option>
                                                    <option value="Cancelled">Cancelled</option>
                                                </select>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label>Start Date</label>
                                                <input type="text" class="form-control datetimepicker" name="jobstartdt">
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label>Expired Date</label>
                                                <input type="text" class="form-control datetimepicker" name="jobexpdt">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-12">
                                            <div class="form-group">
                                                <label>Description</label>
                                                <textarea class="form-control" name="jobdesc"></textarea>
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


                <div id="edit_job" class="modal custom-modal fade" role="dialog">
                    <div class="modal-dialog modal-dialog-centered modal-lg" role="document">
                        <button type="button" class="close" data-bs-dismiss="modal">&times;</button>
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title">Edit Job</h5>
                                <button type="button" class="close" data-bs-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                            </div>
                            <div class="modal-body">
                                <form action="../JobsServlet?action=update" method="post">
                                    
                                    <input type="hidden" name="updatejobcd" id="updatejobcd" >
                                    <div class="row">
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label>Job Title</label>
                                                <input class="form-control" type="text" name="jobtitle" id="jobtitle">
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label>Department</label>
                                                <select class="select" name="jobdept" id="jobdept">
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
                                    </div>
                                    <div class="row">
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label>Job Location</label>
                                                <input class="form-control" type="text" name="joblocation" id="joblocation">
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label>No of Vacancies</label>
                                                <input class="form-control" type="text" name="NoOFVacancy" id="NoOFVacancy">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label>Experience</label>
                                                <input class="form-control" type="text" name="jobexp" id="jobexp">
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label>Age</label>
                                                <input class="form-control" type="text" name="ageForJob" id="ageForJob">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label>Salary From</label>
                                                <input type="text" class="form-control" name="salaryFrom" id="salaryFrom">
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label>Salary To</label>
                                                <input type="text" class="form-control" name="salaryTo" id="salaryTo">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label>Job Type</label>
                                                <select class="select"name="jobtype" id="jobtype">
                                                    <option value="Full Time">Full Time</option>
                                                    <option value="Part Time">Part Time</option>
                                                    <option value="Internship">Internship</option>
                                                    <option value="Remote">Remote</option>
                                                    
                                                </select>
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label>Status</label>
                                                <select class="select" name="jobstatus" id="jobstatus">
                                                    <option value="Open">Open</option>
                                                    <option value="Closed">Closed</option>
                                                    <option value="Cancelled">Cancelled</option>
                                                </select>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label>Start Date</label>
                                                <input type="text" class="form-control datetimepicker" name="jobstartdt" id="jobstartdt">
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label>Expired Date</label>
                                                <input type="text" class="form-control datetimepicker" name="jobexpdt" id="jobexpdt">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-12">
                                            <div class="form-group">
                                                <label>Description</label>
                                                <textarea class="form-control" name="jobdesc" id="jobdesc"></textarea>
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


                <div class="modal custom-modal fade" id="delete_job" role="dialog">
                    <div class="modal-dialog modal-dialog-centered">
                        <div class="modal-content">
                            <div class="modal-body">
                                <div class="form-header">
                                    <h3>Delete Job</h3>
                                    <p>Are you sure want to delete?</p>
                                </div>
                                <div class="modal-btn delete-action">
                                    <div class="row">
                                        <div class="col-6">
                                           <a href="../JobsServlet?action=delete&resigncd=<%=jobcd%>"class="btn btn-primary continue-btn">Delete</a>
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
                                                                   url: '../JobsServlet?action=search',
                                                                   type: 'POST',
                                                                   data: {'depid': id},
                                                                   success: function (e) {
                                                                      
                                                                       var e1  =e.split("#");
                                                                       document.getElementById("jobtitle").value = e1[0].trim();
                                                                       document.getElementById("jobdept").value = e1[1].trim();
                                                                       $("#jobdept").change();
                                                                       document.getElementById("joblocation").value = e1[2].trim();
                                                                       document.getElementById("NoOFVacancy").value = e1[3].trim();
                                                                       document.getElementById("jobexp").value = e1[4].trim();
                                                                       document.getElementById("ageForJob").value = e1[5].trim();
                                                                       document.getElementById("salaryFrom").value = e1[6].trim();
                                                                       document.getElementById("salaryTo").value = e1[7].trim();
                                                                       document.getElementById("jobtype").value = e1[8].trim();
                                                                       document.getElementById("jobstatus").value = e1[9].trim();
                                                                       document.getElementById("jobstartdt").value = e1[10].trim();
                                                                       document.getElementById("jobexpdt").value = e1[11].trim();
                                                                       document.getElementById("jobdesc").value = e1[12].trim();
                                                                       
                                                                       document.getElementById("updatejobcd").value = id;
                                                                   }

                                                               })
                                                           }
                                                                </script>
    </body>
</html>