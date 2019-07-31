<%@page import="user.vo.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

User userLoggedIn = new User("abcde", "1234", "김지현", "F", null, null, null, null, null, "D", null, null, null, null, null);

%>
<!DOCTYPE html>
<html>
<style>
.headerprofile-circle{
    border: 0px;
    border-radius: 100%;
}
.page-top{
	min-width: 1024px;
	min-height: 768px;
}

</style>
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">
  <title>유람(가제)</title>

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
  




 
</head>

<body class="page-top">
  <!-- Navigation -->
  <nav class="navbar navbar-expand-lg navbar-dark fixed-top" id="mainNav">
    <div class="container">
      <a class="navbar-brand js-scroll-trigger" href="<%=request.getContextPath() %>/">유람(가제)</a>
      <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
        메뉴
        <i class="fas fa-bars"></i>
      </button>
      <div class="collapse navbar-collapse" id="navbarResponsive">
        <ul class="navbar-nav text-uppercase ml-auto">
          <li class="nav-item">
            <a class="nav-link js-scroll-trigger" href="<%=request.getContextPath()%>/travel/travelSelectArea">여행지</a>
          </li>
          <li class="nav-item">
            <a class="nav-link js-scroll-trigger" href="<%=request.getContextPath() %>/story/storyMain">여행이야기</a>
          </li>
          <li class="nav-item" id="separator"> <span class="nav-link js-scroll-trigger"></span>
           <!--  <a class="nav-link js-scroll-trigger" href="#about"></a> -->
          </li>
          <%if(userLoggedIn==null){ %>
	          <li class="nav-item">
	            <a class="nav-link js-scroll-trigger" href='<%=request.getContextPath() %>/user/userLoginFrm'>로그인</a> <!-- userLogin.jsp로 이동하는 서블릿 -->
	          </li> 
		      <li class="nav-item">
		        <a class="nav-link js-scroll-trigger" href="#contact">회원가입</a>
		      </li>
          <% }
          	else if(userLoggedIn!=null){ %>
          	 <li class="nav-item">
            	<a class="nav-link js-scroll-trigger" href="<%=request.getContextPath() %>/story/storyMain">로그아웃</a>
         	</li>
          	 <li class="nav-item">
	           <a class="nav-link js-scroll-trigger" style="padding-top: 5px !important" href='<%=request.getContextPath() %>/mypage/mypageView'>
	           		<img src="<%=request.getContextPath() %>/img/profile.jpg" class="headerprofile-circle"  width="40" height="40" />
	           </a> <!-- userLogin.jsp로 이동하는 서블릿 -->
	         </li> 
         <% }%>
        </ul>
      </div>
    </div>
  </nav>
