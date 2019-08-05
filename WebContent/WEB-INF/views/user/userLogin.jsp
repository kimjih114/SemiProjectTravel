<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header-menu.jsp"%>


<!-- Bootstrap core CSS -->
<link
	href="<%=request.getContextPath()%>/vendor/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">

<!-- Custom fonts for this template -->
<link
	href="<%=request.getContextPath()%>/vendor/fontawesome-free/css/all.min.css"
	rel="stylesheet" type="text/css">
<link href="https://fonts.googleapis.com/css?family=Montserrat:400,700"
	rel="stylesheet" type="text/css">
<link href='https://fonts.googleapis.com/css?family=Kaushan+Script'
	rel='stylesheet' type='text/css'>
<link
	href='https://fonts.googleapis.com/css?family=Droid+Serif:400,700,400italic,700italic'
	rel='stylesheet' type='text/css'>
<link
	href='https://fonts.googleapis.com/css?family=Roboto+Slab:400,100,300,700'
	rel='stylesheet' type='text/css'>

<!-- Custom styles for this template -->
<link href="<%=request.getContextPath()%>/css/agency.min.css"
	rel="stylesheet">

<!-- Bootstrap core JavaScript -->
<%-- <script src="<%=request.getContextPath()%>/vendor/jquery/jquery.min.js"></script>
<script
	src="<%=request.getContextPath()%>/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
 --%>
<!-- Plugin JavaScript -->
<%-- <script
	src="<%=request.getContextPath()%>/vendor/jquery-easing/jquery.easing.min.js"></script>
 --%>
<!-- Contact form JavaScript -->
<%-- <script src="<%=request.getContextPath()%>/js/jqBootstrapValidation.js"></script>
<script src="<%=request.getContextPath()%>/js/contact_me.js"></script>
 --%>
<!-- Custom scripts for this template -->
<script src="<%=request.getContextPath()%>/js/agency.min.js"></script>
<script src="<%=request.getContextPath()%>/js/jquery-3.4.1.js"></script>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
	integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
	crossorigin="anonymous"></script>


<style>
/*전체컨테이너 */
div#container {
	background: background-color:#F0F0F0;
	width: 960px;
	margin: 0 auto;
}
div.login-container{

marign-top:100px;

padding-bottom:100px;

}

form {
	margin: 0 auto;
	width: 250px;
}
</style>
<script>
	function validate() {
	
		if ($("#userId").val().trim.length == 0) {
			alert("아이디를 입력하세요");
			$("#userId").focus();
			return false;
		}
		if ($("#userPassword").val().trim().length == 0) {
			alert("비밀번호를 입력하세요.");
			$("#userPassword").focus();
			return false;
		}

		return true;
	}
</script>



<!-- Header -->

<header class="masthead">
	<div class="container">
		<div class="intro-text">
			<h1>LOGIN</h1>
			<!-- <a class="btn btn-primary btn-xl text-uppercase js-scroll-trigger" href="#services"> -->
		</div>
	</div>
</header>



<!-- 로그인메뉴 -->


<div class="login-container">
	<% if(userLoggedIn == null){ %>
	<form action="<%=request.getContextPath() %>/user/loginEnd"
		id="loginEndFrm" method="post" onsubmit="return validate();">
		<div class="form-group">
			<label for="exampleInputEmail1">ID</label> <input type=text
				class="form-control" id="exampleInputEmail1" name="userId"
				aria-describedby="emailHelp" placeholder="Enter ID"> <small
				id="emailHelp" class="form-text text-muted">아이디를 입력하세요</small>
		</div>
		<div class="form-group">
			<label for="exampleInputPassword1">Password</label> <input
				type="password" class="form-control" name="userPassword" id="exampleInputPassword1"
				placeholder="Enter Password">
		</div>
		<div class="form-group form-check">
			<input type="checkbox" class="form-check-input" id="exampleCheck1" name="" >
			<label class="form-check-label" for="exampleCheck1" >아이디 저장</label>
		</div>
		<button type="submit" class="btn btn-primary" >Login</button>
		<input type="button" class="enrollbtn" value="회원가입" >
	</form>

		<% }  %>
</div>


	</body>
	</html>