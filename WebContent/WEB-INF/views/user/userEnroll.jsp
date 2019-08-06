<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header-menu.jsp"%>

<link
	href="<%=request.getContextPath()%>/vendor/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">
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
<link href="<%=request.getContextPath()%>/css/agency.min.css"
	rel="stylesheet">
<script src="<%=request.getContextPath()%>/js/jquery-3.4.1.js"></script>
<script>
function checkIdDuplicate(){
	var userId_ = $("#userId").val().trim();
	
	if(userId_.length < 4){
		alert("아이디는 4 글자 이상 입력하세요.");
		return;
	}
	
	var url = "<%=request.getContextPath()%>/enroll/CheckIdDuplicate";
	var title = "checkIdDuplicatePopup";
	var status = "width=300px, height=200px, left=50px, top=50px";
	var popup = open("", title,status);
	
	//폼과 팝업 연결
	var frm = document.checkIdDuplicateFrm;
	frm.userId.value = userId;
	frm.action = url;
	frm.target = title;
	frm.method = "post";
	frm.submit();
	
}

function enrollValidate(){
	if($("#idValid").val()==1){
		alert("아이디 중복검사를 해주세요.");
		return false;
	}
	return true;
}


<%-- $("#userId").keyup(function(){
	
	var userId_ = $("#userId").val().trim();
	
	
	if(userId_==<%=u.getUserId() %>){
		$("#idCheck").css("color","red");
		document.querySelector("#idCheck").innerHTML = "조건 불충족";
	}
	else{
		$("#idCheck").css("color","black");
		document.querySelector("#idCheck").innerHTML = "조건 충족";
	}
}) --%>

</script>
<header class="masthead">
	<div class="container">
		<div class="intro-text">
			<h1>회원가입</h1>
			<!-- <a class="btn btn-primary btn-xl text-uppercase js-scroll-trigger" href="#services"> -->
		</div>
	</div>
</header>
<style>
#userEnrollFrm{
	text-align : center;
}
table{
	width : 60%;
	margin : auto;
	text-align : center;
}
</style>
<form action="" name="CheckIdDuplicateFrm">
	<input type="hidden" name="userId" />
</form>

		<section id="enroll-container">
		<form action="<%=request.getContextPath()%>/enroll/userEnrollEnd"
			  name="userEnrollFrm"
			  id="userEnrollFrm"
			  method="post"
			  enctype="multipart/form-data"
			  onsubmit="return enrollValidate();">
			<table>
				<input type="text" name="userType" id="userType"
				style="display:none;" value="D" />
			<tr>
				<th>아이디</th>
				<td>
					<input type="text" name="userId" id="userId" 
							placeholder="아이디 4글자 이상" required/>
					<!-- <!-- <input type="button" value="중복검사"
						 onclick="checkIdDuplicate();"/> --> -->
					<label for="idCheck"></label>
					<input type="hidden" name="idValid"
					value="1"/>
				</td>
			</tr>
			<tr>
				<th>사진등록</th>
				<td style="position:relative;">
				<input type="file" name="fileName" id="fileName" />
				</td>
			</tr>
			<tr>
				<th>닉네임</th>
				<td>
					<input type="text" name="usernickName" id="usernickName" />				
				</td>
			</tr>
			<tr>
				<th>비밀번호</th>
				<td>
					<input type="password" name="userPassword" id="userPassword" required/>
				</td>
			</tr>
			<tr>
				<th>비밀번호 확인</th>
				<td>
					<input type="password" name="password-chk" id="password-chk" required/>
				</td>
			</tr>
			<tr>
				<th>이름</th>
				<td>
					<input type="text" name="userName" id="userName" required/>
				</td>
			</tr>
			<tr>
				<th>생일</th>
				<td>
					<input type="text" name="userBirth" id="userBirth" />
				</td>
			</tr>
			<tr>
				<th>이메일</th>
				<td>
					<input type="email" name="userEmail" id="userEmail" />
				</td>
			</tr>
			<tr>
				<th>휴대폰</th>
				<td>
					<input type="tel" name="userPhone" 
							id="userPhone" placeholder="(-없이)01012341234"
							maxlength="11" required/>
				</td>
			</tr>
			<tr>
				<th>성별</th>
				<td>
				<input type="radio" name="userGender" id="userGenderM" value="M" checked />
				<label for="userGenderM">남</label>
				<input type="radio" name="userGender" id="userGenderF" value="F" />
				<label for="userGenderF">여</label>
				</td>
			</tr>
			<tr id="userDefaultPlace">
				<th>관심여행지</th>
				<td>
					<input type="checkbox" name="location" id="location1" value="여행지1" />
					<label for="location1">여행지1</label>
					<input type="checkbox" name="location" id="location2" value="여행지2" />
					<label for="location2">여행지2</label>
					<input type="checkbox" name="location" id="location3" value="여행지3" />
					<label for="location3">여행지3</label>
					<input type="checkbox" name="location" id="location4" value="여행지4" />
					<label for="location4">여행지4</label>
					<input type="checkbox" name="location" id="location5" value="여행지5" />
					<label for="location5">여행지5</label>
				</td>
			</tr>
			<tr id="userDefaultActivity">
				<th>관심프로그램</th>
				<td>
					<input type="checkbox" name="program" id="program1" value="프로그램1" />
					<label for="program1">프로그램1</label>
					<input type="checkbox" name="program" id="program2" value="프로그램2" />
					<label for="program2">프로그램2</label>
					<input type="checkbox" name="program" id="program3" value="프로그램3" />
					<label for="program3">프로그램3</label>
					<input type="checkbox" name="program" id="program4" value="프로그램4" />
					<label for="program4">프로그램4</label>
					<input type="checkbox" name="program" id="program5" value="프로그램5" />
					<label for="program5">프로그램5</label>
				</td>
			</tr>
			</table>	
			  	<input type="submit" value="회원가입" />
			  	<input type="reset" value="초기화" />
		</form>
		
		</section>


</body>
</html>