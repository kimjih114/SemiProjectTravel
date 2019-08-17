<%@page import="admin.model.vo.AdminRoom"%>
<%@page import="travel.model.vo.Travel"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%
	List<Travel> list = (List<Travel>)request.getAttribute("list");
	String pageBar = (String)request.getAttribute("pageBar");
	int numPerPage = (int)request.getAttribute("numPerPage");
	List<AdminRoom> roomList=(List<AdminRoom>)request.getAttribute("roomList");
	System.out.println("roomList는?"+roomList);
	int index=1;
%>
<%@ include file="/WEB-INF/views/common/header-menu.jsp" %>
<link rel="stylesheet" href="selectbox.min.css">
<script src="selectbox.min.js"></script>

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

$(()=>{
	$("#numPerPage").on("change",()=>{
		$("#numPerPageFrm").submit();
	});
	
	
	
	
});

	$("#modifyUserInfo").click(function(){
		
		$.ajax({
	        type : "GET",
	        url : "<%=request.getContextPath() %>/my",
	        dataType : "text",
	        error : function() {
	          alert('통신실패!!');
	        },
	        success : function(data) {
	          $('#Context').html(data);
	        }
	 
	  });


})

function roomUpdateForm(index){
		var roomName=$("#roomName"+index+"").val();
		if(roomName=="null"){
			alert("방을 선택해주세요");
			return;
		}
		//여기서부터 내일하자
}
</script>
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

#tbl-usermenu0 tr :hover{
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
	top : 8%;
	left : 27%;
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
div#search-container{
	margin : 0 0 10px;
	padding : 3px;
}
div#search-travelName{display: inline-block;}
numPerPage{
	float : right;
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
	<td id="modifyUserInfo" onclick="location.href='<%=request.getContextPath()%>/admin/adminUpdateView'">관리자 정보 수정</td>
   	</tr>
	<tr>
   		<td id="userList" onclick="location.href='<%=request.getContextPath()%>/admin/adminUserList'">회원보기</td>
   	</tr>

   		<tr>
   			<td id="business_registration" onclick="location.href='<%=request.getContextPath()%>/travel/travelEnroll.do'">업체 등록</td>
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
   		<tr>
   			<td>사업자 전환</td>
   		</tr>
   	</table>

  </nav>   
 
  	<div id="content" style="top:20%; text-align : center;width:600px;">
  		<h2>업체 목록</h2>
  		<br><br>
  		<div id="head-wrapper">
  			<div id="search-container">
  			<div id="search-travelName" class="searchFrm">
  				<form action="<%=request.getContextPath()%>/admin/travelFinder">
  				검색타입 :
  				<select name ="searchType" id="searchType">
  					<option value="P">여행지</option>
  					<option value="A">숙소</option>
  					<option value="R">맛집</option>
  					<option value="E">놀거리</option>
  					<option value="S">쇼핑</option>
  				</select>
  			
  				<input type="hidden"
  						name="searchType" 
  						value="travel_name"/>
  				<input type="search"
  					  name="searchKeyword"
  					  size="25"
  					  placeholder="검색할 업체 이름을 입력하세요."/>
  				<input type="submit" value="검색"/>  
  			</form>
  			</div>
  			</div>
  			</div>
  		<div id="numPerPage-container" class="wrapper">
  		<form name="numPerPageFrm" id="numPerPageFrm" style="float:right;">
  		<br>
  		&nbsp;&nbsp;페이지 당 업체 수 
  		<select name="numPerPage" id="numPerPage">
  			<option value="20" <%=numPerPage==20?"selected":"" %>>20</option>
  			<option value="10" <%=numPerPage==10?"selected":"" %>>10</option>
  			<option value="5" <%=numPerPage==5?"selected":"" %>>5</option>
  		</select>
  		</form>
  		
  		</div>
  		<br /><br /><br>
  		<table id="tbl-travel"style="margin:0 auto; width:680px;">
  			<thead>
  			<tr>
  				<th>업체 이름</th>
  				<th>타입</th>
  				<th>위치</th>
  				<th>관리자 이름</th>
  				<th>핸드폰 번호</th>
  				<th>방 추가</th>
  			</tr>
  			</thead>
  			<tbody>
  			<% if(list==null|| list.isEmpty()){%>
  			<tr>
  				<td colspan="5" align="center"> 검색 결과가 없습니다.</td>
  			</tr>
  			<%
  			}
  			else{
  				for(Travel t : list){
  			%>
  			<tr>
  				<td>
  					<a href="<%=request.getContextPath()%>/travel/travelDetail?travelContentId=<%=t.getContentId() %>">
  					<%=t.getTravelName() %></a>
  				</td>
  				<td><%switch(t.getTravelType()){
  					case "P" :%>여행지<%;break;
					case "A" :%>숙소<%;break;
					case "R" :%>맛집<%;break;
					case "E" :%>놀거리<%;break;
					case "S" :%>쇼핑<%;break;}%></td>
				<td><%=t.getTravelLocation() %></td>
  				<td><%=t.getTravelOfficierName()%></td>
  				<td><%=t.getTravelOfficierphone()%></td>
  				<td>
  				<%if(t.getTravelType().equals("A")){ %>
  					<button type="button" onclick="location.href='<%=request.getContextPath()%>/admin/roomAddForm?contentId=<%=t.getContentId()%>'">방추가</button>
  					<button type="button" onclick="roomUpdateForm(<%=index%>);">방수정</button>			
  					<select id="roomName<%=index%>">
  					<option value="null">방을선택해주세요</option>
  				<%} %>
  				
  				<%if(roomList!=null){ %>
  				<%for(int i=0;i<roomList.size();i++){ %>
  					<%if(t.getContentId().equals(roomList.get(i).getContentId())){ %> 						
  					<option value="<%=roomList.get(i).getRoomName() %>,<%=roomList.get(i).getContentId()%>"><%=roomList.get(i).getRoomName() %></option> 
  													
  					<%} %>			
  				<%} %>
  				<%} %>
  					</select>
  					
  				</td>
  				
  			</tr>
  			<%	index++;	
  				}
  			}
  			%>
  			</tbody>
  		</table>
  		<br><br>
  		<div id="pageBar"style="text-align:center">
  			<%=pageBar %>
  		</div>
	</div>
 </section>

 

<style>

#numPerPageFrm{
	text-align : center;
}
#numPerPage{
	border-color : orange;
	size : 20px;
}

#travelName{
text-align : center;
}
</style>
</body>
</html>