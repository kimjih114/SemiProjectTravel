<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String contentId=request.getParameter("contentId");
%>

<link rel="stylesheet" href="<%=request.getContextPath() %>/vendor/bootstrap/css/bootstrap.min.css" />
<script src="<%=request.getContextPath()%>/vendor/jquery/jquery.js"></script>
  <!-- Custom styles for this template -->
 
 <link href="css/small-business.css" rel="stylesheet">
<script>
	$(function(){
		$.ajax({
			url: "http://api.visitkorea.or.kr/openapi/service/rest/KorService/detailCommon?ServiceKey=Q3FUrD0IPezrGaAAYbNChhRz7RbeL7Iz0iFE1bEgU1NqkrU8PJw6M2yp%2BC0y7cdykSInV0eNP1Tl0ClQP9TDjw%3D%3D&contentTypeId=12&contentId=<%=contentId%>&MobileOS=ETC&MobileApp=TourAPI3.0_Guide&defaultYN=Y&firstImageYN=Y&areacodeYN=Y&catcodeYN=Y&addrinfoYN=Y&mapinfoYN=Y&overviewYN=Y&transGuideYN=Y",
			type: "get",
			dataType: "xml",
			success:function(data){
				
			},
			error:function(jqxhr,textStatus,errorThrown){
				
			}
		});
	});
</script>
</head>
<body>
	
</body>
</html>