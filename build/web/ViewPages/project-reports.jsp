<%-- 
    Document   : project-reports
    Created on : Jun 1, 2023, 9:20:54 AM
    Author     : HP
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%><!DOCTYPE html>
<html lang="en" data-layout="vertical" data-topbar="light" data-sidebar="dark" data-sidebar-size="lg" data-sidebar-image="none">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0">
<meta name="description" content="Smarthr - Bootstrap Admin Template">
<meta name="keywords" content="admin, estimates, bootstrap, business, corporate, creative, management, minimal, modern, accounts, invoice, html5, responsive, CRM, Projects">
<meta name="author" content="Dreamguys - Bootstrap Admin Template">
<meta name="robots" content="noindex, nofollow">
<title>Reports - HRMS admin template</title>

<link rel="shortcut icon" type="image/x-icon" href="assets/img/favicon.png">

<link rel="stylesheet" href="assets/css/bootstrap.min.css">

<link rel="stylesheet" href="assets/plugins/fontawesome/css/fontawesome.min.css">
<link rel="stylesheet" href="assets/plugins/fontawesome/css/all.min.css">

<link rel="stylesheet" href="assets/css/line-awesome.min.css">
<link rel="stylesheet" href="assets/css/material.css">

<link rel="stylesheet" href="assets/css/font-awesome.min.css">

<link rel="stylesheet" href="assets/css/line-awesome.min.css">

<link rel="stylesheet" href="assets/css/select2.min.css">

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
<div class="col-sm-12">
<h3 class="page-title">Project Reports</h3>
<ul class="breadcrumb">
<li class="breadcrumb-item"><a href="admin-dashboard.html">Dashboard</a></li>
<li class="breadcrumb-item active">Project Reports</li>
</ul>
</div>
</div>
</div>



