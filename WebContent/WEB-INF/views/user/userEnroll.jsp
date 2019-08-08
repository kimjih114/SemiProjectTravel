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
<%-- <script src="<%=request.getContextPath()%>/js/jquery-3.4.1.js"></script> --%>
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
		
		var regExp = /^[a-zA-Z]{1}[a-zA-Z0-9_]{4,11}$/;
		
		if(regExp.test($('#userId').val())==false){
			
			alert("영어,숫자로 구성된 5~12자를 입력하세요.(영문으로 시작)");
			userId.focus();
			return false;
			
		}
		
		var nick = $('#usernickName').val();
			if(nick.trim().length ==0){
				alert("닉네임을 입력하세요.");
				usernickName.focus();
				return false;
			}
		
			var password = $('#userPassword').val();
			var password2 = $('#password-chk').val();
			if(password.trim().length==0){
				alert("비밀번호를 입력하세요.");
				return false;
			}
			
			var regExp = /^....+$/;
			if(regExp.test(password)==true){
			}
			else{
				alert("비밀번호는 4자리 이상 입력해주세요.")
				return false;
			}
			if(password !=password2){
				alert("비밀번호가 다릅니다.");
				password = "";
				password2 = "";
				userPassword.focus();
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
</script>
<header class="masthead">
	<div class="container">
		<div class="intro-text">
			<h1 style="color:#fed136;">회원가입</h1>
		</div>	
	</div>
</header>
<style>
#userEnrollFrm{
	width : 480px;
	margin-left : auto;
	margin-right : auto;
}
.form-input{
	margin : 40px 0;
	width : 100%;
/* 	text-align : center; */
	right : 30%;
}
.inpu{
z-index:1;
font-size:16px;
border: 1px solid orange;
transition : 200ms ease-in-out;
outline : none;
padding : 0;
marging : 0;
}
label{
	font-weight : bold;
}
#putt{
	text-align: center;
}
</style>
<form action="" name="CheckIdDuplicateFrm">
	<input type="hidden" name="userId" />
</form>
<br />
		<div class="form-input">
		<form action="<%=request.getContextPath()%>/enroll/userEnrollEnd"
			  name="userEnrollFrm"
			  id="userEnrollFrm"
			  method="post"
			  enctype="multipart/form-data"
			  onsubmit="return enrollValidate();"
			  >
		
  <div class="form-group">
 	 <input type="text" name="userType" id="userType"
			style="display:none;" value="D" />
    <label for="exampleInputEmail1">아이디</label>
    <input type="text" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="ID" name="userId" required>
    <!-- <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small> -->
  </div>
  <div class="form-group">
 	 <input type="text" name="userType" id="userType"
			style="display:none;" value="D" />
    <label for="exampleInputEmail1">닉네임</label>
    <input type="text" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="NickName" name="usernickName">
  </div>
  <div class="form-group">
    <label for="exampleInputPassword1">비밀번호</label>
    <input type="password" class="form-control" id="exampleInputPassword1" placeholder="Password" name="userPassword" required>
  </div>
  <div class="form-group">
    <label for="exampleInputPassword1">비밀번호 확인</label>
    <input type="password" class="form-control" id="exampleInputPassword1" placeholder="Password" name="password-chk" required>
  </div>
  <div class="form-group">
    <label for="exampleInputEmail1">이름</label>
    <input type="text" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Name" name="userName" required>
  </div>
   <div class="form-group">
    <label for="exampleInputEmail1">생일</label>
    <input type="text" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="2000-01-01"name="userBirth">
    <small id="emailHelp" class="form-text text-muted">2000-01-01 식으로 적어주세요.</small> 
  </div>
   <div class="form-group">
    <label for="exampleInputEmail1">이메일</label>
    <input type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="abc@naver.com"name="userEmail">
  </div>
   <div class="form-group">
    <label for="exampleInputEmail1">휴대폰</label>
    <input type="tel" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="(-없이)01012345678"name="userPhone"
    		maxlength="11" required>
  </div><br />
  <div class="form-check form-check-inline">
  <input class="form-check-input" type="checkbox" id="userGenderM" name="userGender" value="M" checked
    		onclick="check_only(this)">
  <label class="form-check-label" for="inlineCheckbox1">남</label>
</div>
<div class="form-check form-check-inline">
  <input class="form-check-input" type="checkbox" name="userGender" id="userGenderF" value="F"
    		onclick="check_only(this)">
  <label class="form-check-label" for="inlineCheckbox2">여</label>
</div><br /><br />
<div class="form-group">
    <label for="exampleInputEmail1">사진등록</label><br />
    <input type="file" name="fileName" id="fileName" style="text-align:center;"/>
  </div><br />
 <div class="form-group">
    <label for="exampleInputEmail1" id="userDefaultPlace">관심여행지</label><br />
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
	 </div> <br />
  <div class="form-group">
    <label for="exampleInputEmail1" id="userDefaultActivity">관심 프로그램</label><br />
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
  </div>
  
  
  <br /><br />
 <div id="putt">

  <button type="submit" class="btn btn-primary" >회원가입</button>
  <button type="reset" class="btn btn-primary" >초기화</button>
 </div>


				<!-- <input type="text" name="userType" id="userType"
				style="display:none;" value="D" />
				<h5>아이디</h5>
				<input class="inpu" type="text" name="userId" id="userId" 
						placeholder="아이디 4글자 이상" required/>
					
			   <label for="idCheck"></label>
			   <input type="hidden" name="idValid"
					value="1"/>
		
				<br /><br />
				<h5>사진등록</h5>
				<input type="file" name="fileName" id="fileName" />
				
				<br /><br />
				<h5>닉네임</h5>
					<input type="text" class="inpu" name="usernickName" id="usernickName" />				
				<br /><br />
				<h5>비밀번호</h5>
				<input type="password" class="inpu" name="userPassword" id="userPassword" required/>
				<br /><br />
				<h5>비밀번호 확인</h5>
				<input type="password" class="inpu" name="password-chk" id="password-chk" required/>
				<br /><br />
				<h5>이름</h5>
				<input type="text" class="inpu" name="userName" id="userName" required/>
				<br /><br />
				<h5>생일</h5>
				<input type="text" class="inpu" name="userBirth" id="userBirth" />
				<br /><br />
				<h5>이메일</h5>
				<input type="email" class="inpu" name="userEmail" id="userEmail" />
				<br /><br />	
				<h5>휴대폰</h5>
				<input type="tel" name="userPhone" 
							id="userPhone" placeholder="(-없이)01012341234"
							maxlength="11" class="inpu" required/>
				<br /><br />
				<h5>성별</h5>
				<input type="radio" name="userGender" id="userGenderM" value="M" checked />
				<label for="userGenderM">남</label>
				<input type="radio" name="userGender" id="userGenderF" value="F" />
				<label for="userGenderF">여</label>
				<br /><br />

			<h5 id="userDefaultPlace">관심여행지</h5><br>
				
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
				<br /><br />
	
			<h5 id="userDefaultActivity">관심프로그램</h5><br>
				
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
					<br /><br />
		
			  	<input type="submit" value="회원가입" />
			  	<input type="reset" value="초기화" />
		</form>
		</div> -->
</form>
</div>


</body>
</html>