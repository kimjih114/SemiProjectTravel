<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header-menu.jsp"%>

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
function checkIdDulplicate(){
	
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
	frm.userId.value = userId_;
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
			
			alert(" 아이디는 영어,숫자로 구성된 5~12자로 구성되어야 합니다.(영문으로 시작)");
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
			
		var pass= /^[a-zA-Z0-9]{7,19}$/;
		if(pass.test(password)==true){

		}
		else{
			alert("비밀번호는 8자리 이상이며 영어, 숫자로 이루어져 있습니다.")
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
				alert("생년월일을 입력하세요.");
				return false;
			}				 
			var dayRegExp = /^(19[0-9][0-9]|20\d{2})-(0[0-9]|1[0-2])-(0[1-9]|[1-2][0-9]|3[0-1])$/;
			if(dayRegExp.test(birth)==true){	
			}
			else{
				alert("생년월일을 2000-01-01식으로 적어주세요");
				userBirth.focus();
				return false;
			}
			

			var phone = $('#userPhone').val();
			if(phone.trim().length==0){
			alert("핸드폰 번호를 입력하세요.");
			return false;
			}
			var regExp_phone= /^(0)(\d{2}).*(\d{3}).*(\d{4})/
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
<style>
#userEnrollFrm{
	width : 400px;
	margin-left : auto;
	margin-right : auto;
}
.form-input{
	margin : 40px 0;
	width : 100%;
/* 	text-align : center; */
	right : 30%;
}

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
	left : 28%;
	
	background-color : white;
}

#putt{
	text-align: center;
}
z
</style>
<header class="masthead" style="height:300px;">
    <div class="container">
      <div class="intro-text" style="padding-top:140px; !important">
        <div class="intro-heading text-uppercase">
       		회원가입
        </div>
     </div>
    </div>
  </header>
<section id="page-top" style="padding:0px; !important;">
<form action="" name="checkIdDuplicateFrm">
	<input type="hidden" name="userId" /> 
</form>
<br />
		<div class="form-input">
		<form action="<%=request.getContextPath()%>/enroll/userEnrollEnd"
			  name="userEnrollFrm"
			  id="userEnrollFrm"
			  method="post"
			  enctype="multipart/form-data"
			  onsubmit="return enrollValidate();">
		
  <div class="form-group">
 	 <input type="text" name="userType" id="userType"
			style="display:none;" value="D" />
    <label for="exampleInputEmail1">아이디</label>
    <br>
    <input type="text" class="form-control" id="userId" aria-describedby="emailHelp" placeholder="ID" name="userId" required>
    <br />
    <input type="button" value="check id" onclick="checkIdDulplicate();" style="float:right" class="btn btn-primary">
    <input type="hidden" id="idValid" value="1"/>
    <small id="emailHelp" class="form-text text-muted">영어,숫자로 구성된 5~12자를 입력하세요.<br>(영문으로 시작)</small> 
  </div>
  <br>
  <div class="form-group">
 	 <input type="text" name="userType" id="userType"
			style="display:none;" value="D" />
    <label for="exampleInputEmail1">닉네임</label>
    <input type="text" class="form-control" id="usernickName" aria-describedby="emailHelp" placeholder="NickName" name="usernickName">
  </div>
  <br>
  <div class="form-group">
    <label for="exampleInputPassword1">비밀번호</label>
    <input type="password" class="form-control" id="userPassword" placeholder="Password" name="userPassword" required>
    <small id="emailHelp" class="form-text text-muted">비밀번호는 영어, 숫자로 8글자 이상 적어주세요.</small> 
  </div>
  <br>
  <div class="form-group">
    <label for="exampleInputPassword1">비밀번호 확인</label>
    <input type="password" class="form-control" id="password-chk" placeholder="Password" name="password-chk" required>
    <small id="emailHelp" class="form-text text-muted">위와 동일한 비밀번호를 적어주세요.</small> 
  </div>
  <br>
  <div class="form-group">
    <label for="exampleInputEmail1">이름</label>
    <input type="text" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Name" name="userName" required>
  </div>
  <br>
   <div class="form-group">
    <label for="exampleInputEmail1">생년월일</label>
    <input type="text" class="form-control" id="userBirth" aria-describedby="emailHelp" placeholder="2000-01-01"name="userBirth">
    <small id="emailHelp" class="form-text text-muted">2000-01-01식으로 적어주세요</small> 
  </div>
  <br>
   <div class="form-group">
    <label for="exampleInputEmail1">이메일</label>
    <input type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="abc@naver.com"name="userEmail">
    <small id="emailHelp" class="form-text text-muted">abc@trav.com 식으로 적어주세요.</small> 
  </div>
  <br>
   <div class="form-group">
    <label for="exampleInputEmail1">휴대폰</label>
    <input type="tel" class="form-control" id="userPhone" aria-describedby="emailHelp" placeholder="(-없이)01012345678"name="userPhone"
    		maxlength="11" required>
    <small id="emailHelp" class="form-text text-muted">'-'없이 11자리를 적어주세요.</small> 
  </div><br />
  <div class="form-check form-check-inline">
  <input class="form-check-input" type="checkbox" id="userGender" name="userGender" value="M" checked
    		onclick="check_only(this)">
  <label class="form-check-label" for="inlineCheckbox1">남</label>
</div>
<div class="form-check form-check-inline">
  <input class="form-check-input" type="checkbox" name="userGender" id="userGender" value="F"
    		onclick="check_only(this)">
  <label class="form-check-label" for="inlineCheckbox2">여</label>
</div><br /><br />
<div class="form-group">
    <label for="exampleInputEmail1">사진등록</label><br />
    <input type="file" name="fileName" id="fileName" style="text-align:center;"/>
  </div>
    <small id="emailHelp" class="form-text text-muted">필수사항이 아닙니다.</small> 
  
  <br /><br />
  	
<div id="putt" style="text-align:center;">
  <button type="submit" class="btn btn-primary" >회원가입</button>
  <button type="reset" class="btn btn-primary" >초기화</button>
 </div>

</form>
</section>
</div>


</body>
</html>