<div class="row filter-row">
<div class="col-sm-6 col-md-3">
<div class="form-group form-focus">
<div class="cal-icon">
<select class="form-control floating select">
<option>
Name1
</option>
<option>
Name2
</option>
</select>
</div>
<label class="focus-label">Project Name</label>
</div>
</div>
<div class="col-sm-6 col-md-3">
<div class="form-group form-focus">
<div class="cal-icon">
<select class="form-control floating select">
<option>
Active
</option>
<option>
Pending
</option>
</select>
</div>
<label class="focus-label">Status</label>
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
<th>#</th>
<th>Project Title</th>
<th>Client Name</th>
<th>Start Date</th>
<th>End Date</th>
<th>Status</th>
<th>Team</th>
</tr>
</thead>
<tbody>
<tr>
<td>1</td>
<td>
<a href="project-view.html">Hospital Administration</a>
</td>
<td>
<h2 class="table-avatar">
<a href="client-profile.html" class="avatar"><img src="assets/img/profiles/avatar-19.jpg" alt=""></a>
<a href="client-profile.html">Global Technologies</a>
</h2>
</td>
<td>9 Jan 2021</td>
<td>10 Apr 2021</td>
<td>
<div class="dropdown action-label">
<a href="#" class="btn btn-white btn-sm btn-rounded"><i class="fa fa-dot-circle-o text-success"></i> Active </a>
</div>
</td>
<td>
<ul class="team-members">
<li>
<a href="#" title="" data-bs-toggle="tooltip" data-original-title="John Doe"><img alt="" src="assets/img/profiles/avatar-02.jpg"></a>
</li>
<li>
<a href="#" title="" data-bs-toggle="tooltip" data-original-title="Richard Miles"><img alt="" src="assets/img/profiles/avatar-09.jpg"></a>
</li>
<li>
<a href="#" title="" data-bs-toggle="tooltip" data-original-title="John Smith"><img alt="" src="assets/img/profiles/avatar-10.jpg"></a>
</li>
<li>
<a href="#" title="" data-bs-toggle="tooltip" data-original-title="Mike Litorus"><img alt="" src="assets/img/profiles/avatar-05.jpg"></a>
</li>
<li>
<a href="#" class="all-users">+15</a>
</li>
</ul>
</td>
</tr>
<tr>
<td>2</td>
<td>
<a href="project-view.html">Office Management</a>
</td>
<td>
<h2 class="table-avatar">
<a href="client-profile.html" class="avatar"><img src="assets/img/profiles/avatar-29.jpg" alt=""></a>
<a href="client-profile.html">Delta Infotech</a>
</h2>
</td>
<td>10 Dec 2021</td>
<td>2 May 2021</td>
<td>
<div class="action-label">
<a href="" class="btn btn-white btn-sm btn-rounded"><i class="fa fa-dot-circle-o text-success"></i> Active </a>
</div>
</td>
<td>
<ul class="team-members text-nowrap">
<li>
<a href="#" title="" data-bs-toggle="tooltip" data-original-title="John Doe"><img alt="" src="assets/img/profiles/avatar-02.jpg"></a>
</li>
<li>
<a href="#" title="" data-bs-toggle="tooltip" data-original-title="Richard Miles"><img alt="" src="assets/img/profiles/avatar-09.jpg"></a>
</li>
<li>
<a href="#" title="" data-bs-toggle="tooltip" data-original-title="John Smith"><img alt="" src="assets/img/profiles/avatar-10.jpg"></a>
</li>
<li>
<a href="#" title="" data-bs-toggle="tooltip" data-original-title="Mike Litorus"><img alt="" src="assets/img/profiles/avatar-05.jpg"></a>
</li>
<li class="dropdown avatar-dropdown">
<a href="#" class="all-users dropdown-toggle" data-bs-toggle="dropdown" aria-expanded="false">+15</a>
<div class="dropdown-menu dropdown-menu-right">
<div class="avatar-group">
<a class="avatar avatar-xs" href="#">
<img alt="" src="assets/img/profiles/avatar-02.jpg">
</a>
<a class="avatar avatar-xs" href="#">
<img alt="" src="assets/img/profiles/avatar-09.jpg">
</a>
<a class="avatar avatar-xs" href="#">
<img alt="" src="assets/img/profiles/avatar-10.jpg">
</a>
<a class="avatar avatar-xs" href="#">
<img alt="" src="assets/img/profiles/avatar-05.jpg">
</a>
<a class="avatar avatar-xs" href="#">
<img alt="" src="assets/img/profiles/avatar-11.jpg">
</a>
<a class="avatar avatar-xs" href="#">
<img alt="" src="assets/img/profiles/avatar-12.jpg">
</a>
<a class="avatar avatar-xs" href="#">
<img alt="" src="assets/img/profiles/avatar-13.jpg">
</a>
<a class="avatar avatar-xs" href="#">
<img alt="" src="assets/img/profiles/avatar-01.jpg">
</a>
<a class="avatar avatar-xs" href="#">
<img alt="" src="assets/img/profiles/avatar-16.jpg">
</a>
</div>
<div class="avatar-pagination">
<ul class="pagination">
<li class="page-item">
<a class="page-link" href="#" aria-label="Previous">
<span aria-hidden="true">«</span>
<span class="visually-hidden">Previous</span>
</a>
</li>
<li class="page-item"><a class="page-link" href="#">1</a></li>
<li class="page-item"><a class="page-link" href="#">2</a></li>
<li class="page-item">
<a class="page-link" href="#" aria-label="Next">
<span aria-hidden="true">»</span>
<span class="visually-hidden">Next</span>
</a>
</li>
</ul>
</div>
</div>
</li>
</ul>
</td>
</tr>
</tbody>
</table>
</div>
</div>
</div>

</div>

</div>

</div>

