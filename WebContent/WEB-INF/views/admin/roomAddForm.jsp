<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header-menu.jsp" %>
<%
	String contentId=request.getParameter("contentId");
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
   			<td>공지사항 메시지</td>
   		</tr>
   		<tr>
   			<td>문의관리</td>
   		</tr>
   	</table>

  </nav>   
 
  	<div id="content">
  	<form action="<%=request.getContextPath() %>/admin/roomAddEnd"
  		  name="travelEnrollFrm"
  		  id="travelEnrollFrm"
  		  method = "post"
  		  enctype="multipart/form-data"
  		  style="width:500px;">
  	 <div class="form-group">
     <label for="exampleInputEmail1">방 이름</label>
    <input type="text" class="form-control" id="roomName" aria-describedby="emailHelp" placeholder="Name" name="roomName" required>
    <!-- <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small> -->
  </div>
  <input type="hidden" id="contentId" name="contentId" value="<%=contentId%>"/>
  <div class="form-group">
   <label for="exampleInputEmail1">방 사이즈:</label>
    <input type="number" class="form-control" id="roomSize" aria-describedby="emailHelp" placeholder="size" name="roomSize" required>
  </div>
  <div class="form-group">
   <label for="exampleInputEmail1">적정인원:</label>
    <input type="number" class="form-control" id="roomPerson" aria-describedby="emailHelp" placeholder="person" name="roomPerson" required>
  </div>
  <div class="form-group">
  <label for="exampleInputEmail1">성수기 평일 가격:</label>
    <input type="number" class="form-control" id="roomWeekDayHighPrice" aria-describedby="emailHelp" placeholder="price" name="roomWeekDayHighPrice" required>
  </div>
  <div class="form-group">
  <label for="exampleInputEmail1">성수기 주말 가격:</label>
    <input type="number" class="form-control" id="roomWeekEndHighPrice" aria-describedby="emailHelp" placeholder="price" name="roomWeekEndHighPrice" required>
  </div>
  <div class="form-group">
  <label for="exampleInputEmail1">비수기 평일 가격:</label>
    <input type="number" class="form-control" id="roomWeekDaylowPrice" aria-describedby="emailHelp" placeholder="price" name="roomWeekDaylowPrice" required>
  </div>
  <div class="form-group">
  <label for="exampleInputEmail1">비수기 주말 가격:</label>
    <input type="number" class="form-control" id="roomWeekEndlowPrice" aria-describedby="emailHelp" placeholder="price" name="roomWeekEndlowPrice" required>
  </div>
  <div class="form-group">
    <label for="exampleInputEmail1">방 사진1:</label><br />
    <input type="file" name="fileName1" id="fileName1" style="text-align:center;"/>
  </div>
  
	<div class="form-group">
    <label for="exampleInputEmail1">방 사진2:</label><br />
    <input type="file" name="fileName2" id="fileName2" style="text-align:center;"/>
  </div>
  
	<div class="form-group">
    <label for="exampleInputEmail1">방 사진3:</label><br />
    <input type="file" name="fileName3" id="fileName3" style="text-align:center;"/>
  </div>
  	
  <div class="form-group">
    <label for="exampleFormControlTextarea1">방 설명</label>
    <textarea class="form-control" id="exampleFormControlTextarea1" name="content" rows="7"></textarea>
  </div>

	<div id="putt" style="text-align:center;">

  <button type="submit" class="btn btn-primary" >등록</button>
  <button type="reset" class="btn btn-primary" >초기화</button>
 </div>
<br><br><br><br>
 </form>
   	</div>
 </section>


</body>
</html>