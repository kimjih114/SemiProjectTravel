/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/8.5.42
 * Generated at: 2019-08-10 07:49:16 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp.ajax;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import user.model.vo.User;
import user.controller.UserLoginEndServlet;
import user.controller.UserLogoutServlet;
import board.model.vo.Board_Question;
import java.util.List;
import java.sql.Date;

public final class board_005fquestionList_jsp extends org.apache.jasper.runtime.HttpJspBase
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
    _jspx_imports_classes.add("board.model.vo.Board_Question");
    _jspx_imports_classes.add("java.util.List");
    _jspx_imports_classes.add("user.controller.UserLoginEndServlet");
    _jspx_imports_classes.add("user.controller.UserLogoutServlet");
    _jspx_imports_classes.add("user.model.vo.User");
    _jspx_imports_classes.add("java.sql.Date");
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

      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");


User userLoggedIn = (User)session.getAttribute("userLoggedIn");

System.out.println("userLoggedIn@userLogin.jsp=" + userLoggedIn);
  List<Board_Question> list = (List<Board_Question>)request.getAttribute("list"); 
 
 Board_Question qb = new Board_Question();
 System.out.println();

	
 /*//페이지 바 
 String pageBar = (String)request.getAttribute("pageBar");  */
 

      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("<style>\r\n");
      out.write("#q-container {\r\n");
      out.write("\twidth:700px;\r\n");
      out.write("\tmargin:0 auto;\r\n");
      out.write("\ttext-align:center;\r\n");
      out.write("\tposition: absolute;\r\n");
      out.write("\tleft:265px;\r\n");
      out.write("\ttransition: 0.5s;\r\n");
      out.write("\ttop:-344px;\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write("#q-container .tab {\r\n");
      out.write("\tlist-style: none;\r\n");
      out.write("\tmargin: 0;\r\n");
      out.write("\tpadding: 0;\r\n");
      out.write("\toverflow: hidden;\r\n");
      out.write("}\r\n");
      out.write("/* Float the list items side by side */\r\n");
      out.write("#q-container .tab li {\r\n");
      out.write("\tfloat: left;\r\n");
      out.write("\twidth: 33.3333%;\r\n");
      out.write("\tborder-bottom: 1px solid;\r\n");
      out.write("}\r\n");
      out.write("/* Style the links inside the list items */\r\n");
      out.write("#q-container .tab li a {\r\n");
      out.write("\tdisplay: inline-block;\r\n");
      out.write("\tcolor: #000;\r\n");
      out.write("\ttext-align: center;\r\n");
      out.write("\ttext-decoration: none;\r\n");
      out.write("\tpadding: 14px 16px;\r\n");
      out.write("\tfont-size: 17px;\r\n");
      out.write("\ttransition: 0.3s;\r\n");
      out.write("\tcursor: pointer;\r\n");
      out.write("}\r\n");
      out.write("/* Style the tab content */\r\n");
      out.write("#q-container .tabcontent {\r\n");
      out.write("\tdisplay: none;\r\n");
      out.write("\tbackground-color: black;\r\n");
      out.write("\tpadding: 6px 12px;\r\n");
      out.write("\tcolor: #fff;\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write("#q-container ul.tab li.current {\r\n");
      out.write("\r\n");
      out.write("\tcolor: #222;\r\n");
      out.write("\tborder: 1px solid;\r\n");
      out.write("\tborder-bottom: 0;\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write("#q-container .tabcontent.current {\r\n");
      out.write("\tdisplay: block;\r\n");
      out.write("\tbackground-color: white;\r\n");
      out.write("\tcolor: black;\r\n");
      out.write("\tborder: 1px solid;\r\n");
      out.write("\tborder-top: 0px;\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write("#postFrm {\r\n");
      out.write("\twidth: 550px;\r\n");
      out.write("\tmargin: 0 auto;\r\n");
      out.write("\ttext-align: center;\r\n");
      out.write("\tposition: absolute;\r\n");
      out.write("\tleft: 240px;\r\n");
      out.write("\ttop: 50px;\r\n");
      out.write("\tborder: 1px solid;\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write("#post {\r\n");
      out.write("\tposition: absolute;\r\n");
      out.write("\ttop: 10px;\r\n");
      out.write("\tleft: 730px;\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write("#timline-sns {\r\n");
      out.write("\tborder: 1px solid;\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write("#timeline-board-sns {\r\n");
      out.write("\tborder: 1px solid;\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write("#timeline-board-sns td {\r\n");
      out.write("\tpadding: 10px;\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write("board_containerfrm{\r\n");
      out.write("width: 600px; \r\n");
      out.write("margin:0 auto;\r\n");
      out.write("text-align:center; \r\n");
      out.write("\r\n");
      out.write("}\r\n");
      out.write("/*게시글 작성버튼*/\r\n");
      out.write("#btn-add{\r\n");
      out.write("\tfloat:right;\r\n");
      out.write("\tmargin: 0 0 8px;\r\n");
      out.write("}\r\n");
      out.write("table#tbl-board{width:100%; margin:0 auto; border:1px solid black; border-collapse:collapse; clear:both; }\r\n");
      out.write("table#tbl-board th, table#tbl-board td {border:1px solid; padding: 5px 0; text-align:center;} \r\n");
      out.write("form#board_containerfrm{\r\n");
      out.write("margin-left: 8px;\r\n");
      out.write("margin-top:400px;\r\n");
      out.write("\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("div.board_search{\r\n");
      out.write("width:700px;\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write("#select_box {\r\n");
      out.write("  position: relative;\r\n");
      out.write("  width: 200px;\r\n");
      out.write("  height: 32px;\r\n");
      out.write("  background: url(http://cfile1.uf.tistory.com/image/27423E43565F8EF627B215) 0 center no-repeat;\r\n");
      out.write(" \r\n");
      out.write("}\r\n");
      out.write("div.sub_content ul{\r\n");
      out.write("  list-style:none;\r\n");
      out.write("}\r\n");
      out.write("div.sub_content {\r\n");
      out.write(" height: 300px;\r\n");
      out.write("\r\n");
      out.write("}\r\n");
      out.write("div.postscript_area{\r\n");
      out.write("height:244px;\r\n");
      out.write("background: #f5f5f5;\r\n");
      out.write("border-radius: 10px;\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write("ul.post_con{\r\n");
      out.write("padding-left: 20px;\r\n");
      out.write("/* padding-bottom: 25px; */\r\n");
      out.write("padding-right: 20px;\r\n");
      out.write("height: 241px;\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write("hr{\r\n");
      out.write("border: 3px solid rgb(00,00,66);\r\n");
      out.write("}\r\n");
      out.write("li.post-font{\r\n");
      out.write("text-align:left;\r\n");
      out.write("}\r\n");
      out.write("#tbl-board>table{\r\n");
      out.write("border-collapse: collapse;\r\n");
      out.write("border-radius: 10px;\r\n");
      out.write("\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write("#tbl-board>table, #tbl-board>table>td{\r\n");
      out.write("width:700px;\r\n");
      out.write("border : 1px solid gray;\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("}\r\n");
      out.write("#post_font_a:hover{\r\n");
      out.write("\tcolor:#007bff;\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write("#tbl-board>table>tbody>tr:first-child{\r\n");
      out.write("background:#fed136;}\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("/* table#tbl-table, td {\r\n");
      out.write("border: 1px solid;\r\n");
      out.write("}\r\n");
      out.write("table#tbl-table{\r\n");
      out.write("width: 700px;\r\n");
      out.write("} */\r\n");
      out.write("\r\n");
      out.write("</style>\r\n");
      out.write("\r\n");
      out.write("<script>\r\n");
      out.write(" $(()=>{\r\n");
      out.write("\tlocation.href=\"#\"\r\n");
      out.write("})\r\n");
      out.write("\r\n");
      out.write("$(function() {\r\n");
      out.write("\t  var select = $(\"select#color\");\r\n");
      out.write("\r\n");
      out.write("\t  select.change(function() {\r\n");
      out.write("\t    var select_name = $(this).children(\"option:selected\").text();\r\n");
      out.write("\t    $(this).siblings(\"label\").text(select_name);\r\n");
      out.write("\t  });\r\n");
      out.write("\t});\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write(" $(function(){\r\n");
      out.write("\t\t$.ajax({\r\n");
      out.write("\t\t\turl: \"");
      out.print(request.getContextPath() );
      out.write("/board/controller/board/boardList.do\", \r\n");
      out.write("\t\t\ttype: \"get\",\r\n");
      out.write("\t\t\tdataType: \"json\",\r\n");
      out.write("\t\t\tcontentType: \"application; charset=UTF-8\",\r\n");
      out.write("\r\n");
      out.write("\t\t\tsuccess: function(data){\r\n");
      out.write("\t\t\t\tconsole.log(data);\r\n");
      out.write("\t\t\t\t\r\n");
      out.write("\t\t\t\tvar $table = $(\"<table><tr><td>번호</td><td>제목</td><td>작성자</td><td>작성일</td><td>진행상태</td></tr></table>\"); \r\n");
      out.write("\t\t\t\t\t\r\n");
      out.write("\t\t\t\t\t$(data).each((i,qb)=>{\r\n");
      out.write("\t\t\t\t\t\tvar html =\"<tr>\"; \r\n");
      out.write("\t\t\t\t\t\thtml +=\"<td>\"+qb.qboardNo+\"</td>\"; //번호 \r\n");
      out.write("\t\t\t\t\t\thtml +=\"<td>\"+qb.qboardTitle+\"</td>\"; //제목\r\n");
      out.write("\t\t\t\t\t\thtml +=\"<td>\"+qb.qboardWriter+\"</td>\"; //작성자\r\n");
      out.write("\t\t\t\t\t\thtml +=\"<td>\"+qb.qboardDate+\"</td>\"; //작성일 \r\n");
      out.write("\t\t\t\t\t\thtml +=\"<td>\"+qb.qboardStatus+\"</td>\"; //진행상태\r\n");
      out.write("\t\t\t\t\t\thtml +=\"</tr>\"; \r\n");
      out.write("\t\t\t\t\t\tconsole.log(html); \r\n");
      out.write("\t\t\t\t\t\t$table.append(html); \r\n");
      out.write("\t\t\t\t\t}); \r\n");
      out.write("\t\t\t\t\t$(\"#tbl-board\").html($table); \r\n");
      out.write("\t\t\t\t\t\r\n");
      out.write("\t\t\t\t\r\n");
      out.write("\t\t\t},\r\n");
      out.write("\t\t\terror: function(jqxhr, textStatus, errorThrown){\r\n");
      out.write("\t\t\t\tconsole.log(\"ajax처리실패!\");\r\n");
      out.write("\t\t\t\tconsole.log(jqxhr, textStatus, errorThrown);\r\n");
      out.write("\t\t\t}\r\n");
      out.write("\t\t});\r\n");
      out.write("\t});\r\n");
      out.write(" \r\n");
      out.write("\r\n");
      out.write("</script>\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("<!-- 메뉴폼 -->\r\n");
      out.write("\r\n");
      out.write(" <div id=\"q-container\">\r\n");
      out.write("\r\n");
      out.write("\t<form action=\"\" id=\"board_containerfrm\">\r\n");
      out.write(" \t\t<div class=\"sub_content\">\r\n");
      out.write("                            <hr />\r\n");
      out.write("                        <div class=\"postscript_area\">\r\n");
      out.write("                            <ul class=\"post_con\">\r\n");
      out.write("                                <li class=\"post_title\"><h4>1:1문의</h4></li>\r\n");
      out.write("                                <li class=\"post_font\">\r\n");
      out.write("                                \t\t업무와 관련 문의 및 요청사항을 작성하는 게시판입니다. <br />\r\n");
      out.write("                                \t\t1:1 문의는 타인에게 내용이 공개되지 않으므로 더 자세한 답변을 받을 수 있습니다. <br /> <br />\r\n");
      out.write("                                \t\t");
 if(userLoggedIn ==null) {
      out.write("\r\n");
      out.write("                                \t\t문의 시 <a  id=\"post_font_a\"   href=\"");
      out.print(request.getContextPath());
      out.write("/user/userLoginFrm\">로그인</a>이 필요합니다. <br />\r\n");
      out.write("                                \t\t");
} 
      out.write("\r\n");
      out.write("                                \t\t<br />유람은 고객님의 목소리를 소중히 여깁니다. <br />\r\n");
      out.write("                                \t\t문의주신 내용은 확인 즉시 , 빠르게 답변 드리겠습니다.  <br />\r\n");
      out.write("                                \t\t답변은 전화상담이 아닌 온라인으로만 진행됩니다.<br />\r\n");
      out.write("                                    <br />\r\n");
      out.write("           \t\t\t\t\t\t\t\r\n");
      out.write("                                </li>\r\n");
      out.write("                            </ul>\r\n");
      out.write("            \r\n");
      out.write("\t\t\t\t\t\t<hr />\r\n");
      out.write("                        </div>\r\n");
      out.write(" </div>\r\n");
      out.write("\t\t<div class=\"board_search\">\r\n");
      out.write("\r\n");
      out.write("\t\t\t<fieldset style=\"padding-right:10px;\">\r\n");
      out.write("\t\r\n");
      out.write("\t\t\t");

				 if(userLoggedIn != null) { 
			
      out.write("\r\n");
      out.write("\t\t\t<input type=\"button\" class=\"btn btn-secondary btn-sm\" id=\"btn-add\" value=\"글쓰기\">\t\t\t\t\r\n");
      out.write("\t\t\t<!-- 로그인한 경우 글쓰기 가능하게 하기  -->\r\n");
      out.write("\r\n");
      out.write("\t\t\t<script>\r\n");
      out.write("\t\t\t\r\n");
      out.write("\t\t\t$(\"#btn-add\").on(\"click\", function(){\r\n");
      out.write("\t\t\t\t$.ajax({\r\n");
      out.write("\t\t\t\t\turl: \"");
      out.print(request.getContextPath() );
      out.write("/ajax/board_questionForm.jsp\", \r\n");
      out.write("\t\t\t\t\ttype: \"get\",\r\n");
      out.write("\t\t\t\t\tdataType: \"html\",\r\n");
      out.write("\t\t\t\t\tsuccess: function(data){\r\n");
      out.write("\t\t\t\t\t\t$(\"#container-sns\").html(data);\r\n");
      out.write("\t\t\t\t\t}\r\n");
      out.write("\t\t\t\t\t,error:function(request,status,error){\r\n");
      out.write("\t\t\t\t\t    console.log(\"code:\"+request.status+\"\\n\"+\"message:\"+request.responseText+\"\\n\"+\"error:\"+error);\r\n");
      out.write("\r\n");
      out.write("\t\t\t\t\t}\r\n");
      out.write("\t\t\t\t});\r\n");
      out.write("\t\t\t})\r\n");
      out.write("\t\t\t</script>\r\n");
      out.write("\r\n");
      out.write("\t\t\t");

				}
			
      out.write("\r\n");
      out.write("\t\t\t\t</fieldset>\r\n");
      out.write("\t\t\t</div>\r\n");
      out.write("\t\t\t</form>\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\t\t\t<!-- //게시판 검색폼 -->\r\n");
      out.write("\t\t\t<!-- board s -->\r\n");
      out.write("\t\t\t\t<div id=\"tbl-board\">\r\n");
      out.write("\t\t\t\t\r\n");
      out.write("\t\t\t\t\r\n");
      out.write("\t\t\t\t</div>\r\n");
      out.write("\t\t\t\r\n");
      out.write("\r\n");
      out.write("\t</div>\r\n");
      out.write("\t\t\t\r\n");
      out.write("\t</body>\r\n");
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
