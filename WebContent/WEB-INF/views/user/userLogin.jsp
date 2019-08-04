<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header-menu.jsp"%>
<%
	//User userLoggedIn = (User)session.getAttribute("userLoggedIn");

	//System.out.println("userLoggedIn@userLogin.jsp=" + userLoggedIn);

	
%>

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

<style>
/*전체컨테이너 */
div#container {
	background: background-color:#F0F0F0;
	width: 960px;
	margin: 0 auto;
}

form { 

        margin: 0 auto; 

        width:250px;

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
					<table>
						<tr>
							<td>
								<input type="text" 
									   name="userId"
									   id="userId"
									   placeholder="아이디"
									   tabindex="1" 
									  <%--  value="<%=saveId?userId:""%>" --%>/>
							</td>
							
						</tr>
						<tr>
							<td>
								<input type="password" 
									   name="userPassword" 
									   id="userPassword"
									   placeholder="비밀번호" 
									   tabindex="2"/>
							</td>
							<td></td>
						</tr>
						<tr>
							<td colspan="2">
								<%-- <input type="checkbox" 
									   name="saveId" 
									   id="saveId" 
									   <%=saveId?"checked":""%>/> --%>
								<label for="saveId">아이디저장</label>
								<input type="button" 
									   value="회원가입"
									   onclick="goEnroll();" />
								
							</td>
						</tr>
					</table>
				
					<input type="submit" value="로그인" tabindex="3" />
						
				</form>	
			<% }  %>	
			</div>
</body>
</html>
