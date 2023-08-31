<%@page import="org.apache.catalina.tribes.util.Arrays"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dao.Holiday"%>
<!DOCTYPE html>
<html lang="en" data-layout="vertical" data-topbar="light" data-sidebar="dark" data-sidebar-size="lg" data-sidebar-image="none">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0">
        <meta name="description" content="Smarthr - Bootstrap Admin Template">
        <meta name="keywords" content="admin, estimates, bootstrap, business, corporate, creative, management, minimal, modern, accounts, invoice, html5, responsive, CRM, Projects">
        <meta name="author" content="Dreamguys - Bootstrap Admin Template">
        <meta name="robots" content="noindex, nofollow">
        <title>Holidays - HRMS admin template</title>

        <link rel="shortcut icon" type="image/x-icon" href="assets/img/favicon.png">

        <link rel="stylesheet" href="assets/css/bootstrap.min.css">

        <link rel="stylesheet" href="assets/plugins/fontawesome/css/fontawesome.min.css">
        <link rel="stylesheet" href="assets/plugins/fontawesome/css/all.min.css">

        <link rel="stylesheet" href="assets/css/line-awesome.min.css">
        <link rel="stylesheet" href="assets/css/material.css">

        <link rel="stylesheet" href="assets/css/font-awesome.min.css">

        <link rel="stylesheet" href="assets/css/line-awesome.min.css">

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
                                <h3 class="page-title">Holidays 2023</h3>
                                <ul class="breadcrumb">
                                    <li class="breadcrumb-item"><a href="admin-dashboard.html">Dashboard</a></li>
                                    <li class="breadcrumb-item active">Holidays</li>
                                </ul>
                            </div>
                            <div class="col-auto float-end ms-auto">
                                <a href="#" class="btn add-btn" data-bs-toggle="modal" data-bs-target="#add_holiday"><i class="fa fa-plus"></i> Add Holiday</a>
                            </div>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-md-12">
                            <div class="table-responsive">
                                <table class="table table-striped custom-table mb-0" id="tab1">
                                    <thead>
                                        <tr>
                                            <th>#</th>
                                            <th>Title </th>
                                            <th>Holiday Date</th>
                                            
                                            <th class="text-end">Action</th>
                                        </tr>
                                    </thead>
                                    <%      
                                        String holidayid="";
                                            Holiday dao=new Holiday();
                                            ArrayList<ArrayList<String>> arr=dao.selectAllHoliday();
                                            for(ArrayList<String> d : arr){
                                              holidayid=d.get(0);
                                    %>
                                    
                                    <tbody id="tbody">
                                        <tr class="holiday-upcoming">
                                            <td><%= d.get(0)%></td>
                                            <td><%= d.get(1)%></td>
                                            <td><%= d.get(2)%></td>
                                            <td class="text-end">
                                                <div class="dropdown dropdown-action">
                                                    <a href="#" class="action-icon dropdown-toggle" data-bs-toggle="dropdown" aria-expanded="false"><i class="material-icons">more_vert</i></a>
                                                    <div class="dropdown-menu dropdown-menu-up">
                                                        <a class="dropdown-item" href="#" data-bs-toggle="modal" data-bs-target="#edit_holiday" onclick=getmodeldata('<%=d.get(0)%>');> <i class="fa fa-pencil m-r-5"></i> Edit</a>
                                                        <a class="dropdown-item" href="#" data-bs-toggle="modal" data-bs-target="#delete_holiday"><i class="fa fa-trash-o m-r-5"></i> Delete</a>
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


                <div class="modal custom-modal fade" id="add_holiday" role="dialog">
                    <div class="modal-dialog modal-dialog-centered" role="document">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title">Add Holiday</h5>
                                <button type="button" class="close" data-bs-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                            </div>
                            <div class="modal-body">
                              <form action="../HolidayServlet?action=insert" method="post">
                                    <div class="form-group">
                                        <label>Holiday Name <span class="text-danger">*</span></label>
                                        <input class="form-control" type="text"  name="holidayName">
                                    </div>
                                    <div class="form-group">
                                        <label>Holiday Date <span class="text-danger">*</span></label>
                                        <div class="cal-icon"><input class="form-control datetimepicker" type="text" name="holidayDate"></div>
                                    </div>
                                    <div class="submit-section">
                                        <button type="submit" class="btn btn-primary submit-btn">Submit</button>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>


                <div class="modal custom-modal fade" id="edit_holiday" role="dialog">
                    <div class="modal-dialog modal-dialog-centered" role="document">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title">Edit Holiday</h5>
                                <button type="button" class="close" data-bs-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                            </div>
                            <div class="modal-body">
                               <form action="../HolidayServlet?action=update" method="post">
                                    <div class="form-group">
                                        <label>Holiday Name <span class="text-danger">*</span></label>
                                        <input class="form-control" value="New Year" type="text" name="updateholidayName" id="updateholidayName">
                                        <input type="hidden" class="form-control" id="updaterwid" name="updaterwid" value="" type="text">
                                    </div>
                                    <div class="form-group">
                                        <label>Holiday Date <span class="text-danger">*</span></label>
                                        <div class="cal-icon">
                                            <input class="form-control datetimepicker"  name="updateholidayDate"  id="updateholidayDate" value="01-01-2019" type="text"></div>
                                    </div>
                                    <div class="submit-section">
                                        <button class="btn btn-primary submit-btn">Save</button>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>


                <div class="modal custom-modal fade" id="delete_holiday" role="dialog">
                    <div class="modal-dialog modal-dialog-centered">
                        <div class="modal-content">
                            <div class="modal-body">
                                <div class="form-header">
                                    <h3>Delete Holiday</h3>
                                    <p>Are you sure want to delete?</p>
                                </div>
                                <div class="modal-btn delete-action">
                                    <div class="row">
                                        <div class="col-6">
                                            <a href="../HolidayServlet?action=delete&updaterwid=<%=holidayid%>" class="btn btn-primary continue-btn">Delete</a>
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

        <script src="assets/js/moment.min.js"></script>
        <script src="assets/js/bootstrap-datetimepicker.min.js"></script>

        <script src="assets/js/layout.js"></script>
        <script src="assets/js/theme-settings.js"></script>
        <script src="assets/js/greedynav.js"></script>

        <script src="assets/js/app.js"></script>
         <script>

                                                           function getmodeldata(id) {

                                                               $.ajax({
                                                                   url: '../HolidayServlet?action=search',
                                                                   type: 'POST',
                                                                   data: {'depid': id},
                                                                   success: function (e) {
                                                                      
                                                                       var e1  =e.split("#");
                                                                       document.getElementById("updateholidayName").value = e1[0].trim();
                                                                       document.getElementById("updateholidayDate").value = e1[1].trim();
                                                                       document.getElementById("updaterwid").value = id;
                                                                   }

                                                               })
                                                           }
                                                                </script>

    </body>
</html>