<%@page import="admin.model.vo.RoomImage"%>
<%@page import="admin.model.vo.AdminRoom"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header-menu.jsp" %>
<%
	List<AdminRoom> room=(List<AdminRoom>)request.getAttribute("roomList");
	List<RoomImage> image=(List<RoomImage>)request.getAttribute("roomImage");
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
  
  
    <form action="" name="memomsgFrm">
	<input type="hidden" name="userId" />
</form>

<section id="page-top" style="padding:0px; !important;">
  <nav id="sideNav">
	<div id="profile-header">
      <img class="profile-circle"  style="margin: 50px auto 12px;" src="<%=request.getContextPath() %>/upload/profile/<%=loggedIn.getFileName() %>" alt="">
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
   			<td id="business_registration" onclick="location.href='<%=request.getContextPath()%>/travel/travelList'">업체 등록</td>
   		</tr>
   		<tr>
   			<td id="business_List" onclick="location.href='<%=request.getContextPath()%>/travel/travelList'">업체 목록</td>
   		</tr>
   		<tr>
   			<td id="gomsg">공지사항 메시지</td>
   		</tr>
   		<tr>
   			<td id="QuestionList">문의관리</td>
   		</tr>
   	</table>

  </nav>   
 
  	<div id="content">
  	<form action="<%=request.getContextPath() %>/admin/roomUpdateEnd"
  		  name="travelEnrollFrm"
  		  id="travelEnrollFrm"
  		  method = "post"
  		  enctype="multipart/form-data"
  		  style="width:500px;">
  	 <div class="form-group">
     <label for="exampleInputEmail1">방 이름</label>
    <input type="text" class="form-control" id="roomName" aria-describedby="emailHelp" placeholder="Name" name="roomName" value="<%=room.get(0).getRoomName() %>" readonly="readonly" required>
    <!-- <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small> -->
  </div>
  <input type="hidden" id="contentId" name="contentId" value="<%=room.get(0).getContentId()%>"/>
  <div class="form-group">
   <label for="exampleInputEmail1">방 사이즈:</label>
    <input type="number" class="form-control" id="roomSize" aria-describedby="emailHelp" placeholder="size" name="roomSize" value="<%=room.get(0).getRoomSize() %>" required>
  </div>
  <div class="form-group">
   <label for="exampleInputEmail1">적정인원:</label>
    <input type="number" class="form-control" id="roomPerson" aria-describedby="emailHelp" placeholder="person" name="roomPerson" value="<%=room.get(0).getRoomPerson() %>" required>
  </div>
  <div class="form-group">
  <label for="exampleInputEmail1">성수기 평일 가격:</label>
    <input type="number" class="form-control" id="roomWeekDayHighPrice" aria-describedby="emailHelp" placeholder="price" name="roomWeekDayHighPrice" value="<%=room.get(0).getRoomWeekDayHighPrice() %>" required>
  </div>
  <div class="form-group">
  <label for="exampleInputEmail1">성수기 주말 가격:</label>
    <input type="number" class="form-control" id="roomWeekEndHighPrice" aria-describedby="emailHelp" placeholder="price" name="roomWeekEndHighPrice" value="<%=room.get(0).getRoomWeekEndHighPrice() %>" required>
  </div>
  <div class="form-group">
  <label for="exampleInputEmail1">비수기 평일 가격:</label>
    <input type="number" class="form-control" id="roomWeekDaylowPrice" aria-describedby="emailHelp" placeholder="price" name="roomWeekDaylowPrice" value="<%=room.get(0).getRoomWeekDayLowPrice() %>" required>
  </div>
  <div class="form-group">
  <label for="exampleInputEmail1">비수기 주말 가격:</label>
    <input type="number" class="form-control" id="roomWeekEndlowPrice" aria-describedby="emailHelp" placeholder="price" name="roomWeekEndlowPrice" value="<%=room.get(0).getRoomWeekEndLowPrice() %>" required>
  </div>
  <div class="form-group">
    <label for="exampleInputEmail1">방 사진1:</label><br />
    <input type="file" name="fileName1" id="fileName1" />
    <span id="fname1"><%=image.get(0).getOriginalFileName1() %></span>
    <br />
    <input type="checkbox" name="delFile1" id="delFile1">
   <label for="exampleInputEmail1">파일 삭제</label>
   <input type="hidden" name="oldOName1" value="<%=image.get(0).getOriginalFileName1() %>" />
   <input type="hidden" name="oldRName1" value="<%=image.get(0).getRenameFileName1()%>" />
  </div>
  
	<div class="form-group">
    <label for="exampleInputEmail1">방 사진2:</label><br />
    <input type="file" name="fileName2" id="fileName2" />
    <span id="fname2"><%=image.get(0).getOriginalFileName2() %></span>
    <br />
    <input type="checkbox" name="delFile2" id="delFile2">
   <label for="exampleInputEmail1">파일 삭제</label>
   <input type="hidden" name="oldOName2" value="<%=image.get(0).getOriginalFileName2() %>" />
   <input type="hidden" name="oldRName2" value="<%=image.get(0).getRenameFileName2()%>" />
  </div>
  
	<div class="form-group">
    <label for="exampleInputEmail1">방 사진3:</label><br />
    <input type="file" name="fileName3" id="fileName3" />
    <span id="fname3"><%=image.get(0).getOriginalFileName3() %></span>
    <br />
    <input type="checkbox" name="delFile3" id="delFile3">
   <label for="exampleInputEmail1">파일 삭제</label>
   <input type="hidden" name="oldOName3" value="<%=image.get(0).getOriginalFileName3() %>" />
   <input type="hidden" name="oldRName3" value="<%=image.get(0).getRenameFileName3()%>" />
  </div>
  	
  <div class="form-group">
    <label for="exampleFormControlTextarea1">방 설명</label>
    <textarea class="form-control" id="exampleFormControlTextarea1" name="content" rows="7"><%=room.get(0).getContent() %></textarea>
  </div>

	<div id="putt" style="text-align:center;">

  <button type="submit" class="btn btn-primary" >수정</button>
  <button type="reset" class="btn btn-primary" >초기화</button>
 </div>
