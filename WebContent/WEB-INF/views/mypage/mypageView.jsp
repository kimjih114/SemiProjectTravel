<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header-menu.jsp" %>

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

<%-- 
$("#modifyUserInfo").on("click",function(){
	console.log("???");
	var param = {
			userId :'<%=userLoggedIn.getUserId() %>'
	}
	$.ajax({
		url:"<%=request.getContextPath()%>/gson/users/userView",
		data : param,
		type: "get",
		dataType: "json",
		success: function(data){
			console.log(data);
			var $table = $("<table><th>아이디</th><th>닉네임</th><th>이름</th><th>성별</th><th>생년월일</th><th>이메일</th><th>여행지</th><th>활동</th><th>등록일</th></table>");
				
				var html = "<tr>";
				html += "<td><input='text' value='"+u.userId+"'></td>";
				html += "<td>"+u.usernickName+"</td>";
				html += "<td>"+u.userName+"</td>";
				html += "<td>"+u.userGender+"</td>";
				html += "<td>"+u.userBirth+"</td>";
				html += "<td>"+u.userEmail+"</td>";
				html += "<td>"+u.userDefaultPlace+"</td>";
				html += "<td>"+u.userDefaultActivity+"</td>";
				html += "<td>"+u.userEnrollDate+"</td>";
				html += "</tr>";
				console.log(html);
				$table.append(html);
		
			$("#content").html($table);
					
		},
		error: function(jqxhr, textStatus, errorThrown){
			console.log("ajax 처리 실패!");
			console.log(jqxhr, textStatus, errorThrown);
		}
	});
}); --%>

</script>
  <style>
.page-top{
	width: 1024px;
}
  
#profile-header{
	padding-bottom: 20px;
	margin: 0;
	background-color:#fed136;
} 
  
#sideNav {
    text-align: center;
    top: 0;
    left: 0;
    display: -webkit-box;
    display: -ms-flexbox;
    display: fixed;
    -webkit-box-orient: vertical;
    -webkit-box-direction: normal;
    -ms-flex-direction: column;
    flex-direction: column;
	width: 250px;
    /*height: 100vh;*/
    background: #fed136; 

}
.profile-circle{
	max-width: 10rem;
    max-height: 10rem;
    border: 0.5rem solid #212529;
    border-radius: 100%;
    min-width: 0;
    min-height: 0;
}
#sideNav .navbar-nav .nav-item .nav-link {
  font-weight: 800;
  letter-spacing: 0.05rem;
  text-transform: uppercase;
}

#sideNav .navbar-toggler:focus {
  outline-color: #d48a6e;
}

a .nav-link js-scroll-trigger{
	color: #007bff;
    text-decoration: none;
    background-color: transparent;

}
table{
	margin: 10 auto;
	margin-bottom: 30px;
}

table tr :hover{
	cursor: pointer;
	color: orangered;
	
}

table td{
	padding: 10px;
	border-bottom: 1px solid #212529;
	border-collapse: collapse;
    border-right: 0;
    border-left:0;
    height: 50px;
}

#sideNav, table {
	font-size: 90%;
    font-weight: 400;
   /* padding: .75em 0;*/
    letter-spacing: 1px;
}

div#profile-header{
	margin: 0 auto;
}

section#page-top{
	position: relative;
}

.myPost{
	position: absolute;
	top:0;
	left: 260px;
	border:1px solid;
	padding: 10px;
	
}

p.userprofile-userId{
	margin-bottom: 40px;
}


</style>
  
 <header class="masthead" style="height:300px;">
    <div class="container">
      <div class="intro-text" style="padding-top:140px; !important">
        <div class="intro-heading text-uppercase">
       		마이페이지
        </div>
     </div>
    </div>
  </header>
  
<section id="page-top" style="padding:0px; !important;">
  <nav id="sideNav">
	<div id="profile-header">
      <img class="profile-circle"  style="margin: 50px auto 12px;" src="<%=request.getContextPath() %>/img/profile.jpg" alt="">
      <p class="userprofile-userId"><span style="font-weight: 700;">@닉네임</span>님, 환영합니다!
      <button>여행이야기 홈</button>
   </div>

   <table id="tbl-usermenu0">
   	 <tr>
   		<td id="modifyUserInfo"> <a href="<%=request.getContextPath()%>/user/userUpdateView?userId=<%=userLoggedIn.getUserId()%>">회원정보수정</a></td>
   	</tr>
	<tr>
   		<td>메시지</td>
   	</tr>
   	<table id="tbl-usermenu1">
   		<tr>
   			<td><a href="<%=request.getContextPath()%>/mypage/myReservationView?userId=<%=userLoggedIn.getUserId()%>">예약내역</a></td>
   		</tr>
   		<tr>
   			<td>장바구니</td>
   		</tr>
   		<tr>
   			<td>위시리스트</td>
   		</tr>
   	</table>

	<table id="tbl-usermenu4" style="margin-bottom:0px; !important">
    <tr>
    	<td>FAQ</td>
    </tr>
    
    <tr>
    	<td>1:1문의</td>
    </tr>
    
    <tr>
    	<td>공지사항</td>
    </tr> 	
	</table>
  </nav>   

  	<div id="content">
  		
  	</div>
</table>
</nav>
 </section>

</body>
</html>