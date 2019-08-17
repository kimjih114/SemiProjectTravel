<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String userId = (String)request.getParameter("userId");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 변경</title>
<script type="text/javascript" src="<%=request.getContextPath() %>/js/jquery-3.2.1.min.js"></script>
<link href="<%=request.getContextPath() %>/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

<script>
function passwordValidate(){
	var pwd_new = $("#password_new").val().trim();
	var pwd_chk = $("#password_chk").val().trim();
	if(pwd_new!=pwd_chk){
		alert("입력한 비밀번호가 일치하지 않습니다.");
		$("#password_new").select();
		return false;
	}
	
	var pass= /^[a-zA-Z0-9]{7,19}$/;
	if(pass.test(pwd_new)==true){

	}
	else{
		alert("비밀번호는 8자리 이상이며 영어, 숫자로 이루어져 있습니다.");
		return false;
	}
	
	return true;	
}
</script>
<style>
#change{
	background-color : #FEC810;
	border-style : none;
	font-weight : bold;
	margin-top : 10px;
	padding : 5px;
	color : white;
}
#close{
	background-color : #FEC810;
	border-style : none;
	font-weight : bold;
	margin-top : 10px;
	padding : 5px;
	color : white;
}
#updatePwdFrm{
	margin : auto;
}
#password{
	width : 250px;
	hegith : 10px;
}
#password_new{
	width : 250px;
	hegith : 10px;
}
#password_chk{
	width : 250px;
	hegith : 10px;
}
#btn-change{
	text-align:center;
}
</style>
</head>
<body>
	<div id="updatePassword-container" style="margin-top : 25px; margin-left :20%;"  >
		<form id="updatePwdFrm" name="updatePwdFrm" action="<%=request.getContextPath()%>/user/updatePasswordEnd" 
		method="post"  >
		<div class="form-group">
    	<label for="exampleInputPassword1" style="font-size:15px;">현재 비밀번호</label>
   		 <input type="password" class="form-control" id="password" placeholder="Password" name="password" required>
  		</div>
  		<div class="form-group">
    	<label for="exampleInputPassword1" style="font-size:15px;">변경할 비밀번호</label>
   		 <input type="password" class="form-control" id="password_new" placeholder="New Password" name="password_new" required>
  		</div>
  		<div class="form-group">
    	<label for="exampleInputPassword1" style="font-size:15px;">비밀번호 확인</label>
   		 <input type="password" class="form-control" id="password_chk" placeholder="Check Password" name="password_chk" required>
   		 </div>
   		<div id="btn-change" style="margin-right : 90px;">
		<input type="submit" id="change" class="btn btn-primary" value="변경" onclick="return passwordValidate();"/>&nbsp;
		<input type="button" id="close" class="btn btn-primary" onclick="self.close();" value="닫기" />						
		</div>
			
			<input type="hidden" name="userId" value="<%=userId%>"/>
		</form>
	</div>
</body>
</html>