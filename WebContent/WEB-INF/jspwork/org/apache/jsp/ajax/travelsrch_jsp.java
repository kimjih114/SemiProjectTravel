/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/8.5.42
 * Generated at: 2019-08-17 15:45:05 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp.ajax;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class travelsrch_jsp extends org.apache.jasper.runtime.HttpJspBase
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

      out.write("\r\n");
      out.write("\r\n");
      out.write(" <script type=\"text/javascript\">\r\n");
      out.write("\tvar contentids = new Array();\r\n");
      out.write("\tvar contenttypes = new Array();\r\n");
      out.write("\tvar contentthumbnails = new Array();\r\n");
      out.write("\tvar contenttitles = new Array();\r\n");
      out.write("\tvar contentaddresses = new Array();\r\n");
      out.write("\tvar sido1;\r\n");
      out.write("\tvar gugun1;\r\n");
      out.write("\r\n");
      out.write(" \t\r\n");
      out.write(" function closeDiv(div){\r\n");
      out.write("\t contentids.pop(contentids.indexOf($(div).next().children().html()));\r\n");
      out.write("\t $(div).parent().parent().remove();\r\n");
      out.write("\t console.log(contentids);\r\n");
      out.write(" }\r\n");
      out.write(" \r\n");
      out.write(" function star(span){\r\n");
      out.write("\t  $(span).parent().children('span').removeClass('on');\r\n");
      out.write("\t  $(span).addClass('on').prevAll('span').addClass('on');\r\n");
      out.write("\t  return false;\r\n");
      out.write(" };\r\n");
      out.write("\r\n");
      out.write(" \t$(\"#search\").on(\"click\", function(){\r\n");
      out.write(" \t\tsido1 = $(\"#sido1\").val();\r\n");
      out.write(" \t\tgugun1 = $(\"#gugun1\").val();\r\n");
      out.write(" \t});\r\n");
      out.write(" \t\r\n");
      out.write("  $('document').ready(function() {\r\n");
      out.write("\t   var area0 = [\"시/도 선택\",\"서울특별시\",\"인천광역시\",\"대전광역시\",\"대구광역시\",\"광주광역시\",\"부산광역시\",\"울산광역시\",\"세종특별자치시\",\"경기도\",\"강원도\",\"충청북도\",\"충청남도\",\"경상북도\",\"경상남도\",\"전라북도\",\"전라남도\",\"제주도\"];\r\n");
      out.write("\t   var area1 = [\"강남구\",\"강동구\",\"강북구\",\"강서구\",\"관악구\",\"광진구\",\"구로구\",\"금천구\",\"노원구\",\"도봉구\",\"동대문구\",\"동작구\",\"마포구\",\"서대문구\",\"서초구\",\"성동구\",\"성북구\",\"송파구\",\"양천구\",\"영등포구\",\"용산구\",\"은평구\",\"종로구\",\"중구\",\"중랑구\"];\r\n");
      out.write("\t   var area2 = [\"강화군\",\"계양구\",\"미추홀구\",\"남동구\",\"동구\",\"부평구\",\"서구\",\"연수구\",\"옹진군\",\"중구\"];\r\n");
      out.write("\t   var area3 = [\"대덕구\",\"동구\",\"서구\",\"유성구\",\"중구\"];\r\n");
      out.write("\t   var area4 = [\"남구\",\"달서구\",\"달성군\",\"동구\",\"북구\",\"서구\",\"수성구\",\"중구\"];\r\n");
      out.write("\t   var area5 = [\"광산구\",\"남구\",\"동구\",\"북구\",\"서구\"];\r\n");
      out.write("\t   var area6 = [\"강서구\",\"금정구\",\"기장군\",\"남구\",\"동구\",\"동래구\",\"부산진구\",\"북구\",\"사상구\",\"사하구\",\"서구\",\"수영구\",\"연제구\",\"영도구\",\"중구\",\"해운대구\"];\r\n");
      out.write("\t   var area7 = [\"중구\",\"남구\",\"동구\",\"북구\",\"울주군\"];\r\n");
      out.write("\t   var area8 = [\"세종특별자치시\"];\r\n");
      out.write("\t   var area9 = [\"가평군\",\"고양시\",\"과천시\",\"광명시\",\"광주시\",\"구리시\",\"군포시\",\"김포시\",\"남양주시\",\"동두천시\",\"부천시\",\"성남시\",\"수원시\",\"시흥시\",\"안산시\",\"안성시\",\"안양시\",\"양주시\",\"양평군\",\"여주시\",\"연천군\",\"오산시\",\"용인시\",\"의왕시\",\"의정부시\",\"이천시\",\"파주시\",\"평택시\",\"포천시\",\"하남시\",\"화성시\"];\r\n");
      out.write("\t   var area10 = [\"강릉시\",\"고성군\",\"동해시\",\"삼척시\",\"속초시\",\"양구군\",\"양양군\",\"영월군\",\"원주시\",\"인제군\",\"정선군\",\"철원군\",\"춘천시\",\"태백시\",\"평창군\",\"홍천군\",\"화천군\",\"횡성군\"];\r\n");
      out.write("\t   var area11 = [\"괴산군\",\"단양군\",\"보은군\",\"영동군\",\"옥천군\",\"음성군\",\"제천시\",\"진천군\",\"청원군\",\"청주시\",\"충주시\",\"증평군\"];\r\n");
      out.write("\t   var area12 = [\"공주시\",\"금산군\",\"논산시\",\"당진시\",\"보령시\",\"부여군\",\"서산시\",\"서천군\",\"아산시\",\"예산군\",\"천안시\",\"청양군\",\"태안군\",\"홍성군\",\"계룡시\"];\r\n");
      out.write("\t   var area13 = [\"경산시\",\"경주시\",\"고령군\",\"구미시\",\"군위군\",\"김천시\",\"문경시\",\"봉화군\",\"상주시\",\"성주군\",\"안동시\",\"영덕군\",\"영양군\",\"영주시\",\"영천시\",\"예천군\",\"울릉군\",\"울진군\",\"의성군\",\"청도군\",\"청송군\",\"칠곡군\",\"포항시\"];\r\n");
      out.write("\t   var area14 = [\"거제시\",\"거창군\",\"고성군\",\"김해시\",\"남해군\",\"마산시\",\"밀양시\",\"사천시\",\"산청군\",\"양산시\",\"의령군\",\"진주시\",\"진해시\",\"창녕군\",\"창원시\",\"통영시\",\"하동군\",\"함안군\",\"함양군\",\"합천군\"];\r\n");
      out.write("\t   var area15 = [\"고창군\",\"군산시\",\"김제시\",\"남원시\",\"무주군\",\"부안군\",\"순창군\",\"완주군\",\"익산시\",\"임실군\",\"장수군\",\"전주시\",\"정읍시\",\"진안군\"];\r\n");
      out.write("\t   var area16 = [\"강진군\",\"고흥군\",\"곡성군\",\"광양시\",\"구례군\",\"나주시\",\"담양군\",\"목포시\",\"무안군\",\"보성군\",\"순천시\",\"신안군\",\"여수시\",\"영광군\",\"영암군\",\"완도군\",\"장성군\",\"장흥군\",\"진도군\",\"함평군\",\"해남군\",\"화순군\"];\r\n");
      out.write("\t   var area17 = [\"남제주군\",\"북제주군\",\"서귀포시\",\"제주시\"];\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write(" $(\"select[name^=sido]\").each(function() {\r\n");
      out.write("\t  $selsido = $(this);\r\n");
      out.write("\t  $.each(eval(area0), function(idx) {\r\n");
      out.write("\t   \t$selsido.append(\"<option value='\"+idx+\"'>\"+this+\"</option>\");\r\n");
      out.write("\t  });\r\n");
      out.write("\t  $selsido.next().append(\"<option value=''>구/군 선택</option>\");\r\n");
      out.write(" });\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write(" $(\"select[name^=sido]\").change(function() {\r\n");
      out.write("  var area = \"area\"+$(\"option\",$(this)).index($(\"option:selected\",$(this)));\r\n");
      out.write("  var $gugun = $(this).next(); // 선택영역 군구 객체\r\n");
      out.write("  $(\"option\",$gugun).remove(); // 구군 초기화\r\n");
      out.write("  $(\"#search\").val('');\r\n");
      out.write("  \r\n");
      out.write("  \r\n");
      out.write("  if(area == \"area0\")\r\n");
      out.write("   $gugun.append(\"<option value=''>구/군 선택</option>\");\r\n");
      out.write("  else {\r\n");
      out.write("   $.each(eval(area), function(idx) {\r\n");
      out.write("    $gugun.append(\"<option value='\"+(idx+1)+\"'>\"+this+\"</option>\");\r\n");
      out.write("   });\r\n");
      out.write("  }\r\n");
      out.write(" });\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("});\r\n");
      out.write("   var hiddenCount=0;\r\n");
      out.write("\r\n");
      out.write("   function conMore(){\r\n");
      out.write("   \tfor(var i=0;i<=hiddenCount;i++){\r\n");
      out.write("   \t\t$(\"#hiddenContents\"+i).removeAttr(\"style\");\r\n");
      out.write("   \t\t$(\"#contentsMore\").html(\"\");\r\n");
      out.write("   \t}\r\n");
      out.write("   \t\r\n");
      out.write("   }\r\n");
      out.write("\r\n");
      out.write("   function searchList(e){\r\n");
      out.write("   \tvar $sel = $(\".sel\");\r\n");
      out.write("   \tvar $li = $(\"#autoComplete li\");\r\n");
      out.write("   \t\r\n");
      out.write("   \tif(e.key == \"ArrowDown\"){\r\n");
      out.write("   \t\tif($sel.length == 0){\r\n");
      out.write("   \t\t\t$li.eq(0).addClass(\"sel\");\r\n");
      out.write("   \t\t}\t\r\n");
      out.write("   \t\telse if($sel.is($li.last())){\r\n");
      out.write("   \t\t\t\r\n");
      out.write("   \t\t}\r\n");
      out.write("   \t\telse{\r\n");
      out.write("   \t\t\t$sel.removeClass(\"sel\").next().addClass(\"sel\");\r\n");
      out.write("   \t\t}\r\n");
      out.write("   \t}\r\n");
      out.write("   \telse if(e.key == \"ArrowUp\"){\r\n");
      out.write("   \t\tif($sel.length == 0){\r\n");
      out.write("   \t\t\t\r\n");
      out.write("   \t\t}\t\r\n");
      out.write("   \t\telse if($sel.is($li.first())){\r\n");
      out.write("   \t\t\t$sel.removeClass(\"sel\");\r\n");
      out.write("   \t\t}\r\n");
      out.write("   \t\telse{\r\n");
      out.write("   \t\t\t$sel.removeClass(\"sel\").prev().addClass(\"sel\");\r\n");
      out.write("   \t\t}\r\n");
      out.write("   \t}\r\n");
      out.write("   \t\r\n");
      out.write("   \telse if(e.key == \"Enter\"){\r\n");
      out.write("   \t\t$(e.target).val($sel.text());\r\n");
      out.write("   \t\t$(\"#search\").val($(e.target).text().replace('+', ''));\r\n");
      out.write("   \t\t$(\"#autoComplete\").hide().children().remove();\r\n");
      out.write("   \t\t$.ajax({\r\n");
      out.write("   \t\t\turl: \"http://api.visitkorea.or.kr/openapi/service/rest/KorService/areaBasedList?ServiceKey=S0BJm1yXPPy5UgmsERf%2BnJjnz9RkRpbFJVQXS93Ql6%2B1xk5T%2FQa15nogO4%2BOrWRSf0fo7RFFcdGsODeGZ%2BW6dQ%3D%3D&contentTypeId=&areaCode=\"+sido1+\"&sigunguCode=\"+gugun1+\"&cat1=&cat2=&cat3=&listYN=Y&MobileOS=ETC&MobileApp=TourAPI3.0_Guide&arrange=A&numOfRows=300&pageNo=1\",\r\n");
      out.write("\t\t\t\ttype: \"get\",\r\n");
      out.write("\t\t\t\tdataType: \"xml\",\r\n");
      out.write("\t\t\t\tsuccess:function(data){\t\t\t\r\n");
      out.write("\t\t\t\t\tvar $root=$(data).find(\":root\");\t\t\t\t\r\n");
      out.write("\t\t\t\t\tvar $items=$root.find(\"item\");\r\n");
      out.write("\t\t\t\t\tvar html = \"\";\r\n");
      out.write("\t\t\t\t\t\r\n");
      out.write("\t\t\t\t\tif($(contentids).length>=3){\r\n");
      out.write("\t\t\t\t\t\talert(\"여행지는 3개까지 등록 가능합니다.\");\r\n");
      out.write("\t\t\t\t\t\treturn;\r\n");
      out.write("\t\t\t\t\t}\r\n");
      out.write("\t\t\t\t\t$items.each(function(i,m){\r\n");
      out.write("\t\t\t\t\t\tif($(m).find(\"title\").text()==$sel.text().replace('+', '')){\r\n");
      out.write("\t\t\t\t\t\t\tif(contentids.length>0){\r\n");
      out.write("\t\t\t\t\t\t\t\t  if(contentids.indexOf($(m).find(\"contentid\").text())!=-1){\r\n");
      out.write("\t\t\t\t\t\t\t\t\t  alert(\"이미 추가된 여행지입니다.\");\r\n");
      out.write("\t\t\t\t\t\t\t\t\t  return;\r\n");
      out.write("\t\t\t\t\t\t\t\t  }\r\n");
      out.write("\t\t\t\t\t\t\t}\r\n");
      out.write("\t\t\t\t\t\t\thtml+=\"<div class='card h-100'>\";\r\n");
      out.write("\t\t\t\t\t\t\t\thtml+=\"<a href='#' class='goInfo'><img class='card-img-top' src='\"+$(m).find(\"firstimage\").text()+\"'></a>\";\r\n");
      out.write("\t\t\t\t\t\t\t\t\thtml+=\"<div class='caption'>\"\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\thtml+=\"<div class='cc' onclick='closeDiv(this);'>x</div>\"\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\thtml+=\"<div class='caption-text' ><a href='");
      out.print(request.getContextPath());
      out.write("/travel/detailPage?contentId=\"+$(m).find(\"contentid\").text()+\"&contentTypeId=\"+$(m).find('contenttypeid').text()+\"' target='_blank'>\"+$(m).find(\"title\").text()+\"</a>\";\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\thtml+=\"<div class='contentid' style='display:none'>\"+$(m).find(\"contentid\").text()+\"</div>\"+\"</h4>\";\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\thtml+=\"<p class='card-text'>\"+$(m).find(\"addr1\").text()+\"</p>\"\r\n");
      out.write("\t\t\t\t\t\t\t\t\thtml+=\"</div>\";\r\n");
      out.write("\t\t\t\t\t\t\t\thtml+=\"</div>\";\r\n");
      out.write("\t\t\t\t\t\t\t\thtml+=\"<div class='starRev'>\";\r\n");
      out.write("\t\t\t\t\t\t\t\t\thtml+=\"<span class='starR' onclick='star(this);'>별1</span>\";\r\n");
      out.write("\t\t\t\t\t\t\t\t\thtml+=\"<span class='starR' onclick='star(this);'>별2</span>\";\r\n");
      out.write("\t\t\t\t\t\t\t\t\thtml+=\"<span class='starR' onclick='star(this);'>별3</span>\";\r\n");
      out.write("\t\t\t\t\t\t\t\t\thtml+=\"<span class='starR' onclick='star(this);'>별4</span>\";\r\n");
      out.write("\t\t\t\t\t\t\t\t\thtml+=\"<span class='starR' onclick='star(this);'>별5</span>\";\r\n");
      out.write("\t\t\t\t\t\t\t\t\thtml+=\"</div>\"\r\n");
      out.write("\t\t\t\t\t\t\t\t\thtml+=\"</div>\";\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\r\n");
      out.write("\t\t\t\t\t\t\t\t\tcontentids.push($(m).find(\"contentid\").text());\t\t\r\n");
      out.write("\t\t\t\t\t\t\t\t\tcontenttypes.push($(m).find(\"contenttypeid\").text());\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\r\n");
      out.write("\t\t\t\t\t\t\t\t\tif($(m).find(\"firstimage\").text()!=null){\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\tcontentthumbnails.push($(m).find(\"firstimage\").text());\r\n");
      out.write("\t\t\t\t\t\t\t\t\t}else {\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\tcontentthumbnails.push(\"undefined\");\r\n");
      out.write("\t\t\t\t\t\t\t\t\t}\r\n");
      out.write("\t\t\t\t\t\t\t\t\tcontenttitles.push($(m).find(\"title\").text());\r\n");
      out.write("\t\t\t\t\t\t\t\t\tcontentaddresses.push($(m).find(\"addr1\").text());\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\r\n");
      out.write("\t\t\r\n");
      out.write("\t\t\t\t\t\t}\t\r\n");
      out.write("\t\t\t\t\r\n");
      out.write("\t\t\t});\r\n");
      out.write("   \t\t\t\r\n");
      out.write("\t\t\t $(\"#contents\").append(html);\r\n");
      out.write("\t\t\t $(\"#search\").val('');\r\n");
      out.write("   \t\t\t},\r\n");
      out.write("   \t\t\terror:function(jqxhr,textStatus,errorThrown){\r\n");
      out.write("   \t\t\t\t\r\n");
      out.write("   \t\t\t}\r\n");
      out.write("   \t\t});\r\n");
      out.write("   \t\t\r\n");
      out.write("   \t}\r\n");
      out.write("   \telse{\r\n");
      out.write("   \t\tvar search = $(\"#search\").val().trim();\r\n");
      out.write("   \t\t\r\n");
      out.write("   \t\tif(search.length == 0){\r\n");
      out.write("   \t\t\treturn;\r\n");
      out.write("   \t\t}else{\r\n");
      out.write("   \t\t\t$.ajax({\r\n");
      out.write("   \t\t\t\turl: \"http://api.visitkorea.or.kr/openapi/service/rest/KorService/areaBasedList?ServiceKey=S0BJm1yXPPy5UgmsERf%2BnJjnz9RkRpbFJVQXS93Ql6%2B1xk5T%2FQa15nogO4%2BOrWRSf0fo7RFFcdGsODeGZ%2BW6dQ%3D%3D&contentTypeId=&areaCode=\"+sido1+\"&sigunguCode=\"+gugun1+\"&cat1=&cat2=&cat3=&listYN=Y&MobileOS=ETC&MobileApp=TourAPI3.0_Guide&arrange=A&numOfRows=300&pageNo=1\",\r\n");
      out.write("   \t\t\t\ttype: \"get\",\r\n");
      out.write("   \t\t\t\tdataType: \"xml\",\r\n");
      out.write("   \t\t\t\tsuccess:function(data){\r\n");
      out.write("   \t\t\t\t\t\r\n");
      out.write("   \t\t\t\t\tvar $root=$(data).find(\":root\");\t\t\t\t\r\n");
      out.write("   \t\t\t\t\tvar $items=$root.find(\"item\");\r\n");
      out.write("   \t\t\t\t\tvar html = \"\";\r\n");
      out.write("   \t\t\t\t\t$items.each(function(i,m){\r\n");
      out.write("   \t\t\t\t\t\t\r\n");
      out.write("   \t\t\t\t\t\tif($(m).find(\"title\").text().indexOf(search)==-1){\t\t\t\t\t\t\r\n");
      out.write("   \t\t\t\t\t\t\t\t$(\"#autoComplete\").hide();\t\t\t\t\t\t\t\r\n");
      out.write("   \t\t\t\t\t\t}else{\t\t\t\t\t\t\t\r\n");
      out.write("   \t\t\t\t\t\t\t\thtml += \"<li><span style='float:left; color:orange' padding:10px;>+</span>\"+$(m).find(\"title\").text()+\"</li>\";\r\n");
      out.write("   \t\t\t\t\t\t\t\t\t\t\t\t\t\t\r\n");
      out.write("   \t\t\t\t\t\t\t$(\"#autoComplete\").html(html)\r\n");
      out.write("   \t\t\t\t\t\t\t\t\t\t\t  .fadeIn(200);\r\n");
      out.write("   \t\t\t\t\t\t}\r\n");
      out.write("   \t\t\t\t\t\t\r\n");
      out.write("   \t\t\t\t\t});\r\n");
      out.write("   \t\t\t\t\t\r\n");
      out.write("   \t\t\t\t\t$(\"#autoComplete li\").unbind(\"click\").bind(\"click\", (e=>{\t\t\t\t\t\t\r\n");
      out.write("   \t\t\t\t\t\t$(\"#search\").val($(e.target).text().replace('+', ''));\r\n");
      out.write("   \t\t\t\t\t\t//#autoComplete 감춤\r\n");
      out.write("   \t\t\t\t\t\t$(\"#autoComplete\").hide().children().remove();\r\n");
      out.write("   \t\t\t\t\t\t\r\n");
      out.write("   \t\t\t\t\t\t$.ajax({\r\n");
      out.write("   \t\t\t\t\t\t\turl: \"http://api.visitkorea.or.kr/openapi/service/rest/KorService/areaBasedList?ServiceKey=S0BJm1yXPPy5UgmsERf%2BnJjnz9RkRpbFJVQXS93Ql6%2B1xk5T%2FQa15nogO4%2BOrWRSf0fo7RFFcdGsODeGZ%2BW6dQ%3D%3D&contentTypeId=&areaCode=\"+sido1+\"&sigunguCode=\"+gugun1+\"&cat1=&cat2=&cat3=&listYN=Y&MobileOS=ETC&MobileApp=TourAPI3.0_Guide&arrange=A&numOfRows=300&pageNo=1\",\r\n");
      out.write("   \t\t\t\t\t\t\ttype: \"get\",\r\n");
      out.write("   \t\t\t\t\t\t\tdataType: \"xml\",\r\n");
      out.write("   \t\t\t\t\t\t\tsuccess:function(data){\t\t\t\r\n");
      out.write("   \t\t\t\t\t\t\t\tvar $root=$(data).find(\":root\");\t\t\t\t\r\n");
      out.write("   \t\t\t\t\t\t\t\tvar $items=$root.find(\"item\");\r\n");
      out.write("   \t\t\t\t\t\t\t\tvar html = \"\";\r\n");
      out.write("   \t\t\t\t\t\t\t\t\r\n");
      out.write("   \t\t\t\t\t\t\t\tconsole.log($items);\r\n");
      out.write("   \t\t\t\t\t\t\t\t\r\n");
      out.write("   \t\t\t\t\t\t\t\tif($(\"contentids\").length>=3){\r\n");
      out.write("   \t\t\t\t\t\t\t\t\talert(\"여행지는 3개까지 등록 가능합니다.\");\r\n");
      out.write("   \t\t\t\t\t\t\t\t\treturn;\r\n");
      out.write("   \t\t\t\t\t\t\t\t}\r\n");
      out.write("   \t\t\t\t\t\t\t\t$items.each(function(i,m){\r\n");
      out.write("   \t\t\t\t\t\t\t\t\t\r\n");
      out.write("   \t\t\t\t\t\t\t\t\tif($(m).find(\"title\").text()==$(e.target).text().replace('+', '')){\r\n");
      out.write("   \t\t\t\t\t\t\t\t\t\tif(contentids.length>0){\r\n");
      out.write("   \t   \t\t\t\t\t\t\t\t\t  if(contentids.indexOf($(m).find(\"contentid\").text())!=-1){\r\n");
      out.write("   \t   \t\t\t\t\t\t\t\t\t\t  alert(\"이미 추가된 여행지입니다.\");\r\n");
      out.write("   \t   \t\t\t\t\t\t\t\t\t\t  return;\r\n");
      out.write("   \t   \t\t\t\t\t\t\t\t\t  }\r\n");
      out.write("   \t\t\t\t\t\t\t\t\t\t}\r\n");
      out.write("    \t\t\t\t\t\t\t\t\t\thtml+=\"<div class='card h-100'>\";\r\n");
      out.write("   \t\t\t\t\t\t\t\t\t\t\t\thtml+=\"<a href='#' class='goInfo'><img class='card-img-top' src='\"+$(m).find(\"firstimage\").text()+\"'></a>\";\r\n");
      out.write("\t   \t\t\t\t\t\t\t\t\t\t\t\thtml+=\"<div class='caption'>\"\r\n");
      out.write("\t   \t\t\t\t\t\t\t\t\t\t\t\t\thtml+=\"<div class='cc' onclick='closeDiv(this);'>x</div>\"\r\n");
      out.write("\t   \t\t\t\t\t\t\t\t\t\t\t\t\t\thtml+=\"<div class='caption-text' ><a href='");
      out.print(request.getContextPath());
      out.write("/travel/detailPage?contentId=\"+$(m).find(\"contentid\").text()+\"&contentTypeId=\"+$(m).find('contenttypeid').text()+\"' target='_blank'>\"+$(m).find(\"title\").text()+\"</a>\";\r\n");
      out.write("\t   \t\t\t\t\t\t\t\t\t\t\t\t\t\thtml+=\"<div class='contentid' style='display:none'>\"+$(m).find(\"contentid\").text()+\"</div>\"+\"</h4>\";\r\n");
      out.write("\t   \t\t\t\t\t\t\t\t\t\t\t\t\t\thtml+=\"<p class='card-text'>\"+$(m).find(\"addr1\").text()+\"</p>\"\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\t\t\t\thtml+=\"</div>\";\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\t\t\thtml+=\"</div>\";\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\t\t\thtml+=\"<div class='starRev'>\";\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\t\t\t\thtml+=\"<span class='starR' onclick='star(this);'>별1</span>\";\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\t\t\t\thtml+=\"<span class='starR' onclick='star(this);'>별2</span>\";\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\t\t\t\thtml+=\"<span class='starR' onclick='star(this);'>별3</span>\";\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\t\t\t\thtml+=\"<span class='starR' onclick='star(this);'>별4</span>\";\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\t\t\t\thtml+=\"<span class='starR' onclick='star(this);'>별5</span>\";\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\t\t\t\thtml+=\"</div>\"\r\n");
      out.write("   \t\t\t\t\t\t\t\t\t\t\t\t\thtml+=\"</div>\";\r\n");
      out.write("   \t\t\t\t\t\t\t\t\t\t\t\t\t\r\n");
      out.write("   \t\t\t\t\t\t\t\t\t\t\tconsole.log(\"imageroot=\"+$(m).find(\"firstimage\").text());\r\n");
      out.write("   \t\t\t\t\t\t\t\t\t\t\tcontentids.push($(m).find(\"contentid\").text());\t\r\n");
      out.write("   \t\t\t\t\t\t\t\t\t\t\t\r\n");
      out.write("   \t\t\t\t\t\t\t\t\t\t\tcontenttypes.push($(m).find(\"contenttypeid\").text());\r\n");
      out.write("   \t\t\t\t\t\t\t\t\t\t\tif($(m).find(\"firstimage\").text()!=null){\r\n");
      out.write("   \t\t\t\t\t\t\t\t\t\t\t\tcontentthumbnails.push($(m).find(\"firstimage\").text());\r\n");
      out.write("   \t\t\t\t\t\t\t\t\t\t\t}else {\r\n");
      out.write("   \t\t\t\t\t\t\t\t\t\t\t\tcontentthumbnails.push(\"undefined\");\r\n");
      out.write("   \t\t\t\t\t\t\t\t\t\t\t}\r\n");
      out.write("   \t\t\t\t\t\t\t\t\t\t\tcontenttitles.push($(m).find(\"title\").text());\r\n");
      out.write("   \t\t\t\t\t\t\t\t\t\t\tcontentaddresses.push($(m).find(\"addr1\").text());\r\n");
      out.write("   \t\t\t\t\t\t\t\t\t\t\t\r\n");
      out.write("   \t\t\t\t\t\t\t\t\t\t\t\r\n");
      out.write("   \t\t\t\t\t\t\t\t\t\t\r\n");
      out.write("   \t\t\t\t\t\r\n");
      out.write("   \t\t\t\t\t\t\t\t\t}\t\r\n");
      out.write("   \t\t\t\t\t\r\n");
      out.write("   \t\t\t\t\t\t\t\t});\r\n");
      out.write("   \t\t\t\t\t\t\t\t$(\"#contents\").append(html);\r\n");
      out.write("   \t\t\t\t\t\t\t    $(\"#search\").val('');\r\n");
      out.write("   \t\t\t\t\t\t\t},\r\n");
      out.write("   \t\t\t\t\t\t\terror:function(jqxhr,textStatus,errorThrown){\r\n");
      out.write("   \t\t\t\t\t\t\t\t\r\n");
      out.write("   \t\t\t\t\t\t\t}\r\n");
      out.write("   \t\t\t\t\t\t});\r\n");
      out.write("   \t\t\t\t\t\t\r\n");
      out.write("  \r\n");
      out.write("   \t\t\t\t\t})).hover(e=>{\r\n");
      out.write("   \t\t\t\t\t\t$(e.target).addClass(\"sel\").siblings().removeClass(\"sel\");\t\t\t\r\n");
      out.write("   \t\t\t\t\t}, e=>{\r\n");
      out.write("   \t\t\t\t\t\t$(e.target).removeClass(\"sel\");\r\n");
      out.write("   \t\t\t\t\t});\r\n");
      out.write("   \t\t\t\t\t\r\n");
      out.write("   \t\t\t\t},\r\n");
      out.write("   \t\t\t\terror:function(){\r\n");
      out.write("   \t\t\t\t\t\r\n");
      out.write("   \t\t\t\t}\r\n");
      out.write("   \t\t\t\r\n");
      out.write("   \t\t\t});\t\r\n");
      out.write("   \t\t}\r\n");
      out.write("   \t}\r\n");
      out.write("   }\r\n");
      out.write("   \r\n");
      out.write("</script>\r\n");
      out.write("\r\n");
      out.write("\t<div align=\"left\">\r\n");
      out.write("\t\t<label for=\"\" style=\"font-weight: 700;\">여행지</label><span style=\"font-size:0.5em; color:gray;\">최대 3개까지 등록 가능합니다.</span>\r\n");
      out.write("\t\t<br />\r\n");
      out.write("\t\t<select name=\"sido1\" id=\"sido1\"></select>\r\n");
      out.write("\t\t<select name=\"gugun1\" id=\"gugun1\"></select>\r\n");
      out.write("\t\t<div id=\"searchFrm\">\r\n");
      out.write("\t\t\t<input hidden=\"hidden\" />\r\n");
      out.write("\t\t\t<input type=\"search\" name=\"search\" id=\"search\" placeholder=\"검색어입력\" onkeyup=\"searchList(event);\" size=\"27\" /> \r\n");
      out.write("\t\t\t<ul id=\"autoComplete\" style=\"z-index:99;\">\r\n");
      out.write("\t\t\t\t\t\t\r\n");
      out.write("\t\t\t</ul>\r\n");
      out.write("\t\t</div>\r\n");
      out.write("\t</div>\r\n");
      out.write("\t\t<div class=\"row\" id=\"contents\" style=\"margin: 0 auto;\">\r\n");
      out.write("\t\t\t<!-- ajax 내용 들어가는곳 -->\t\t\t\t\t\t\t\t\t\r\n");
      out.write("\t\t</div>\r\n");
      out.write("\t\t\r\n");
      out.write("<style>\r\n");
      out.write("\r\n");
      out.write("#header>a{margin-left: 45px;}\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write(".wrapper{\r\n");
      out.write("\tposition:relative;\r\n");
      out.write("}\r\n");
      out.write("#autoComplete{\r\n");
      out.write("\tdisplay: none;\r\n");
      out.write("\tbackground: white;\r\n");
      out.write("\tmin-width: 253px;\r\n");
      out.write("\tborder: 1px solid gray;\r\n");
      out.write("\tposition: absolute;\r\n");
      out.write("\ttop: 22px;\r\n");
      out.write("\tleft: 0px;\r\n");
      out.write("\tpadding: 0;\r\n");
      out.write("\tmargin: 0;\r\n");
      out.write("}\r\n");
      out.write("#autoComplete li{\r\n");
      out.write("\tpadding: 0 10px;\r\n");
      out.write("\tlist-style: none;\r\n");
      out.write("\tcursor: pointer;\r\n");
      out.write("}\r\n");
      out.write("#autoComplete li.sel{\r\n");
      out.write("\tbackground: gray;\r\n");
      out.write("\tcolor: white;\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write("#search{\r\n");
      out.write("\tmargin-bottom: 5px;\r\n");
      out.write("}\r\n");
      out.write("#searchFrm{\r\n");
      out.write("\tdisplay: inline;\r\n");
      out.write("\tposition: relative;\r\n");
      out.write("}\r\n");
      out.write("#contents{\r\n");
      out.write("padding: 0 10px;\r\n");
      out.write("text-align: center;\r\n");
      out.write("}\r\n");
      out.write("#contents .card-img-top, .goInfo{\r\n");
      out.write("width: 150px; height:  150px;\r\n");
      out.write("position: relative;\r\n");
      out.write("}\r\n");
      out.write(".card-img-top{\r\n");
      out.write("\tborder: 1px black solid;\r\n");
      out.write("\twidth: 150px;\r\n");
      out.write("\theight: 150px;\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write(".h-100{\r\n");
      out.write("width: 150px;\r\n");
      out.write("border: 1px solid transparent;\r\n");
      out.write("padding: 0 2px;\r\n");
      out.write("\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write(".card-text{\r\n");
      out.write("\tfont-size: 0.8em;\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write("div.caption{\r\n");
      out.write("\tdisplay:block;\r\n");
      out.write("\twidth: 150px; height: 150px;\r\n");
      out.write("\tposition: absolute;\r\n");
      out.write("    top:0px;\r\n");
      out.write("    padding: 0px;\r\n");
      out.write("    opacity: 0; \r\n");
      out.write("    background: rgb(0, 0, 0, 0.5);\r\n");
      out.write("    cursor: pointer;   \r\n");
      out.write("    text-align: center;\r\n");
      out.write("    vertical-align: middle;\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write(".h-100:hover .caption{\r\n");
      out.write("\topacity: 1;\r\n");
      out.write("}\r\n");
      out.write("p.card-text{\r\n");
      out.write("\tcolor: white;\r\n");
      out.write("}\r\n");
      out.write(".row{\r\n");
      out.write("\tdisplay: table;\r\n");
      out.write("}\r\n");
      out.write(".row div{\r\n");
      out.write("    display: table-cell;\r\n");
      out.write("\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write(".caption-text{\r\n");
      out.write("\twidth: 150px;\r\n");
      out.write("\theight: 150px;\r\n");
      out.write("\ttext-align: center;\r\n");
      out.write("\tdisplay:table-cell;\r\n");
      out.write("\tvertical-align: middle;\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write(".cc{\r\n");
      out.write("\tposition: absolute;\r\n");
      out.write("\tcolor:#fec503;\r\n");
      out.write("\ttop:1px;\r\n");
      out.write("\tleft:135px;\r\n");
      out.write("\tcurser:pointer;\r\n");
      out.write("\t\r\n");
      out.write("}\r\n");
      out.write(".starR{\r\n");
      out.write("  background: url('http://miuu227.godohosting.com/images/icon/ico_review.png') no-repeat right 0;\r\n");
      out.write("  background-size: auto 100%;\r\n");
      out.write("  width: 30px;\r\n");
      out.write("  height: 30px;\r\n");
      out.write("  display:table-cell;\r\n");
      out.write("  text-indent: -9999px;\r\n");
      out.write("  cursor: pointer;\r\n");
      out.write("}\r\n");
      out.write(".starR.on{background-position:0 0;}\r\n");
      out.write("\r\n");
      out.write(".starRev{\r\n");
      out.write("\tmargin:0 auto;\r\n");
      out.write("}\r\n");
      out.write("</style>\r\n");
      out.write("\r\n");
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
