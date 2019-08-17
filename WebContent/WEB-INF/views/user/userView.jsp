<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header-menu.jsp" %>
<%
	User user = (User)session.getAttribute("userLoggedIn");

	User rUser = new UserService().selectOne(user.getUserId());
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

function enrollValidate(){

		
		var nick = $('#usernickName').val();
			if(nick.trim().length ==0){
				alert("닉네임을 입력하세요.");
				usernickName.focus();
				return false;
			}
		
			
		
			var birth = $('#userBirth').val();
			
			if(birth.trim().length==0){
				alert("생일을 입력하세요.");
				return false;
			}
			var dayRegExp = /^(19|20)\d{2}-(0[1-9]|1[012])-(0[1-9]|[12][0-9]|3[0-1])$/
			if(dayRegExp.test(birth)==true){	
			}
			else{
				alert("생일을 정확히 입력해주세요.");
				userBirth.focus();
				return false;
			}
			

			var phone = $('#userPhone').val();
			if(phone.trim().length==0){
			alert("핸드폰 번호를 입력하세요.");
			return false;
			}
			var regExp_phone= /(\d{3}).*(\d{3}).*(\d{4})/
			if(regExp_phone.test(phone)==true){
			}
			else{
				alert("정확한 전화번호를 입력하세요.");
				userPhone.focus();
				return false;
			}
		
		return true;	
	}
function check_only(chk){
	var obj = document.getElementsByName("userGender");
	for(var i =0; i<obj.length; i++){
		if(obj[i] !=chk){
			obj[i].checked=false;
		}
	}
}
<%-- $("#modifyUserInfo").click(function(){
	$.ajax({
		url:"<%=request.getContextPath()%>/gson/users/userView",
		data : {userId :<%=userLoggedIn.getUserId() %>},
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
		
			$("#content_hi").html($table);
					
		},
		error: function(jqxhr, textStatus, errorThrown){
			console.log("ajax 처리 실패!");
			console.log(jqxhr, textStatus, errorThrown);
		}
	});
}); --%>

</script>
  <style>
a{
	color:black;
}
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
#content{
	position : absolute;
	top : 7%;
	left : 28%;
}
#fname{
	position : absolute;
	left : 26%;
	margin-top : 2px;
	background-color : white;
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
   		<td id="modifyUserInfo"><a href="<%=request.getContextPath()%>/user/userUpdateView?userId=<%=userLoggedIn.getUserId()%>">회원정보수정</a></td>
   	</tr>
	<tr>
   		<td>메시지</td>
   	</tr>
   	<table id="tbl-usermenu1">
   		<tr>
   			<td>예약내역<a href="<%=request.getContextPath()%>/mypage/myReservationView?userId=<%=userLoggedIn.getUserId()%>"></a></td>
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

  	<div id="content" style="margin-left : 180px;">
  		<form action="<%=request.getContextPath()%>/update/userUpdateEnd?userId=<%=userLoggedIn.getUserId()%>"
			  name="userUpdateFrm"
			  id="userUpdateFrm"
			  method="post"
			  enctype="multipart/form-data"
			  >

  		 <div class="form-group">
 	 <input type="text" name="userType" id="userType"
			style="display:none;" value="D" />
    <label for="exampleInputEmail1">아이디</label>
    <input type="text" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="ID" name="userId"
    value = <%=rUser.getUserId() %> required readonly>
    <!-- <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small> -->
  </div>
  <div class="form-group">
 	 <input type="text" name="userType" id="userType"
			style="display:none;" value="D" />
    <label for="exampleInputEmail1">닉네임</label>
    <input type="text" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="NickName" name="usernickName"
    value="<%=rUser.getUsernickName()%>">
  </div>
  
  <div class="form-group">
    <label for="exampleInputEmail1">이름</label>
    <input type="text" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Name" name="userName" 
    value="<%=rUser.getUserName() %>" required>
  </div>
   <div class="form-group">
    <label for="exampleInputEmail1">생일</label>
    <input type="text" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="2000-01-01"name="userBirth"
    value="<%=rUser.getUserBirth()%>">
    <small id="emailHelp" class="form-text text-muted">2000-01-01 식으로 적어주세요.</small> 
  </div>
   <div class="form-group">
    <label for="exampleInputEmail1">이메일</label>
    <input type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="abc@naver.com"name="userEmail"
    value="<%=rUser.getUserEmail()%>">
  </div>
   <div class="form-group">
    <label for="exampleInputEmail1">휴대폰</label>
    <input type="tel" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="(-없이)01012345678"name="userPhone"
    		maxlength="11" value="<%=rUser.getUserPhone() %>" required>
  </div><br />
  <div class="form-check form-check-inline">
  <input class="form-check-input" type="checkbox" id="userGenderM" name="userGender" value="M" checked
    		onclick="check_only(this)" value="<%=rUser.getUserGender()%>">
  <label class="form-check-label" for="inlineCheckbox1">남</label>
</div>
<div class="form-check form-check-inline">
  <input class="form-check-input" type="checkbox" name="userGender" id="userGenderF" value="F"
    		onclick="check_only(this)" value="<%=rUser.getUserGender()%>"> 
  <label class="form-check-label" for="inlineCheckbox2">여</label>
</div><br /><br />
<div class="form-group">
    <label for="exampleInputEmail1">사진등록</label><br />
   <input type="file" name="fileUpdate" id="fileUpdate"/>
   <span id="fname"><%=rUser.getFileName()!=null?rUser.getFileName():"" %></span>
   <%if(rUser.getFileName()!=null){ %>
   <br>
<!--    <input type="checkbox" name="delFile" id="delFile">
   <label for="exampleInputEmail1">파일 삭제</label> -->
   <%} %>
   <input type="hidden" name="oldOName" value="<%=rUser.getOriginalFileName()!=null?rUser.getOriginalFileName():"" %>" />
   <input type="hidden" name="oldRName" value="<%=rUser.getFileName()!=null?rUser.getFileName():"" %>" />
  </div><br />
  <div id="putt" style="text-align:center;">
 	<button type="submit" class="btn btn-primary" >회원정보 수정</button>
 	 <button type="reset" class="btn btn-primary" >초기화</button>
 	<button type="reset" class="btn btn-primary" onclick="updatePassword();">비밀번호 변겅</button>
 	 </div>
 	 <br>
 	 </form>
 	   <button class="btn btn-primary" style="float:right;"onclick="fun_confirm();">탈퇴</button>
 	 
  	</div>
  	
</table>
</nav>
 </section>
<script>
function updatePassword(){
	
	var url = "<%=request.getContextPath()%>/user/updatePassword?memberId=<%=rUser.getUserId()%>";
    var title = "updatePassword";
    var status =  "left=500px, top=100px, width=400px, height=400px";
    
	var popup = window.open(url,title,status);
	
}

function fun_confirm(){
	
	if(confirm("탈퇴하시겠습니까?")==true){
		location.href='<%=request.getContextPath()%>/user/userDelete?userId=<%=rUser.getUserId()%>'
		
	}else{
		return;
	}
}
$("#fileUpdate").change(function(){
	console.log($(this).val());
	//사용자가 파일을 선택한 경우
	if($(this).val() != ""){
		$("#fname").hide();
		
		$("#delFile").hide().next().hide();
	}
	//사용자가 파일선택을 취소한 경우
	else{
		$("#fname").show();
		
		$("#delFile").show().next().show();
	}
});
</script>
</body>
</html>