<br><br><br><br>
 </form>
   	</div>
 </section>
<script>

$("#fileName1").change(function(){
	console.log($(this).val());
	//사용자가 파일을 선택한 경우
	if($(this).val() != ""){
		$("#fname1").hide();
		
		$("#delFile1").hide().next().hide();
	}
	//사용자가 파일선택을 취소한 경우
	else{
		$("#fname1").show();
		
		$("#delFile1").show().next().show();
	}
});

$("#fileName2").change(function(){
	console.log($(this).val());
	//사용자가 파일을 선택한 경우
	if($(this).val() != ""){
		$("#fname2").hide();
		
		$("#delFile2").hide().next().hide();
	}
	//사용자가 파일선택을 취소한 경우
	else{
		$("#fname2").show();
		
		$("#delFile2").show().next().show();
	}
});

$("#fileName3").change(function(){
	console.log($(this).val());
	//사용자가 파일을 선택한 경우
	if($(this).val() != ""){
		$("#fname3").hide();
		
		$("#delFile3").hide().next().hide();
	}
	//사용자가 파일선택을 취소한 경우
	else{
		$("#fname3").show();
		
		$("#delFile3").show().next().show();
	}
});





$("#QuestionList").on("click", function(){
	var userId = '<%=userLoggedIn.getUserId() %>';	
	console.log("userLoggedIn"+userId);
	location.href="<%=request.getContextPath()%>/boardquestion/boardList?userId="+userId; 
});

$("#gomsg").on("click", function(){
		var userId = '<%=userLoggedIn.getUserId() %>';	
		console.log("userLoggedIn"+userId);
	 	
	 	
			var url="<%=request.getContextPath()%>/chat/chatroom.do?userId="+userId;
			var title="popup"; 
			var status = "width=400px, height=500px, left=150px, top=0px";
			var popup = open("", title, status);
			
			var frm = document.memomsgFrm;
			frm.userId.value= userId;
			frm.action = url;
			frm.target=title;
			frm.method= "post"; 
			frm.submit();
		
	});


</script>

</body>
</html>