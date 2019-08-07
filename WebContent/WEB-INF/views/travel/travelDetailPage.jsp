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
			url: "http://api.visitkorea.or.kr/openapi/service/rest/KorService/detailCommon?ServiceKey=Q3FUrD0IPezrGaAAYbNChhRz7RbeL7Iz0iFE1bEgU1NqkrU8PJw6M2yp%2BC0y7cdykSInV0eNP1Tl0ClQP9TDjw%3D%3D&contentTypeId=<%=contentTypeId%>&contentId=<%=contentId%>&MobileOS=ETC&MobileApp=TourAPI3.0_Guide&defaultYN=Y&firstImageYN=Y&areacodeYN=Y&catcodeYN=Y&addrinfoYN=Y&mapinfoYN=Y&overviewYN=Y&transGuideYN=Y",
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
						html1+="<div class='col-lg-7'>";
						html1+="<img class='img-fluid rounded mb-4 mb-lg-0' src='"+$(m).find("firstimage").text()+"' alt=''>";
						html1+="</div>";
						html1+="<div class='col-lg-5'>";
						html1+="<h1 class='font-weight-light'>"+$(m).find("title").text()+"</h1>";
						html1+="<p>"+$(m).find("addr1").text()+"</p>";
						html1+="</div>";													
					
						html2+="<div class='card-body'>";
						html2+="<p class='text-white m-0'>"+$(m).find("overview").text()+"</p>";
						html2+="</div>";
				});
				$("#content1").html(html1);
				$("#content2").html(html2);
			},
			error:function(jqxhr,textStatus,errorThrown){
				
			}
		});
	});
	
	function reservationForm(){
		location.href="<%=request.getContextPath()%>/travel/reservationForm?contentId=<%=contentId%>&contentTypeId=<%=contentTypeId%>";
	}
</script>
</head>
<body>
	<header class="masthead" style="height:300px;">
    	<div class="container">
      	<div class="intro-text" style="padding-top:140px; !important">
        	<div class="intro-heading text-uppercase">
       		
        	</div>
     	</div>
    	</div>
  	</header>
  	

  <!-- Page Content -->
  <div class="container">
	
	<%if(contentTypeId.equals("32")){%>
		<button type="button" onclick="reservationForm();">예약하러가기</button>
	 <%} %>  
    
    <!-- Heading Row -->
    <div class="row align-items-center my-5" id="content1">
        
    </div>
    <!-- /.row -->

    <!-- Call to Action Well -->
    <div class="card text-white bg-secondary my-5 py-4 text-center" id="content2">
      
    </div>


  </div>
  <!-- /.container -->

</body>
</html>