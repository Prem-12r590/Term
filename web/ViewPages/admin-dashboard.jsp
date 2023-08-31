<%-- 
    Document   : admin-dashboard
    Created on : May 23, 2023, 10:52:05 AM
    Author     : VIVEKJHA
--%>

<%@page import="com.sun.xml.internal.ws.util.StringUtils"%>
<%@page import="dao.ClientProjectDao"%>
<%@page import="dao.ClientDao"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dao.GetDropDownData"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>﻿<!DOCTYPE html>
<html lang="en" data-layout="vertical" data-topbar="light" data-sidebar="dark" data-sidebar-size="lg" data-sidebar-image="none">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0">
        <meta name="description" content="Smarthr - Bootstrap Admin Template">
        <meta name="keywords" content="admin, estimates, bootstrap, business, corporate, creative, management, minimal, modern, accounts, invoice, html5, responsive, CRM, Projects">
        <meta name="author" content="Dreamguys - Bootstrap Admin Template">
        <meta name="robots" content="noindex, nofollow">
        <title>Dashboard - HRMS admin template</title>

        <link rel="shortcut icon" type="image/x-icon" href="assets/img/favicon.png">

        <link rel="stylesheet" href="assets/css/bootstrap.min.css">

        <link rel="stylesheet" href="assets/plugins/fontawesome/css/fontawesome.min.css">
        <link rel="stylesheet" href="assets/plugins/fontawesome/css/all.min.css">

        <link rel="stylesheet" href="assets/css/line-awesome.min.css">
        <link rel="stylesheet" href="assets/css/material.css">

        <link rel="stylesheet" href="assets/css/font-awesome.min.css">

        <link rel="stylesheet" href="assets/css/line-awesome.min.css">

        <link rel="stylesheet" href="assets/plugins/morris/morris.css">

        <link rel="stylesheet" href="assets/css/style.css">
    </head>
    <body>

        <div class="main-wrapper">


            <%@include file="Header.jsp" %>
            <%@include file="Sidebar.jsp" %>



            <%    String Name1 = (String) session.getAttribute("admin");
                  String Name12=StringUtils.capitalize(Name1);
            %>

            <div class="page-wrapper">

                <div class="content container-fluid">

                    <div class="page-header">
                        <div class="row">
                            <div class="col-sm-12">
                                <h3 class="page-title">Welcome <%=Name12%></h3>
                                <ul class="breadcrumb">
                                    <li class="breadcrumb-item active">Dashboard</li>
                                </ul>
                            </div>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-md-6 col-sm-6 col-lg-6 col-xl-4">
                            <div class="card dash-widget">
                                <div class="card-body">
                                    <span class="dash-widget-icon"><i class="fa fa-cubes"></i></span>
                                    <div class="dash-widget-info">
                                        <h3>  <%
                                                        GetDropDownData GetData = new GetDropDownData();
                                                        int cnt1 = GetData.getProjet();
                                                        
                                                            out.println(cnt1);
                                                       
                                                    %>  </h3>
                                        <span>Projects</span>
                                    </div>
                                </div>
                            </div>
                        </div>
                        
                       
                        <div class="col-md-6 col-sm-6 col-lg-6 col-xl-4">
                            <div class="card dash-widget">
                                <div class="card-body">
                                    <span class="dash-widget-icon"><i class="fa fa-usd"></i></span>
                                    <div class="dash-widget-info">
                                        <h3>
                                               <%
                                                       
                                                        int cnt = GetData.getClient();
                                                        
                                                            out.println(cnt);
                                                       
                                                    %>     
                                        </h3>
                                        <span>Clients</span>
                                    </div>
                                </div>
                            </div>
                        </div>
                  
                        <div class="col-md-6 col-sm-6 col-lg-6 col-xl-4">
                            <div class="card dash-widget">
                                <div class="card-body">
                                    <span class="dash-widget-icon"><i class="fa fa-user"></i></span>
                                    <div class="dash-widget-info">
                                        <h3>
                                             <%
                                                       
                                                        int cnt12 = GetData.getEmployee();
                                                        
                                                            out.println(cnt12);
                                                       
                                                    %> 
                                        </h3>
                                        <span>Employees</span>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-12">
                            <div class="row">
                                <div class="col-md-6 text-center">
                                    <div class="card">
                                        <div class="card-body">
                                            <h3 class="card-title">Total Revenue</h3>
                                            <div id="bar-charts"></div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-6 text-center">
                                    <div class="card">
                                        <div class="card-body">
                                            <h3 class="card-title">Sales Overview</h3>
                                            <div id="line-charts"></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                 

                    
                    <div class="row">
                        <div class="col-md-6 d-flex">
                            <div class="card card-table flex-fill">
                                <div class="card-header">
                                    <h3 class="card-title mb-0">Clients</h3>
                                </div>
                                <div class="card-body">
                                    <div class="table-responsive">
                                        <table class="table custom-table mb-0">
                                            <thead>
                                                <tr>
                                                    <th>Name</th>
                                                    <th>Client Id</th>
                                                    <th>Email</th>
                                                    <th>Mobile</th>
                                                </tr>
                                            </thead>
                                              <%
                                        String clientcd = "";
                                        ClientDao dao = new ClientDao();
                                        ArrayList<ArrayList<String>> arr = dao.selectAllClient();
                                        for (ArrayList<String> d : arr) {
                                            clientcd = d.get(0);
                                      %>
                                            <tbody>
                                        <tr>
                                            <td>
                                                <%=d.get(1) +" " +d.get(2)%>
                                            </td>
                                            <td><%=d.get(0)%></td>
                                            <td><%=d.get(4)%></td>
                                            <td><%=d.get(6)%></td>
                                           
                                            
                                        </tr>

                                    </tbody>
                                    <%}%>
                                        </table>
                                    </div>
                                </div>
                                <div class="card-footer">
                                    <a href="clients-list.jsp">View all clients</a>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6 d-flex">
                            <div class="card card-table flex-fill">
                                <div class="card-header">
                                    <h3 class="card-title mb-0">Recent Projects</h3>
                                </div>
                                <div class="card-body">
                                    <div class="table-responsive">
                                        <table class="table custom-table mb-0">
                                            <thead>
                                                <tr>
                                                    <th>Project Name </th>
                                                    <th>Project Id</th>
                                                    <th>Team Lead</th>
                                                    <th>DeadLine Date</th>
                                                    <th>Priority</th>
                                                    
                                                </tr>
                                            </thead>
                                              <%
                                        String clprjt = "";
                                        ClientProjectDao dao1 = new ClientProjectDao();
                                        ArrayList<ArrayList<String>> arr1 = dao1.selectAllProject();
                                        for (ArrayList<String> d : arr1) {
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

                                            

                                           
                                        </tr>

                                    </tbody>
                                    <%}%>
                                        </table>
                                    </div>
                                </div>
                                <div class="card-footer">
                                    <a href="project-list.jsp">View all projects</a>
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

        <script src="assets/plugins/morris/morris.min.js"></script>
        <script src="assets/plugins/raphael/raphael.min.js"></script>
        <script src="assets/js/chart.js"></script>
        <script src="assets/js/greedynav.js"></script>

        <script src="assets/js/layout.js"></script>
        <script src="assets/js/theme-settings.js"></script>

        <script src="assets/js/app.js"></script>
    </body>
</html>