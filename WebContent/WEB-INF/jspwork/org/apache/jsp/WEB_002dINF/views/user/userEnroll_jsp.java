/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/8.5.42
 * Generated at: 2019-08-17 09:37:03 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp.WEB_002dINF.views.user;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import user.model.service.UserService;
import sns.model.vo.ProfileSNS;
import sns.model.service.SNSService;
import user.model.vo.User;

public final class userEnroll_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent,
                 org.apache.jasper.runtime.JspSourceImports {

  private static final javax.servlet.jsp.JspFactory _jspxFactory =
          javax.servlet.jsp.JspFactory.getDefaultFactory();

  private static java.util.Map<java.lang.String,java.lang.Long> _jspx_dependants;

  static {
    _jspx_dependants = new java.util.HashMap<java.lang.String,java.lang.Long>(1);
    _jspx_dependants.put("/WEB-INF/views/common/header-menu.jsp", Long.valueOf(1566010913000L));
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
      out.write("/upload/profile/");
      out.print(loggedIn.getFileName() );
      out.write("\" class=\"header-profile-circle\"  width=\"40\" height=\"40\" />\r\n");
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
      out.write("<script>\r\n");
      out.write("function checkIdDulplicate(){\r\n");
      out.write("\t\r\n");
      out.write("\tvar userId_ = $(\"#userId\").val().trim();\r\n");
      out.write("\tif(userId_.length < 4){\r\n");
      out.write("\t\talert(\"아이디는 4 글자 이상 입력하세요.\");\r\n");
      out.write("\t\treturn;\r\n");
      out.write("\t}\r\n");
      out.write("\t\r\n");
      out.write("\tvar url = \"");
      out.print(request.getContextPath());
      out.write("/enroll/CheckIdDuplicate\";\r\n");
      out.write("\tvar title = \"checkIdDuplicatePopup\";\r\n");
      out.write("\tvar status = \"width=300px, height=200px, left=50px, top=50px\";\r\n");
      out.write("\tvar popup = open(\"\", title,status);\r\n");
      out.write("\t\r\n");
      out.write("\t//폼과 팝업 연결\r\n");
      out.write("\tvar frm = document.checkIdDuplicateFrm;\r\n");
      out.write("\tfrm.userId.value = userId_;\r\n");
      out.write("\tfrm.action = url;\r\n");
      out.write("\tfrm.target = title;\r\n");
      out.write("\tfrm.method = \"post\";\r\n");
      out.write("\tfrm.submit();\r\n");
      out.write("\t\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write(" function enrollValidate(){\r\n");
      out.write("\t\r\n");
      out.write("\t\tif($(\"#idValid\").val()==1){\r\n");
      out.write("\t\t\talert(\"아이디 중복검사를 해주세요.\");\r\n");
      out.write("\t\t\treturn false;\r\n");
      out.write("\t\t}\r\n");
      out.write("\t\t\r\n");
      out.write("\t\tvar regExp = /^[a-zA-Z]{1}[a-zA-Z0-9_]{4,11}$/;\r\n");
      out.write("\t\t\r\n");
      out.write("\t\tif(regExp.test($('#userId').val())==false){\r\n");
      out.write("\t\t\t\r\n");
      out.write("\t\t\talert(\" 아이디는 영어,숫자로 구성된 5~12자로 구성되어야 합니다.(영문으로 시작)\");\r\n");
      out.write("\t\t\tuserId.focus();\r\n");
      out.write("\t\t\treturn false;\r\n");
      out.write("\t\t\t\r\n");
      out.write("\t\t}\r\n");
      out.write("\t\t\r\n");
      out.write("\t\tvar nick = $('#usernickName').val();\r\n");
      out.write("\t\t\tif(nick.trim().length ==0){\r\n");
      out.write("\t\t\t\talert(\"닉네임을 입력하세요.\");\r\n");
      out.write("\t\t\t\tusernickName.focus();\r\n");
      out.write("\t\t\t\treturn false;\r\n");
      out.write("\t\t}\r\n");
      out.write("\t\t\r\n");
      out.write("\t\tvar password = $('#userPassword').val();\r\n");
      out.write("\t\tvar password2 = $('#password-chk').val();\r\n");
      out.write("\t\t\tif(password.trim().length==0){\r\n");
      out.write("\t\t\t\talert(\"비밀번호를 입력하세요.\");\r\n");
      out.write("\t\t\t\treturn false;\r\n");
      out.write("\t\t}\r\n");
      out.write("\t\t\t\r\n");
      out.write("\t\tvar pass= /^[a-zA-Z0-9]{7,19}$/;\r\n");
      out.write("\t\tif(pass.test(password)==true){\r\n");
      out.write("\r\n");
      out.write("\t\t}\r\n");
      out.write("\t\telse{\r\n");
      out.write("\t\t\talert(\"비밀번호는 8자리 이상이며 영어, 숫자로 이루어져 있습니다.\")\r\n");
      out.write("\t\t\treturn false;\r\n");
      out.write("\t\t}\r\n");
      out.write("\t\t\t\r\n");
      out.write("\t\tif(password !=password2){\r\n");
      out.write("\t\t\t\talert(\"비밀번호가 다릅니다.\");\r\n");
      out.write("\t\t\t\tpassword = \"\";\r\n");
      out.write("\t\t\t\tpassword2 = \"\";\r\n");
      out.write("\t\t\t\tuserPassword.focus();\r\n");
      out.write("\t\t\t\treturn false;\r\n");
      out.write("\t\t\t}\r\n");
      out.write("\t\t\t\r\n");
      out.write("\t\t\r\n");
      out.write("\t\t\tvar birth = $('#userBirth').val();\r\n");
      out.write("\t\t\t\r\n");
      out.write("\t\t\tif(birth.trim().length==0){\r\n");
      out.write("\t\t\t\talert(\"생년월일을 입력하세요.\");\r\n");
      out.write("\t\t\t\treturn false;\r\n");
      out.write("\t\t\t}\t\t\t\t \r\n");
      out.write("\t\t\tvar dayRegExp = /^(19[0-9][0-9]|20\\d{2})-(0[0-9]|1[0-2])-(0[1-9]|[1-2][0-9]|3[0-1])$/;\r\n");
      out.write("\t\t\tif(dayRegExp.test(birth)==true){\t\r\n");
      out.write("\t\t\t}\r\n");
      out.write("\t\t\telse{\r\n");
      out.write("\t\t\t\talert(\"생년월일을 2000-01-01식으로 적어주세요\");\r\n");
      out.write("\t\t\t\tuserBirth.focus();\r\n");
      out.write("\t\t\t\treturn false;\r\n");
      out.write("\t\t\t}\r\n");
      out.write("\t\t\t\r\n");
      out.write("\r\n");
      out.write("\t\t\tvar phone = $('#userPhone').val();\r\n");
      out.write("\t\t\tif(phone.trim().length==0){\r\n");
      out.write("\t\t\talert(\"핸드폰 번호를 입력하세요.\");\r\n");
      out.write("\t\t\treturn false;\r\n");
      out.write("\t\t\t}\r\n");
      out.write("\t\t\tvar regExp_phone= /^(0)(\\d{2}).*(\\d{3}).*(\\d{4})/\r\n");
      out.write("\t\t\tif(regExp_phone.test(phone)==true){\r\n");
      out.write("\t\t\t}\r\n");
      out.write("\t\t\telse{\r\n");
      out.write("\t\t\t\talert(\"정확한 전화번호를 입력하세요.\");\r\n");
      out.write("\t\t\t\tuserPhone.focus();\r\n");
      out.write("\t\t\t\treturn false;\r\n");
      out.write("\t\t\t}\r\n");
      out.write("\t\t\r\n");
      out.write("\t\treturn true;\t\r\n");
      out.write("\t} \r\n");
      out.write(" \r\n");
      out.write("function check_only(chk){\r\n");
      out.write("\tvar obj = document.getElementsByName(\"userGender\");\r\n");
      out.write("\tfor(var i =0; i<obj.length; i++){\r\n");
      out.write("\t\tif(obj[i] !=chk){\r\n");
      out.write("\t\t\tobj[i].checked=false;\r\n");
      out.write("\t\t}\r\n");
      out.write("\t}\r\n");
      out.write("}\r\n");
      out.write("</script>\r\n");
      out.write("<style>\r\n");
      out.write("#userEnrollFrm{\r\n");
      out.write("\twidth : 400px;\r\n");
      out.write("\tmargin-left : auto;\r\n");
      out.write("\tmargin-right : auto;\r\n");
      out.write("}\r\n");
      out.write(".form-input{\r\n");
      out.write("\tmargin : 40px 0;\r\n");
      out.write("\twidth : 100%;\r\n");
      out.write("/* \ttext-align : center; */\r\n");
      out.write("\tright : 30%;\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write("a{\r\n");
      out.write("\tcolor:black;\r\n");
      out.write("}\r\n");
      out.write(".page-top{\r\n");
      out.write("\twidth: 1024px;\r\n");
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
      out.write("\tpadding: 10px;\t\t\r\n");
      out.write("\t\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write("p.userprofile-userId{\r\n");
      out.write("\tmargin-bottom: 40px;\r\n");
      out.write("}\r\n");
      out.write("#content{\r\n");
      out.write("\tposition : absolute;\r\n");
      out.write("\ttop : 7%;\r\n");
      out.write("\tleft : 28%;\r\n");
      out.write("}\r\n");
      out.write("#fname{\r\n");
      out.write("\tposition : absolute;\r\n");
      out.write("\tleft : 28%;\r\n");
      out.write("\t\r\n");
      out.write("\tbackground-color : white;\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write("#putt{\r\n");
      out.write("\ttext-align: center;\r\n");
      out.write("}\r\n");
      out.write("z\r\n");
      out.write("</style>\r\n");
      out.write("<header class=\"masthead\" style=\"height:300px;\">\r\n");
      out.write("    <div class=\"container\">\r\n");
      out.write("      <div class=\"intro-text\" style=\"padding-top:140px; !important\">\r\n");
      out.write("        <div class=\"intro-heading text-uppercase\">\r\n");
      out.write("       \t\t회원가입\r\n");
      out.write("        </div>\r\n");
      out.write("     </div>\r\n");
      out.write("    </div>\r\n");
      out.write("  </header>\r\n");
      out.write("<section id=\"page-top\" style=\"padding:0px; !important;\">\r\n");
      out.write("<form action=\"\" name=\"checkIdDuplicateFrm\">\r\n");
      out.write("\t<input type=\"hidden\" name=\"userId\" /> \r\n");
      out.write("</form>\r\n");
      out.write("<br />\r\n");
      out.write("\t\t<div class=\"form-input\">\r\n");
      out.write("\t\t<form action=\"");
      out.print(request.getContextPath());
      out.write("/enroll/userEnrollEnd\"\r\n");
      out.write("\t\t\t  name=\"userEnrollFrm\"\r\n");
      out.write("\t\t\t  id=\"userEnrollFrm\"\r\n");
      out.write("\t\t\t  method=\"post\"\r\n");
      out.write("\t\t\t  enctype=\"multipart/form-data\"\r\n");
      out.write("\t\t\t  onsubmit=\"return enrollValidate();\">\r\n");
      out.write("\t\t\r\n");
      out.write("  <div class=\"form-group\">\r\n");
      out.write(" \t <input type=\"text\" name=\"userType\" id=\"userType\"\r\n");
      out.write("\t\t\tstyle=\"display:none;\" value=\"D\" />\r\n");
      out.write("    <label for=\"exampleInputEmail1\">아이디</label>\r\n");
      out.write("    <br>\r\n");
      out.write("    <input type=\"text\" class=\"form-control\" id=\"userId\" aria-describedby=\"emailHelp\" placeholder=\"ID\" name=\"userId\" required>\r\n");
      out.write("    <br />\r\n");
      out.write("    <input type=\"button\" value=\"check id\" onclick=\"checkIdDulplicate();\" style=\"float:right\" class=\"btn btn-primary\">\r\n");
      out.write("    <input type=\"hidden\" id=\"idValid\" value=\"1\"/>\r\n");
      out.write("    <small id=\"emailHelp\" class=\"form-text text-muted\">영어,숫자로 구성된 5~12자를 입력하세요.<br>(영문으로 시작)</small> \r\n");
      out.write("  </div>\r\n");
      out.write("  <br>\r\n");
      out.write("  <div class=\"form-group\">\r\n");
      out.write(" \t <input type=\"text\" name=\"userType\" id=\"userType\"\r\n");
      out.write("\t\t\tstyle=\"display:none;\" value=\"D\" />\r\n");
      out.write("    <label for=\"exampleInputEmail1\">닉네임</label>\r\n");
      out.write("    <input type=\"text\" class=\"form-control\" id=\"usernickName\" aria-describedby=\"emailHelp\" placeholder=\"NickName\" name=\"usernickName\">\r\n");
      out.write("  </div>\r\n");
      out.write("  <br>\r\n");
      out.write("  <div class=\"form-group\">\r\n");
      out.write("    <label for=\"exampleInputPassword1\">비밀번호</label>\r\n");
      out.write("    <input type=\"password\" class=\"form-control\" id=\"userPassword\" placeholder=\"Password\" name=\"userPassword\" required>\r\n");
      out.write("    <small id=\"emailHelp\" class=\"form-text text-muted\">비밀번호는 영어, 숫자로 8글자 이상 적어주세요.</small> \r\n");
      out.write("  </div>\r\n");
      out.write("  <br>\r\n");
      out.write("  <div class=\"form-group\">\r\n");
      out.write("    <label for=\"exampleInputPassword1\">비밀번호 확인</label>\r\n");
      out.write("    <input type=\"password\" class=\"form-control\" id=\"password-chk\" placeholder=\"Password\" name=\"password-chk\" required>\r\n");
      out.write("    <small id=\"emailHelp\" class=\"form-text text-muted\">위와 동일한 비밀번호를 적어주세요.</small> \r\n");
      out.write("  </div>\r\n");
      out.write("  <br>\r\n");
      out.write("  <div class=\"form-group\">\r\n");
      out.write("    <label for=\"exampleInputEmail1\">이름</label>\r\n");
      out.write("    <input type=\"text\" class=\"form-control\" id=\"exampleInputEmail1\" aria-describedby=\"emailHelp\" placeholder=\"Name\" name=\"userName\" required>\r\n");
      out.write("  </div>\r\n");
      out.write("  <br>\r\n");
      out.write("   <div class=\"form-group\">\r\n");
      out.write("    <label for=\"exampleInputEmail1\">생년월일</label>\r\n");
      out.write("    <input type=\"text\" class=\"form-control\" id=\"userBirth\" aria-describedby=\"emailHelp\" placeholder=\"2000-01-01\"name=\"userBirth\">\r\n");
      out.write("    <small id=\"emailHelp\" class=\"form-text text-muted\">2000-01-01식으로 적어주세요</small> \r\n");
      out.write("  </div>\r\n");
      out.write("  <br>\r\n");
      out.write("   <div class=\"form-group\">\r\n");
      out.write("    <label for=\"exampleInputEmail1\">이메일</label>\r\n");
      out.write("    <input type=\"email\" class=\"form-control\" id=\"exampleInputEmail1\" aria-describedby=\"emailHelp\" placeholder=\"abc@naver.com\"name=\"userEmail\">\r\n");
      out.write("    <small id=\"emailHelp\" class=\"form-text text-muted\">abc@trav.com 식으로 적어주세요.</small> \r\n");
      out.write("  </div>\r\n");
      out.write("  <br>\r\n");
      out.write("   <div class=\"form-group\">\r\n");
      out.write("    <label for=\"exampleInputEmail1\">휴대폰</label>\r\n");
      out.write("    <input type=\"tel\" class=\"form-control\" id=\"userPhone\" aria-describedby=\"emailHelp\" placeholder=\"(-없이)01012345678\"name=\"userPhone\"\r\n");
      out.write("    \t\tmaxlength=\"11\" required>\r\n");
      out.write("    <small id=\"emailHelp\" class=\"form-text text-muted\">'-'없이 11자리를 적어주세요.</small> \r\n");
      out.write("  </div><br />\r\n");
      out.write("  <div class=\"form-check form-check-inline\">\r\n");
      out.write("  <input class=\"form-check-input\" type=\"checkbox\" id=\"userGender\" name=\"userGender\" value=\"M\" checked\r\n");
      out.write("    \t\tonclick=\"check_only(this)\">\r\n");
      out.write("  <label class=\"form-check-label\" for=\"inlineCheckbox1\">남</label>\r\n");
      out.write("</div>\r\n");
      out.write("<div class=\"form-check form-check-inline\">\r\n");
      out.write("  <input class=\"form-check-input\" type=\"checkbox\" name=\"userGender\" id=\"userGender\" value=\"F\"\r\n");
      out.write("    \t\tonclick=\"check_only(this)\">\r\n");
      out.write("  <label class=\"form-check-label\" for=\"inlineCheckbox2\">여</label>\r\n");
      out.write("</div><br /><br />\r\n");
      out.write("<div class=\"form-group\">\r\n");
      out.write("    <label for=\"exampleInputEmail1\">사진등록</label><br />\r\n");
      out.write("    <input type=\"file\" name=\"fileName\" id=\"fileName\" style=\"text-align:center;\"/>\r\n");
      out.write("  </div>\r\n");
      out.write("    <small id=\"emailHelp\" class=\"form-text text-muted\">필수사항이 아닙니다.</small> \r\n");
      out.write("  \r\n");
      out.write("  <br /><br />\r\n");
      out.write("  \t\r\n");
      out.write("<div id=\"putt\" style=\"text-align:center;\">\r\n");
      out.write("  <button type=\"submit\" class=\"btn btn-primary\" >회원가입</button>\r\n");
      out.write("  <button type=\"reset\" class=\"btn btn-primary\" >초기화</button>\r\n");
      out.write(" </div>\r\n");
      out.write("\r\n");
      out.write("</form>\r\n");
      out.write("</section>\r\n");
      out.write("</div>\r\n");
      out.write("\r\n");
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
