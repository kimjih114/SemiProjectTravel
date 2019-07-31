<%@page import="travel.model.vo.Travel"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	List<Travel> list=(List<Travel>)request.getAttribute("list");
	String pageBar=(String)request.getAttribute("pageBar");
	String sido=request.getParameter("sido1");
	String gugun=request.getParameter("gugun1");
	String searchAddress=sido+" "+gugun;
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>여행지</title>
<link rel="stylesheet" href="<%=request.getContextPath() %>/vendor/bootstrap/css/bootstrap.min.css" />
<script src="<%=request.getContextPath()%>/vendor/jquery/jquery.js"></script>
<script>
function contentPage(){
	location.href="<%=request.getContextPath()%>/travel/contentPage";
}
</script>
<style>
#header>a{margin-left: 45px;}
div#pageBar{margin-top:10px; text-align:center;}
div#pageBar span.cPage{color: #0066ff; margin-right: 5px;}
div#pageBar a{margin-right: 5px;}
</style>
</head>
<body>
	<div class="container">

		<h1 class="font-weight-light text-center text-lg-left mt-4 mb-0" id="header">
			<a href="<%=request.getContextPath() %>/travel/travelSelectArea">다른지역선택</a>
			<a href="<%=request.getContextPath() %>/travel/travelView?sido1=<%=sido%>&gugun1=<%=gugun%>">여행지</a> 
			<a href="<%=request.getContextPath() %>/travel/travelFood?searchAddress=<%=searchAddress%>">맛집</a> 
			<a href="<%=request.getContextPath() %>/travel/roomReservation">숙소</a>
			<a href="#">쇼핑</a> 
			<a href="#">놀거리</a>
		</h1>
		<br />
		<form action="<%=request.getContextPath() %>/search/searchGo"
			method="get">
			<h1 class="font-weight-light text-center text-lg-left mt-4 mb-0">
				<input type="text" name="search" id="search" placeholder="검색" /> <img
					src="<%=request.getContextPath() %>/img/travel/검색.png" alt="검색"
					style="cursor: pointer;" />
			</h1>
		</form>
		<br />
		<h3>여행지</h3>
		<br />
		<h3><%=searchAddress%></h3>
		<hr class="mt-2 mb-5">

		<div class="row">
			<%for(int i=0;i<list.size();i++){%>
			
			<div class="col-lg-4 col-sm-6 mb-4">
				<div class="card h-100">
					<a href="#"><img class="card-img-top"
						src="<%=request.getContextPath() %>/img/travel/<%=list.get(i).getOldProfileName() %>.jpg" alt=""></a>
					<div class="card-body">
						<h4 class="card-title">
							<a href="#"><%=list.get(i).getTravelName() %></a>
						</h4>
						<p class="card-text"><%=list.get(i).getTravelContent() %></p>
					</div>
				</div>
			</div>
				
			<%} %>
			
			
		</div>
		<!-- /.row -->

		<!-- pageBar -->
		<div id='pageBar'>
		<%=pageBar%>
		</div>
		 
		
		 
	</div>
</body>
</html>