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

<script>

</script>
  <style>
  #content{
	position : absolute;
	top : 8%;
	left : 22%;
}	
a{
	color : black;
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


</style>
<script language="javascript" type="text/javascript">
var today = new Date(); // 오늘 날짜//지신의 컴퓨터를 기준으로
//today 에 Date객체를 넣어줌 //ex)5일  
function prevCalendar() {


today = new Date(today.getFullYear(), today.getMonth() - 1, today.getDate());
buildCalendar(); // 현재 달 
}

function nextCalendar() {


today = new Date(today.getFullYear(), today.getMonth() + 1, today.getDate());
buildCalendar();
}

function buildCalendar() {// 현재 달fur
var nMonth = new Date(today.getFullYear(), today.getMonth(), 1);  // 이번 달의 첫째 날
var lastDate = new Date(today.getFullYear(), today.getMonth()+1, 0); // 이번 달의 마지막 날
var tblCalendar = document.getElementById("calendar");     // 테이블 달력을 만들 테이블
var tblCalendarYM = document.getElementById("calendarYM");    // yyyy년 m월 출력할 곳
tblCalendarYM.innerHTML = today.getFullYear() + "년 " + (today.getMonth() + 1) + "월";  // yyyy년 m월 출력
//기존 테이블에 뿌려진 줄, 칸 삭제


while (tblCalendar.rows.length > 2) {
tblCalendar.deleteRow(tblCalendar.rows.length - 1);
}
var row = null;
row = tblCalendar.insertRow();
var cnt = 0;
//1일이 시작되는 칸을 맞추어 줌
for (i=0; i<nMonth.getDay(); i++) {
cell = row.insertCell();
cnt = cnt + 1;
}

for (i=1; i<=lastDate.getDate(); i++) { 
cell = row.insertCell();
cell.innerHTML = i;
cnt = cnt + 1;
if (cnt%7 == 0)// 1주일이 7일 이므로
 row = calendar.insertRow();// 줄 추가
}

}

</script>  
 <header class="masthead" style="height:300px;">
    <div class="container">
      <div class="intro-text" style="padding-top:140px; !important">
        <div class="intro-heading text-uppercase">
       		마이페이지
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
     <img class="profile-circle"  style="margin: 50px auto 12px;" src="<%=request.getContextPath() %>/upload/profile/<%=loggedIn.getFileName() %>" alt=""></img>
      <p class="userprofile-userId"><span style="font-weight: 700;">@닉네임</span>님, 환영합니다!
      <button>여행이야기 홈</button>
   </div>

   <table id="tbl-usermenu0">
   	 <tr>
   		<td id="modifyUserInfo"><a href="<%=request.getContextPath()%>/user/userUpdateView?userId=<%=userLoggedIn.getUserId()%>">회원정보수정</a></td>
   	</tr>
	<tr>
   		<td id="gomsg">메시지</td>
   	</tr>
   	<table id="tbl-usermenu1">
   		<tr>
   			<td><a href="<%=request.getContextPath()%>/mypage/myReservationView?userId=<%=userLoggedIn.getUserId()%>">예약내역</a></td>
   		</tr>
   		<tr>
   			<td><a href="<%=request.getContextPath()%>/mypage/myReservationDelView?userId=<%=userLoggedIn.getUserId()%>">취소내역</a></td>
   		</tr>
   		<tr>
   			<td><a href="<%=request.getContextPath()%>/mypage/myBasketView?userId=<%=userLoggedIn.getUserId()%>">장바구니</a></td>
   		</tr>
   	</table>

	<table id="tbl-usermenu4" style="margin-bottom:0px; !important">
    <tr>
    	<td><a href="<%=request.getContextPath()%>/search/FAQ">FAQ</a></td>
    </tr>
    
    <tr>
    	<td id="QuestionList">1:1문의</td>
    </tr>
    
    	
	</table>
  </nav>   

 <div id="content" style="width:600px;">
  		<table id="calendar" boarder="3" align="center" style="width: 600px; margin-left:90px;">
 <tr>
     <td><label onclick="prevCalendar()"><</label></td>
        <td colspan="5" align="center" id="calendarYM">yyyy년 m월</td>
        <td><label onclick="nextCalendar()">>
           
        </label></td>
    </tr>
    <tr>
     <td align="center">일</td>
     <td align="center">월</td>
     <td align="center">화</td>
     <td align="center">수</td>
     <td align="center">목</td>
     <td align="center">금</td>
     <td align="center">토</td>
   </tr>
 
 
</table>
<script language="javascript" type="text/javascript">
buildCalendar();
</script>
  		
  	</div>
</table>
</nav>
 </section>

<script>

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