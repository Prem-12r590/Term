<%-- 
    Document   : policies
    Created on : May 11, 2023, 12:11:21 PM
    Author     : VIVEKJHA
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="dao.PoliciesDao"%>
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
        <title>Policies - HRMS admin template</title>

        <link rel="shortcut icon" type="image/x-icon" href="assets/img/favicon.png">

        <link rel="stylesheet" href="assets/css/bootstrap.min.css">

        <link rel="stylesheet" href="assets/plugins/fontawesome/css/fontawesome.min.css">
        <link rel="stylesheet" href="assets/plugins/fontawesome/css/all.min.css">

        <link rel="stylesheet" href="assets/css/line-awesome.min.css">
        <link rel="stylesheet" href="assets/css/material.css">

        <link rel="stylesheet" href="assets/css/font-awesome.min.css">

        <link rel="stylesheet" href="assets/css/line-awesome.min.css">

        <link rel="stylesheet" href="assets/css/select2.min.css">

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

            <div class="two-col-bar" id="two-col-bar">
                <div class="sidebar sidebar-twocol">
                    <div class="sidebar-left slimscroll">
                        <div class="nav flex-column nav-pills" id="v-pills-tab" role="tablist" aria-orientation="vertical">
                            <a class="nav-link" id="v-pills-dashboard-tab" title="Dashboard" data-bs-toggle="pill" href="#v-pills-dashboard" role="tab" aria-controls="v-pills-dashboard" aria-selected="true">
                                <span class="material-icons-outlined">
                                    home
                                </span>
                            </a>
                            <a class="nav-link" id="v-pills-apps-tab" title="Apps" data-bs-toggle="pill" href="#v-pills-apps" role="tab" aria-controls="v-pills-apps" aria-selected="false">
                                <span class="material-icons-outlined">
                                    dashboard
                                </span>
                            </a>
                            <a class="nav-link " id="v-pills-employees-tab" title="Employees" data-bs-toggle="pill" href="#v-pills-employees" role="tab" aria-controls="v-pills-employees" aria-selected="false">
                                <span class="material-icons-outlined">
                                    people
                                </span>
                            </a>
                            <a class="nav-link " id="v-pills-clients-tab" title="Clients" data-bs-toggle="pill" href="#v-pills-clients" role="tab" aria-controls="v-pills-clients" aria-selected="false">
                                <span class="material-icons-outlined">
                                    person
                                </span>
                            </a>
                            <a class="nav-link " id="v-pills-projects-tab" title="Projects" data-bs-toggle="pill" href="#v-pills-projects" role="tab" aria-controls="v-pills-projects" aria-selected="false">
                                <span class="material-icons-outlined">
                                    topic
                                </span>
                            </a>
                            <a class="nav-link " id="v-pills-leads-tab" title="Leads" data-bs-toggle="pill" href="#v-pills-leads" role="tab" aria-controls="v-pills-leads" aria-selected="false">
                                <span class="material-icons-outlined">
                                    leaderboard
                                </span>
                            </a>
                            <a class="nav-link " id="v-pills-tickets-tab" title="Tickets" data-bs-toggle="pill" href="#v-pills-tickets" role="tab" aria-controls="v-pills-tickets" aria-selected="false">
                                <span class="material-icons-outlined">
                                    confirmation_number
                                </span>
                            </a>
                            <a class="nav-link " id="v-pills-sales-tab" title="Sales" data-bs-toggle="pill" href="#v-pills-sales" role="tab" aria-controls="v-pills-sales" aria-selected="false">
                                <span class="material-icons-outlined">
                                    shopping_bag
                                </span>
                            </a>
                            <a class="nav-link " id="v-pills-accounting-tab" title="Accounting" data-bs-toggle="pill" href="#v-pills-accounting" role="tab" aria-controls="v-pills-accounting" aria-selected="false">
                                <span class="material-icons-outlined">
                                    account_balance_wallet
                                </span>
                            </a>
                            <a class="nav-link " id="v-pills-payroll-tab" title="Payroll" data-bs-toggle="pill" href="#v-pills-payroll" role="tab" aria-controls="v-pills-payroll" aria-selected="false">
                                <span class="material-icons-outlined">
                                    request_quote
                                </span>
                            </a>
                            <a class="nav-link active" id="v-pills-policies-tab" title="Policies" data-bs-toggle="pill" href="#v-pills-policies" role="tab" aria-controls="v-pills-policies" aria-selected="false">
                                <span class="material-icons-outlined">
                                    verified_user
                                </span>
                            </a>
                            <a class="nav-link" id="v-pills-reports-tab" title="Reports" data-bs-toggle="pill" href="#v-pills-reports" role="tab" aria-controls="v-pills-reports" aria-selected="false">
                                <span class="material-icons-outlined">
                                    report_gmailerrorred
                                </span>
                            </a>
                            <a class="nav-link" id="v-pills-performance-tab" title="Performance" data-bs-toggle="pill" href="#v-pills-performance" role="tab" aria-controls="v-pills-performance" aria-selected="false">
                                <span class="material-icons-outlined">
                                    shutter_speed
                                </span>
                            </a>
                            <a class="nav-link" id="v-pills-goals-tab" title="Goals" data-bs-toggle="pill" href="#v-pills-goals" role="tab" aria-controls="v-pills-goals" aria-selected="false">
                                <span class="material-icons-outlined">
                                    track_changes
                                </span>
                            </a>
                            <a class="nav-link" id="v-pills-training-tab" title="Training" data-bs-toggle="pill" href="#v-pills-training" role="tab" aria-controls="v-pills-training" aria-selected="false">
                                <span class="material-icons-outlined">
                                    checklist_rtl
                                </span>
                            </a>
                            <a class="nav-link" id="v-pills-promotion-tab" title="Promotions" data-bs-toggle="pill" href="#v-pills-promotion" role="tab" aria-controls="v-pills-promotion" aria-selected="false">
                                <span class="material-icons-outlined">
                                    auto_graph
                                </span>
                            </a>
                            <a class="nav-link" id="v-pills-resignation-tab" title="Resignation" data-bs-toggle="pill" href="#v-pills-resignation" role="tab" aria-controls="v-pills-resignation" aria-selected="false">
                                <span class="material-icons-outlined">
                                    do_not_disturb_alt
                                </span>
                            </a>
                            <a class="nav-link" id="v-pills-termination-tab" title="Termination" data-bs-toggle="pill" href="#v-pills-termination" role="tab" aria-controls="v-pills-termination" aria-selected="false">
                                <span class="material-icons-outlined">
                                    indeterminate_check_box
                                </span>
                            </a>
                            <a class="nav-link" id="v-pills-assets-tab" title="Assets" data-bs-toggle="pill" href="#v-pills-assets" role="tab" aria-controls="v-pills-assets" aria-selected="false">
                                <span class="material-icons-outlined">
                                    web_asset
                                </span>
                            </a>
                            <a class="nav-link" id="v-pills-jobs-tab" title="Jobs" data-bs-toggle="pill" href="#v-pills-jobs" role="tab" aria-controls="v-pills-jobs" aria-selected="false">
                                <span class="material-icons-outlined">
                                    work_outline
                                </span>
                            </a>
                            <a class="nav-link" id="v-pills-knowledgebase-tab" title="Knowledgebase" data-bs-toggle="pill" href="#v-pills-knowledgebase" role="tab" aria-controls="v-pills-knowledgebase" aria-selected="false">
                                <span class="material-icons-outlined">
                                    school
                                </span>
                            </a>
                            <a class="nav-link" id="v-pills-activities-tab" title="Activities" data-bs-toggle="pill" href="#v-pills-activities" role="tab" aria-controls="v-pills-activities" aria-selected="false">
                                <span class="material-icons-outlined">
                                    toggle_off
                                </span>
                            </a>
                            <a class="nav-link" id="v-pills-users-tab" title="Users" data-bs-toggle="pill" href="#v-pills-users" role="tab" aria-controls="v-pills-users" aria-selected="false">
                                <span class="material-icons-outlined">
                                    group_add
                                </span>
                            </a>
                            <a class="nav-link" id="v-pills-settings-tab" title="Settings" data-bs-toggle="pill" href="#v-pills-settings" role="tab" aria-controls="v-pills-settings" aria-selected="false">
                                <span class="material-icons-outlined">
                                    settings
                                </span>
                            </a>
                            <a class="nav-link" id="v-pills-profile-tab" title="Profile" data-bs-toggle="pill" href="#v-pills-profile" role="tab" aria-controls="v-pills-profile" aria-selected="false">
                                <span class="material-icons-outlined">
                                    manage_accounts
                                </span>
                            </a>
                            <a class="nav-link" id="v-pills-authentication-tab" title="Authentication" data-bs-toggle="pill" href="#v-pills-authentication" role="tab" aria-controls="v-pills-authentication" aria-selected="false">
                                <span class="material-icons-outlined">
                                    perm_contact_calendar
                                </span>
                            </a>
                            <a class="nav-link" id="v-pills-errorpages-tab" title="Error Pages" data-bs-toggle="pill" href="#v-pills-errorpages" role="tab" aria-controls="v-pills-errorpages" aria-selected="false">
                                <span class="material-icons-outlined">
                                    announcement
                                </span>
                            </a>
                            <a class="nav-link" id="v-pills-subscriptions-tab" title="Subscriptions" data-bs-toggle="pill" href="#v-pills-subscriptions" role="tab" aria-controls="v-pills-subscriptions" aria-selected="false">
                                <span class="material-icons-outlined">
                                    loyalty
                                </span>
                            </a>
                            <a class="nav-link" id="v-pills-pages-tab" title="Pages" data-bs-toggle="pill" href="#v-pills-pages" role="tab" aria-controls="v-pills-pages" aria-selected="false">
                                <span class="material-icons-outlined">
                                    layers
                                </span>
                            </a>
                            <a class="nav-link" id="v-pills-forms-tab" title="Forms" data-bs-toggle="pill" href="#v-pills-forms" role="tab" aria-controls="v-pills-forms" aria-selected="false">
                                <span class="material-icons-outlined">
                                    view_day
                                </span>
                            </a>
                            <a class="nav-link" id="v-pills-tables-tab" title="Tables" data-bs-toggle="pill" href="#v-pills-tables" role="tab" aria-controls="v-pills-tables" aria-selected="false">
                                <span class="material-icons-outlined">
                                    table_rows
                                </span>
                            </a>
                            <a class="nav-link" id="v-pills-documentation-tab" title="Documentation" data-bs-toggle="pill" href="#v-pills-documentation" role="tab" aria-controls="v-pills-documentation" aria-selected="false">
                                <span class="material-icons-outlined">
                                    description
                                </span>
                            </a>
                            <a class="nav-link" id="v-pills-changelog-tab" title="Changelog" data-bs-toggle="pill" href="#v-pills-changelog" role="tab" aria-controls="v-pills-changelog" aria-selected="false">
                                <span class="material-icons-outlined">
                                    sync_alt
                                </span>
                            </a>
                            <a class="nav-link" id="v-pills-multilevel-tab" title="Multilevel" data-bs-toggle="pill" href="#v-pills-multilevel" role="tab" aria-controls="v-pills-multilevel" aria-selected="false">
                                <span class="material-icons-outlined">
                                    library_add_check
                                </span>
                            </a>
                        </div>
                    </div>
                    <div class="sidebar-right">
                        <div class="tab-content" id="v-pills-tabContent">
                            <div class="tab-pane fade" id="v-pills-dashboard" role="tabpanel" aria-labelledby="v-pills-dashboard-tab">
                                <p>Dashboard</p>
                                <ul>
                                    <li>
                                        <a href="admin-dashboard.html">Admin Dashboard</a>
                                    </li>
                                    <li>
                                        <a href="employee-dashboard.html">Employee Dashboard</a>
                                    </li>
                                </ul>
                            </div>
                            <div class="tab-pane fade" id="v-pills-apps" role="tabpanel" aria-labelledby="v-pills-apps-tab">
                                <p>App</p>
                                <ul>
                                    <li>
                                        <a href="chat.html">Chat</a>
                                    </li>
                                    <li class="sub-menu">
                                        <a href="#">Calls <span class="menu-arrow"></span></a>
                                        <ul style="display: none;">
                                            <li><a href="voice-call.html">Voice Call</a></li>
                                            <li><a href="video-call.html">Video Call</a></li>
                                            <li><a href="outgoing-call.html">Outgoing Call</a></li>
                                            <li><a href="incoming-call.html">Incoming Call</a></li>
                                        </ul>
                                    </li>
                                    <li>
                                        <a href="calender.html">Calendar</a>
                                    </li>
                                    <li>
                                        <a href="contacts.html">Contacts</a>
                                    </li>
                                    <li>
                                        <a href="inbox.html">Email</a>
                                    </li>
                                    <li>
                                        <a href="file-manager.html">File Manager</a>
                                    </li>
                                </ul>
                            </div>
                            <div class="tab-pane fade " id="v-pills-employees" role="tabpanel" aria-labelledby="v-pills-employees-tab">
                                <p>Employees</p>
                                <ul>
                                    <li><a href="employees.html">All Employees</a></li>
                                    <li><a href="holidays.html">Holidays</a></li>
                                    <li><a href="leaves.html">Leaves (Admin) <span class="badge rounded-pill bg-primary float-end">1</span></a></li>
                                    <li><a href="leaves-employee.html">Leaves (Employee)</a></li>
                                    <li><a href="leave-settings.html">Leave Settings</a></li>
                                    <li><a href="attendance.html"> Attendance (Admin)</a></li>
                                    <li><a href="attendance-employee.html">Attendance (Employee)</a></li>
                                    <li><a href="departments.html">Departments</a></li>
                                    <li><a href="designations.html">Designations</a></li>
                                    <li><a href="timesheet.html">Timesheet</a></li>
                                    <li><a href="shift-scheduling.html">Shift & Schedule</a></li>
                                    <li><a href="overtime.html">Overtime</a></li>
                                </ul>
                            </div>
                            <div class="tab-pane fade " id="v-pills-clients" role="tabpanel" aria-labelledby="v-pills-clients-tab">
                                <p>Clients</p>
                                <ul>
                                    <li><a href="clients.html">Clients</a></li>
                                </ul>
                            </div>
                            <div class="tab-pane fade " id="v-pills-projects" role="tabpanel" aria-labelledby="v-pills-projects-tab">
                                <p>Projects</p>
                                <ul>
                                    <li><a href="projects.html">Projects</a></li>
                                    <li><a href="tasks.html">Tasks</a></li>
                                    <li><a href="task-board.html">Task Board</a></li>
                                </ul>
                            </div>
                            <div class="tab-pane fade " id="v-pills-leads" role="tabpanel" aria-labelledby="v-pills-leads-tab">
                                <p>Leads</p>
                                <ul>
                                    <li><a href="leads.html">Leads</a></li>
                                </ul>
                            </div>
                            <div class="tab-pane fade " id="v-pills-tickets" role="tabpanel" aria-labelledby="v-pills-tickets-tab">
                                <p>Tickets</p>
                                <ul>
                                    <li><a href="tickets.html">Tickets</a></li>
                                </ul>
                            </div>
                            <div class="tab-pane fade " id="v-pills-sales" role="tabpanel" aria-labelledby="v-pills-sales-tab">
                                <p>Sales</p>
                                <ul>
                                    <li><a href="estimates.html">Estimates</a></li>
                                    <li><a href="invoices.html">Invoices</a></li>
                                    <li><a href="payments.html">Payments</a></li>
                                    <li><a href="expenses.html">Expenses</a></li>
                                    <li><a href="provident-fund.html">Provident Fund</a></li>
                                    <li><a href="taxes.html">Taxes</a></li>
                                </ul>
                            </div>
                            <div class="tab-pane fade " id="v-pills-accounting" role="tabpanel" aria-labelledby="v-pills-accounting-tab">
                                <p>Accounting</p>
                                <ul>
                                    <li><a href="categories.html">Categories</a></li>
                                    <li><a href="budgets.html">Budgets</a></li>
                                    <li><a href="budget-expenses.html">Budget Expenses</a></li>
                                    <li><a href="budget-revenues.html">Budget Revenues</a></li>
                                </ul>
                            </div>
                            <div class="tab-pane fade" id="v-pills-payroll" role="tabpanel" aria-labelledby="v-pills-payroll-tab">
                                <p>Payroll</p>
                                <ul>
                                    <li><a href="salary.html"> Employee Salary </a></li>
                                    <li><a href="salary-view.html"> Payslip </a></li>
                                    <li><a href="payroll-items.html"> Payroll Items </a></li>
                                </ul>
                            </div>
                            <div class="tab-pane fade  show active" id="v-pills-policies" role="tabpanel" aria-labelledby="v-pills-policies-tab">
                                <p>Policies</p>
                                <ul>
                                    <li><a href="policies.html" class="active"> Policies </a></li>
                                </ul>
                            </div>
                            <div class="tab-pane fade" id="v-pills-reports" role="tabpanel" aria-labelledby="v-pills-reports-tab">
                                <p>Reports</p>
                                <ul>
                                    <li><a href="expense-reports.html"> Expense Report </a></li>
                                    <li><a href="invoice-reports.html"> Invoice Report </a></li>
                                    <li><a href="payments-reports.html"> Payments Report </a></li>
                                    <li><a href="project-reports.html"> Project Report </a></li>
                                    <li><a href="task-reports.html"> Task Report </a></li>
                                    <li><a href="user-reports.html"> User Report </a></li>
                                    <li><a href="employee-reports.html"> Employee Report </a></li>
                                    <li><a href="payslip-reports.html"> Payslip Report </a></li>
                                    <li><a href="attendance-reports.html"> Attendance Report </a></li>
                                    <li><a href="leave-reports.html"> Leave Report </a></li>
                                    <li><a href="daily-reports.html"> Daily Report </a></li>
                                </ul>
                            </div>
                            <div class="tab-pane fade" id="v-pills-performance" role="tabpanel" aria-labelledby="v-pills-performance-tab">
                                <p>Performance</p>
                                <ul>
                                    <li><a href="performance-indicator.html"> Performance Indicator </a></li>
                                    <li><a href="performance.html"> Performance Review </a></li>
                                    <li><a href="performance-appraisal.html"> Performance Appraisal </a></li>
                                </ul>
                            </div>
                            <div class="tab-pane fade" id="v-pills-goals" role="tabpanel" aria-labelledby="v-pills-goals-tab">
                                <p>Goals</p>
                                <ul>
                                    <li><a href="goal-tracking.html"> Goal List </a></li>
                                    <li><a href="goal-type.html"> Goal Type </a></li>
                                </ul>
                            </div>
                            <div class="tab-pane fade" id="v-pills-training" role="tabpanel" aria-labelledby="v-pills-training-tab">
                                <p>Training</p>
                                <ul>
                                    <li><a href="training.html"> Training List </a></li>
                                    <li><a href="trainers.html"> Trainers</a></li>
                                    <li><a href="training-type.html"> Training Type </a></li>
                                </ul>
                            </div>
                            <div class="tab-pane fade" id="v-pills-promotion" role="tabpanel" aria-labelledby="v-pills-promotion-tab">
                                <p>Promotion</p>
                                <ul>
                                    <li><a href="promotion.html"> Promotion </a></li>
                                </ul>
                            </div>
                            <div class="tab-pane fade" id="v-pills-resignation" role="tabpanel" aria-labelledby="v-pills-resignation-tab">
                                <p>Resignation</p>
                                <ul>
                                    <li><a href="resignation.html"> Resignation </a></li>
                                </ul>
                            </div>
                            <div class="tab-pane fade" id="v-pills-termination" role="tabpanel" aria-labelledby="v-pills-termination-tab">
                                <p>Termination</p>
                                <ul>
                                    <li><a href="termination.html"> Termination </a></li>
                                </ul>
                            </div>
                            <div class="tab-pane fade" id="v-pills-assets" role="tabpanel" aria-labelledby="v-pills-assets-tab">
                                <p>Assets</p>
                                <ul>
                                    <li><a href="assets.html"> Assets </a></li>
                                </ul>
                            </div>
                            <div class="tab-pane fade " id="v-pills-jobs" role="tabpanel" aria-labelledby="v-pills-jobs-tab">
                                <p>Jobs</p>
                                <ul>
                                    <li><a href="user-dashboard.html"> User Dasboard </a></li>
                                    <li><a href="jobs-dashboard.html"> Jobs Dasboard </a></li>
                                    <li><a href="jobs.html"> Manage Jobs </a></li>
                                    <li><a href="job-applicants.html"> Applied Jobs </a></li>
                                    <li><a href="manage-resumes.html"> Manage Resumes </a></li>
                                    <li><a href="shortlist-candidates.html"> Shortlist Candidates </a></li>
                                    <li><a href="interview-questions.html"> Interview Questions </a></li>
                                    <li><a href="offer_approvals.html"> Offer Approvals </a></li>
                                    <li><a href="experiance-level.html"> Experience Level </a></li>
                                    <li><a href="candidates.html"> Candidates List </a></li>
                                    <li><a href="schedule-timing.html"> Schedule timing </a></li>
                                    <li><a href="apptitude-result.html"> Aptitude Results </a></li>
                                </ul>
                            </div>
                            <div class="tab-pane fade" id="v-pills-knowledgebase" role="tabpanel" aria-labelledby="v-pills-knowledgebase-tab">
                                <p>Knowledgebase</p>
                                <ul>
                                    <li><a href="knowledgebase.html"> Knowledgebase </a></li>
                                </ul>
                            </div>
                            <div class="tab-pane fade" id="v-pills-activities" role="tabpanel" aria-labelledby="v-pills-activities-tab">
                                <p>Activities</p>
                                <ul>
                                    <li><a href="activities.html"> Activities </a></li>
                                </ul>
                            </div>
                            <div class="tab-pane fade" id="v-pills-users" role="tabpanel" aria-labelledby="v-pills-activities-tab">
                                <p>Users</p>
                                <ul>
                                    <li><a href="users.html"> Users </a></li>
                                </ul>
                            </div>
                            <div class="tab-pane fade" id="v-pills-settings" role="tabpanel" aria-labelledby="v-pills-settings-tab">
                                <p>Settings</p>
                                <ul>
                                    <li><a href="settings.html"> Settings </a></li>
                                </ul>
                            </div>
                            <div class="tab-pane fade" id="v-pills-profile" role="tabpanel" aria-labelledby="v-pills-profile-tab">
                                <p>Profile</p>
                                <ul>
                                    <li><a href="profile.html"> Employee Profile </a></li>
                                    <li><a href="client-profile.html"> Client Profile </a></li>
                                </ul>
                            </div>
                            <div class="tab-pane fade" id="v-pills-authentication" role="tabpanel" aria-labelledby="v-pills-authentication-tab">
                                <p>Authentication</p>
                                <ul>
                                    <li><a href="index.html"> Login </a></li>
                                    <li><a href="register.html"> Register </a></li>
                                    <li><a href="forgot-password.html"> Forgot Password </a></li>
                                    <li><a href="otp.html"> OTP </a></li>
                                    <li><a href="lock-screen.html"> Lock Screen </a></li>
                                </ul>
                            </div>
                            <div class="tab-pane fade" id="v-pills-errorpages" role="tabpanel" aria-labelledby="v-pills-errorpages-tab">
                                <p>Error Pages</p>
                                <ul>
                                    <li><a href="error-404.html">404 Error </a></li>
                                    <li><a href="error-500.html">500 Error </a></li>
                                </ul>
                            </div>
                            <div class="tab-pane fade" id="v-pills-subscriptions" role="tabpanel" aria-labelledby="v-pills-subscriptions-tab">
                                <p>Subscriptions</p>
                                <ul>
                                    <li><a href="subscriptions.html"> Subscriptions (Admin) </a></li>
                                    <li><a href="subscriptions-company.html"> Subscriptions (Company) </a></li>
                                    <li><a href="subscribed-companies.html"> Subscribed Companies</a></li>
                                </ul>
                            </div>
                            <div class="tab-pane fade" id="v-pills-pages" role="tabpanel" aria-labelledby="v-pills-pages-tab">
                                <p>Pages</p>
                                <ul>
                                    <li><a href="search.html"> Search </a></li>
                                    <li><a href="faq.html"> FAQ </a></li>
                                    <li><a href="terms.html"> Terms </a></li>
                                    <li><a href="privacy-policy.html"> Privacy Policy </a></li>
                                    <li><a href="blank-page.html"> Blank Page </a></li>
                                </ul>
                            </div>
                            <div class="tab-pane fade" id="v-pills-forms" role="tabpanel" aria-labelledby="v-pills-forms-tab">
                                <p>Forms</p>
                                <ul>
                                    <li><a href="form-basic-inputs.html">Basic Inputs </a></li>
                                    <li><a href="form-input-groups.html">Input Groups </a></li>
                                    <li><a href="form-horizontal.html">Horizontal Form </a></li>
                                    <li><a href="form-vertical.html"> Vertical Form </a></li>
                                    <li><a href="form-mask.html"> Form Mask </a></li>
                                    <li><a href="form-validation.html"> Form Validation </a></li>
                                </ul>
                            </div>
                            <div class="tab-pane fade" id="v-pills-tables" role="tabpanel" aria-labelledby="v-pills-tables-tab">
                                <p>Tables</p>
                                <ul>
                                    <li><a href="tables-basic.html">Basic Tables </a></li>
                                    <li><a href="data-tables.html">Data Table </a></li>
                                </ul>
                            </div>
                            <div class="tab-pane fade" id="v-pills-documentation" role="tabpanel" aria-labelledby="v-pills-documentation-tab">
                                <p>Documentation</p>
                                <ul>
                                    <li><a href="#">Documentation </a></li>
                                </ul>
                            </div>
                            <div class="tab-pane fade" id="v-pills-changelog" role="tabpanel" aria-labelledby="v-pills-changelog-tab">
                                <p>Change Log</p>
                                <ul>
                                    <li><a href="#"><span>Change Log</span> <span class="badge badge-primary ms-auto">v3.4</span> </a></li>
                                </ul>
                            </div>
                            <div class="tab-pane fade" id="v-pills-multilevel" role="tabpanel" aria-labelledby="v-pills-multilevel-tab">
                                <p>Multi Level</p>
                                <ul>
                                    <li class="sub-menu">
                                        <a href="javascript:void(0);">Level 1 <span class="menu-arrow"></span></a>
                                        <ul style="display: none;" class="ms-3">
                                            <li class="sub-menu">
                                                <a href="javascript:void(0);">Level 1 <span class="menu-arrow"></span></a>
                                                <ul>
                                                    <li><a href="javascript:void(0);">Level 2</a></li>
                                                    <li><a href="javascript:void(0);">Level 3</a></li>
                                                </ul>
                                            </li>
                                        </ul>
                                    </li>
                                    <li><a href="javascript:void(0);">Level 2</a></li>
                                    <li><a href="javascript:void(0);">Level 3</a></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>


            <div class="page-wrapper">

                <div class="content container-fluid">

                    <div class="page-header">
                        <div class="row align-items-center">
                            <div class="col">
                                <h3 class="page-title">Policies</h3>
                                <ul class="breadcrumb">
                                    <li class="breadcrumb-item"><a href="admin-dashboard.html">Dashboard</a></li>
                                    <li class="breadcrumb-item active">Policies</li>
                                </ul>
                            </div>
                            <div class="col-auto float-end ms-auto">
                                <a href="#" class="btn add-btn" data-bs-toggle="modal" data-bs-target="#add_policy"><i class="fa fa-plus"></i> Add Policy</a>
                            </div>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-md-12">
                            <div class="table-responsive">
                                <table class="table table-striped custom-table mb-0 datatable">
                                    <thead>
                                        <tr>
                                            <th >Id</th>
                                            <th>Policy Name </th>
                                            <th>Department </th>
                                            <th>Description </th>
                                            <th>Created </th>
                                            <th class="text-end">Action</th>
                                        </tr>
                                    </thead>
                                     <%      
                                           String plcd="";
                                            PoliciesDao dao=new PoliciesDao();
                                            ArrayList<ArrayList<String>> arr=dao.selectAllpolicy();
                                            for(ArrayList<String> d : arr){
                                              plcd=d.get(0);
                                    %>
                                    <tbody>
                                        <tr>
                                            <td><%=d.get(0)%></td>
                                            <td><%=d.get(1)%></td>
                                            <td><%=d.get(2)%></td>
                                            <td><%=d.get(3)%></td>
                                            <td><%=d.get(4)%></td>
                                            <td class="text-end">
                                                <div class="dropdown dropdown-action">
                                                    <a href="#" class="action-icon dropdown-toggle" data-bs-toggle="dropdown" aria-expanded="false"><i class="material-icons">more_vert</i></a>
                                                    <div class="dropdown-menu dropdown-menu-right">
                                                        <a class="dropdown-item" href="#" data-bs-toggle="modal" data-bs-target="#edit_policy" onclick=getmodeldata('<%=d.get(0)%>');><i class="fa fa-pencil m-r-5"></i> Edit</a>
                                                        <a class="dropdown-item" href="#" data-bs-toggle="modal" data-bs-target="#delete_policy"><i class="fa fa-trash-o m-r-5"></i> Delete</a>
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


                <div id="add_policy" class="modal custom-modal fade" role="dialog">
                    <div class="modal-dialog modal-dialog-centered" role="document">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title">Add Policy</h5>
                                <button type="button" class="close" data-bs-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                            </div>
                            <div class="modal-body">
                                <form action="../PolicyServlet?action=insert" method="post">
                                    <div class="form-group">
                                        <label>Policy Name <span class="text-danger">*</span></label>
                                        <input class="form-control" type="text" name="policyName">
                                    </div>
                                    <div class="form-group">
                                        <label>Description <span class="text-danger">*</span></label>
                                        <textarea class="form-control" rows="4" name="policedesc"></textarea>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-form-label">Department</label>
                                       <select class="select" name="deptpolicy">
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
                                
                                    <div class="submit-section">
                                        <button type="submit" class="btn btn-primary submit-btn">Submit</button>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>


                <div id="edit_policy" class="modal custom-modal fade" role="dialog">
                    <div class="modal-dialog modal-dialog-centered" role="document">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title">Edit Policy</h5>
                                <button type="button" class="close" data-bs-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                            </div>
                            <div class="modal-body">
                                 <form action="../PolicyServlet?action=update" method="post">
                                     <input type="hidden" name="updateplcd" id="updateplcd">
                                    <div class="form-group">
                                        <label>Policy Name <span class="text-danger">*</span></label>
                                        <input class="form-control" type="text" name="policyName" id="policyName">
                                    </div>
                                    <div class="form-group">
                                        <label>Description <span class="text-danger">*</span></label>
                                        <textarea class="form-control" rows="4" name="policedesc" id="policedesc"></textarea>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-form-label">Department</label>
                                        <select class="select" name="deptpolicy" id="deptpolicy">
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
                                
                                    <div class="submit-section">
                                        <button type="submit" class="btn btn-primary submit-btn">Submit</button>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>


                <div class="modal custom-modal fade" id="delete_policy" role="dialog">
                    <div class="modal-dialog modal-dialog-centered">
                        <div class="modal-content">
                            <div class="modal-body">
                                <div class="form-header">
                                    <h3>Delete Policy</h3>
                                    <p>Are you sure want to delete?</p>
                                </div>
                                <div class="modal-btn delete-action">
                                    <div class="row">
                                        <div class="col-6">
                                            <a href="../PolicyServlet?action=delete&plcd=<%=plcd%>" class="btn btn-primary continue-btn">Delete</a>
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

        <script src="assets/js/layout.js"></script>
        <script src="assets/js/theme-settings.js"></script>
        <script src="assets/js/greedynav.js"></script>

        <script src="assets/js/app.js"></script>
        
         <script>

                                                           function getmodeldata(id) {

                                                               $.ajax({
                                                                   url: '../PolicyServlet?action=search',
                                                                   type: 'POST',
                                                                   data: {'depid': id},
                                                                   success: function (e) {
                                                                      
                                                                       var e1  =e.split("#");
                                                                       document.getElementById("policyName").value = e1[0].trim();
                                                                       document.getElementById("policedesc").value = e1[1].trim();
                                                                       document.getElementById("deptpolicy").value = e1[2].trim();
                                                                       $("#deptpolicy").change();
                                                                       document.getElementById("updateplcd").value = id;
                                                                   }

                                                               })
                                                           }
                                                                </script>
    </body>
</html>