/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/8.5.42
 * Generated at: 2019-08-15 20:52:47 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp.WEB_002dINF.views.travel;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import user.model.service.UserService;
import sns.model.vo.ProfileSNS;
import sns.model.service.SNSService;
import user.model.vo.User;

public final class travelDetailPage_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent,
                 org.apache.jasper.runtime.JspSourceImports {

  private static final javax.servlet.jsp.JspFactory _jspxFactory =
          javax.servlet.jsp.JspFactory.getDefaultFactory();

  private static java.util.Map<java.lang.String,java.lang.Long> _jspx_dependants;

  static {
    _jspx_dependants = new java.util.HashMap<java.lang.String,java.lang.Long>(1);
    _jspx_dependants.put("/WEB-INF/views/common/header-menu.jsp", Long.valueOf(1565878183000L));
  }

  private static final java.util.Set<java.lang.String> _jspx_imports_packages;

  private static final java.util.Set<java.lang.String> _jspx_imports_classes;

  static {
    _jspx_imports_packages = new java.util.HashSet<>();
    _jspx_imports_packages.add("javax.servlet");
    _jspx_imports_packages.add("javax.servlet.http");
    _jspx_imports_packages.add("javax.servlet.jsp");
    _jspx_imports_classes = new java.util.HashSet<>();
    _jspx_imports_classes.add("user.model.service.UserService");
    _jspx_imports_classes.add("sns.model.vo.ProfileSNS");
    _jspx_imports_classes.add("sns.model.service.SNSService");
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
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("<!DOCTYPE html>\r\n");
      out.write("<html lang=\"ko\">\r\n");
      out.write(" <!-- Bootstrap core CSS -->\r\n");
      out.write("  <link href=\"/trav/vendor/bootstrap/css/bootstrap.min.css\" rel=\"stylesheet\">\r\n");
      out.write("  <!-- Custom fonts for this template -->\r\n");
      out.write("  <link href=\"/trav/vendor/fontawesome-free/css/all.min.css\" rel=\"stylesheet\" type=\"text/css\">\r\n");
      out.write("  <link href=\"https://fonts.googleapis.com/css?family=Montserrat:400,700\" rel=\"stylesheet\" type=\"text/css\">\r\n");
      out.write("  <link href='https://fonts.googleapis.com/css?family=Kaushan+Script' rel='stylesheet' type='text/css'>\r\n");
      out.write("  <link href='https://fonts.googleapis.com/css?family=Droid+Serif:400,700,400italic,700italic' rel='stylesheet' type='text/css'>\r\n");
      out.write("  <link href='https://fonts.googleapis.com/css?family=Roboto+Slab:400,100,300,700' rel='stylesheet' type='text/css'>\r\n");
      out.write("  <!-- Custom styles for this template -->\r\n");
      out.write("  <link href=\"/trav/css/agency.min.css\" rel=\"stylesheet\">\r\n");
      out.write("  <!-- Bootstrap core JavaScript -->\r\n");
      out.write("  <script src=\"/trav/vendor/jquery/jquery.min.js\"></script>\r\n");
      out.write("  <script src=\"/trav/vendor/bootstrap/js/bootstrap.bundle.min.js\"></script>\r\n");
      out.write("  <!-- Plugin JavaScript -->\r\n");
      out.write("  <script src=\"/trav/vendor/jquery-easing/jquery.easing.min.js\"></script>\r\n");
      out.write("  <!-- Contact form JavaScript -->\r\n");
      out.write("  <script src=\"/trav/js/jqBootstrapValidation.js\"></script>\r\n");
      out.write("  <script src=\"/trav/js/contact_me.js\"></script>\r\n");
      out.write("  <!-- Custom scripts for this template -->\r\n");
      out.write("  <script src=\"/trav/js/agency.min.js\"></script>\r\n");
      out.write("\r\n");
      out.write("\r\n");


	User userLoggedIn = (User)session.getAttribute("userLoggedIn");
	System.out.println("userLoggedIn@userLogin.jsp=" + userLoggedIn);
	User loggedIn = null;
	if(userLoggedIn!=null){
		loggedIn = new UserService().selectOne(userLoggedIn.getUserId());
	}

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
      out.write("header.masthead{\r\n");
      out.write("background-image:url(");
      out.print(request.getContextPath());
      out.write("/img/header-new.jpg);\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("}\r\n");
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
      out.write("          \r\n");
      out.write("\t\t  <li class=\"nav-item\">\r\n");
      out.write("\t\t  ");
 if(userLoggedIn!=null){
      out.write("\r\n");
      out.write("\t        <a class=\"nav-link js-scroll-trigger\" href=\"");
      out.print(request.getContextPath() );
      out.write("/story/storyMain?mypage=");
      out.print(userLoggedIn.getUserId() );
      out.write("\">여행이야기</a>\r\n");
      out.write("\t      ");
} else{ 
      out.write("\r\n");
      out.write("\t        <a class=\"nav-link js-scroll-trigger\" href=\"");
      out.print(request.getContextPath() );
      out.write("/story/storyMain\">여행이야기</a>\r\n");
      out.write("\t      ");
} 
      out.write("\r\n");
      out.write("\t      \r\n");
      out.write("\t      </li>\r\n");
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
      out.write("\t           \t");
if(userLoggedIn==null || userLoggedIn.getFileName()==null){
      out.write("\r\n");
      out.write("\t           \t\t<button onclick=\"location.href='");
      out.print(request.getContextPath() );
      out.write("/mypage/mypageView'\"></button>\r\n");
      out.write("\t           \t");
 } else if(userLoggedIn!=null && loggedIn!=null) {
      out.write("\r\n");
      out.write("\t           \t\t<img src=\"");
      out.print(request.getContextPath() );
      out.write("/upload/profile/");
      out.print(loggedIn.getFileName() );
      out.write("\" class=\"header-profile-circle\"  width=\"40\" height=\"40\" />\r\n");
      out.write("\t           \t");
} 
      out.write("\r\n");
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
      out.write("  ");
      out.write("\r\n");
      out.write("<script type=\"text/javascript\" src=\"//dapi.kakao.com/v2/maps/sdk.js?appkey=d2938583d97927bcf8d3eb5281b24f12&libraries=services\"></script>\r\n");
      out.write("\r\n");

	String contentId=request.getParameter("contentId");
	String contentTypeId=request.getParameter("contentTypeId");
	double avgGrade=(double)request.getAttribute("avgGrade");

      out.write("\r\n");
      out.write("\r\n");
      out.write("<script>\r\n");
      out.write("\t$(function(){\r\n");
      out.write("\t\t\r\n");
      out.write("\t\t$.ajax({\r\n");
      out.write("\t\t\turl: \"http://api.visitkorea.or.kr/openapi/service/rest/KorService/detailCommon?ServiceKey=Q3FUrD0IPezrGaAAYbNChhRz7RbeL7Iz0iFE1bEgU1NqkrU8PJw6M2yp%2BC0y7cdykSInV0eNP1Tl0ClQP9TDjw%3D%3D&contentTypeId=");
      out.print(contentTypeId);
      out.write("&contentId=");
      out.print(contentId);
      out.write("&MobileOS=ETC&MobileApp=TourAPI3.0_Guide&defaultYN=Y&firstImageYN=Y&areacodeYN=Y&catcodeYN=Y&addrinfoYN=Y&mapinfoYN=Y&overviewYN=Y&transGuideYN=Y\",\r\n");
      out.write("\t\t\ttype: \"get\",\r\n");
      out.write("\t\t\tdataType: \"xml\",\r\n");
      out.write("\t\t\tasync : false,\r\n");
      out.write("\t\t\tsuccess:function(data){\r\n");
      out.write("\t\t\t\tvar $root=$(data).find(\":root\");\r\n");
      out.write("\t\t\t\t\r\n");
      out.write("\t\t\t\tvar $items=$root.find(\"item\");\r\n");
      out.write("\t\t\t\tvar html=\"\";\r\n");
      out.write("\t\t\t\t\r\n");
      out.write("\t\t\t\tvar $root=$(data).find(\":root\");\t\t\t\t\r\n");
      out.write("\t\t\t\tvar $items=$root.find(\"item\");\r\n");
      out.write("\t\t\t\tvar html1 = \"\";\r\n");
      out.write("\t\t\t\tvar html2 = \"\";\r\n");
      out.write("\t\t\t\t$items.each(function(i,m){\t\t\t\t\t\t\r\n");
      out.write("\t\t\t\t\t\thtml1+=\"<div class='col-lg-7'>\";\r\n");
      out.write("\t\t\t\t\t\thtml1+=\"<img class='img-fluid rounded mb-4 mb-lg-0' src='\"+$(m).find(\"firstimage\").text()+\"' alt=''>\";\r\n");
      out.write("\t\t\t\t\t\thtml1+=\"</div>\";\r\n");
      out.write("\t\t\t\t\t\thtml1+=\"<div class='col-lg-5'>\";\r\n");
      out.write("\t\t\t\t\t\thtml1+=\"<h1 class='font-weight-light'>\"+$(m).find(\"title\").text()+\"</h1>\";\r\n");
      out.write("\t\t\t\t\t\thtml1+=\"<input type='hidden' id='title' value='\"+$(m).find(\"title\").text()+\"'>\";\r\n");
      out.write("\t\t\t\t\t\thtml1+=\"<p>\"+$(m).find(\"addr1\").text()+\"</p>\";\r\n");
      out.write("\t\t\t\t\t\thtml1+=\"<input type='hidden' id='address' value='\"+$(m).find(\"addr1\").text()+\"'>\";\r\n");
      out.write("\t\t\t\t\t\thtml1+=\"<p>별점(5점만점):\"+");
      out.print(avgGrade);
      out.write("+\"</p>\";\r\n");
      out.write("\t\t\t\t\t\thtml1+=\"<p class='star_rating'>\";\r\n");
      out.write("\t\t\t\t\t\thtml1+=\"<a href='#' id='s1'>★</a>\";\r\n");
      out.write("\t\t\t\t\t\thtml1+=\"<a href='#' id='s2'>★</a>\";\r\n");
      out.write("\t\t\t\t\t\thtml1+=\"<a href='#' id='s3'>★</a>\";\r\n");
      out.write("\t\t\t\t\t\thtml1+=\"<a href='#' id='s4'>★</a>\";\r\n");
      out.write("\t\t\t\t\t\thtml1+=\"<a href='#' id='s5'>★</a>\";\r\n");
      out.write("\t\t\t\t\t\thtml1+=\"</p>\";\r\n");
      out.write("\t\t\t\t\t\thtml1+=\"<button onclick='map();'>지도보기</button>\";\r\n");
      out.write("\t\t\t\t\t\thtml1+=\"<div id='map' style='width:400px;height:300px;'></div>\";\r\n");
      out.write("\t\t\t\t\t\thtml1+=\"</div>\";\t\t\t\t\t\t\t\t\t\t\t\t\t\r\n");
      out.write("\t\t\t\t\t\r\n");
      out.write("\t\t\t\t\t\thtml2+=\"<div class='card-body'>\";\r\n");
      out.write("\t\t\t\t\t\thtml2+=\"<p class='text-white m-0'>\"+$(m).find(\"overview\").text()+\"</p>\";\r\n");
      out.write("\t\t\t\t\t\thtml2+=\"</div>\";\r\n");
      out.write("\t\t\t\t});\r\n");
      out.write("\t\t\t\t$(\"#content1\").html(html1);\r\n");
      out.write("\t\t\t\t$(\"#content2\").html(html2);\r\n");
      out.write("\t\t\t},\r\n");
      out.write("\t\t\terror:function(jqxhr,textStatus,errorThrown){\r\n");
      out.write("\t\t\t\t\r\n");
      out.write("\t\t\t}\r\n");
      out.write("\t\t});\r\n");
      out.write("\t\t\r\n");
      out.write("\t\tif(");
      out.print(avgGrade);
      out.write("==0){\r\n");
      out.write("\t\t\t\r\n");
      out.write("\t\t}else if(");
      out.print(avgGrade);
      out.write(">0&&");
      out.print(avgGrade);
      out.write("<=1){\r\n");
      out.write("\t\t\t$(\"#s1\").addClass(\"on\");\r\n");
      out.write("\t\t}else if(");
      out.print(avgGrade);
      out.write(">1&&");
      out.print(avgGrade);
      out.write("<=2){\r\n");
      out.write("\t\t\t$(\"#s1\").addClass(\"on\");\r\n");
      out.write("\t\t\t$(\"#s2\").addClass(\"on\");\r\n");
      out.write("\t\t}else if(");
      out.print(avgGrade);
      out.write(">2&&");
      out.print(avgGrade);
      out.write("<=3){\r\n");
      out.write("\t\t\t$(\"#s1\").addClass(\"on\");\r\n");
      out.write("\t\t\t$(\"#s2\").addClass(\"on\");\r\n");
      out.write("\t\t\t$(\"#s3\").addClass(\"on\");\r\n");
      out.write("\t\t}else if(");
      out.print(avgGrade);
      out.write(">3&&");
      out.print(avgGrade);
      out.write("<=4){\r\n");
      out.write("\t\t\t$(\"#s1\").addClass(\"on\");\r\n");
      out.write("\t\t\t$(\"#s2\").addClass(\"on\");\r\n");
      out.write("\t\t\t$(\"#s3\").addClass(\"on\");\r\n");
      out.write("\t\t\t$(\"#s4\").addClass(\"on\");\r\n");
      out.write("\t\t}else if(");
      out.print(avgGrade);
      out.write(">4&&");
      out.print(avgGrade);
      out.write("<=5){\r\n");
      out.write("\t\t\t$(\"#s1\").addClass(\"on\");\r\n");
      out.write("\t\t\t$(\"#s2\").addClass(\"on\");\r\n");
      out.write("\t\t\t$(\"#s3\").addClass(\"on\");\r\n");
      out.write("\t\t\t$(\"#s4\").addClass(\"on\");\r\n");
      out.write("\t\t\t$(\"#s5\").addClass(\"on\");\r\n");
      out.write("\t\t}\r\n");
      out.write("\r\n");
      out.write("\t});\r\n");
      out.write("\t\r\n");
      out.write("\tfunction reservationForm(){\r\n");
      out.write("\t\tvar title=$(\"#title\").val();\r\n");
      out.write("\t\t\r\n");
      out.write("\t\tlocation.href=\"");
      out.print(request.getContextPath());
      out.write("/travel/reservationForm?contentId=");
      out.print(contentId);
      out.write("&contentTypeId=");
      out.print(contentTypeId);
      out.write("&title=\"+title;\r\n");
      out.write("\t}\r\n");
      out.write("\t\r\n");
      out.write("\tfunction map(){\r\n");
      out.write("\t\tvar addr=$(\"#address\").val();\r\n");
      out.write("\t\tvar title=$(\"#title\").val();\r\n");
      out.write("\t\tconsole.log(addr);\r\n");
      out.write("\t\tvar container = document.getElementById('map'); //지도를 담을 영역의 DOM 레퍼런스\r\n");
      out.write("\t\tvar options = { //지도를 생성할 때 필요한 기본 옵션\r\n");
      out.write("\t\t\tcenter: new kakao.maps.LatLng(33.450701, 126.570667), //지도의 중심좌표.\r\n");
      out.write("\t\t\tlevel: 3 //지도의 레벨(확대, 축소 정도)\r\n");
      out.write("\t\t};\r\n");
      out.write("\r\n");
      out.write("\t\tvar map = new kakao.maps.Map(container, options); //지도 생성 및 객체 리턴\r\n");
      out.write("\t\t// 주소-좌표 변환 객체를 생성합니다\r\n");
      out.write("\t\tvar geocoder = new kakao.maps.services.Geocoder();\r\n");
      out.write("\r\n");
      out.write("\t\t// 주소로 좌표를 검색합니다\r\n");
      out.write("\t\tgeocoder.addressSearch(addr, function(result, status) {\r\n");
      out.write("\r\n");
      out.write("\t\t    // 정상적으로 검색이 완료됐으면 \r\n");
      out.write("\t\t     if (status === kakao.maps.services.Status.OK) {\r\n");
      out.write("\r\n");
      out.write("\t\t        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);\r\n");
      out.write("\r\n");
      out.write("\t\t        // 결과값으로 받은 위치를 마커로 표시합니다\r\n");
      out.write("\t\t        var marker = new kakao.maps.Marker({\r\n");
      out.write("\t\t            map: map,\r\n");
      out.write("\t\t            position: coords\r\n");
      out.write("\t\t        });\r\n");
      out.write("\r\n");
      out.write("\t\t        // 인포윈도우로 장소에 대한 설명을 표시합니다\r\n");
      out.write("\t\t        var infowindow = new kakao.maps.InfoWindow({\r\n");
      out.write("\t\t            content: '<div style=\"width:150px;text-align:center;padding:6px 0;\">'+title+'</div>'\r\n");
      out.write("\t\t        });\r\n");
      out.write("\t\t        infowindow.open(map, marker);\r\n");
      out.write("\r\n");
      out.write("\t\t        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다\r\n");
      out.write("\t\t        map.setCenter(coords);\r\n");
      out.write("\t\t    } \r\n");
      out.write("\t\t});    \r\n");
      out.write("\t}\r\n");
      out.write("</script>\r\n");
      out.write("<style>\r\n");
      out.write("\t.star_rating {font-size:0; letter-spacing:-4px;}\r\n");
      out.write("\t.star_rating a {\r\n");
      out.write("    font-size:22px;\r\n");
      out.write("    letter-spacing:0;\r\n");
      out.write("    display:inline-block;\r\n");
      out.write("    margin-left:5px;\r\n");
      out.write("    color:#ccc;\r\n");
      out.write("    text-decoration:none;\r\n");
      out.write("\t}\r\n");
      out.write("\t.star_rating a:first-child {margin-left:0;}\r\n");
      out.write("\t.star_rating a.on {color:#777;}\r\n");
      out.write("\r\n");
      out.write("</style>\r\n");
      out.write("</head>\r\n");
      out.write("<body>\r\n");
      out.write("\t<header class=\"masthead\" style=\"height:300px;\">\r\n");
      out.write("    \t<div class=\"container\">\r\n");
      out.write("      \t<div class=\"intro-text\" style=\"padding-top:140px; !important\">\r\n");
      out.write("        \t<div class=\"intro-heading text-uppercase\">\r\n");
      out.write("       \t\t\r\n");
      out.write("        \t</div>\r\n");
      out.write("     \t</div>\r\n");
      out.write("    \t</div>\r\n");
      out.write("  \t</header>\r\n");
      out.write("  \t\r\n");
      out.write("\r\n");
      out.write("  <!-- Page Content -->\r\n");
      out.write("  <div class=\"container\">\r\n");
      out.write("\t\r\n");
      out.write("\t");
if(contentTypeId.equals("32")&&userLoggedIn!=null){
      out.write("\r\n");
      out.write("\t\t<button type=\"button\" onclick=\"reservationForm();\">예약하러가기</button>\r\n");
      out.write("\t ");
} 
      out.write("  \r\n");
      out.write("    \r\n");
      out.write("    <!-- Heading Row -->\r\n");
      out.write("    <div class=\"row align-items-center my-5\" id=\"content1\">\r\n");
      out.write("        \r\n");
      out.write("    </div>\r\n");
      out.write("    <!-- /.row -->\r\n");
      out.write("\r\n");
      out.write("    <!-- Call to Action Well -->\r\n");
      out.write("    <div class=\"card text-white bg-secondary my-5 py-4 text-center\" id=\"content2\">\r\n");
      out.write("      \r\n");
      out.write("    </div>\r\n");
      out.write("\r\n");
      out.write("\t\r\n");
      out.write("  </div>\r\n");
      out.write(" \r\n");
      out.write("\t\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\t\r\n");
      out.write("</body>\r\n");
      out.write("</html>\r\n");
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
