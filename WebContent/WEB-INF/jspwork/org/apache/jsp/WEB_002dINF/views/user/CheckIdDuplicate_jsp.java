/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/8.5.42
 * Generated at: 2019-08-17 09:37:10 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp.WEB_002dINF.views.user;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class CheckIdDuplicate_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent,
                 org.apache.jasper.runtime.JspSourceImports {

  private static final javax.servlet.jsp.JspFactory _jspxFactory =
          javax.servlet.jsp.JspFactory.getDefaultFactory();

  private static java.util.Map<java.lang.String,java.lang.Long> _jspx_dependants;

  private static final java.util.Set<java.lang.String> _jspx_imports_packages;

  private static final java.util.Set<java.lang.String> _jspx_imports_classes;

  static {
    _jspx_imports_packages = new java.util.HashSet<>();
    _jspx_imports_packages.add("javax.servlet");
    _jspx_imports_packages.add("javax.servlet.http");
    _jspx_imports_packages.add("javax.servlet.jsp");
    _jspx_imports_classes = null;
  }

  private volatile javax.el.ExpressionFactory _el_expressionfactory;
  private volatile org.apache.tomcat.InstanceManager _jsp_instancemanager;

  public java.util.Map<java.lang.String,java.lang.Long> getDependants() {
    return _jspx_dependants;
  }

  public java.util.Set<java.lang.String> getPackageImports() {
    return _jspx_imports_packages;
  }

  public java.util.Set<java.lang.String> getClassImports() {
    return _jspx_imports_classes;
  }

  public javax.el.ExpressionFactory _jsp_getExpressionFactory() {
    if (_el_expressionfactory == null) {
      synchronized (this) {
        if (_el_expressionfactory == null) {
          _el_expressionfactory = _jspxFactory.getJspApplicationContext(getServletConfig().getServletContext()).getExpressionFactory();
        }
      }
    }
    return _el_expressionfactory;
  }

  public org.apache.tomcat.InstanceManager _jsp_getInstanceManager() {
    if (_jsp_instancemanager == null) {
      synchronized (this) {
        if (_jsp_instancemanager == null) {
          _jsp_instancemanager = org.apache.jasper.runtime.InstanceManagerFactory.getInstanceManager(getServletConfig());
        }
      }
    }
    return _jsp_instancemanager;
  }

  public void _jspInit() {
  }

  public void _jspDestroy() {
  }

  public void _jspService(final javax.servlet.http.HttpServletRequest request, final javax.servlet.http.HttpServletResponse response)
      throws java.io.IOException, javax.servlet.ServletException {

    final java.lang.String _jspx_method = request.getMethod();
    if (!"GET".equals(_jspx_method) && !"POST".equals(_jspx_method) && !"HEAD".equals(_jspx_method) && !javax.servlet.DispatcherType.ERROR.equals(request.getDispatcherType())) {
      response.sendError(HttpServletResponse.SC_METHOD_NOT_ALLOWED, "JSPs only permit GET POST or HEAD");
      return;
    }

    final javax.servlet.jsp.PageContext pageContext;
    javax.servlet.http.HttpSession session = null;
    final javax.servlet.ServletContext application;
    final javax.servlet.ServletConfig config;
    javax.servlet.jsp.JspWriter out = null;
    final java.lang.Object page = this;
    javax.servlet.jsp.JspWriter _jspx_out = null;
    javax.servlet.jsp.PageContext _jspx_page_context = null;


    try {
      response.setContentType("text/html; charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;

      out.write('\r');
      out.write('\n');

	String userId = request.getParameter("userId");
	boolean isUsable = (boolean)request.getAttribute("isUsable");

      out.write("\r\n");
      out.write("<!DOCTYPE html>\r\n");
      out.write("<html>\r\n");
      out.write("<head>\r\n");
      out.write("<meta charset=\"UTF-8\">\r\n");
      out.write("<title>아이디 중복검사</title>\r\n");
      out.write("<script src = \"");
      out.print(request.getContextPath());
      out.write("/js/jquery-3.4.1.js\"></script>\r\n");
      out.write("<link href=\"");
      out.print(request.getContextPath() );
      out.write("/vendor/bootstrap/css/bootstrap.min.css\" rel=\"stylesheet\">\r\n");
      out.write("  \r\n");
      out.write("<style>\r\n");
      out.write("#checkId-container{\r\n");
      out.write("\ttext-align : center;\r\n");
      out.write("\tpadding-top : 50px;\r\n");
      out.write("}\r\n");
      out.write("span#duplicated{\r\n");
      out.write("\tcolor : red;\r\n");
      out.write("\tfont-weight : bold;\r\n");
      out.write("}\r\n");
      out.write("#exit{\r\n");
      out.write("\tbackground-color : #FEC810;\r\n");
      out.write("\tborder-style : none;\r\n");
      out.write("\tfont-weight : bold;\r\n");
      out.write("}\r\n");
      out.write("#again{\r\n");
      out.write("\tbackground-color : #FEC810;\r\n");
      out.write("\tborder-style : none;\r\n");
      out.write("\tfont-weight : bold;\r\n");
      out.write("\tpadding-top : 10px;\r\n");
      out.write("\tmargin-top : 10px;\r\n");
      out.write("\r\n");
      out.write("}\r\n");
      out.write("#uRam{\r\n");
      out.write("\ttop:0;\r\n");
      out.write("\tbackground-color:#212529;\r\n");
      out.write("\tcolor : orange;\r\n");
      out.write("\tfont-size : 30px;\r\n");
      out.write("}\r\n");
      out.write(".check_id{\r\n");
      out.write("\tfont-size : 25px;\r\n");
      out.write("\tfont-color : orange;\r\n");
      out.write("\ttext-decoration : underline;\r\n");
      out.write("}\r\n");
      out.write(".form-control{\r\n");
      out.write("\tmargin-left : 70px;\r\n");
      out.write("\tmargin-top : 10px;\r\n");
      out.write("\t\r\n");
      out.write("}\r\n");
      out.write("</style>\r\n");
      out.write("</head>\r\n");
      out.write("\r\n");
      out.write("<body>\r\n");
      out.write("<div id=\"uRam\">&nbsp;유람</div>\r\n");
      out.write("\r\n");
      out.write("<div id=\"checkId-container\" style=\"padding-top : 20px;text-align:center;\">\r\n");
      out.write("\t");
 if(isUsable == true){ 
      out.write("\r\n");
      out.write("\t<br>\r\n");
      out.write("\t\t<span class=\"check_id\">");
      out.print(userId);
      out.write("</span> 는 사용 가능합니다.\r\n");
      out.write("\t\t<br><br>\r\n");
      out.write("\t\t<button type=\"button\" onclick=\"setUserId();\" class=\"btn btn-primary\" id=\"exit\">닫기</button>\r\n");
      out.write("\t");
} else { 
      out.write("\r\n");
      out.write("\t\t<span style=\"font-weight : bold;\">");
      out.print(userId);
      out.write("</span>는 이미 사용중입니다. \r\n");
      out.write("\t\t<form action=\"");
      out.print(request.getContextPath());
      out.write("/enroll/CheckIdDuplicate\"\r\n");
      out.write("\t\t\t  id=\"checkIdDuplicateFrm\"\r\n");
      out.write("\t\t\t  name=\"checkIdDuplicateFrm\"\r\n");
      out.write("\t\t\t  method=\"post\">\r\n");
      out.write("\t\t\t      <input type=\"text\" class=\"form-control\" id=\"userId\" aria-describedby=\"emailHelp\" placeholder=\"ID\" name=\"userId\" style=\"width:170px;\">\r\n");
      out.write("\t\t\t<button type=\"button\" class=\"btn btn-primary\" id=\"again\"\r\n");
      out.write("\t\t\t\t    onclick=\"checkIdDulplicate();\" >\r\n");
      out.write("\t\t\t\t중복검사\r\n");
      out.write("\t\t\t</button>\r\n");
      out.write("\t\t</form>\r\n");
      out.write("\t\r\n");
      out.write("\t");
 } 
      out.write("\r\n");
      out.write("\t\t\r\n");
      out.write("</div>\r\n");
      out.write("<script>\r\n");
      out.write("function checkIdDulplicate(){\r\n");
      out.write("\t\r\n");
      out.write("\tvar userId = $(\"#userId\").val().trim();\r\n");
      out.write("\tif(userId.length < 4){\r\n");
      out.write("\t\talert(\"아이디는 4 글자 이상 입력하세요.\");\r\n");
      out.write("\t\treturn;\r\n");
      out.write("\t}\r\n");
      out.write("\r\n");
      out.write("\t//폼과 팝업 연결\r\n");
      out.write("\tvar frm = document.checkIdDuplicateFrm;\r\n");
      out.write("\tfrm.userId.value = userId;\r\n");
      out.write("\tfrm.submit();\r\n");
      out.write("\t\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write("function setUserId(){\r\n");
      out.write("\tvar frm = opener.document.userEnrollFrm;\r\n");
      out.write("\t\r\n");
      out.write("\tfrm.userId.value = '");
      out.print(userId);
      out.write("';\r\n");
      out.write("\tfrm.idValid.value = 0;\r\n");
      out.write("\tfrm.usernickName.focus();\r\n");
      out.write("\tself.close();\r\n");
      out.write("}\r\n");
      out.write("</script>\r\n");
      out.write("</body>\r\n");
      out.write("</html>");
    } catch (java.lang.Throwable t) {
      if (!(t instanceof javax.servlet.jsp.SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          try {
            if (response.isCommitted()) {
              out.flush();
            } else {
              out.clearBuffer();
            }
          } catch (java.io.IOException e) {}
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}