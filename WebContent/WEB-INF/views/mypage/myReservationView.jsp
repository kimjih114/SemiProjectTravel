<%@page import="travel.model.vo.RoomReservation"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header-menu.jsp" %>
<%
	List<RoomReservation> room=(List<RoomReservation>)request.getAttribute("room");
	List<RoomReservation> friendRoom=(List<RoomReservation>)request.getAttribute("friendRoom");
	System.out.println("friendRoom값은?"+friendRoom);
	System.out.println("room값은?"+room);
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
	left : 22%;
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
  <style>
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
	<header class="masthead" style="height:300px;">
    <div class="container">
      <div class="intro-text" style="padding-top:140px; !important">
        <div class="intro-heading text-uppercase">
       		예약내역
        </div>
     </div>
    </div>
  </header>
  
  <section id="page-top" style="padding:0px; !important;">
  <nav id="sideNav">
	<div id="profile-header">
      <img class="profile-circle"  style="margin: 50px auto 12px;" src="<%=request.getContextPath() %>/img/profile.jpg" alt="">
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
   		<tr>
   			<td>위시리스트</td>
   		</tr>
   	</table>

	<table id="tbl-usermenu4" style="margin-bottom:0px; !important">
    <tr>
    	<td><a href="<%=request.getContextPath()%>/search/FAQ">FAQ</a></td>
    </tr>
    
    <tr>
    	<td id="QuestionList">1:1문의</td>
    </tr>
    
    <tr>
    	<td>공지사항</td>
    </tr> 	
	</table>
  </nav>  
	
	<div id="content">
  		<h2 style="margin-left: 100px;">예약 내역</h2>
  		<table id="tbl-user" style="margin-left: 100px; width: 600px;">
  			<thead>
  			<tr>
  				<th>숙소이름</th>
  				<th>방이름</th>
  				<th>예약날짜</th>
  				<th>가격</th>
  				<th>결제날짜</th>
  				<th></th>
  			</tr>
  			</thead>
  			<tbody>
  				<%if(room.isEmpty()&&friendRoom.isEmpty()){ %>
  				
  				<tr>
  					<td colspan="5">예약내역이 없습니다.</td>
  				</tr>
  				<%}else{ 
  					for(int i=0;i<room.size();i++){
  						%>
  						<tr>
  							<td><%=room.get(i).getTravelName() %></td>
  							<td><%=room.get(i).getRoomName() %></td>
  							<td><%=room.get(i).getReservationStartDate() %>~<%=room.get(i).getReservationEndDate() %></td>
  							<td><%=room.get(i).getPrice() %></td>
  							<td><%=room.get(i).getPaymentDate()%></td>
  							<td><button type="button" onclick="location.href='<%=request.getContextPath()%>/mypage/reservationDel?userId=<%=userLoggedIn.getUserId()%>&contentId=<%=room.get(i).getContentId()%>&travelName=<%=room.get(i).getTravelName()%>&roomName=<%=room.get(i).getRoomName() %>&reservationStartDate=<%=room.get(i).getReservationStartDate()%>&reservationEndDate=<%=room.get(i).getReservationEndDate()%>'">예약취소</button></td>
  						</tr>
  						<%
  					}
  					for(int z=0;z<friendRoom.size();z++){
  						%>
  						<tr>
  							<td><%=friendRoom.get(z).getTravelName() %></td>
  							<td><%=friendRoom.get(z).getRoomName() %></td>
  							<td><%=friendRoom.get(z).getReservationStartDate() %>~<%=friendRoom.get(z).getReservationEndDate() %></td>
  							<td><%=friendRoom.get(z).getPrice() %></td>
  							<td><%=friendRoom.get(z).getPaymentDate()%></td>
  							<td>취소불가</td>
  						</tr>
  						<%
  					}
  				}%>
  				
  				
  			</tbody>
  		</table>
  		<div id="pageBar">
  			
  		</div>
  	</div>

 </section>
  
  
  
</body>
</html>