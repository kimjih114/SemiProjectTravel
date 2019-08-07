<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header-menu.jsp" %>
<%
	String contentId=request.getParameter("contentId");
	String contentTypeId=request.getParameter("contentTypeId");	
%>
<script>
	$(function(){
		$.ajax({
			url: "http://api.visitkorea.or.kr/openapi/service/rest/KorService/detailInfo?ServiceKey=Q3FUrD0IPezrGaAAYbNChhRz7RbeL7Iz0iFE1bEgU1NqkrU8PJw6M2yp%2BC0y7cdykSInV0eNP1Tl0ClQP9TDjw%3D%3D&contentTypeId=<%=contentTypeId%>&contentId=<%=contentId%>&MobileOS=ETC&MobileApp=TourAPI3.0_Guide&listYN=Y",
			type: "get",
			dataType: "xml",
			success:function(data){
				var $root=$(data).find(":root");
				
				var $items=$root.find("item");
				var html="";
				
				var $root=$(data).find(":root");				
				var $items=$root.find("item");
				var html1 = "";
				$items.each(function(i,m){						
	
						html1+="<h1 class='my-4'></h1>";
						html1+="<div class='row'>";
						html1+="<div class='col-md-8'><img class='img-fluid' src='"+$(m).find("roomimg1").text()+"' alt=''></div>";
						html1+="<div class='col-md-4'>";
						html1+="<h3 class='my-3'>"+$(m).find("roomtitle").text()+"</h3>";
						html1+="<p>객실크기:"+$(m).find("roomsize1").text()+"</p>";
						html1+="<p>기준인원:"+$(m).find("roommaxcount").text()+"</p>";
						html1+="<p>객실소개:"+$(m).find("roomintro").text()+"</p>";
						html1+="<p>비수기주중최소:"+$(m).find("roomoffseasonminfee1").text()+"(성수기:"+$(m).find("roomoffseasonminfee2").text()+")</p>";
						html1+="<p>비수기주말최소:"+$(m).find("roompeakseasonminfee1").text()+"(성수기:"+$(m).find("roompeakseasonminfee2").text()+")</p>";
						html1+="<h3 class='my-3'><button type='button'>예약하기</button></h3>";
						html1+="</div></div>";
						html1+="<h3 class='my-4'></h3>";	
						html1+="<div class='row'>";
						html1+="<div class='col-md-3 col-sm-6 mb-4'>";
						html1+="<a href='#'><img class='img-fluid' src='"+$(m).find("roomimg1").text()+"' alt=''></a>";
						html1+="</div>";
						html1+="<div class='col-md-3 col-sm-6 mb-4'><a href='#'><img class='img-fluid' src='"+$(m).find("roomimg2").text()+"' alt=''></a></div>";
						html1+="<div class='col-md-3 col-sm-6 mb-4'><a href='#'><img class='img-fluid' src='"+$(m).find("roomimg3").text()+"' alt=''></a></div>";
						html1+=" </div>";
				});
				$("#contents").html(html1);
				
			},
			error:function(jqxhr,textStatus,errorThrown){
				
			}
		});
	});
</script>
<body>
	
	<header class="masthead" style="height:300px;">
    	<div class="container">
      	<div class="intro-text" style="padding-top:140px; !important">
        	<div class="intro-heading text-uppercase">
       		
        	</div>
     	</div>
    	</div>
  	</header>
  	
  	<h2>달력</h2>
  	
  	
	<!-- Page Content -->
<div class="container">
<div id="contents">
  
  

</div>
</div>

	
</body>
</html>