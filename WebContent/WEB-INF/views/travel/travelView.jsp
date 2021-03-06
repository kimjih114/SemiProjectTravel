<%@page import="travel.model.vo.Travel"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/views/common/header-menu.jsp" %>
<%
	int sido=Integer.parseInt(request.getParameter("sido1"));
	int gugun=Integer.parseInt(request.getParameter("gugun1"));
	
%>
 <!-- Bootstrap core CSS -->
  <link href="<%=request.getContextPath() %>/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

  <!-- Custom fonts for this template -->
  <link href="<%=request.getContextPath() %>/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
  <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" type="text/css">
  <link href='https://fonts.googleapis.com/css?family=Kaushan+Script' rel='stylesheet' type='text/css'>
  <link href='https://fonts.googleapis.com/css?family=Droid+Serif:400,700,400italic,700italic' rel='stylesheet' type='text/css'>
  <link href='https://fonts.googleapis.com/css?family=Roboto+Slab:400,100,300,700' rel='stylesheet' type='text/css'>

  <!-- Custom styles for this template -->
  <link href="<%=request.getContextPath() %>/css/agency.min.css" rel="stylesheet">
  
  <!-- Bootstrap core JavaScript -->
  <script src="<%=request.getContextPath() %>/vendor/jquery/jquery.min.js"></script>
  <script src="<%=request.getContextPath() %>/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

  <!-- Plugin JavaScript -->
  <script src="<%=request.getContextPath() %>/vendor/jquery-easing/jquery.easing.min.js"></script>

  <!-- Contact form JavaScript -->
  <script src="<%=request.getContextPath() %>/js/jqBootstrapValidation.js"></script>
  <script src="<%=request.getContextPath() %>/js/contact_me.js"></script>

  <!-- Custom scripts for this template -->
  <script src="<%=request.getContextPath() %>/js/agency.min.js"></script>

<script>
var hiddenCount=0;

$(function(){
	$.ajax({
		url: "http://api.visitkorea.or.kr/openapi/service/rest/KorService/areaBasedList?ServiceKey=Q3FUrD0IPezrGaAAYbNChhRz7RbeL7Iz0iFE1bEgU1NqkrU8PJw6M2yp%2BC0y7cdykSInV0eNP1Tl0ClQP9TDjw%3D%3D&contentTypeId=12&areaCode=<%=sido%>&sigunguCode=<%=gugun%>&cat1=&cat2=&cat3=&listYN=Y&MobileOS=ETC&MobileApp=TourAPI3.0_Guide&arrange=A&numOfRows=100&pageNo=1",
		type: "get",
		dataType: "xml",
		success:function(data){
			
			var $root=$(data).find(":root");
			
			var $items=$root.find("item");
			var html="";
			var pageMore="";
			var totalContents=0;
			
			$items.each(function(i,m){
				totalContents++;
			});
			
			$items.each(function(i,m){							
					
				var src="";
					if($(m).find("firstimage").text()!=""){
						src=$(m).find("firstimage").text();
					}else{
						src="http://placehold.it/700x400";
					}
					
					if(i<=8){
						html+="<div class='col-lg-4 col-sm-6 mb-4'>";
						html+="<div class='card h-100'>";
						html+="<a href='<%=request.getContextPath()%>/travel/detailPage?contentId="+$(m).find("contentid").text()+"&contentTypeId="+$(m).find("contenttypeid").text()+"'><img class='card-img-top' src='"+src+"'></a>";
						html+="<div class='card-body'>";
						html+="<h4 class='card-title'>";
						html+="<a href='#'>"+$(m).find("title").text()+"</a>";
						html+="</h4>";
						html+="<p class='card-text'>"+$(m).find("addr1").text()+"</p>";
						html+="</div>";
						html+="</div>";
						html+="</div>";
						
					}else{
						if(i==9){
							pageMore+="<input type='button' id='button' value='더보기' onclick='conMore();'/>";
						}
						
						html+="<div class='col-lg-4 col-sm-6 mb-4' id='hiddenContents"+hiddenCount+"' style='display: none'>";
						html+="<div class='card h-100'>";
						html+="<a href='<%=request.getContextPath()%>/travel/detailPage?contentId="+$(m).find("contentid").text()+"&contentTypeId="+$(m).find("contenttypeid").text()+"'><img class='card-img-top' src='"+src+"'></a>";
						html+="<div class='card-body'>";
						html+="<h4 class='card-title'>";
						html+="<a href='#'>"+$(m).find("title").text()+"</a>";
						html+="</h4>";
						html+="<p class='card-text'>"+$(m).find("addr1").text()+"</p>";
						html+="</div>";
						html+="</div>";
						html+="</div>";
						hiddenCount++;
					}
				
			});
			
			$("#contents").html(html);
			$("#contentsMore").html(pageMore);
			
		},
		error:function(jqxhr,textStatus,errorThrown){
			
		}
	});
});

