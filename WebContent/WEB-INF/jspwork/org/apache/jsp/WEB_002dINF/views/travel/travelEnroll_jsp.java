/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/8.5.42
 * Generated at: 2019-08-10 07:49:44 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp.WEB_002dINF.views.travel;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import user.model.vo.User;

public final class travelEnroll_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent,
                 org.apache.jasper.runtime.JspSourceImports {

  private static final javax.servlet.jsp.JspFactory _jspxFactory =
          javax.servlet.jsp.JspFactory.getDefaultFactory();

  private static java.util.Map<java.lang.String,java.lang.Long> _jspx_dependants;

  static {
    _jspx_dependants = new java.util.HashMap<java.lang.String,java.lang.Long>(1);
    _jspx_dependants.put("/WEB-INF/views/common/header-menu.jsp", Long.valueOf(1565413607000L));
  }

  private static final java.util.Set<java.lang.String> _jspx_imports_packages;

  private static final java.util.Set<java.lang.String> _jspx_imports_classes;

  static {
    _jspx_imports_packages = new java.util.HashSet<>();
    _jspx_imports_packages.add("javax.servlet");
    _jspx_imports_packages.add("javax.servlet.http");
    _jspx_imports_packages.add("javax.servlet.jsp");
    _jspx_imports_classes = new java.util.HashSet<>();
    _jspx_imports_classes.add("user.model.vo.User");
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
      out.write("\r\n");
      out.write("\r\n");
      out.write("<!DOCTYPE html>\r\n");
      out.write("<html lang=\"ko\">\r\n");
      out.write(" <!-- Bootstrap core CSS -->\r\n");
      out.write("  <link href=\"/trav/vendor/bootstrap/css/bootstrap.min.css\" rel=\"stylesheet\">\r\n");
      out.write("\r\n");
      out.write("  <!-- Custom fonts for this template -->\r\n");
      out.write("  <link href=\"/trav/vendor/fontawesome-free/css/all.min.css\" rel=\"stylesheet\" type=\"text/css\">\r\n");
      out.write("  <link href=\"https://fonts.googleapis.com/css?family=Montserrat:400,700\" rel=\"stylesheet\" type=\"text/css\">\r\n");
      out.write("  <link href='https://fonts.googleapis.com/css?family=Kaushan+Script' rel='stylesheet' type='text/css'>\r\n");
      out.write("  <link href='https://fonts.googleapis.com/css?family=Droid+Serif:400,700,400italic,700italic' rel='stylesheet' type='text/css'>\r\n");
      out.write("  <link href='https://fonts.googleapis.com/css?family=Roboto+Slab:400,100,300,700' rel='stylesheet' type='text/css'>\r\n");
      out.write("\r\n");
      out.write("  <!-- Custom styles for this template -->\r\n");
      out.write("  <link href=\"/trav/css/agency.min.css\" rel=\"stylesheet\">\r\n");
      out.write("  \r\n");
      out.write("  <!-- Bootstrap core JavaScript -->\r\n");
      out.write("  <script src=\"/trav/vendor/jquery/jquery.min.js\"></script>\r\n");
      out.write("  <script src=\"/trav/vendor/bootstrap/js/bootstrap.bundle.min.js\"></script>\r\n");
      out.write("\r\n");
      out.write("  <!-- Plugin JavaScript -->\r\n");
      out.write("  <script src=\"/trav/vendor/jquery-easing/jquery.easing.min.js\"></script>\r\n");
      out.write("\r\n");
      out.write("  <!-- Contact form JavaScript -->\r\n");
      out.write("  <script src=\"/trav/js/jqBootstrapValidation.js\"></script>\r\n");
      out.write("  <script src=\"/trav/js/contact_me.js\"></script>\r\n");
      out.write("\r\n");
      out.write("  <!-- Custom scripts for this template -->\r\n");
      out.write("  <script src=\"/trav/js/agency.min.js\"></script>\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");


	User userLoggedIn = (User)session.getAttribute("userLoggedIn");

	System.out.println("userLoggedIn@userLogin.jsp=" + userLoggedIn);

      out.write("\r\n");
      out.write("<head>\r\n");
      out.write("  <meta charset=\"utf-8\">\r\n");
      out.write("  <meta name=\"viewport\" content=\"width=device-width, initial-scale=1, shrink-to-fit=no\">\r\n");
      out.write("  <meta name=\"description\" content=\"\">\r\n");
      out.write("  <meta name=\"author\" content=\"\">\r\n");
      out.write("\r\n");
      out.write("  \r\n");
      out.write("  <title>유람</title>\r\n");
      out.write("\r\n");
      out.write("<style>\r\n");
      out.write("\r\n");
      out.write(".header-profile-circle{\r\n");
      out.write("    border: 0px;\r\n");
      out.write("    border-radius: 100%;\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write(".header-menu-container{\r\n");
      out.write("\r\n");
      out.write("}\r\n");
      out.write("</style>\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("</head>\r\n");
      out.write("\r\n");
      out.write("<body id=\"page-top\">\r\n");
      out.write("\r\n");
      out.write("  <!-- Navigation -->\r\n");
      out.write("  <nav class=\"navbar navbar-expand-lg navbar-dark fixed-top\" id=\"mainNav\">\r\n");
      out.write("    <div class=\"container\">\r\n");
      out.write("      <a class=\"navbar-brand js-scroll-trigger\" href=\"");
      out.print(request.getContextPath() );
      out.write("/\">유람</a>\r\n");
      out.write("      <button class=\"navbar-toggler navbar-toggler-right\" type=\"button\" data-toggle=\"collapse\" data-target=\"#navbarResponsive\" aria-controls=\"navbarResponsive\" aria-expanded=\"false\" aria-label=\"Toggle navigation\">\r\n");
      out.write("        Menu\r\n");
      out.write("        <i class=\"fas fa-bars\"></i>\r\n");
      out.write("      </button>\r\n");
      out.write("      <div class=\"collapse navbar-collapse\" id=\"navbarResponsive\">\r\n");
      out.write("        <ul class=\"navbar-nav text-uppercase ml-auto\">\r\n");
      out.write("          <li class=\"nav-item\">\r\n");
      out.write("            <a class=\"nav-link js-scroll-trigger\" href=\"");
      out.print(request.getContextPath());
      out.write("/travel/travelSelectArea\">여행지</a>\r\n");
      out.write("          </li>\r\n");
      out.write("          <li class=\"nav-item\">\r\n");
      out.write("            <a class=\"nav-link js-scroll-trigger\" href=\"");
      out.print(request.getContextPath() );
      out.write("/story/storyMain\">여행이야기</a>\r\n");
      out.write("          </li>\r\n");
      out.write("          <li class=\"nav-item\">\r\n");
      out.write("            <span class=\"nav-link js-scroll-trigger\">&nbsp;&nbsp;</span>\r\n");
      out.write("          </li>\r\n");
      out.write("         ");
if(userLoggedIn==null){ 
      out.write("\r\n");
      out.write("\t          <li class=\"nav-item\">\r\n");
      out.write("\t            <a class=\"nav-link js-scroll-trigger\" href='");
      out.print(request.getContextPath() );
      out.write("/user/userLoginFrm'>로그인</a> <!-- userLogin.jsp로 이동하는 서블릿 -->\r\n");
      out.write("\t          </li> \r\n");
      out.write("\t\t      <li class=\"nav-item\">\r\n");
      out.write("\t\t        <a class=\"nav-link js-scroll-trigger\" href=\"");
      out.print(request.getContextPath());
      out.write("/user/userEnrollFrm\">회원가입</a>\r\n");
      out.write("\t\t      </li>\r\n");
      out.write("         ");
 }
          	else if(userLoggedIn!=null && "A".equals(userLoggedIn.getUserType())){
      out.write("\r\n");
      out.write("          \t<li class=\"nav-item\">\r\n");
      out.write("            \t<a class=\"nav-link js-scroll-trigger\" href=\"");
      out.print(request.getContextPath() );
      out.write("/user/userLogout\">로그아웃</a>\r\n");
      out.write("         \t</li>\r\n");
      out.write("          \t <li class=\"nav-item\">\r\n");
      out.write("\t           <a class=\"nav-link js-scroll-trigger\" style=\"padding-top: 5px !important\" href='");
      out.print(request.getContextPath() );
      out.write("/admin/adminView'>\r\n");
      out.write("\t           \t\t<img src=\"");
      out.print(request.getContextPath() );
      out.write("/img/이동욱.jpg\" class=\"header-profile-circle\"  width=\"40\" height=\"40\" />\r\n");
      out.write("\t           </a> <!-- userLogin.jsp로 이동하는 서블릿 -->\r\n");
      out.write("\t         </li> \r\n");
      out.write("          ");
 }
          	else if(userLoggedIn!=null){ 
      out.write("\r\n");
      out.write("          \t <li class=\"nav-item\">\r\n");
      out.write("            \t<a class=\"nav-link js-scroll-trigger\" href=\"");
      out.print(request.getContextPath() );
      out.write("/user/userLogout\">로그아웃</a>\r\n");
      out.write("         \t</li>\r\n");
      out.write("          \t <li class=\"nav-item\">\r\n");
      out.write("\t           <a class=\"nav-link js-scroll-trigger\" style=\"padding-top: 5px !important\" href='");
      out.print(request.getContextPath() );
      out.write("/mypage/mypageView'>\r\n");
      out.write("\t           \t\t<img src=\"");
      out.print(request.getContextPath() );
      out.write("/upload/enroll/");
      out.print(userLoggedIn.getFileName() );
      out.write("\" class=\"header-profile-circle\"  width=\"40\" height=\"40\" />\r\n");
      out.write("\t           </a> <!-- userLogin.jsp로 이동하는 서블릿 -->\r\n");
      out.write("\t         </li> \r\n");
      out.write("         ");
} 
      out.write("\r\n");
      out.write("         \r\n");
      out.write("        </ul>\r\n");
      out.write("      </div>\r\n");
      out.write("    </div>\r\n");
      out.write("  </nav>\r\n");
      out.write("  \r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write(" <!-- Bootstrap core CSS -->\r\n");
      out.write("  <link href=\"");
      out.print(request.getContextPath() );
      out.write("/vendor/bootstrap/css/bootstrap.min.css\" rel=\"stylesheet\">\r\n");
      out.write("\r\n");
      out.write("  <!-- Custom fonts for this template -->\r\n");
      out.write("  <link href=\"");
      out.print(request.getContextPath() );
      out.write("/vendor/fontawesome-free/css/all.min.css\" rel=\"stylesheet\" type=\"text/css\">\r\n");
      out.write("  <link href=\"https://fonts.googleapis.com/css?family=Montserrat:400,700\" rel=\"stylesheet\" type=\"text/css\">\r\n");
      out.write("  <link href='https://fonts.googleapis.com/css?family=Kaushan+Script' rel='stylesheet' type='text/css'>\r\n");
      out.write("  <link href='https://fonts.googleapis.com/css?family=Droid+Serif:400,700,400italic,700italic' rel='stylesheet' type='text/css'>\r\n");
      out.write("  <link href='https://fonts.googleapis.com/css?family=Roboto+Slab:400,100,300,700' rel='stylesheet' type='text/css'>\r\n");
      out.write("\r\n");
      out.write("  <!-- Custom styles for this template -->\r\n");
      out.write("  <link href=\"");
      out.print(request.getContextPath() );
      out.write("/css/agency.min.css\" rel=\"stylesheet\">\r\n");
      out.write("  \r\n");
      out.write("  <!-- Bootstrap core JavaScript -->\r\n");
      out.write("  <script src=\"");
      out.print(request.getContextPath() );
      out.write("/vendor/jquery/jquery.min.js\"></script>\r\n");
      out.write("  <script src=\"");
      out.print(request.getContextPath() );
      out.write("/vendor/bootstrap/js/bootstrap.bundle.min.js\"></script>\r\n");
      out.write("\r\n");
      out.write("  <!-- Plugin JavaScript -->\r\n");
      out.write("  <script src=\"");
      out.print(request.getContextPath() );
      out.write("/vendor/jquery-easing/jquery.easing.min.js\"></script>\r\n");
      out.write("\r\n");
      out.write("  <!-- Contact form JavaScript -->\r\n");
      out.write("  <script src=\"");
      out.print(request.getContextPath() );
      out.write("/js/jqBootstrapValidation.js\"></script>\r\n");
      out.write("  <script src=\"");
      out.print(request.getContextPath() );
      out.write("/js/contact_me.js\"></script>\r\n");
      out.write("\r\n");
      out.write("  <!-- Custom scripts for this template -->\r\n");
      out.write("  <script src=\"");
      out.print(request.getContextPath() );
      out.write("/js/agency.min.js\"></script>\r\n");
      out.write(" <style>\r\n");
      out.write(".page-top{\r\n");
      out.write("\twidth: 1024px;\r\n");
      out.write("\tposition : relative;\r\n");
      out.write("}\r\n");
      out.write("  \r\n");
      out.write("#profile-header{\r\n");
      out.write("\tpadding-bottom: 20px;\r\n");
      out.write("\tmargin: 0;\r\n");
      out.write("\tbackground-color:#fed136;\r\n");
      out.write("} \r\n");
      out.write("  \r\n");
      out.write("#sideNav {\r\n");
      out.write("    text-align: center;\r\n");
      out.write("    top: 0;\r\n");
      out.write("    left: 0;\r\n");
      out.write("    display: -webkit-box;\r\n");
      out.write("    display: -ms-flexbox;\r\n");
      out.write("    display: fixed;\r\n");
      out.write("    -webkit-box-orient: vertical;\r\n");
      out.write("    -webkit-box-direction: normal;\r\n");
      out.write("    -ms-flex-direction: column;\r\n");
      out.write("    flex-direction: column;\r\n");
      out.write("\twidth: 250px;\r\n");
      out.write("    /*height: 100vh;*/\r\n");
      out.write("    background: #fed136; \r\n");
      out.write("\r\n");
      out.write("}\r\n");
      out.write(".profile-circle{\r\n");
      out.write("\tmax-width: 10rem;\r\n");
      out.write("    max-height: 10rem;\r\n");
      out.write("    border: 0.5rem solid #212529;\r\n");
      out.write("    border-radius: 100%;\r\n");
      out.write("    min-width: 0;\r\n");
      out.write("    min-height: 0;\r\n");
      out.write("}\r\n");
      out.write("#sideNav .navbar-nav .nav-item .nav-link {\r\n");
      out.write("  font-weight: 800;\r\n");
      out.write("  letter-spacing: 0.05rem;\r\n");
      out.write("  text-transform: uppercase;\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write("#sideNav .navbar-toggler:focus {\r\n");
      out.write("  outline-color: #d48a6e;\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write("a .nav-link js-scroll-trigger{\r\n");
      out.write("\tcolor: #007bff;\r\n");
      out.write("    text-decoration: none;\r\n");
      out.write("    background-color: transparent;\r\n");
      out.write("\r\n");
      out.write("}\r\n");
      out.write("table{\r\n");
      out.write("\tmargin: 10 auto;\r\n");
      out.write("\tmargin-bottom: 30px;\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write("table tr :hover{\r\n");
      out.write("\tcursor: pointer;\r\n");
      out.write("\tcolor: orangered;\r\n");
      out.write("\t\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write("table td{\r\n");
      out.write("\tpadding: 10px;\r\n");
      out.write("\tborder-bottom: 1px solid #212529;\r\n");
      out.write("\tborder-collapse: collapse;\r\n");
      out.write("    border-right: 0;\r\n");
      out.write("    border-left:0;\r\n");
      out.write("    height: 50px;\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write("#sideNav, table {\r\n");
      out.write("\tfont-size: 90%;\r\n");
      out.write("    font-weight: 400;\r\n");
      out.write("   /* padding: .75em 0;*/\r\n");
      out.write("    letter-spacing: 1px;\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write("div#profile-header{\r\n");
      out.write("\tmargin: 0 auto;\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write("section#page-top{\r\n");
      out.write("\tposition: relative;\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write(".myPost{\r\n");
      out.write("\tposition: absolute;\r\n");
      out.write("\ttop:0;\r\n");
      out.write("\tleft: 260px;\r\n");
      out.write("\tborder:1px solid;\r\n");
      out.write("\tpadding: 10px;\r\n");
      out.write("\t\r\n");
      out.write("}\r\n");
      out.write("#content{\r\n");
      out.write("\tposition : absolute;\r\n");
      out.write("\ttop : 5%;\r\n");
      out.write("\tleft : 28%;\r\n");
      out.write("}\r\n");
      out.write("#content table{\r\n");
      out.write("\tborder-collapse : collapse;\r\n");
      out.write("\ttext-align : center;\r\n");
      out.write("\tline-height:1.5;\r\n");
      out.write("\tborder-top : 1px solid #ccc;\r\n");
      out.write("}\r\n");
      out.write("#content table th{\r\n");
      out.write("\tfont-weight : bold;\r\n");
      out.write("\tvertical-align : top;\r\n");
      out.write("\tcolor : #fff;\r\n");
      out.write("\tbackground : orange;\r\n");
      out.write("}\r\n");
      out.write("#content table td{\r\n");
      out.write("\tvartical-align : top;\r\n");
      out.write("\tborder-collapse: collapse;\r\n");
      out.write("\tborder-bottom : 1px solid orange;\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write("#content table tr:nth-child(2n){\r\n");
      out.write("\tbackground-color:#f7f2eb;\r\n");
      out.write("}\r\n");
      out.write("</style>\r\n");
      out.write("  \r\n");
      out.write(" <header class=\"masthead\" style=\"height:300px;\">\r\n");
      out.write("    <div class=\"container\">\r\n");
      out.write("      <div class=\"intro-text\" style=\"padding-top:140px; !important\">\r\n");
      out.write("        <div class=\"intro-heading text-uppercase\">\r\n");
      out.write("       \t\t관리자페이지\r\n");
      out.write("        </div>\r\n");
      out.write("     </div>\r\n");
      out.write("    </div>\r\n");
      out.write("  </header>\r\n");
      out.write("  \r\n");
      out.write("<section id=\"page-top\" style=\"padding:0px; !important;\">\r\n");
      out.write("  <nav id=\"sideNav\">\r\n");
      out.write("\t<div id=\"profile-header\">\r\n");
      out.write("      <img class=\"profile-circle\"  style=\"margin: 50px auto 12px;\" src=\"");
      out.print(request.getContextPath() );
      out.write("/img/이동욱.jpg\" alt=\"\">\r\n");
      out.write("      <p class=\"userprofile-userId\">관리자님, 안녕하세요!\r\n");
      out.write("\r\n");
      out.write("   </div>\r\n");
      out.write("\r\n");
      out.write("   <table id=\"tbl-usermenu0\">\r\n");
      out.write("   \t <tr>\r\n");
      out.write("   \t\t<td id=\"modifyUserInfo\">관리자 정보 수정</td>\r\n");
      out.write("   \t</tr>\r\n");
      out.write("\t<tr>\r\n");
      out.write("   \t\t<td id=\"userList\">회원보기</td>\r\n");
      out.write("   \t</tr>\r\n");
      out.write("\r\n");
      out.write("   \t\t<tr>\r\n");
      out.write("   \t\t\t<td id=\"business_registration\" onclick=\"location.href='");
      out.print(request.getContextPath());
      out.write("/travel/travelEnroll.do'\">업체 등록</td>\r\n");
      out.write("   \t\t</tr>\r\n");
      out.write("   \t\t<tr>\r\n");
      out.write("   \t\t\t<td>공지사항 등록</td>\r\n");
      out.write("   \t\t</tr>\r\n");
      out.write("   \t\t<tr>\r\n");
      out.write("   \t\t\t<td>문의관리</td>\r\n");
      out.write("   \t\t</tr>\r\n");
      out.write("   \t</table>\r\n");
      out.write("\r\n");
      out.write("  </nav>   \r\n");
      out.write(" \r\n");
      out.write("  \t<div id=\"content\">\r\n");
      out.write("  \t<form action=\"");
      out.print(request.getContextPath());
      out.write("/travel/travelEnrollEnd\"\r\n");
      out.write("  \t\t  name=\"travelEnrollFrm\"\r\n");
      out.write("  \t\t  id=\"travelEnrollFrm\"\r\n");
      out.write("  \t\t  method = \"post\"\r\n");
      out.write("  \t\t  enctype=\"multipart/form-data\">\r\n");
      out.write("  \t <div class=\"form-group\">\r\n");
      out.write("     <label for=\"exampleInputEmail1\">시설 명칭 입력</label>\r\n");
      out.write("    <input type=\"text\" class=\"form-control\" id=\"travelName\" aria-describedby=\"emailHelp\" placeholder=\"Name\" name=\"travelName\" required>\r\n");
      out.write("    <!-- <small id=\"emailHelp\" class=\"form-text text-muted\">We'll never share your email with anyone else.</small> -->\r\n");
      out.write("  </div>\r\n");
      out.write("  <div class=\"form-group\">\r\n");
      out.write("   <label for=\"exampleInputEmail1\">상세 주소 입력</label>\r\n");
      out.write("    <input type=\"text\" class=\"form-control\" id=\"travelLocation\" aria-describedby=\"emailHelp\" placeholder=\"Location\" name=\"travelLocation\" required>\r\n");
      out.write("    <small id=\"emailHelp\" class=\"form-text text-muted\">도로명 주소를 적어주세요.</small>\r\n");
      out.write("  </div>\r\n");
      out.write("\t<div class=\"form-group\">\r\n");
      out.write("    <label for=\"exampleInputEmail1\">사진등록</label><br />\r\n");
      out.write("    <input type=\"file\" name=\"fileName\" id=\"fileName\" style=\"text-align:center;\"/>\r\n");
      out.write("  </div>\r\n");
      out.write("  <div class=\"form-group\">\r\n");
      out.write("  <label for=\"exampleInputEmail1\">사업 등록자 이름</label>\r\n");
      out.write("    <input type=\"text\" class=\"form-control\" id=\"officierName\" aria-describedby=\"emailHelp\" placeholder=\"Officier\" name=\"officierName\" required>\r\n");
      out.write("  </div>\r\n");
      out.write("  <div class=\"form-group\">\r\n");
      out.write("  \t<label for=\"exampleInputEmail1\">사업 등록자 전화번호</label>\r\n");
      out.write("    <input type=\"text\" class=\"form-control\" id=\"officierPhone\" aria-describedby=\"emailHelp\" placeholder=\"Location\" name=\"officierPhone\" required>\r\n");
      out.write("  </div>\r\n");
      out.write("  \t<div class=\"form-group\">\r\n");
      out.write("    <label for=\"exampleInputEmail1\" id=\"userDefaultActivity\">여행 타입</label><br />\r\n");
      out.write("    <input type=\"checkbox\" name=\"program\" id=\"program1\" value=\"프로그램1\" />\r\n");
      out.write("\t\t\t\t\t<label for=\"program1\">프로그램1</label>\r\n");
      out.write("\t\t\t\t\t<input type=\"checkbox\" name=\"program\" id=\"program2\" value=\"프로그램2\" />\r\n");
      out.write("\t\t\t\t\t<label for=\"program2\">프로그램2</label>\r\n");
      out.write("\t\t\t\t\t<input type=\"checkbox\" name=\"program\" id=\"program3\" value=\"프로그램3\" />\r\n");
      out.write("\t\t\t\t\t<label for=\"program3\">프로그램3</label>\r\n");
      out.write("\t\t\t\t\t<input type=\"checkbox\" name=\"program\" id=\"program4\" value=\"프로그램4\" />\r\n");
      out.write("\t\t\t\t\t<label for=\"program4\">프로그램4</label>\r\n");
      out.write("\t\t\t\t\t<input type=\"checkbox\" name=\"program\" id=\"program5\" value=\"프로그램5\" />\r\n");
      out.write("\t\t\t\t\t<label for=\"program5\">프로그램5</label>\r\n");
      out.write("  </div>\r\n");
      out.write("  <div class=\"form-group\">\r\n");
      out.write("    <label for=\"exampleFormControlTextarea1\">시설 소개 내용</label>\r\n");
      out.write("    <textarea class=\"form-control\" id=\"exampleFormControlTextarea1\" name=\"content\" rows=\"7\"></textarea>\r\n");
      out.write("  </div>\r\n");
      out.write("\r\n");
      out.write("\t<div id=\"putt\" style=\"text-align:center;\">\r\n");
      out.write("\r\n");
      out.write("  <button type=\"submit\" class=\"btn btn-primary\" >등록</button>\r\n");
      out.write("  <button type=\"reset\" class=\"btn btn-primary\" >초기화</button>\r\n");
      out.write(" </div>\r\n");
      out.write(" </form>\r\n");
      out.write("   \t</div>\r\n");
      out.write(" </section>\r\n");
      out.write("\r\n");
      out.write("<script>\r\n");
      out.write("$(\"#userList\").click(()=>{\r\n");
      out.write("\t$.ajax({\r\n");
      out.write("\t\turl:\"");
      out.print(request.getContextPath());
      out.write("/jquery/gson/admin/selectAll.do\",\r\n");
      out.write("\t\ttype: \"get\",\r\n");
      out.write("\t\tdataType: \"json\",\r\n");
      out.write("\t\tsuccess: function(data){\r\n");
      out.write("\t\t\tconsole.log(data);\r\n");
      out.write("\t\t\t\r\n");
      out.write("\t\t\tvar $table = $(\"<table><th>아이디</th><th>닉네임</th><th>이름</th><th>성별</th><th>생년월일</th><th>이메일</th><th>여행지</th><th>활동</th><th>등록일</th></table>\");\r\n");
      out.write("\t\t\t$(data).each((i,u)=>{\r\n");
      out.write("\t\t\t\t\r\n");
      out.write("\t\t\t\tvar html = \"<tr>\";\r\n");
      out.write("\t\t\t\thtml += \"<td>\"+u.userId+\"</td>\";\r\n");
      out.write("\t\t\t\thtml += \"<td>\"+u.usernickName+\"</td>\";\r\n");
      out.write("\t\t\t\thtml += \"<td>\"+u.userName+\"</td>\";\r\n");
      out.write("\t\t\t\thtml += \"<td>\"+u.userGender+\"</td>\";\r\n");
      out.write("\t\t\t\thtml += \"<td>\"+u.userBirth+\"</td>\";\r\n");
      out.write("\t\t\t\thtml += \"<td>\"+u.userEmail+\"</td>\";\r\n");
      out.write("\t\t\t\thtml += \"<td>\"+u.userDefaultPlace+\"</td>\";\r\n");
      out.write("\t\t\t\thtml += \"<td>\"+u.userDefaultActivity+\"</td>\";\r\n");
      out.write("\t\t\t\thtml += \"<td>\"+u.userEnrollDate+\"</td>\";\r\n");
      out.write("\t\t\t\thtml += \"</tr>\";\r\n");
      out.write("\t\t\t\tconsole.log(html);\r\n");
      out.write("\t\t\t\t$table.append(html);\r\n");
      out.write("\t\t\t});\r\n");
      out.write("\t\t\t\r\n");
      out.write("\t\t\t$(\"#content\").html($table);\r\n");
      out.write("\t\t\t\r\n");
      out.write("\t\t\t\r\n");
      out.write("\t\t},\r\n");
      out.write("\t\terror: function(jqxhr, textStatus, errorThrown){\r\n");
      out.write("\t\t\tconsole.log(\"ajax 처리 실패!\");\r\n");
      out.write("\t\t\tconsole.log(jqxhr, textStatus, errorThrown);\r\n");
      out.write("\t\t}\r\n");
      out.write("\t});\r\n");
      out.write("});\r\n");
      out.write("</script>\r\n");
      out.write("\r\n");
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
