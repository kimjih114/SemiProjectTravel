/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/8.5.42
 * Generated at: 2019-08-18 06:35:15 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp.WEB_002dINF.views.message;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import user.model.vo.User;

public final class messageList_jsp extends org.apache.jasper.runtime.HttpJspBase
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

      out.write("\r\n");
      out.write("\r\n");
      out.write("    \r\n");
      out.write(" ");

	//User userLoggedIn = (User)session.getAttribute("userLoggedIn");
 
 
      out.write("   \r\n");
      out.write("    \r\n");
      out.write("<!DOCTYPE html>\r\n");
      out.write("<html>\r\n");
      out.write("<head>\r\n");
      out.write("<meta charset=\"UTF-8\">\r\n");
      out.write("<title>메시지</title>\r\n");
      out.write("<script src=\"");
      out.print(request.getContextPath());
      out.write("/js/jquery-3.4.1.js\"></script>\r\n");
      out.write("<script src=\"");
      out.print(request.getContextPath());
      out.write("/js/jquery-3.4.1.js\"></script>\r\n");
      out.write("<link rel=\"stylesheet\" href=\"https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css\" integrity=\"sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T\" crossorigin=\"anonymous\">\r\n");
      out.write("<script src=\"https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js\" integrity=\"sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM\" crossorigin=\"anonymous\"></script>\r\n");
      out.write("\r\n");
      out.write("<style>\r\n");
      out.write("#chat-container{\r\n");
      out.write("\twidth: 405px;\r\n");
      out.write("\theight:300px;\r\n");
      out.write("\t/* margin: 0 auto; */\r\n");
      out.write("\tpadding: 10px;\r\n");
      out.write("}\r\n");
      out.write("#msg-container{\r\n");
      out.write("\theight: 300px;\r\n");
      out.write("\toverflow-y: scroll;\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write(".jumbotron{\r\n");
      out.write("width: 405px;\r\n");
      out.write("height: 100px;\r\n");
      out.write("background-color: #20C88E;\r\n");
      out.write("}\r\n");
      out.write(".lead{\r\n");
      out.write(" color:#fed136;\r\n");
      out.write(" font-weight: bold;\r\n");
      out.write("}\r\n");
      out.write(".my-4, #msg-container{\r\n");
      out.write("border: 1px solid rgb(00,00,66);\r\n");
      out.write("border-radius: 5px;\r\n");
      out.write("}\r\n");
      out.write("#msg-container, .jumbotron{\r\n");
      out.write("    margin-bottom: 10px;\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write("</style>\r\n");
      out.write("<!-- </head> -->\r\n");
      out.write("<script>\r\n");
      out.write("\r\n");
      out.write("$(()=>{\r\n");
      out.write("\r\n");
      out.write("\tvar host = location.host; \r\n");
      out.write("\tvar ws = new WebSocket('ws://'+host+\"");
      out.print(request.getContextPath());
      out.write("/chat/messagechat\");\r\n");
      out.write("\t\r\n");
      out.write("\tws.onopen = e =>{\r\n");
      out.write("\t\tconsole.log(\"소켓 열림\"); \r\n");
      out.write("\t};\r\n");
      out.write("\t\r\n");
      out.write("\tws.onmessage = e =>{\r\n");
      out.write("\t\tvar o = JSON.parse(e.data);\r\n");
      out.write("\t\t\r\n");
      out.write("\t\tif(o.type === 'message'){\r\n");
      out.write("\t\t\tvar html=\"<li class='list-group-item'>\";\r\n");
      out.write("\t\t\thtml += \"<span class='badge badge-dark'>\"+o.sender+\"</span>\";\r\n");
      out.write("\t\t\thtml += \"&nbsp;&nbsp;\"+o.msg;\r\n");
      out.write("\t\t\thtml += \"</li>\";\r\n");
      out.write("\t\t\t\r\n");
      out.write("\t\t\t$(\"#msg-container ul\").append(html);\r\n");
      out.write("\t\t\t\r\n");
      out.write("\t\t\tvar scrollHeight = $(\"#msg-container\").prop(\"scrollHeight\");\r\n");
      out.write("\t\t\t$(\"#msg-container\").scrollTop(scrollHeight);\r\n");
      out.write("\t\t}else if(o.type ===\"dm\"){\r\n");
      out.write("\t\t\talert(o.sender+\":\"+o.msg); \r\n");
      out.write("\t\t}\r\n");
      out.write("\t\t\r\n");
      out.write("\t\t\r\n");
      out.write("\t} \r\n");
      out.write("\tws.onerror = e =>{\r\n");
      out.write("\t\t\r\n");
      out.write("\t\tconsole.log(\"소켓 에러남~\"); \r\n");
      out.write("\t\t\r\n");
      out.write("\t}//서버와 연결 종료시 핸들러\r\n");
      out.write("\tws.onclose = e => {\r\n");
      out.write("\t\tconsole.log(\"ws close!\");\r\n");
      out.write("\t}\r\n");
      out.write("\t\r\n");
      out.write("\t//메세지 전송\r\n");
      out.write("\t$(\"#send\").click(()=>{\r\n");
      out.write("\t\tvar o = {\r\n");
      out.write("\t\t\ttype: \"message\",\r\n");
      out.write("\t\t\tmsg: $(\"#msg\").val(),\r\n");
      out.write("\t\t\tsender: \"");
      out.print(request.getParameter("userId"));
      out.write("\",\r\n");
      out.write("\t\t\ttime: Date.now()\r\n");
      out.write("\t\t}\r\n");
      out.write("\t\t\r\n");
      out.write("\t\tvar s = JSON.stringify(o); \r\n");
      out.write("\t\tws.send(s);\r\n");
      out.write("\t\t\r\n");
      out.write("\t\t$(\"#msg\").val('').focus(); \r\n");
      out.write("\t\t\r\n");
      out.write("\t\t\r\n");
      out.write("\t});\r\n");
      out.write("\t\r\n");
      out.write("\t//접속한 친구 목록 가져오기  \r\n");
      out.write("\t$(\"#dm-client\").focus(()=>{\r\n");
      out.write("\t\t\r\n");
      out.write("\t\t$.ajax({\r\n");
      out.write("\t\t\turl:\"");
      out.print(request.getContextPath());
      out.write("/chat/msgList.do\",\r\n");
      out.write("\t\t\tdataType:\"json\",\r\n");
      out.write("\t\t\tsuccess: function(data){\r\n");
      out.write("\t\t\t\tvar html = \"<option value='' disabled>접속자 목록</option>\";\r\n");
      out.write("\t\t\t\t\r\n");
      out.write("\t\t\t\t$.each(data, (i,userId)=>{\r\n");
      out.write("\t\t\t\t\thtml +=\"<option value='\"+userId+\"'>\"; \r\n");
      out.write("\t\t\t\t\thtml+=userId;\r\n");
      out.write("\t\t\t\t\thtml+=\"</option>\"; \r\n");
      out.write("\t\t\t\t\t\t\t\t\t\r\n");
      out.write("\t\t\t\t});\r\n");
      out.write("\t\t\t\t$(\"#dm-client\").html(html); \r\n");
      out.write("\t\t\t},\r\n");
      out.write("\t\t\t\terror: function(jpxhr, textStatus,err){\r\n");
      out.write("\t\t\t\t\tconsole.log(\"ajax처리 실패\");\r\n");
      out.write("\t\t\t\t\tconsole.log(jpxhr, textStatus, err); \r\n");
      out.write("\t\t\t\t}\r\n");
      out.write("\t\t});\r\n");
      out.write("\r\n");
      out.write("\t});\r\n");
      out.write("\t\r\n");
      out.write("\t$(\"#dm-send\").click(()=>{\r\n");
      out.write("\t\tvar dm = $(\"#dm-msg\").val().trim(); \r\n");
      out.write("\t\tif(dm.length== 0 || $(\"#dm-client option:selected\").val()== \"\")\r\n");
      out.write("\t\t\treturn;\r\n");
      out.write("\t\t\r\n");
      out.write("\t\tvar dm ={\r\n");
      out.write("\t\t\t\ttype:\"dm\",\r\n");
      out.write("\t\t\t\tmsg:$(\"#dm-msg\").val(),\r\n");
      out.write("\t\t\t\tsender:\"");
      out.print(request.getParameter("userId"));
      out.write("\",\r\n");
      out.write("\t\t\t\treceiver:$(\"#dm-client option:selected\").val(),\r\n");
      out.write("\t\t\t\ttime:Date.now()\r\n");
      out.write("\t\t}\r\n");
      out.write("\t\t\r\n");
      out.write("\t\tvar param = {\r\n");
      out.write("\t\t\t\tdm: JSON.stringify(dm)\r\n");
      out.write("\t\t}\r\n");
      out.write("\t\t\r\n");
      out.write("\t\t$.ajax({\r\n");
      out.write("\t\t\turl:\"");
      out.print(request.getContextPath());
      out.write("/chat/messageSendDM.do\",\r\n");
      out.write("\t\t\tdata:param, \r\n");
      out.write("\t\t\tdataType:\"json\",\r\n");
      out.write("\t\t\tsuccess: data =>{\r\n");
      out.write("\t\t\t\tconsole.log(data);\r\n");
      out.write("\t\t\t},\r\n");
      out.write("\t\t\terror:(jpxhr, textStatus, err)=>{\r\n");
      out.write("\t\t\t\tconsole.log(\"ajax처리 실패\"); \r\n");
      out.write("\t\t\t\tconsole.log(jpxhr, textStatus,err); \r\n");
      out.write("\t\t\t}\r\n");
      out.write("\t\t\t\r\n");
      out.write("\t\t});\r\n");
      out.write("\t\t\r\n");
      out.write("\t\t\r\n");
      out.write("\t});\r\n");
      out.write("\t\r\n");
      out.write("\t\r\n");
      out.write("\t\r\n");
      out.write("\t\r\n");
      out.write("\t\r\n");
      out.write("\t\r\n");
      out.write("});\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("</script>\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("<body>\r\n");
      out.write("\r\n");
      out.write("\t<div class=\"jumbotron\">\r\n");
      out.write("\r\n");
      out.write("\t  <p class=\"lead\" >안녕하세요, 유람 채팅방입니다.</p>\r\n");
      out.write("\t  <hr class=\"my-4\">\r\n");
      out.write("\t</div>\r\n");
      out.write("\t\r\n");
      out.write("\t<section id=\"chat-container\">\r\n");
      out.write("\t\t<!-- 메세지목록 -->\r\n");
      out.write("\t\t<div id=\"msg-container\">\r\n");
      out.write("\t\t\t<ul class=\"list-group list-group-flush\"></ul>\r\n");
      out.write("\t\t</div>\r\n");
      out.write("\t\t<!-- 사용자입력 -->\r\n");
      out.write("\t\t<div class=\"input-group mb-3\">\r\n");
      out.write("\t\t  <input type=\"text\" \r\n");
      out.write("\t\t  \t\t class=\"form-control\" \r\n");
      out.write("\t\t  \t\t id=\"msg\">\r\n");
      out.write("\t\t  <div class=\"input-group-append\">\r\n");
      out.write("\t\t    <button class=\"btn btn-info\"\r\n");
      out.write("\t\t    \t\ttype=\"button\"\r\n");
      out.write("\t\t    \t\tid=\"send\">보내기</button>\r\n");
      out.write("\t\t  </div>\r\n");
      out.write("\t\t</div>\r\n");
      out.write("\t\t<hr style=\"margin: 10px 0\"/>\r\n");
      out.write("\t\t<!-- DM 영역 -->\r\n");
      out.write("\t\t<div id=\"dm-container\" class=\"input-group mb-3\">\r\n");
      out.write("\t\t  <div class=\"input-group-prepend\">\r\n");
      out.write("\t\t    <label class=\"input-group-text\" \r\n");
      out.write("\t\t    \t   for=\"dm-client\">DM</label>\r\n");
      out.write("\t\t  </div>\r\n");
      out.write("\t\t  <select class=\"custom-select\" \r\n");
      out.write("\t\t  \t\t  id=\"dm-client\">\r\n");
      out.write("\t\t    <option selected>접속한 친구 목록</option>\r\n");
      out.write("\t\t  </select>\r\n");
      out.write("\t\t</div>\r\n");
      out.write("\t\t<div class=\"input-group mb-3\">\r\n");
      out.write("\t\t  <input type=\"text\" \r\n");
      out.write("\t\t  \t\t class=\"form-control\" \r\n");
      out.write("\t\t  \t\t id=\"dm-msg\">\r\n");
      out.write("\t\t  <div class=\"input-group-append\">\r\n");
      out.write("\t\t    <button class=\"btn btn-info\"\r\n");
      out.write("\t\t    \t\ttype=\"button\"\r\n");
      out.write("\t\t    \t\tid=\"dm-send\">보내기</button>\r\n");
      out.write("\t\t  </div>\r\n");
      out.write("\t\t</div>\t\t\r\n");
      out.write("\t\r\n");
      out.write("\t</section>\r\n");
      out.write("\t\r\n");
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
