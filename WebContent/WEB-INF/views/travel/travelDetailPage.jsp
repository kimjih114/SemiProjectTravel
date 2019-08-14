<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header-menu.jsp" %>

<%
	String contentId=request.getParameter("contentId");
	String contentTypeId=request.getParameter("contentTypeId");
	double avgGrade=(double)request.getAttribute("avgGrade");
%>

<script>
	$(function(){
		
		$.ajax({
			url: "http://api.visitkorea.or.kr/openapi/service/rest/KorService/detailCommon?ServiceKey=Q3FUrD0IPezrGaAAYbNChhRz7RbeL7Iz0iFE1bEgU1NqkrU8PJw6M2yp%2BC0y7cdykSInV0eNP1Tl0ClQP9TDjw%3D%3D&contentTypeId=<%=contentTypeId%>&contentId=<%=contentId%>&MobileOS=ETC&MobileApp=TourAPI3.0_Guide&defaultYN=Y&firstImageYN=Y&areacodeYN=Y&catcodeYN=Y&addrinfoYN=Y&mapinfoYN=Y&overviewYN=Y&transGuideYN=Y",
			type: "get",
			dataType: "xml",
			async : false,
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
						html1+="<input type='hidden' id='title' value='"+$(m).find("title").text()+"'>";
						html1+="<p>"+$(m).find("addr1").text()+"</p>";
						html1+="<input type='hidden' id='address' value='"+$(m).find("addr1").text()+"'>";
						html1+="<p>별점(5점만점):"+<%=avgGrade%>+"</p>";
						html1+="<p class='star_rating'>";
						html1+="<a href='#' id='s1'>★</a>";
						html1+="<a href='#' id='s2'>★</a>";
						html1+="<a href='#' id='s3'>★</a>";
						html1+="<a href='#' id='s4'>★</a>";
						html1+="<a href='#' id='s5'>★</a>";
						html1+="</p>";
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
		
		if(<%=avgGrade%>==0){
			
		}else if(<%=avgGrade%>>0&&<%=avgGrade%><=1){
			$("#s1").addClass("on");
		}else if(<%=avgGrade%>>1&&<%=avgGrade%><=2){
			$("#s1").addClass("on");
			$("#s2").addClass("on");
		}else if(<%=avgGrade%>>2&&<%=avgGrade%><=3){
			$("#s1").addClass("on");
			$("#s2").addClass("on");
			$("#s3").addClass("on");
		}else if(<%=avgGrade%>>3&&<%=avgGrade%><=4){
			$("#s1").addClass("on");
			$("#s2").addClass("on");
			$("#s3").addClass("on");
			$("#s4").addClass("on");
		}else if(<%=avgGrade%>>4&&<%=avgGrade%><=5){
			$("#s1").addClass("on");
			$("#s2").addClass("on");
			$("#s3").addClass("on");
			$("#s4").addClass("on");
			$("#s5").addClass("on");
		}

	});
	
	function reservationForm(){
		var title=$("#title").val();
		
		location.href="<%=request.getContextPath()%>/travel/reservationForm?contentId=<%=contentId%>&contentTypeId=<%=contentTypeId%>&title="+title;
	}
</script>
<style>
	.star_rating {font-size:0; letter-spacing:-4px;}
	.star_rating a {
    font-size:22px;
    letter-spacing:0;
    display:inline-block;
    margin-left:5px;
    color:#ccc;
    text-decoration:none;
	}
	.star_rating a:first-child {margin-left:0;}
	.star_rating a.on {color:#777;}

</style>
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
	
	<%if(contentTypeId.equals("32")&&userLoggedIn!=null){%>
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
 
	


	
</body>
</html>
