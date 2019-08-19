<%@page import="travel.model.vo.Travel"%>
<%@page import="travel.model.service.TravelService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header-menu.jsp" %>
<%
	String contentId  = request.getParameter("travelContentId");
	
	Travel trav = new TravelService().selectTravel(contentId);
	System.out.println("Trav"+trav);
	
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
	top : 7%;
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
#fname{
	position : absolute;
	left : 17.8%;
	
	background-color : white;
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
   		<tr>
   			<td>사업자 전환</td>
   		</tr>
   	</table>

  </nav>   
 
  	<div id="content" style="margin-left:180px;">
  	<form action="<%=request.getContextPath()%>/travel/travelUpdateEnd?contentId=<%=trav.getContentId() %>"
  		  name="travelEnrollFrm"
  		  id="travelEnrollFrm"
  		  method = "post"
  		  enctype="multipart/form-data"
  		  style="width:500px;">
  	 <div class="form-group">
     <label for="exampleInputEmail1">시설 명칭 입력</label>
    <input type="text" class="form-control" id="travelName" aria-describedby="emailHelp" 
    	name="travelName" value="<%=trav.getTravelName()%>"required>
    <!-- <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small> -->
  </div>
  <div class="form-group">
   <label for="exampleInputEmail1">상세 주소 입력</label>
    <input type="text" class="form-control" id="travelLocation" aria-describedby="emailHelp"
    value="<%=trav.getTravelLocation()%>" name="travelLocation" required>
    <small id="emailHelp" class="form-text text-muted">도로명 주소를 적어주세요.</small>
  </div>
	<div class="form-group">
    <label for="exampleInputEmail1">사진등록</label><br />
    <input type="file" name="fileUpdate" id="fileUpdate" style="text-align:center;"/>
    <span id="fname" style="width:200px"><%=trav.getThumbnailRenamedFilename()!=null?trav.getThumbnailRenamedFilename():"" %></span>
  <input type="hidden" name="oldOName" value="<%=trav.getThumbnailOriginalFilename()!=null?trav.getThumbnailOriginalFilename():"" %>" />
   <input type="hidden" name="oldRName" value="<%=trav.getThumbnailRenamedFilename()!=null?trav.getThumbnailRenamedFilename():"" %>" />
  </div>
  <div class="form-group">
  <label for="exampleInputEmail1">사업 등록자 이름</label>
    <input type="text" class="form-control" id="officierName" aria-describedby="emailHelp"
    	   value="<%=trav.getTravelOfficierName() %>" name="officierName" required>
  </div>
  <div class="form-group">
  	<label for="exampleInputEmail1">사업 등록자 전화번호</label>
    <input type="text" class="form-control" id="officierPhone" aria-describedby="emailHelp" 
    maxlength="11" value="<%=trav.getTravelOfficierphone() %>" name="officierPhone" required>
  </div>
  	<div class="form-group">
    <label for="exampleInputEmail1" id="userDefaultActivity">여행 타입</label><br />
    <input type="checkbox" name="program" id="program1" value="P" onclick="doOpenCheck(this);"/>
	<label for="program1">여행지</label>
	<input type="checkbox" name="program" id="program2" value="A" onclick="doOpenCheck(this);"/>
	<label for="program2">숙소</label>
	<input type="checkbox" name="program" id="program3" value="R" onclick="doOpenCheck(this);"/>
	<label for="program3">맛집</label>
	<input type="checkbox" name="program" id="program4" value="E" onclick="doOpenCheck(this);"/>
	<label for="program4">놀거리</label>
	<input type="checkbox" name="program" id="program5" value="S" onclick="doOpenCheck(this);" />
	<label for="program5">쇼핑</label>
  </div>
  <div class="form-group">
    <label for="exampleFormControlTextarea1">시설 소개 내용</label>
    <textarea class="form-control" id="exampleFormControlTextarea1" name="content" rows="7"><%=trav.getTravelContent()%></textarea>
  </div>

	<div id="putt" style="text-align:center;">

  <button type="submit" class="btn btn-primary" >수정</button>
  <button type="reset" class="btn btn-primary" >초기화</button>
 </div>
 </form>
  <button class="btn btn-primary" style="float:right;" onclick="fun_confirm()">삭제</button>
   	</div>
 </section>
<script>
function fun_confirm(){
	
	if(confirm("업체를 삭제하시겠습니까?")==true){
		location.href='<%=request.getContextPath()%>/travel/travelDelete?contentId=<%=trav.getContentId() %>'
		
	}else{
		return;
	}
}
function doOpenCheck(chk){
    var obj = document.getElementsByName("program");
    for(var i=0; i<obj.length; i++){
        if(obj[i] != chk){
            obj[i].checked = false;
        }
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
<script>
$(document).ready(()=>{
	
	switch(<%=trav.getTravelType()%>){
	case "P" : $("input:checkbox[id='program1']").prop('checked',true);break;
	case "A" : $("input:checkbox[id='program2']").prop('checked',true);break;
	case "R" : $("input:checkbox[id='program3']").prop('checked',true);break;
	case "E" : $("input:checkbox[id='program4']").prop('checked',true);break;
	case "S" : $("input:checkbox[id='program5']").prop('checked',true);break;
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