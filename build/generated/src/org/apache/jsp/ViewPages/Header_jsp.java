package org.apache.jsp.ViewPages;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import com.sun.xml.internal.ws.util.StringUtils;

public final class Header_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("\n");
      out.write("<div class=\"header\">\n");
      out.write("\n");
      out.write("<div class=\"header-left\">\n");
      out.write("<a href=\"admin-dashboard.html\" class=\"logo\">\n");
      out.write("<img src=\"assets/img/logo.png\" width=\"40\" height=\"40\" alt=\"\">\n");
      out.write("</a>\n");
      out.write("<a href=\"admin-dashboard.html\" class=\"logo2\">\n");
      out.write("<img src=\"assets/img/erp.jpg\" width=\"120\" height=\"40\" alt=\"\">\n");
      out.write("</a>\n");
      out.write("</div>\n");
      out.write("\n");
      out.write("    <a id=\"toggle_btn\" href=\"javascript:void(0);\">\n");
      out.write("<span class=\"bar-icon\">\n");
      out.write("<span></span>\n");
      out.write("<span></span>\n");
      out.write("<span></span>\n");
      out.write("</span>\n");
      out.write("</a>\n");
      out.write("\n");
      out.write("<div class=\"page-title-box\">\n");
      out.write("<h3>HR-Portal</h3>\n");
      out.write("</div>\n");
      out.write("\n");
      out.write("<a id=\"mobile_btn\" class=\"mobile_btn mt-2\" href=\"#sidebar\"><i class=\"fa fa-bars\"></i></a>\n");
      out.write("\n");
      out.write("<ul class=\"nav user-menu\">\n");
      out.write("\n");
      out.write("<li class=\"nav-item\">\n");
      out.write("<div class=\"top-nav-search\">\n");
      out.write("<a href=\"javascript:void(0);\" class=\"responsive-search\">\n");
      out.write("<i class=\"fa fa-search\"></i>\n");
      out.write("</a>\n");
      out.write("<form action=\"search.html\">\n");
      out.write("<input class=\"form-control\" type=\"text\" placeholder=\"Search here\">\n");
      out.write("<button class=\"btn\" type=\"submit\"><i class=\"fa fa-search\"></i></button>\n");
      out.write("</form>\n");
      out.write("</div>\n");
      out.write("</li>\n");
      out.write("\n");
      out.write("\n");
      out.write("<li class=\"nav-item dropdown has-arrow flag-nav\">\n");
      out.write("<div class=\"dropdown-menu dropdown-menu-right\">\n");
      out.write("<a href=\"javascript:void(0);\" class=\"dropdown-item\">\n");
      out.write("<img src=\"assets/img/flags/us.png\" alt=\"\" height=\"16\"> English\n");
      out.write("</a>\n");
      out.write("<a href=\"javascript:void(0);\" class=\"dropdown-item\">\n");
      out.write("<img src=\"assets/img/flags/fr.png\" alt=\"\" height=\"16\"> French\n");
      out.write("</a>\n");
      out.write("<a href=\"javascript:void(0);\" class=\"dropdown-item\">\n");
      out.write("<img src=\"assets/img/flags/es.png\" alt=\"\" height=\"16\"> Spanish\n");
      out.write("</a>\n");
      out.write("<a href=\"javascript:void(0);\" class=\"dropdown-item\">\n");
      out.write("<img src=\"assets/img/flags/de.png\" alt=\"\" height=\"16\"> German\n");
      out.write("</a>\n");
      out.write("</div>\n");
      out.write("</li>\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");

String Name=(String) session.getAttribute("admin");
String loginName=StringUtils.capitalize(Name);


      out.write("\n");
      out.write("\n");
      out.write("<li class=\"nav-item dropdown has-arrow main-drop\">\n");
      out.write("<a href=\"#\" class=\"dropdown-toggle nav-link\" data-bs-toggle=\"dropdown\">\n");
      out.write("\n");
      out.write("<span class=\"status online\"></span></span>\n");
      out.write("<span>");
      out.print(loginName);
      out.write("</span>\n");
      out.write("</a>\n");
      out.write("<div class=\"dropdown-menu\">\n");
      out.write("<a class=\"dropdown-item\" href=\"login.jsp\">Logout</a>\n");
      out.write("</div>\n");
      out.write("</li>\n");
      out.write("</ul>\n");
      out.write("\n");
      out.write("\n");
      out.write("<div class=\"dropdown mobile-user-menu\">\n");
      out.write("<a href=\"#\" class=\"nav-link dropdown-toggle\" data-bs-toggle=\"dropdown\" aria-expanded=\"false\"><i class=\"fa fa-ellipsis-v\"></i></a>\n");
      out.write("<div class=\"dropdown-menu dropdown-menu-right\">\n");
      out.write("<a class=\"dropdown-item\" href=\"login.jsp\">Logout</a>\n");
      out.write("</div>\n");
      out.write("</div>\n");
      out.write("\n");
      out.write("</div>");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
