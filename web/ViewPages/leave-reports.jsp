<%-- 
    Document   : leave-reports
    Created on : Jun 1, 2023, 9:26:38 AM
    Author     : HP
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en" data-layout="vertical" data-topbar="light" data-sidebar="dark" data-sidebar-size="lg" data-sidebar-image="none">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0">
<meta name="description" content="Smarthr - Bootstrap Admin Template">
<meta name="keywords" content="admin, estimates, bootstrap, business, corporate, creative, management, minimal, modern, accounts, invoice, html5, responsive, CRM, Projects">
<meta name="author" content="Dreamguys - Bootstrap Admin Template">
<meta name="robots" content="noindex, nofollow">
<title>Leave Report - HRMS admin template</title>

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
<div class="row">
<div class="col">
<h3 class="page-title">Leave Report</h3>
<ul class="breadcrumb">
<li class="breadcrumb-item"><a href="admin-dashboard.html">Dashboard</a></li>
<li class="breadcrumb-item active">Leave Report</li>
</ul>
</div>
<div class="col-auto">
<a href="#" class="btn btn-primary">PDF</a>
</div>
</div>
</div>


<div class="row filter-row mb-4">
<div class="col-sm-6 col-md-3">
<div class="form-group form-focus">
<input class="form-control floating" type="text">
<label class="focus-label">Employee</label>
</div>
</div>
<div class="col-sm-6 col-md-3">
<div class="form-group form-focus select-focus">
<select class="select floating">
<option>Select Department</option>
<option>Designing</option>
<option>Development</option>
<option>Finance</option>
<option>Hr & Finance</option>
</select>
<label class="focus-label">Department</label>
</div>
</div>
<div class="col-sm-6 col-md-3">
<div class="form-group form-focus">
<div class="cal-icon">
<input class="form-control floating datetimepicker" type="text">
</div>
<label class="focus-label">From</label>
</div>
</div>
<div class="col-sm-6 col-md-3">
<div class="form-group form-focus">
<div class="cal-icon">
<input class="form-control floating datetimepicker" type="text">
</div>
<label class="focus-label">To</label>
</div>
</div>
<div class="col-sm-6 col-md-3">
<a href="#" class="btn btn-success w-100"> Search </a>
</div>
</div>

<div class="row">
<div class="col-md-12">
<div class="table-responsive">
<table class="table table-striped custom-table mb-0 datatable">
<thead>
<tr>
<th>Employee</th>
<th>Date</th>
<th>Department</th>
<th>Leave Type</th>
<th>No.of Days</th>
<th>Remaining Leave</th>
<th>Total Leaves</th>
<th>Total Leave Taken</th>
<th>Leave Carry Forward</th>
</tr>
</thead>
<tbody>
<tr>
<td>
<h2 class="table-avatar">
<a href="profile.html" class="avatar"><img alt="" src="assets/img/profiles/avatar-02.jpg"></a>
<a href="profile.html">John Doe <span>#0001</span></a>
</h2>
</td>
<td>20 Dec 2020</td>
<td>Design</td>
<td class="text-center">
<button class="btn btn-outline-info btn-sm">Sick Leave</button>
</td>
<td class="text-center"><span class="btn btn-danger btn-sm">05</span></td>
<td class="text-center"><span class="btn btn-warning btn-sm"><b>08</b></span></td>
<td class="text-center"><span class="btn btn-success btn-sm"><b>20</b></span></td>
<td class="text-center">12</td>
<td class="text-center">08</td>
</tr>
<tr>
<td>
<h2 class="table-avatar">
<a href="profile.html" class="avatar"><img alt="" src="assets/img/profiles/avatar-09.jpg"></a>
<a href="profile.html">Richard Miles <span>#0002</span></a>
</h2>
</td>
<td>21 Dec 2020</td>
<td>Web Developer</td>
<td class="text-center">
<button class="btn btn-outline-warning btn-sm">Parenting Leave</button>
</td>
<td class="text-center"><span class="btn btn-danger btn-sm">03</span></td>
<td class="text-center"><span class="btn btn-warning btn-sm"><b>08</b></span></td>
<td class="text-center"><span class="btn btn-success btn-sm"><b>20</b></span></td>
<td class="text-center">12</td>
<td class="text-center">05</td>
</tr>
<tr>
<td>
<h2 class="table-avatar">
<a href="profile.html" class="avatar"><img alt="" src="assets/img/profiles/avatar-10.jpg"></a>
<a href="profile.html">John Smith <span>#003</span></a>
</h2>
</td>
<td>22 Dec 2020</td>
<td>Android Developer</td>
<td class="text-center">
<button class="btn btn-outline-danger btn-sm">Emercency Leave</button>
</td>
<td class="text-center"><span class="btn btn-danger btn-sm">01</span></td>
<td class="text-center"><span class="btn btn-warning btn-sm"><b>09</b></span></td>
<td class="text-center"><span class="btn btn-success btn-sm"><b>20</b></span></td>
<td class="text-center">17</td>
<td class="text-center">03</td>
</tr>
<tr>
<td>
<h2 class="table-avatar">
<a href="profile.html" class="avatar"><img alt="" src="assets/img/profiles/avatar-05.jpg"></a>
<a href="profile.html">Mike Litorus <span>#004</span></a>
</h2>
</td>
<td>23 Dec 2020</td>
<td>IOS Developer</td>
<td class="text-center">
<button class="btn btn-outline-info btn-sm">Sick Leave</button>
</td>
<td class="text-center"><span class="btn btn-danger btn-sm">15</span></td>
<td class="text-center"><span class="btn btn-warning btn-sm"><b>05</b></span></td>
<td class="text-center"><span class="btn btn-success btn-sm"><b>20</b></span></td>
<td class="text-center">15</td>
<td class="text-center">05</td>
</tr>
<tr>
<td>
<h2 class="table-avatar">
<a href="profile.html" class="avatar"><img alt="" src="assets/img/profiles/avatar-11.jpg"></a>
<a href="profile.html">Wilmer Deluna <span>#005</span></a>
</h2>
</td>
<td>24 Dec 2020</td>
<td>Team Leader</td>
<td class="text-center">
<button class="btn btn-outline-info btn-sm">Sick Leave</button>
</td>
<td class="text-center"><span class="btn btn-danger btn-sm">10</span></td>
<td class="text-center"><span class="btn btn-warning btn-sm"><b>07</b></span></td>
<td class="text-center"><span class="btn btn-success btn-sm"><b>20</b></span></td>
<td class="text-center">18</td>
<td class="text-center">2</td>
</tr>
</tbody>
</table>
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
</body>
</html>