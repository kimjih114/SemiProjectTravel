<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%
	List<User> list = (List<User>)request.getAttribute("list");
	String searchType = request.getParameter("searchType");
	String searchKeyword = request.getParameter("searchKeyword");
	String pageBar = (String)request.getAttribute("pageBar");
%>
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


$(()=>{
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
})

$(()=>{
	$("#searchType").on("change", (e)=>{
		var type = $(e.target).val();
		
		$(".searchFrm").hide();
		$("#search-"+type).css('display','inline-block');
		
	});
});
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


div#search-userId{display: <%="userId".equals(searchType)?"inline-block":"none"%>;}
div#search-userName{display: <%="userName".equals(searchType)?"inline-block":"none"%>;}
div#search-userPhone{display: <%="userPhone".equals(searchType)?"inline-block":"none"%>;}
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
   			<td id="business_registration" onclick="location.href='<%=request.getContextPath()%>/travel/travelEnroll.do'">업체 등록</td>
   		</tr>
   		<tr>
   			<td id="business_List" onclick="location.href='<%=request.getContextPath()%>/travel/travelList'">업체 목록</td>
   		</tr>
   		<tr>
   			<td>공지사항 등록</td>
   		</tr>
   		<tr>
   			<td>문의관리</td>
   		</tr>
   	</table>

  </nav>   
 
  	<div id="content">
  		<h2>회원 목록</h2>
  		<div id="head-wrapper">
  			<div id="search-container">
  				검색타입 :
  				<select id="searchType">
  					<option value="userId">아이디</option>
  					<option value="userName">회원명</option>
  					<option value="userPhone">핸드폰</option>
  				</select>
  			<div id="search-userId" class="searchFrm">
  				<form action="<%=request.getContextPath()%>/admin/userFineder">
  				<input type="hidden"
  						name="searchType" 
  						value="userId"/>
  				<input type="search"
  					  name="searchKeyword"
  					  size="25"
  					  value="<%="userId".equals(searchType)?searchKeyword:"" %>"
  					  placeholder="검색할 아이디를 입력하세요."/>
  				<input type="submit" value="검색"/>  
  			</form>
  			</div>
  			<div id="search-userName" class="searchFrm">
  				<form action="<%=request.getContextPath()%>/admin/userFineder">
  				<input type="hidden"
  						name="searchType" 
  						value="userName"/>
  				<input type="search"
  					  name="searchKeyword"
  					  size="25"
  					   value="<%="userName".equals(searchType)?searchKeyword:"" %>"
  					  placeholder="검색할 회원명을 입력하세요."/>
  				<input type="submit" value="검색"/>  
  			</form>
  			</div>
  			<div id="search-userPhone" class="searchFrm">
  				<form action="<%=request.getContextPath()%>/admin/userFineder">
  				<input type="hidden"
  						name="searchType" 
  						value="userPhone"/>
  				<input type="search"
  					  name="searchKeyword"
  					  size="25"
  					   value="<%="userPhone".equals(searchType)?searchKeyword:"" %>"
  					  placeholder="검색할 핸드폰 번호를 입력하세요."/>
  				<input type="submit" value="검색"/>  
  			</form>
  			</div>
  			</div>
  			
  			
  		</div>
  		<br /><br /><br />
  		<table id="tbl-user">
  			<thead>
  			<tr>
  				<th>아이디</th>
  				<th>닉네임</th>
  				<th>이름</th>
  				<th>성별</th>
  				<th>이메일</th>
  				<th>핸드폰 번호</th>
  			</tr>
  			</thead>
  			<tbody>
  			<% if(list==null|| list.isEmpty()){%>
  			<tr>
  				<td colspan="9" align="center"> 검색 결과가 없습니다.</td>
  			</tr>
  			<%
  			}
  			else{
  				for(User u : list){
  			%>
  			<tr>
  				<td><%=u.getUserId() %></td>
  				<td><%=u.getUsernickName() %></td>
  				<td><%=u.getUserName() %></td>
  				<td><%="M".equals(u.getUserGender())?"남":"여" %></td>
  				<td><%=u.getUserEmail() %></td>
  				<td><%=u.getUserPhone() %></td>
  			</tr>
  			<%		
  				}
  			}
  			%>
  			</tbody>
  		</table>
  		<div id="pageBar">
  			<%=pageBar %>
  		</div>
  	</div>

 </section>

 

<style>
#travelName{
text-align : center;
}
</style>
</body>
</html>