function conMore(){
	for(var i=0;i<=hiddenCount;i++){
		$("#hiddenContents"+i).removeAttr("style");
		$("#contentsMore").html("");
	}
	
}

function searchList(e){
	
	console.log(e.key);
	console.log($("#search").val().trim());
	var $sel = $(".sel");
	var $li = $("#autoComplete li");
	
	if(e.key == "ArrowDown"){
		if($sel.length == 0){
			$li.eq(0).addClass("sel");
		}	
		else if($sel.is($li.last())){
			
		}
		else{
			$sel.removeClass("sel").next().addClass("sel");
		}
	}
	else if(e.key == "ArrowUp"){
		if($sel.length == 0){
			
		}	
		else if($sel.is($li.first())){
			$sel.removeClass("sel");
		}
		else{
			$sel.removeClass("sel").prev().addClass("sel");
		}
	}
	else if(e.key == "Enter"){
		
		$(e.target).val($sel.text());
		
		$("#autoComplete").hide().children().remove();
		
		$.ajax({
			url: "http://api.visitkorea.or.kr/openapi/service/rest/KorService/areaBasedList?ServiceKey=Q3FUrD0IPezrGaAAYbNChhRz7RbeL7Iz0iFE1bEgU1NqkrU8PJw6M2yp%2BC0y7cdykSInV0eNP1Tl0ClQP9TDjw%3D%3D&contentTypeId=12&areaCode=<%=sido%>&sigunguCode=<%=gugun%>&cat1=&cat2=&cat3=&listYN=Y&MobileOS=ETC&MobileApp=TourAPI3.0_Guide&arrange=A&numOfRows=100&pageNo=1",
			type: "get",
			dataType: "xml",
			success:function(data){			
				var $root=$(data).find(":root");				
				var $items=$root.find("item");
				var html = "";
				$items.each(function(i,m){
					
					if($(m).find("title").text()==$sel.text()){
						html+="<div class='col-lg-4 col-sm-6 mb-4'>";
						html+="<div class='card h-100'>";
						html+="<a href='<%=request.getContextPath()%>/travel/detailPage?contentId="+$(m).find("contentid").text()+"&contentTypeId="+$(m).find("contenttypeid").text()+"'><img class='card-img-top' src='"+$(m).find("firstimage").text()+"'></a>";
						html+="<div class='card-body'>";
						html+="<h4 class='card-title'>";
						html+="<a href='#'>"+$(m).find("title").text()+"</a>";
						html+="</h4>";
						html+="<p class='card-text'>"+$(m).find("addr1").text()+"</p>";
						html+="</div>";
						html+="</div>";
						html+="</div>";		
					}	
	
				});
				$("#contents").html(html);
				$("#contentsMore").html("");
			},
			error:function(jqxhr,textStatus,errorThrown){
				
			}
		});
		
	}
	else{
		var search = $("#search").val().trim();
		
		if(search.length == 0){
			return;
		}else{
			$.ajax({
				url: "http://api.visitkorea.or.kr/openapi/service/rest/KorService/areaBasedList?ServiceKey=Q3FUrD0IPezrGaAAYbNChhRz7RbeL7Iz0iFE1bEgU1NqkrU8PJw6M2yp%2BC0y7cdykSInV0eNP1Tl0ClQP9TDjw%3D%3D&contentTypeId=12&areaCode=<%=sido%>&sigunguCode=<%=gugun%>&cat1=&cat2=&cat3=&listYN=Y&MobileOS=ETC&MobileApp=TourAPI3.0_Guide&arrange=A&numOfRows=100&pageNo=1",
				type: "get",
				dataType: "xml",
				success:function(data){
					
					var $root=$(data).find(":root");				
					var $items=$root.find("item");
					var html = "";
					$items.each(function(i,m){
						
						if($(m).find("title").text().indexOf(search)==-1){						
								$("#autoComplete").hide();							
						}else{							
								html += "<li>"+$(m).find("title").text()+"</li>";
														
							$("#autoComplete").html(html)
											  .fadeIn(200);
						}
						
					});
					
					$("#autoComplete li").click(e=>{
						
						$("#search").val($(e.target).text());
						//#autoComplete 감춤
						$("#autoComplete").hide().children().remove();
						
						$.ajax({
							url: "http://api.visitkorea.or.kr/openapi/service/rest/KorService/areaBasedList?ServiceKey=Q3FUrD0IPezrGaAAYbNChhRz7RbeL7Iz0iFE1bEgU1NqkrU8PJw6M2yp%2BC0y7cdykSInV0eNP1Tl0ClQP9TDjw%3D%3D&contentTypeId=12&areaCode=<%=sido%>&sigunguCode=<%=gugun%>&cat1=&cat2=&cat3=&listYN=Y&MobileOS=ETC&MobileApp=TourAPI3.0_Guide&arrange=A&numOfRows=100&pageNo=1",
							type: "get",
							dataType: "xml",
							success:function(data){			
								var $root=$(data).find(":root");				
								var $items=$root.find("item");
								var html = "";
								$items.each(function(i,m){
									if($(m).find("title").text()==$(e.target).text()){
										html+="<div class='col-lg-4 col-sm-6 mb-4'>";
										html+="<div class='card h-100'>";
										html+="<a href='<%=request.getContextPath()%>/travel/detailPage?contentId="+$(m).find("contentid").text()+"&contentTypeId="+$(m).find("contenttypeid").text()+"'><img class='card-img-top' src='"+$(m).find("firstimage").text()+"'></a>";
										html+="<div class='card-body'>";
										html+="<h4 class='card-title'>";
										html+="<a href='#'>"+$(m).find("title").text()+"</a>";
										html+="</h4>";
										html+="<p class='card-text'>"+$(m).find("addr1").text()+"</p>";
										html+="</div>";
										html+="</div>";
										html+="</div>";		
									}	
					
								});
								$("#contents").html(html);
								$("#contentsMore").html("");
							},
							error:function(jqxhr,textStatus,errorThrown){
								
							}
						});
						
						
						
					}).hover(e=>{
						$(e.target).addClass("sel").siblings().removeClass("sel");			
					}, e=>{
						$(e.target).removeClass("sel");
					});
					
				},
				error:function(){
					
				}
			
			});	
		}
	}

}
</script>
<style>
#header>a{margin-left: 45px;}
.card-img-top{
	width: 288px;
	height: 250px;
}

