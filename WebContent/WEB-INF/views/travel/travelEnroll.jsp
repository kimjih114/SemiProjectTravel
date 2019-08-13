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
 <style>
.page-top{
	width: 1024px;
	position : relative;
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
#content{
	position : absolute;
	top : 5%;
	left : 28%;
}
#content table{
	border-collapse : collapse;
	text-align : center;
	line-height:1.5;
	border-top : 1px solid #ccc;
}
#content table th{
	font-weight : bold;
	vertical-align : top;
	color : #fff;
	background : orange;
}
#content table td{
	vartical-align : top;
	border-collapse: collapse;
	border-bottom : 1px solid orange;
}

#content table tr:nth-child(2n){
	background-color:#f7f2eb;
}
</style>
  
 <header class="masthead" style="height:300px;">
    <div class="container">
      <div class="intro-text" style="padding-top:140px; !important">
        <div class="intro-heading text-uppercase">
       		관리자페이지
        </div>
     </div>
    </div>
  </header>
  
<section id="page-top" style="padding:0px; !important;">
  <nav id="sideNav">
	<div id="profile-header">
      <img class="profile-circle"  style="margin: 50px auto 12px;" src="<%=request.getContextPath() %>/img/이동욱.jpg" alt="">
      <p class="userprofile-userId">관리자님, 안녕하세요!

   </div>

   <table id="tbl-usermenu0">
   	 <tr>
   		<td id="modifyUserInfo">관리자 정보 수정</td>
   	</tr>
	<tr>
   		<td id="userList" onclick="location.href='<%=request.getContextPath()%>/admin/adminUserList'">회원보기</td>
   	</tr>

   		<tr>
   			<td id="business_registration" onclick="location.href='<%=request.getContextPath()%>/travel/travelEnroll.do'">업체 등록</td>
   		</tr>
   		<tr>
   			<td>블랙리스트 관리</td>
   		</tr>
   		<tr>
   			<td>문의관리</td>
   		</tr>
   	</table>

  </nav>   
 
  	<div id="content">
  	<form action="<%=request.getContextPath()%>/travel/travelEnrollEnd"
  		  name="travelEnrollFrm"
  		  id="travelEnrollFrm"
  		  method = "post"
  		  enctype="multipart/form-data">
  	 <div class="form-group">
     <label for="exampleInputEmail1">시설 명칭 입력</label>
    <input type="text" class="form-control" id="travelName" aria-describedby="emailHelp" placeholder="Name" name="travelName" required>
    <!-- <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small> -->
  </div>
  <div class="form-group">
   <label for="exampleInputEmail1">상세 주소 입력</label>
    <input type="text" class="form-control" id="travelLocation" aria-describedby="emailHelp" placeholder="Location" name="travelLocation" required>
    <small id="emailHelp" class="form-text text-muted">도로명 주소를 적어주세요.</small>
  </div>
	<div class="form-group">
    <label for="exampleInputEmail1">사진등록</label><br />
    <input type="file" name="fileName" id="fileName" style="text-align:center;"/>
  </div>
  <div class="form-group">
  <label for="exampleInputEmail1">사업 등록자 이름</label>
    <input type="text" class="form-control" id="officierName" aria-describedby="emailHelp" placeholder="Officier" name="officierName" required>
  </div>
  <div class="form-group">
  	<label for="exampleInputEmail1">사업 등록자 전화번호</label>
    <input type="text" class="form-control" id="officierPhone" aria-describedby="emailHelp" placeholder="Location" name="officierPhone" required>
  </div>
  	<div class="form-group">
    <label for="exampleInputEmail1" id="userDefaultActivity">여행 타입</label><br />
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
  <div class="form-group">
    <label for="exampleFormControlTextarea1">시설 소개 내용</label>
    <textarea class="form-control" id="exampleFormControlTextarea1" name="content" rows="7"></textarea>
  </div>

	<div id="putt" style="text-align:center;">

  <button type="submit" class="btn btn-primary" >등록</button>
  <button type="reset" class="btn btn-primary" >초기화</button>
 </div>
 </form>
   	</div>
 </section>

<script>
$("#userList").click(()=>{
	$.ajax({
		url:"<%=request.getContextPath()%>/jquery/gson/admin/selectAll.do",
		type: "get",
		dataType: "json",
		success: function(data){
			console.log(data);
			
			var $table = $("<table><th>아이디</th><th>닉네임</th><th>이름</th><th>성별</th><th>생년월일</th><th>이메일</th><th>여행지</th><th>활동</th><th>등록일</th></table>");
			$(data).each((i,u)=>{
				
				var html = "<tr>";
				html += "<td>"+u.userId+"</td>";
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
			});
			
			$("#content").html($table);
			
			
		},
		error: function(jqxhr, textStatus, errorThrown){
			console.log("ajax 처리 실패!");
			console.log(jqxhr, textStatus, errorThrown);
		}
	});
});
</script>

</body>
</html>