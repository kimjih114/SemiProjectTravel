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
<style>
#checkId-container{
	text-align : center;
	padding-top : 50px;
}
span#duplicated{
	color : red;
	font-weight : bold;
}
</style>
<script>
function checkIdDuplicate(){
	var userId = $("#userId").val().trim();
	
	if(userId.length < 4){
		alert("아이디는 4글자 이상 입력하세요.");
		return;
	}
	
	var frm = document.checkIdDuplicateFrm;
	frm.userId.value = userId;
	frm.submit();
}



</script>
</head>
<body>
<div id="checkId-container">
	<% if(isUsable == true){ %>
		[<span><%=userId %></span>]는 사용 가능합니다.
		<br><br>
		<button type="button" onclick="setMemberId();">닫기</button>

	<%} else { %>
		[<span><%=userId %></span>]는 이미 사용중입니다. 
		<form action="<%=request.getContextPath()%>/enroll/CheckIdDuplicate"
			  name="checkIdDuplicateFrm"
			  method="post">
			<input type="text" name="userId"
				   id="userId"
				   placeholder="아이디를 입력하세요." />
			<button type="button" 
				    onclick="checkIdDuplicate();">
				중복검사
			</button>
		</form>
	
	<% } %>
		<br><br>
</div>
<script>
function setMemberId(){
	var frm = opener.document.userEnrollFrm;
	frm.userId.value = '<%=userId%>';
	frm.idValid.value = 0;
	self.close();
}

</script>
</body>
</html>