<div class="settings-icon">
<span data-bs-toggle="offcanvas" data-bs-target="#theme-settings-offcanvas" aria-controls="theme-settings-offcanvas"><i class="las la-cog"></i></span>
</div>
<div class="offcanvas offcanvas-end border-0 " tabindex="-1" id="theme-settings-offcanvas">
<div class="sidebar-headerset">
<div class="sidebar-headersets">
<h2>Customizer</h2>
<h3>Customize your overview Page layout</h3>
</div>
<div class="sidebar-headerclose">
<a data-bs-dismiss="offcanvas" aria-label="Close"><img src="assets/img/close.png" alt="img"></a>
</div>
</div>
<div class="offcanvas-body p-0">
<div data-simplebar class="h-100">
<div class="settings-mains">
<div class="layout-head">
<h5>Layout</h5>
<h6>Choose your layout</h6>
</div>
<div class="row">
<div class="col-4">
<div class="form-check card-radio p-0">
<input id="customizer-layout01" name="data-layout" type="radio" value="vertical" class="form-check-input">
<label class="form-check-label avatar-md w-100" for="customizer-layout01">
<img src="assets/img/vertical.png" alt="img">
</label>
</div>
<h5 class="fs-13 text-center mt-2">Vertical</h5>
</div>
<div class="col-4">
<div class="form-check card-radio p-0">
<input id="customizer-layout02" name="data-layout" type="radio" value="horizontal" class="form-check-input">
<label class="form-check-label  avatar-md w-100" for="customizer-layout02">
<img src="assets/img/horizontal.png" alt="img">
</label>
</div>
<h5 class="fs-13 text-center mt-2">Horizontal</h5>
</div>
<div class="col-4">
<div class="form-check card-radio p-0">
<input id="customizer-layout03" name="data-layout" type="radio" value="twocolumn" class="form-check-input">
<label class="form-check-label  avatar-md w-100" for="customizer-layout03">
<img src="assets/img/two-col.png" alt="img">
</label>
</div>
<h5 class="fs-13 text-center mt-2">Two Column</h5>
</div>
</div>
<div class="layout-head pt-3">
<h5>Color Scheme</h5>
<h6>Choose Light or Dark Scheme.</h6>
</div>
<div class="colorscheme-cardradio">
<div class="row">
<div class="col-4">
<div class="form-check card-radio p-0">
<input class="form-check-input" type="radio" name="data-layout-mode" id="layout-mode-orange" value="orange">
<label class="form-check-label  avatar-md w-100 " for="layout-mode-orange">
<img src="assets/img/vertical.png" alt="img">
</label>
</div>
<h5 class="fs-13 text-center mt-2">Orange</h5>
</div>
<div class="col-4">
<div class="form-check card-radio p-0">
<input class="form-check-input" type="radio" name="data-layout-mode" id="layout-mode-light" value="light">
<label class="form-check-label  avatar-md w-100" for="layout-mode-light">
<img src="assets/img/vertical.png" alt="img">
</label>
</div>
<h5 class="fs-13 text-center mt-2">Light</h5>
</div>
<div class="col-4">
<div class="form-check card-radio dark  p-0 ">
<input class="form-check-input" type="radio" name="data-layout-mode" id="layout-mode-dark" value="dark">
<label class="form-check-label avatar-md w-100 " for="layout-mode-dark">
<img src="assets/img/vertical.png" alt="img">
</label>
</div>
<h5 class="fs-13 text-center mt-2">Dark</h5>
</div>
<div class="col-4">
<div class="form-check card-radio blue  p-0 ">
<input class="form-check-input" type="radio" name="data-layout-mode" id="layout-mode-blue" value="blue">
<label class="form-check-label  avatar-md w-100" for="layout-mode-blue">
<img src="assets/img/vertical.png" alt="img">
</label>
</div>
<h5 class="fs-13 text-center mt-2">Blue</h5>
</div>
<div class="col-4">
<div class="form-check card-radio maroon p-0">
<input class="form-check-input" type="radio" name="data-layout-mode" id="layout-mode-maroon" value="maroon">
<label class="form-check-label  avatar-md w-100 " for="layout-mode-maroon">
<img src="assets/img/vertical.png" alt="img">
</label>
</div>
<h5 class="fs-13 text-center mt-2">Maroon</h5>
</div>
<div class="col-4">
<div class="form-check card-radio purple p-0">
<input class="form-check-input" type="radio" name="data-layout-mode" id="layout-mode-purple" value="purple">
<label class="form-check-label  avatar-md w-100 " for="layout-mode-purple">
<img src="assets/img/vertical.png" alt="img">
</label>
</div>
<h5 class="fs-13 text-center mt-2">Purple</h5>
</div>
</div>
</div>
<div id="layout-width">
<div class="layout-head pt-3">
<h5>Layout Width</h5>
<h6>Choose Fluid or Boxed layout.</h6>
</div>
<div class="row">
<div class="col-4">
<div class="form-check card-radio p-0">
<input class="form-check-input" type="radio" name="data-layout-width" id="layout-width-fluid" value="fluid">
<label class="form-check-label avatar-md w-100" for="layout-width-fluid">
<img src="assets/img/vertical.png" alt="img">
</label>
</div>
<h5 class="fs-13 text-center mt-2">Fluid</h5>
</div>
<div class="col-4">
<div class="form-check card-radio p-0 ">
<input class="form-check-input" type="radio" name="data-layout-width" id="layout-width-boxed" value="boxed">
<label class="form-check-label avatar-md w-100 px-2" for="layout-width-boxed">
<img src="assets/img/boxed.png" alt="img">
</label>
</div>
<h5 class="fs-13 text-center mt-2">Boxed</h5>
</div>
</div>
</div>
<div id="layout-position">
<div class="layout-head pt-3">
<h5>Layout Position</h5>
<h6>Choose Fixed or Scrollable Layout Position.</h6>
</div>
<div class="btn-group bor-rad-50 overflow-hidden radio" role="group">
<input type="radio" class="btn-check" name="data-layout-position" id="layout-position-fixed" value="fixed">
<label class="btn btn-light w-sm" for="layout-position-fixed">Fixed</label>
<input type="radio" class="btn-check" name="data-layout-position" id="layout-position-scrollable" value="scrollable">
<label class="btn btn-light w-sm ms-0" for="layout-position-scrollable">Scrollable</label>
</div>
</div>
<div class="layout-head pt-3">
<h5>Topbar Color</h5>
<h6>Choose Light or Dark Topbar Color.</h6>
</div>
<div class="row">
<div class="col-4">
<div class="form-check card-radio  p-0">
<input class="form-check-input" type="radio" name="data-topbar" id="topbar-color-light" value="light">
<label class="form-check-label avatar-md w-100" for="topbar-color-light">
<img src="assets/img/vertical.png" alt="img">
</label>
</div>
<h5 class="fs-13 text-center mt-2">Light</h5>
</div>
<div class="col-4">
<div class="form-check card-radio p-0">
<input class="form-check-input" type="radio" name="data-topbar" id="topbar-color-dark" value="dark">
<label class="form-check-label  avatar-md w-100" for="topbar-color-dark">
<img src="assets/img/dark.png" alt="img">
</label>
</div>
<h5 class="fs-13 text-center mt-2">Dark</h5>
</div>
</div>
<div id="sidebar-size">
<div class="layout-head pt-3">
<h5>Sidebar Size</h5>
<h6>Choose a size of Sidebar.</h6>
</div>
<div class="row">
<div class="col-4">
<div class="form-check sidebar-setting card-radio  p-0 ">
<input class="form-check-input" type="radio" name="data-sidebar-size" id="sidebar-size-default" value="lg">
<label class="form-check-label avatar-md w-100" for="sidebar-size-default">
<img src="assets/img/vertical.png" alt="img">
</label>
</div>
<h5 class="fs-13 text-center mt-2">Default</h5>
</div>
<div class="col-4">
<div class="form-check sidebar-setting card-radio p-0">
<input class="form-check-input" type="radio" name="data-sidebar-size" id="sidebar-size-compact" value="md">
<label class="form-check-label  avatar-md w-100" for="sidebar-size-compact">
<img src="assets/img/compact.png" alt="img">
</label>
</div>
<h5 class="fs-13 text-center mt-2">Compact</h5>
</div>
<div class="col-4">
<div class="form-check sidebar-setting card-radio p-0 ">
<input class="form-check-input" type="radio" name="data-sidebar-size" id="sidebar-size-small-hover" value="sm-hover">
<label class="form-check-label avatar-md w-100" for="sidebar-size-small-hover">
<img src="assets/img/small-hover.png" alt="img">
</label>
</div>
<h5 class="fs-13 text-center mt-2">Small Hover View</h5>
</div>
</div>
</div>
<div id="sidebar-view">
<div class="layout-head pt-3">
<h5>Sidebar View</h5>
<h6>Choose Default or Detached Sidebar view.</h6>
</div>
<div class="row">
<div class="col-4">
<div class="form-check sidebar-setting card-radio  p-0">
<input class="form-check-input" type="radio" name="data-layout-style" id="sidebar-view-default" value="default">
<label class="form-check-label avatar-md w-100" for="sidebar-view-default">
<img src="assets/img/compact.png" alt="img">
</label>
</div>
<h5 class="fs-13 text-center mt-2">Default</h5>
</div>
<div class="col-4">
<div class="form-check sidebar-setting card-radio p-0">
<input class="form-check-input" type="radio" name="data-layout-style" id="sidebar-view-detached" value="detached">
<label class="form-check-label  avatar-md w-100" for="sidebar-view-detached">
<img src="assets/img/detached.png" alt="img">
</label>
</div>
<h5 class="fs-13 text-center mt-2">Detached</h5>
</div>
</div>
</div>
<div id="sidebar-color">
<div class="layout-head pt-3">
<h5>Sidebar Color</h5>
<h6>Choose a color of Sidebar.</h6>
</div>
<div class="row">
<div class="col-4">
<div class="form-check sidebar-setting card-radio p-0" data-bs-toggle="collapse" data-bs-target="#collapseBgGradient.show">
<input class="form-check-input" type="radio" name="data-sidebar" id="sidebar-color-light" value="light">
<label class="form-check-label  avatar-md w-100" for="sidebar-color-light">
<span class="bg-light bg-sidebarcolor"></span>
</label>
</div>
<h5 class="fs-13 text-center mt-2">Light</h5>
</div>
<div class="col-4">
<div class="form-check sidebar-setting card-radio p-0" data-bs-toggle="collapse" data-bs-target="#collapseBgGradient.show">
<input class="form-check-input" type="radio" name="data-sidebar" id="sidebar-color-dark" value="dark">
<label class="form-check-label  avatar-md w-100" for="sidebar-color-dark">
<span class="bg-darks bg-sidebarcolor"></span>
</label>
</div>
<h5 class="fs-13 text-center mt-2">Dark</h5>
</div>
<div class="col-4">
<div class="form-check sidebar-setting card-radio p-0">
<input class="form-check-input" type="radio" name="data-sidebar" id="sidebar-color-gradient" value="gradient">
<label class="form-check-label avatar-md w-100" for="sidebar-color-gradient">
<span class="bg-gradients bg-sidebarcolor"></span>
</label>
</div>
<h5 class="fs-13 text-center mt-2">Gradient</h5>
</div>
<div class="col-4 d-none">
<button class="btn btn-link avatar-md w-100 p-0 overflow-hidden border collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseBgGradient" aria-expanded="false" aria-controls="collapseBgGradient">
<span class="d-flex gap-1 h-100">
<span class="flex-shrink-0">
<span class="bg-vertical-gradient d-flex h-100 flex-column gap-1 p-1">
<span class="d-block p-1 px-2 bg-soft-light rounded mb-2"></span>
<span class="d-block p-1 px-2 pb-0 bg-soft-light"></span>
<span class="d-block p-1 px-2 pb-0 bg-soft-light"></span>
<span class="d-block p-1 px-2 pb-0 bg-soft-light"></span>
</span>
</span>
<span class="flex-grow-1">
<span class="d-flex h-100 flex-column">
<span class="bg-light d-block p-1"></span>
<span class="bg-light d-block p-1 mt-auto"></span>
</span>
</span>
</span>
</button>
<h5 class="fs-13 text-center mt-2">Gradient</h5>
</div>
</div>
<div class="collapse d-none" id="collapseBgGradient">
<div class="d-flex gap-2 flex-wrap img-switch p-2 px-3 bg-light rounded">
<div class="form-check sidebar-setting card-radio">
<input class="form-check-input" type="radio" name="data-sidebar" id="sidebar-color-gradient" value="gradient">
<label class="form-check-label p-0 avatar-xs rounded-circle" for="sidebar-color-gradient">
<span class="avatar-title rounded-circle bg-vertical-gradient"></span>
</label>
</div>
<div class="form-check sidebar-setting card-radio">
<input class="form-check-input" type="radio" name="data-sidebar" id="sidebar-color-gradient-2" value="gradient-2">
<label class="form-check-label p-0 avatar-xs rounded-circle" for="sidebar-color-gradient-2">
<span class="avatar-title rounded-circle bg-vertical-gradient-2"></span>
</label>
</div>
<div class="form-check sidebar-setting card-radio">
<input class="form-check-input" type="radio" name="data-sidebar" id="sidebar-color-gradient-3" value="gradient-3">
<label class="form-check-label p-0 avatar-xs rounded-circle" for="sidebar-color-gradient-3">
<span class="avatar-title rounded-circle bg-vertical-gradient-3"></span>
</label>
</div>
<div class="form-check sidebar-setting card-radio">
<input class="form-check-input" type="radio" name="data-sidebar" id="sidebar-color-gradient-4" value="gradient-4">
<label class="form-check-label p-0 avatar-xs rounded-circle" for="sidebar-color-gradient-4">
<span class="avatar-title rounded-circle bg-vertical-gradient-4"></span>
</label>
</div>
</div>
</div>
</div>
</div>
</div>
</div>
<div class="offcanvas-footer border-top p-3 text-center">
<div class="row">
<div class="col-6">
<button type="button" class="btn btn-light w-100 bor-rad-50" id="reset-layout">Reset</button>
</div>
<div class="col-6">
<a href="https://themeforest.net/item/smarthr-bootstrap-admin-panel-template/21153150" target="_blank" class="btn btn-primary w-100 bor-rad-50">Buy Now</a>
</div>
</div>
</div>
</div>

<script src="assets/js/jquery-3.6.0.min.js"></script>

<script src="assets/js/bootstrap.bundle.min.js"></script>

<script src="assets/js/select2.min.js"></script>

<script src="assets/js/jquery.slimscroll.min.js"></script>

<script src="assets/js/layout.js"></script>
<script src="assets/js/theme-settings.js"></script>
<script src="assets/js/greedynav.js"></script>

<script src="assets/js/app.js"></script>
</body>
</html>