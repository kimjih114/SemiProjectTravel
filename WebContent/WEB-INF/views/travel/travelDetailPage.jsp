<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header-menu.jsp" %>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=d2938583d97927bcf8d3eb5281b24f12&libraries=services"></script>

<%
	String contentId=request.getParameter("contentId");
	String contentTypeId=request.getParameter("contentTypeId");
	double avgGrade=(double)request.getAttribute("avgGrade");
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
						html1+="<button onclick='map();'>지도보기</button>";
						
						<%if(contentTypeId.equals("32")&&userLoggedIn!=null){%>
						html1+="<button type='button' onclick='reservationForm();'>예약하러가기</button>";
					 	<%} %> 
						
						html1+="<div id='map' style='width:400px;height:300px;'></div>";
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
	
	function map(){
		var addr=$("#address").val();
		var title=$("#title").val();
		console.log(addr);
		var container = document.getElementById('map'); //지도를 담을 영역의 DOM 레퍼런스
		var options = { //지도를 생성할 때 필요한 기본 옵션
			center: new kakao.maps.LatLng(33.450701, 126.570667), //지도의 중심좌표.
			level: 3 //지도의 레벨(확대, 축소 정도)
		};

		var map = new kakao.maps.Map(container, options); //지도 생성 및 객체 리턴
		// 주소-좌표 변환 객체를 생성합니다
		var geocoder = new kakao.maps.services.Geocoder();

		// 주소로 좌표를 검색합니다
		geocoder.addressSearch(addr, function(result, status) {

		    // 정상적으로 검색이 완료됐으면 
		     if (status === kakao.maps.services.Status.OK) {

		        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);

		        // 결과값으로 받은 위치를 마커로 표시합니다
		        var marker = new kakao.maps.Marker({
		            map: map,
		            position: coords
		        });

		        // 인포윈도우로 장소에 대한 설명을 표시합니다
		        var infowindow = new kakao.maps.InfoWindow({
		            content: '<div style="width:150px;text-align:center;padding:6px 0;">'+title+'</div>'
		        });
		        infowindow.open(map, marker);

		        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
		        map.setCenter(coords);
		    } 
		});    
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

button {

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
