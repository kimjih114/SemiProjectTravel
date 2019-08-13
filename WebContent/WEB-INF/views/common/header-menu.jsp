<%@page import="sns.model.service.SNSService"%>
<%@page import="user.model.vo.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
 <!-- Bootstrap core CSS -->
  <link href="/trav/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

  <!-- Custom fonts for this template -->
  <link href="/trav/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
  <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" type="text/css">
  <link href='https://fonts.googleapis.com/css?family=Kaushan+Script' rel='stylesheet' type='text/css'>
  <link href='https://fonts.googleapis.com/css?family=Droid+Serif:400,700,400italic,700italic' rel='stylesheet' type='text/css'>
  <link href='https://fonts.googleapis.com/css?family=Roboto+Slab:400,100,300,700' rel='stylesheet' type='text/css'>

  <!-- Custom styles for this template -->
  <link href="/trav/css/agency.min.css" rel="stylesheet">
  
  <!-- Bootstrap core JavaScript -->
  <script src="/trav/vendor/jquery/jquery.min.js"></script>
  <script src="/trav/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

  <!-- Plugin JavaScript -->
  <script src="/trav/vendor/jquery-easing/jquery.easing.min.js"></script>

  <!-- Contact form JavaScript -->
  <script src="/trav/js/jqBootstrapValidation.js"></script>
  <script src="/trav/js/contact_me.js"></script>

  <!-- Custom scripts for this template -->
  <script src="/trav/js/agency.min.js"></script>



<%

	User userLoggedIn = (User)session.getAttribute("userLoggedIn");

	System.out.println("userLoggedIn@userLogin.jsp=" + userLoggedIn);
%>
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  
  <title>유람</title>

<style>
header.masthead{
background-image:url(<%=request.getContextPath()%>/img/header-new.jpg);


}
.header-profile-circle{
    border: 0px;
    border-radius: 100%;
}

.header-menu-container{

}
</style>


</head>

<body id="page-top">

  <!-- Navigation -->
  <nav class="navbar navbar-expand-lg navbar-dark fixed-top" id="mainNav">
    <div class="container">
      <a class="navbar-brand js-scroll-trigger" href="<%=request.getContextPath() %>/">유람</a>
      <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
        Menu
        <i class="fas fa-bars"></i>
      </button>
      <div class="collapse navbar-collapse" id="navbarResponsive">
        <ul class="navbar-nav text-uppercase ml-auto">
          <li class="nav-item">
            <a class="nav-link js-scroll-trigger" href="<%=request.getContextPath()%>/travel/travelSelectArea">여행지</a>
          </li>
          
		  <li class="nav-item">
		  <% if(userLoggedIn!=null){%>
	        <a class="nav-link js-scroll-trigger" href="<%=request.getContextPath() %>/story/storyMain?mypage=<%=userLoggedIn.getUserId() %>">여행이야기</a>
	      <%} else{ %>
	        <a class="nav-link js-scroll-trigger" href="<%=request.getContextPath() %>/story/storyMain">여행이야기</a>
	      <%} %>
	      
	      </li>
          <li class="nav-item">
            <span class="nav-link js-scroll-trigger">&nbsp;&nbsp;</span>
          </li>
         <%if(userLoggedIn==null){ %>
	          <li class="nav-item">
	            <a class="nav-link js-scroll-trigger" href='<%=request.getContextPath() %>/user/userLoginFrm'>로그인</a> <!-- userLogin.jsp로 이동하는 서블릿 -->
	          </li> 
		      <li class="nav-item">
		        <a class="nav-link js-scroll-trigger" href="<%=request.getContextPath()%>/user/userEnrollFrm">회원가입</a>
		      </li>
         <% }
          	else if(userLoggedIn!=null && "A".equals(userLoggedIn.getUserType())){%>
          	<li class="nav-item">
            	<a class="nav-link js-scroll-trigger" href="<%=request.getContextPath() %>/user/userLogout">로그아웃</a>
         	</li>
          	 <li class="nav-item">
	           <a class="nav-link js-scroll-trigger" style="padding-top: 5px !important" href='<%=request.getContextPath() %>/admin/adminView'>
	           		<img src="<%=request.getContextPath() %>/img/이동욱.jpg" class="header-profile-circle"  width="40" height="40" />
	           </a> <!-- userLogin.jsp로 이동하는 서블릿 -->
	         </li> 
          <% }
          	else if(userLoggedIn!=null){ %>
          	 <li class="nav-item">
            	<a class="nav-link js-scroll-trigger" href="<%=request.getContextPath() %>/user/userLogout">로그아웃</a>
         	</li>
          	 <li class="nav-item">
	           <a class="nav-link js-scroll-trigger" style="padding-top: 5px !important" href='<%=request.getContextPath() %>/mypage/mypageView'>
	           	<%if(userLoggedIn==null || userLoggedIn.getFileName()==null){%>
	           		<button onclick="location.href='<%=request.getContextPath() %>/mypage/mypageView'"></button>
	           	<% } else {%>
	           		<img src="<%=request.getContextPath() %>/upload/profile/<%=userLoggedIn.getFileName() %>" class="header-profile-circle"  width="40" height="40" />
	           	<%} %>
	           </a> <!-- userLogin.jsp로 이동하는 서블릿 -->
	         </li> 
         <%} %>
         
        </ul>
      </div>
    </div>
  </nav>
  