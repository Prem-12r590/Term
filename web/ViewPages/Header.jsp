<%@page import="com.sun.xml.internal.ws.util.StringUtils"%>
<div class="header">

<div class="header-left">
<a href="admin-dashboard.html" class="logo">
<img src="assets/img/logo.png" width="40" height="40" alt="">
</a>
<a href="admin-dashboard.html" class="logo2">
<img src="assets/img/erp.jpg" width="120" height="40" alt="">
</a>
</div>

    <a id="toggle_btn" href="javascript:void(0);">
<span class="bar-icon">
<span></span>
<span></span>
<span></span>
</span>
</a>

<div class="page-title-box">
<h3>HR-Portal</h3>
</div>

<a id="mobile_btn" class="mobile_btn mt-2" href="#sidebar"><i class="fa fa-bars"></i></a>

<ul class="nav user-menu">

<li class="nav-item">
<div class="top-nav-search">
<a href="javascript:void(0);" class="responsive-search">
<i class="fa fa-search"></i>
</a>
<form action="search.html">
<input class="form-control" type="text" placeholder="Search here">
<button class="btn" type="submit"><i class="fa fa-search"></i></button>
</form>
</div>
</li>


<li class="nav-item dropdown has-arrow flag-nav">
<div class="dropdown-menu dropdown-menu-right">
<a href="javascript:void(0);" class="dropdown-item">
<img src="assets/img/flags/us.png" alt="" height="16"> English
</a>
<a href="javascript:void(0);" class="dropdown-item">
<img src="assets/img/flags/fr.png" alt="" height="16"> French
</a>
<a href="javascript:void(0);" class="dropdown-item">
<img src="assets/img/flags/es.png" alt="" height="16"> Spanish
</a>
<a href="javascript:void(0);" class="dropdown-item">
<img src="assets/img/flags/de.png" alt="" height="16"> German
</a>
</div>
</li>





<%
String Name=(String) session.getAttribute("admin");
String loginName=StringUtils.capitalize(Name);

%>

<li class="nav-item dropdown has-arrow main-drop">
<a href="#" class="dropdown-toggle nav-link" data-bs-toggle="dropdown">

<span class="status online"></span></span>
<span><%=loginName%></span>
</a>
<div class="dropdown-menu">
<a class="dropdown-item" href="login.jsp">Logout</a>
</div>
</li>
</ul>


<div class="dropdown mobile-user-menu">
<a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown" aria-expanded="false"><i class="fa fa-ellipsis-v"></i></a>
<div class="dropdown-menu dropdown-menu-right">
<a class="dropdown-item" href="login.jsp">Logout</a>
</div>
</div>

</div>