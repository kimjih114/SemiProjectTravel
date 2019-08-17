<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String userId = request.getParameter("userId");
	boolean isUsable = (boolean)request.getAttribute("isUsable");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 중복검사</title>
<script src = "<%=request.getContextPath()%>/js/jquery-3.4.1.js"></script>
<link href="<%=request.getContextPath() %>/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  
<style>
#checkId-container{
	text-align : center;
	padding-top : 50px;
}
span#duplicated{
	color : red;
	font-weight : bold;
}
#exit{
	background-color : #FEC810;
	border-style : none;
	font-weight : bold;
}
#again{
	background-color : #FEC810;
	border-style : none;
	font-weight : bold;
	padding-top : 10px;
	margin-top : 10px;

}
#uRam{
	top:0;
	background-color:#212529;
	color : orange;
	font-size : 30px;
}
.check_id{
	font-size : 25px;
	font-color : orange;
	text-decoration : underline;
}
.form-control{
	margin-left : 70px;
	margin-top : 10px;
	
}
</style>
</head>

<body>
<div id="uRam">&nbsp;유람</div>

<div id="checkId-container" style="padding-top : 20px;text-align:center;">
	<% if(isUsable == true){ %>
	<br>
		<span class="check_id"><%=userId%></span> 는 사용 가능합니다.
		<br><br>
		<button type="button" onclick="setUserId();" class="btn btn-primary" id="exit">닫기</button>
	<%} else { %>
		<span style="font-weight : bold;"><%=userId%></span>는 이미 사용중입니다. 
		<form action="<%=request.getContextPath()%>/enroll/CheckIdDuplicate"
			  id="checkIdDuplicateFrm"
			  name="checkIdDuplicateFrm"
			  method="post">
			      <input type="text" class="form-control" id="userId" aria-describedby="emailHelp" placeholder="ID" name="userId" style="width:170px;">
			<button type="button" class="btn btn-primary" id="again"
				    onclick="checkIdDulplicate();" >
				중복검사
			</button>
		</form>
	
	<% } %>
		
</div>
<script>
function checkIdDulplicate(){
	
	var userId = $("#userId").val().trim();
	if(userId.length < 4){
		alert("아이디는 4 글자 이상 입력하세요.");
		return;
	}

	//폼과 팝업 연결
	var frm = document.checkIdDuplicateFrm;
	frm.userId.value = userId;
	frm.submit();
	
}

function setUserId(){
	var frm = opener.document.userEnrollFrm;
	
	frm.userId.value = '<%=userId%>';
	frm.idValid.value = 0;
	frm.usernickName.focus();
	self.close();
}
</script>
</body>
</html>