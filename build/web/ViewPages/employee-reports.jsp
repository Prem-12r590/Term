<%-- 
    Document   : employee-reports
    Created on : Jun 1, 2023, 9:22:40 AM
    Author     : HP
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>﻿<!DOCTYPE html>
<html lang="en" data-layout="vertical" data-topbar="light" data-sidebar="dark" data-sidebar-size="lg" data-sidebar-image="none">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0">
<meta name="description" content="Smarthr - Bootstrap Admin Template">
<meta name="keywords" content="admin, estimates, bootstrap, business, corporate, creative, management, minimal, modern, accounts, invoice, html5, responsive, CRM, Projects">
<meta name="author" content="Dreamguys - Bootstrap Admin Template">
<meta name="robots" content="noindex, nofollow">
<title>Employee Report - HRMS admin template</title>

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
<h3 class="page-title">Employee Report</h3>
<ul class="breadcrumb">
<li class="breadcrumb-item"><a href="admin-dashboard.html">Dashboard</a></li>
<li class="breadcrumb-item active">Employee Report</li>
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
<div class="d-grid">
<a href="#" class="btn btn-success"> Search </a>
</div>
</div>
</div>

<div class="row">
<div class="col-md-12">
<div class="table-responsive">
<table class="table table-striped custom-table mb-0 datatable">
<thead>
<tr>
<th>Employee Name</th>
<th>Employee Type</th>
<th>Email</th>
<th>Department</th>
<th>Designation</th>
<th>Joining Date</th>
<th>DOB</th>
<th>Martial Status</th>
<th>Gender</th>
<th>Terminated Date</th>
<th>Relieving Date</th>
<th>Salary</th>
<th>Address</th>
 <th>Contact Number</th>
<th>Emercency Contact Details</th>
<th>Experience</th>
<th class="text-center">Status</th>
</tr>
</thead>
<tbody>
<tr>
<td>
<h2 class="table-avatar">
<a href="profile.html" class="avatar"><img alt="" src="assets/img/profiles/avatar-02.jpg"></a>
<a href="profile.html" class="text-primary">John Doe <span>#0001</span></a>
</h2>
</td>
<td>Employee</td>
<td class="text-info"><a href="/cdn-cgi/l/email-protection" class="__cf_email__" data-cfemail="a2c8cdcaccc6cdc7e2c7dac3cfd2cec78cc1cdcf">[email&#160;protected]</a></td>
<td>Design</td>
<td>UI Design</td>
<td>20 Aug 2020</td>
<td>03 Mar 1992</td>
<td>Married</td>
<td>Male</td>
<td>-</td>
<td>-</td>
<td>$20000</td>
<td>
1861 Bayonne Ave, Manchester Township, NJ, 08759
</td>
<td>9876543210</td>
<td>7894561235</td>
<td>0 years 4 months and 9 days</td>
<td><button class="btn btn-outline-success btn-sm">Active</button></td>
</tr>
<tr>
<td>
<h2 class="table-avatar">
<a href="profile.html" class="avatar"><img alt="" src="assets/img/profiles/avatar-09.jpg"></a>
<a href="profile.html" class="text-primary">Richard Miles <span>#0002</span></a>
</h2>
</td>
<td>Employee</td>
<td class="text-info"><a href="/cdn-cgi/l/email-protection" class="__cf_email__" data-cfemail="691b000a01081b0d0400050c1a290c11080419050c470a0604">[email&#160;protected]</a></td>
<td>Android Developer</td>
<td>IT Support</td>
<td>01 Jul 2020</td>
<td>05 Dec 1979</td>
<td>Married</td>
<td>Male</td>
<td>-</td>
<td>-</td>
<td>$15000</td>
<td>
1861 Bayonne Ave, Manchester Township, NJ, 08759
</td>
<td>9876543210</td>
<td>7894561235</td>
<td>0 years 5 months and 24 days</td>
<td><button class="btn btn-outline-success btn-sm">Active</button></td>
</tr>
<tr>
<td>
<h2 class="table-avatar">
<a href="profile.html" class="avatar"><img alt="" src="assets/img/profiles/avatar-10.jpg"></a>
<a href="profile.html" class="text-primary">John Smith <span>#003</span></a>
</h2>
</td>
<td>Employee</td>
<td class="text-info"><a href="/cdn-cgi/l/email-protection" class="__cf_email__" data-cfemail="9df7f2f5f3eef0f4e9f5ddf8e5fcf0edf1f8b3fef2f0">[email&#160;protected]</a></td>
<td>IOS Developer</td>
<td>Development Manager</td>
<td>03 Sep 2020</td>
<td>16 Apr 1984</td>
<td>Married</td>
<td>Male</td>
<td>-</td>
<td>-</td>
<td>$27000</td>
<td>
1861 Bayonne Ave, Manchester Township, NJ, 08759
</td>
<td>9876543210</td>
<td>7894561235</td>
<td>0 years 3 months and 21 days</td>
<td><button class="btn btn-outline-success btn-sm">Active</button></td>
</tr>
<tr>
<td>
<h2 class="table-avatar">
<a href="profile.html" class="avatar"><img alt="" src="assets/img/profiles/avatar-05.jpg"></a>
<a href="profile.html" class="text-primary">Mike Litorus <span>#004</span></a>
</h2>
</td>
<td>Employee</td>
<td class="text-info"><a href="/cdn-cgi/l/email-protection" class="__cf_email__" data-cfemail="a8c5c1c3cdc4c1dcc7dadddbe8cdd0c9c5d8c4cd86cbc7c5">[email&#160;protected]</a></td>
<td>Web Developer</td>
<td>IT Support</td>
<td>15 Nov 2020</td>
<td>15 Jul 2005</td>
<td>Single</td>
<td>Male</td>
<td>-</td>
<td>-</td>
<td>$15000</td>
<td>
1861 Bayonne Ave, Manchester Township, NJ, 08759
</td>
<td>9876543210</td>
<td>7894561235</td>
<td>0 years 1 months and 9 days</td>
<td><button class="btn btn-outline-success btn-sm">Active</button></td>
</tr>
<tr>
<td>
<h2 class="table-avatar">
<a href="profile.html" class="avatar"><img alt="" src="assets/img/profiles/avatar-11.jpg"></a>
<a href="profile.html" class="text-primary">Wilmer Deluna <span>#005</span></a>
</h2>
</td>
<td>Employee</td>
<td class="text-info"><a href="/cdn-cgi/l/email-protection" class="__cf_email__" data-cfemail="f7809e9b9a928593929b829996b7928f969a879b92d994989a">[email&#160;protected]</a></td>
<td>Team Leader</td>
<td>Development Manager</td>
<td>01 Dec 2020</td>
<td>21 Jun 1984</td>
<td>Married</td>
<td>Male</td>
<td>-</td>
<td>-</td>
<td>$25000</td>
<td>
1861 Bayonne Ave, Manchester Township, NJ, 08759
</td>
<td>9876543210</td>
<td>7894561235</td>
<td>0 years 0 months and 24 days</td>
<td><button class="btn btn-outline-success btn-sm">Active</button></td>
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
<div data-simplebar="" class="h-100">
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

<script data-cfasync="false" src="../../cdn-cgi/scripts/5c5dd728/cloudflare-static/email-decode.min.js"></script><script src="assets/js/jquery-3.6.0.min.js"></script>

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