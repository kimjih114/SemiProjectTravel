<%@page import="sns.model.vo.ProfileSNS"%>
<%@page import="user.model.vo.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header-menu.jsp" %>
<%

	ProfileSNS profileSNS = (ProfileSNS)request.getAttribute("profileSNS");

%>
 <header class="masthead" style="height:300px;">
      <div class="intro-text" style="padding-top:140px; !important">
        <div class="intro-heading text-uppercase">
       		<%=profileSNS.getHeaderText() %>&nbsp;<button>edit</button>
       		<!-- @닉네임의 페이지입니다.(유저가설정가능) -->
        </div>
     </div>
  </header>
  
<section class="page-top" style="padding:0px; !important;">
	  <nav id="sideNav">
		<div id="profile-header">
	      <img class="profile-circle"  style="margin: 50px auto 12px;" src="<%=request.getContextPath() %>/upload/profile/<%=userLoggedIn.getFileName() %>" alt="">
	      <p class="userprofile-userId"><%=profileSNS.getUserNickname() %> <button>edit</button></p>
	      <p class="userIntroduce" style="margin-bottom: 50px;"> <%=profileSNS.getUserIntroduce() %><button>edit</button></p>
	   </div>
	    <table class="tbl-usermenu">
	   		<tr>
	   			<td id="gohome">홈</td>
	   		</tr>
	   	</table>
	   <table class="tbl-usermenu">
	   		<tr>
	   			<td>알림</td>
	   		</tr>
	   	</table>
	   	<table class="tbl-usermenu">
	   		<tr>
	   			<td>메시지</td>
	   		</tr>
	   		<tr>
	   			<td>검색</td>
	   		</tr>
	   		<tr>
	   			<td>팔로워</td>
	   		</tr>

	   	</table>
	   	
	    <table class="tbl-usermenu">
	    <tr>
	   		<td id="setting">설정</td>
	   	</tr>
		</table>
	
		<table class="tbl-usermenu" style="margin-bottom:0px; !important">
	    <tr>
	    	<td>FAQ</td>
	    </tr>
	    
	    <tr>
	    	<td id="QuestionList">1:1문의</td>
	    </tr>
	    
	    <tr>
	    	<td>공지사항</td>
	    </tr> 	
		</table>
	  </nav>
	  
 <style>	 
.page-top{
	position: relative;
}

#profile-header{
	padding-bottom: 20px;
	margin: 0;
	background-color:<%=profileSNS.getThemeColor() %>;
} 
  
  
#sideNav {
    text-align: center;
    top: 0;
    left: 0;
    display: -webkit-box;
    display: -ms-flexbox;
    /*display: fixed;*/
    -webkit-box-orient: vertical;
    -webkit-box-direction: normal;
    -ms-flex-direction: column;
    flex-direction: column;
    width: 210px;
    /*height: 100vh;*/
    background:<%=profileSNS.getThemeColor() %>; 
    /*min-width: 250px;*/
    
}
.profile-circle{
	width: 150px;
    height: 150px;
    border: 0.5rem solid #212529;
    border-radius: 100%;
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
.tbl-usermenu{
	margin: 10 auto;
	margin-bottom: 30px;
}

.tbl-usermenu tr :hover{
	cursor: pointer;
	color: orangered;
	
}

.tbl-usermenu td{
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

.main-section{
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
    width: 56%;
    /*height: 100vh;*/
    background: lightgray;
    
    /*min-width: 800px;*/
	
}

#timline-sns{
	border:1px solid;
}

#timeline-board-sns{
	border:1px solid;
}


.timeline-boardcontent-sns{
	padding: 10px;
	width: 580px;
	text-align:left;
	border:1px solid;
}

#boardcontent_img{
	padding:0px;
}

.nick_sns{
	font-weight: 700;
}

</style>	  
	  
	  <script>
 $(()=>{
		$.ajax({
			url: "<%=request.getContextPath() %>/ajax/home.jsp",
			success: function(data){
				$("#container-sns").html(data);
			},
			error: function(jqxhr, textStatus, errorThrown){
				console.log("ajax처리실패!");
				console.log(jqxhr, textStatus, errorThrown);
			},
			complete: function(){
				console.log("complete!!!");
			}
		});
 })
  
 
 
 	$("#gohome").on("click", function(){
 		$.ajax({
			url: "<%=request.getContextPath() %>/ajax/home.jsp",
			success: function(data){
 				console.log(data);
				$("#container-sns").html(data);
			},
			error: function(jqxhr, textStatus, errorThrown){
				console.log("ajax처리실패!");
				console.log(jqxhr, textStatus, errorThrown);
			},
			complete: function(){
				console.log("complete!!!");
			}
		});
 	});
 	
 	$("#setting").on("click", function(){
		$.ajax({
			url: "<%=request.getContextPath() %>/ajax/setting.jsp", 
			type: "get",
			dataType: "html",
			success: function(data){
				$("#container-sns").html(data);
			},
			error: function(jqxhr, textStatus, errorThrown){
				console.log("ajax처리실패!");
				console.log(jqxhr, textStatus, errorThrown);
			}
		});
	})
		
	$("#QuestionList").on("click", function(){
		$.ajax({
			url: "<%=request.getContextPath() %>/ajax/board_questionList.jsp", 
			type: "get",
			dataType: "html",
			success: function(data){
				$("#container-sns").html(data);
			},
			error: function(jqxhr, textStatus, errorThrown){
				console.log("ajax처리실패!");
				console.log(jqxhr, textStatus, errorThrown);
			}
		});
	})

	</script>
	  