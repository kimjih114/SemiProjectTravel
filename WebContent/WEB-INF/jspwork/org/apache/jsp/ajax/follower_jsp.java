/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/8.5.42
 * Generated at: 2019-08-12 22:25:48 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp.ajax;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import sns.model.vo.ProfileSNS;
import java.util.List;

public final class follower_jsp extends org.apache.jasper.runtime.HttpJspBase
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
    _jspx_imports_classes = new java.util.HashSet<>();
    _jspx_imports_classes.add("java.util.List");
    _jspx_imports_classes.add("sns.model.vo.ProfileSNS");
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

      out.write('\n');
      out.write('\n');
      out.write('\n');

	String mypage = request.getParameter("mypage");

      out.write("\n");
      out.write("<style>\n");
      out.write("#follower-container {\n");
      out.write("\twidth:540px;\n");
      out.write("\tmargin:0 auto;\n");
      out.write("\ttext-align:center;\n");
      out.write("\tposition: absolute;\n");
      out.write("\tleft:220px;\n");
      out.write("\ttransition: 0.5s;\n");
      out.write("\ttop:10px;\n");
      out.write("}\n");
      out.write("\n");
      out.write("\n");
      out.write("#follower-container .tab {\n");
      out.write("\tlist-style: none;\n");
      out.write("\tmargin: 0;\n");
      out.write("\tpadding: 0;\n");
      out.write("\toverflow: hidden;\n");
      out.write("}\n");
      out.write("/* Float the list items side by side */\n");
      out.write("#follower-container .tab li {\n");
      out.write("\tfloat: left;\n");
      out.write("\twidth: 33.3333%;\n");
      out.write("\tborder-bottom: 1px solid;\n");
      out.write("}\n");
      out.write("/* Style the links inside the list items */\n");
      out.write("#follower-container .tab li a {\n");
      out.write("\tdisplay: inline-block;\n");
      out.write("\tcolor: #000;\n");
      out.write("\ttext-align: center;\n");
      out.write("\ttext-decoration: none;\n");
      out.write("\tpadding: 14px 16px;\n");
      out.write("\tfont-size: 17px;\n");
      out.write("\ttransition:0.3s;\n");
      out.write("\tcursor: pointer;\n");
      out.write("}\n");
      out.write("/* Style the tab content */\n");
      out.write("#follower-container .tabcontent {\n");
      out.write("\tdisplay: none;\n");
      out.write("\tbackground-color:black;\n");
      out.write("\tpadding: 6px 5px;\n");
      out.write("\tcolor:#fff;\n");
      out.write("}\n");
      out.write("#follower-container ul.tab li.current{\n");
      out.write("\tbackground-color: #fed136;\n");
      out.write("\tcolor: #222;\n");
      out.write("\tborder:1px solid;\n");
      out.write("\tborder-bottom: 0;\n");
      out.write("}\n");
      out.write("#follower-container .tabcontent.current {\n");
      out.write("\tdisplay: block;\n");
      out.write("\tbackground: white;\n");
      out.write("\tcolor: black;\n");
      out.write("\tborder: 1px solid;\n");
      out.write("\tborder-top: 0px;\n");
      out.write("\tborder-collapse: collapse;\n");
      out.write("\t\n");
      out.write("}\n");
      out.write("div.followListContainer{\n");
      out.write("\tmargin:0 auto;\n");
      out.write("}\n");
      out.write("table.followList{\n");
      out.write("\twidth: 527px;\n");
      out.write("\tborder:1px solid black;\n");
      out.write("}\n");
      out.write("table.followList td{\n");
      out.write("\twidth: 527px;\n");
      out.write("\tborder:1px solid black;\n");
      out.write("\tpadding: 10px;\n");
      out.write("\tborder-collapse: collapse;\n");
      out.write("}\n");
      out.write("#followerSearch{\n");
      out.write("\twidth: 200px;\n");
      out.write("\tfloat:left;\n");
      out.write("\tmargin: 10px;\n");
      out.write("}\n");
      out.write("\n");
      out.write("</style>\n");
      out.write("<script>\n");
      out.write("$(()=>{\n");
      out.write("\tvar param = {\n");
      out.write("\t\t\tmypage : '");
      out.print(mypage);
      out.write("'\n");
      out.write("\t}\n");
      out.write("\t$.ajax({\n");
      out.write("\t\turl:\"");
      out.print(request.getContextPath() );
      out.write("/gson/sns/followOneList.do\",\n");
      out.write("\t\ttype:\"get\",\n");
      out.write("\t\tdata:param,\n");
      out.write("\t\tdataType:\"json\",\n");
      out.write("\t\tsuccess: function(data){\n");
      out.write("\t\t\tconsole.log(data);\n");
      out.write("\t\t\tvar html='';\n");
      out.write("\t\t\t$(data).each((i,u)=>{\n");
      out.write("\t\t\t\thtml = \"<tr>\";\n");
      out.write("\t\t\t\thtml += \"<td>\"+u.userId+\"</td>\";\n");
      out.write("\t\t\t\thtml += \"<td>\"+u.userNickname+\"</td>\";\n");
      out.write("\t\t\t\thtml += \"<td>\"+u.userIntroduce+\"</td>\";\n");
      out.write("\t\t\t\thtml += \"</tr>\";\n");
      out.write("\t\t\t\tconsole.log(html);\n");
      out.write("\t\t\t\n");
      out.write("\t\t\t});\n");
      out.write("\t\t\t\n");
      out.write("\t\t\t$(\".followList\").html(html);\n");
      out.write("\t\t},\n");
      out.write("\t\terror: function(jqxhr, textStatus, errorThrown){\n");
      out.write("\t\t\tconsole.log(\"ajax처리실패!\");\n");
      out.write("\t\t\tconsole.log(jqxhr, textStatus, errorThrown);\n");
      out.write("\t\t}\n");
      out.write("\t});\n");
      out.write("\t\n");
      out.write("\t\n");
      out.write("});\n");
      out.write("\n");
      out.write("\n");
      out.write("\t\n");
      out.write("\n");
      out.write("\n");
      out.write("$(function() {\n");
      out.write("\t$('ul.tab li').click(function() {\n");
      out.write("\t\tvar activeTab = $(this).attr('data-tab');\n");
      out.write("\t\t$('ul.tab li').removeClass('current');\n");
      out.write("\t\t$('.tabcontent').removeClass('current');\n");
      out.write("\t\t$(this).addClass('current');\n");
      out.write("\t\t$('#' + activeTab).addClass('current');\n");
      out.write("\t})\n");
      out.write("});\n");
      out.write("\n");
      out.write("</script>\n");
      out.write("\n");
      out.write(" <div id=\"follower-container\">\n");
      out.write("\t\t\t<ul class=\"tab\">\n");
      out.write("\t\t\t\t<li class=\"current\" data-tab=\"tab1\"><a>팔로워</a></li>\n");
      out.write("\t\t\t\t<li data-tab=\"tab2\"><a>내가 팔로우한 사람</a></li>\n");
      out.write("\t\t\t\t<li data-tab=\"tab3\"><a>나를 팔로우한 사람</a></li>\n");
      out.write("\t\t\t</ul>\n");
      out.write("\t\t\n");
      out.write("\t\t\t<div id=\"tab1\" class=\"tabcontent current\">\n");
      out.write("\t\t\t\t<div class=\"followListContainer\">\n");
      out.write("\t\t\t\t\t<input type=\"search\" name=\"followerSearch\" id=\"followerSearch\" />\n");
      out.write("\t\t\t\t\t<table class=\"followList\">\n");
      out.write("\t\t\t\t\t\t\n");
      out.write("\t\t\t\t\t</table>\n");
      out.write("\t\t    \t</div>\n");
      out.write("\t\t\t</div>\n");
      out.write("\t\t\n");
      out.write("\t\t\t<div id=\"tab2\" class=\"tabcontent\">\n");
      out.write("\t\t\t\t<h3>좋아요</h3>\n");
      out.write("\t\t\t\t<p>Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of \"de Finibus Bonorum et Malorum\" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, \"Lorem ipsum dolor sit amet..\", comes from a line in section 1.10.32.</p>\n");
      out.write("\t\t\t</div>\n");
      out.write("\t\t\t<div id=\"tab3\" class=\"tabcontent\">\n");
      out.write("\t\t\t\t<h3>좋아요</h3>\n");
      out.write("\t\t\t\t<p>Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of \"de Finibus Bonorum et Malorum\" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, \"Lorem ipsum dolor sit amet..\", comes from a line in section 1.10.32.</p>\n");
      out.write("\t\t\t</div>\n");
      out.write("\n");
      out.write("\t\t</div>");
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