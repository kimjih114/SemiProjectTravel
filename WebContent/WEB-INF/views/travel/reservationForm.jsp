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
				var html2 = "";
				$items.each(function(i,m){						
						
						/*
    
     
      <p>객실크기:</p>
      <p>기준인원:</p>
      <p>객실소개:</p>
      <p>비수기주중최소:(성수기:)</p>
      <p>비수기주말최소:(성수기:)</p>
      <h3 class="my-3"><button type="button">예약하기</button></h3>
    </div>

  </div>
  
  <h3 class="my-4">Related Projects</h3>

  <div class="row">

    <div class="col-md-3 col-sm-6 mb-4">
      <a href="#">
            <img class="img-fluid" src="http://placehold.it/500x300" alt="">
          </a>
    </div>

    <div class="col-md-3 col-sm-6 mb-4">
      <a href="#">
            <img class="img-fluid" src="http://placehold.it/500x300" alt="">
          </a>
    </div>

    <div class="col-md-3 col-sm-6 mb-4">
      <a href="#">
            <img class="img-fluid" src="http://placehold.it/500x300" alt="">
          </a>
    </div>

  </div>
						*/
					
					
					
						html1+="<h1 class='my-4'></h1>";
						html1+="<div class='row'>";
						html1+="<div class='col-md-8'><img class='img-fluid' src='"+$(m).find("roomimg1").text()+"' alt=''></div>";
						html1+="<div class='col-md-4'>";
						html1+="<h3 class='my-3'>"+$(m).find("roomtitle").text()+"</h3>";
						html1+="<p>객실크기:</p>";
						html1+="<p>기준인원:</p>";
						html1+="<p>객실소개:</p>";
						html1+="<p>객실크기:</p>";
						html1+="<p>객실크기:</p>";
																		
					
						
				});
				$("#content1").html(html1);
				
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