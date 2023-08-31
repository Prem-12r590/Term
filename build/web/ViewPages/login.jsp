<%-- 
    Document   : index
    Created on : 26 May, 2023, 1:24:29 PM
    Author     : omdix
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
        <title>Login - HRMS admin template</title>

        <link rel="shortcut icon" type="image/x-icon" href="assets/img/erp.jpg">

        <link rel="stylesheet" href="assets/css/bootstrap.min.css">

        <link rel="stylesheet" href="assets/plugins/fontawesome/css/fontawesome.min.css">
        <link rel="stylesheet" href="assets/plugins/fontawesome/css/all.min.css">

        <link rel="stylesheet" href="assets/css/line-awesome.min.css">
        <link rel="stylesheet" href="assets/css/material.css">

        <link rel="stylesheet" href="assets/css/font-awesome.min.css">

        <link rel="stylesheet" href="assets/css/line-awesome.min.css">

        <link rel="stylesheet" href="assets/css/font-awesome.min.css">

        <link rel="stylesheet" href="assets/css/style.css">
    </head>
    <body class="account-page">

        <div class="main-wrapper mt-4 pt-4">
            <div class="account-content">
                <div class="container">



                    <div class="account-box">
                        <div class="account-wrapper mt-3">
                            <div class="account-logo">
                                <img src="assets/img/logo2.png" style="height: 45px;width: 140px;" alt="HR Portal">
                                <h5>HR Portal</h5>
                            </div>



                            <form action="../LoginServlet" method="post">
                                <div class="form-group">
                                    <label>User Name</label>
                                    <input class="form-control" type="text" name="userName">
                                </div>
                                <div class="form-group">
                                    <div class="row">

                                        <div class="col-auto">

                                            password

                                        </div>
                                    </div>
                                    <div class="position-relative">
                                        <input class="form-control" type="password" id="password" name="userpass">
                                        <span class="fa fa-eye-slash" id="toggle-password"></span>
                                    </div>
                                </div>
                                <div class="form-group text-center">
                                    <button class="btn btn-primary account-btn" type="submit">Login</button>
                                </div>
                               
                            </form>

                        </div>
                    </div>
                </div>
            </div>
        </div>


        <script src="assets/js/jquery-3.6.0.min.js"></script>

        <script src="assets/js/bootstrap.bundle.min.js"></script>

        <script src="assets/js/layout.js"></script>
        <script src="assets/js/theme-settings.js"></script>
        <script src="assets/js/greedynav.js"></script>

        <script src="assets/js/app.js"></script>
    </body>
</html>