.wrapper{
	position:relative;
}
#autoComplete{
	display: none;
	background: white;
	min-width: 159px;
	border: 1px solid gray;
	position: absolute;
	top: 475px;
	padding: 0;
	margin: 0;
}
#autoComplete li{
	padding: 0 10px;
	list-style: none;
	cursor: pointer;
}
#autoComplete li.sel{
	background: gray;
	color: white;
}
#button {

    width:100px;

    background: orange;

    border: none;

    color:#fff;

    padding: 15px 0;

    text-align: center;

    text-decoration: none;

    display: inline-block;

    font-size: 15px;

    margin: 4px;

    cursor: pointer;

}
</style>

	<header class="masthead" style="height:300px;">
    <div class="container">
      <div class="intro-text" style="padding-top:140px; !important">
        <div class="intro-heading text-uppercase">
       		
        </div>
     </div>
    </div>
  </header>
	<div class="container">

		<h1 class="font-weight-light text-center text-lg-left mt-4 mb-0" id="header" style="margin-left: 10px;">
			<a href="<%=request.getContextPath() %>/">홈</a>
			<a href="<%=request.getContextPath() %>/travel/travelView?sido1=<%=sido%>&gugun1=<%=gugun%>">여행지</a> 
			<a href="<%=request.getContextPath() %>/travel/travelFood?sido1=<%=sido%>&gugun1=<%=gugun%>">맛집</a> 
			<a href="<%=request.getContextPath() %>/travel/travelRoom?sido1=<%=sido%>&gugun1=<%=gugun%>">숙소</a>
			<a href="<%=request.getContextPath() %>/travel/travelShopping?sido1=<%=sido%>&gugun1=<%=gugun%>">쇼핑</a> 
			<a href="<%=request.getContextPath() %>/travel/travelPlay?sido1=<%=sido%>&gugun1=<%=gugun%>">놀거리</a>
		</h1>
		<br />
		<%-- <form action="<%=request.getContextPath() %>/search/searchGo"
			method="get"></form> --%>
				
				
				<h1 class="font-weight-light text-center text-lg-left mt-4 mb-0">
				<input type="search" name="search" id="search" placeholder="검색어입력" onkeyup="searchList(event);" style="margin-left: 210px;"/> 
					<ul id="autoComplete" style="margin-left: 210px;">
					
					</ul>	
				
				<%-- <img src="<%=request.getContextPath() %>/img/travel/검색.png" alt="검색"
					style="cursor: pointer;"/>	 --%>	
				
				</h1>
	
		<br />
		<h2>여행지</h2>
		<br />
		<h3></h3>
		<hr class="mt-2 mb-5">

		<div class="row" id="contents">
		<!-- ajax 내용 들어가는곳 -->									
		</div>
		<!-- /.row -->

		<!-- 더보기 -->
		<div id="contentsMore" align="center">
			
		</div>
		 
		
		 
	</div>
</body>
</html>