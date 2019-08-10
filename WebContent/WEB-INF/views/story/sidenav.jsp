<%@page import="sns.model.vo.ProfileSNS"%>
<%@page import="user.model.vo.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header-menu.jsp" %>
<%

	ProfileSNS profileSNS = (ProfileSNS)request.getAttribute("profileSNS");

%>
<script>
function updateHeaderText(){
	var headertext = $("#headerBefore").text();
	console.log(headertext);
	
	var html = "<input type='text' id='headerAfter' name='headerAfter' value='"+headertext+"'/>";
	html += "<button id='headerAfterBtn' onclick='headerTextModify();' style='margin-left:10px;'>edit</button>"
	$("#headerBeforeBtn").remove();
	
	$("#headerFrm").html(html);
	
}
function updateNickName(){
	var nickname = $("#nickBefore").text();
	console.log(nickname);
	
	var html = "<input type='text' id='nickAfter' name='nickafter' value='"+nickname+"' size='10' />";
	html += "<button id='nickAfterBtn' onclick='nickNameModify();' style='margin-left:10px;'>edit</button>"
	$("#nickBeforeBtn").remove();
	
	$("#nickFrm").html(html);
	
}
function updateIntroduce(){
	var intro = $("#introBefore").text();
	console.log(intro);
	
	var html = "<textarea name='introAfter' id='introAfter' cols='20' rows='4'>"+intro+"</textarea>";
	html += "<button id='introAfterBtn' onclick='introModify();' style='float:right; margin-right: 14px;'>edit</button>"
	$("#introBeforeBtn").remove();
	
	$("#introFrm").html(html);
	
}

function headerTextModify(){
	var headertext = $("#headerAfter").val();
	var userid = '<%=userLoggedIn.getUserId() %>';
	var param = {
			headertext : headertext,
			userid : userid
	}
	
	$("#headerAfter").remove();
	$("#headerAfterBtn").remove();

	
	$.ajax({
		url : "<%=request.getContextPath()%>/gson/sns/headerTextModify.do",
		data : param,
		dataType: "json",
		type : "post",
		success : function(data){
			console.log(data);
			var html = "<span id='headerBefore'>"+headertext+"</span>";
			html+="<button id='headerBeforeBtn' onclick='updateHeaderText();'>edit</button>";
			$("#headerFrm").html(html);
		},
		error : function(data){
			console.log("ajax처리실패");
		},
		complete: function(data){
			
		}
	});
}
function nickNameModify(){
	var nickname = $("#nickAfter").val();
	var userid = '<%=userLoggedIn.getUserId() %>';
	var param = {
			nickname : nickname,
			userid : userid
	}
	
	$("#nickAfter").remove();
	$("#nickAfterBtn").remove();

	
	$.ajax({
		url : "<%=request.getContextPath()%>/gson/sns/nickNameModify.do",
		data : param,
		dataType: "json",
		type : "post",
		success : function(data){
			console.log(data);
			var html = "<span id='nickBefore'>"+nickname+"</span>";
			html+="<button id='nickBeforeBtn' onclick='updateNickName();'>edit</button>";
			$("#nickFrm").html(html);
		},
		error : function(data){
			console.log("ajax처리실패");
		},
		complete: function(data){
			
		}
	});
}
function introModify(){
	var intro = $("#introAfter").val();
	console.log(intro);
	var userid = '<%=userLoggedIn.getUserId() %>';
	var param = {
			intro : intro,
			userid : userid
	}
	
	$("#introAfter").remove();
	$("#introAfterBtn").remove();

	
	$.ajax({
		url : "<%=request.getContextPath()%>/gson/sns/introModify.do",
		data : param,
		dataType: "json",
		type : "post",
		success : function(data){
			console.log(data);
			var html = "<span id='introBefore'>"+intro+"</span>";
			html+="<button id='introBeforeBtn' onclick='updateIntroduce();'>edit</button>";
			$("#introFrm").html(html);
		},
		error : function(data){
			console.log("ajax처리실패");
		},
		complete: function(data){
			
		}
	});
}

</script>

 <header class="masthead" style="height:300px;">
      <div class="intro-text" style="padding-top:140px; !important">
        <div class="intro-heading text-uppercase">
       		<div id="headerFrm">
				<span id="headerBefore"><%=profileSNS.getHeaderText() %></span>
				<button id="headerBeforeBtn" onclick="updateHeaderText();" style='margin-left:10px;'>edit</button>
			</div>
        </div>
     </div>
  </header>
  
<section class="page-top" style="padding:0px; !important;">
	  <nav id="sideNav">
		<div id="profile-header">
	      <img class="profile-circle"  style="margin: 50px auto 12px;" src="<%=request.getContextPath() %>/upload/profile/<%=userLoggedIn.getFileName() %>" alt="">
	      <div id="nickFrm">
	      	<span id="nickBefore" style="font-weight: 700;"><%=profileSNS.getUserNickname() %></span>
	      	<button id="nickBeforeBtn" onclick="updateNickName();">edit</button>
	      </div>
	      <div id="introFrm" style="margin: 10px 0 50px;">
				<span id="introBefore"><%=profileSNS.getUserIntroduce() %></span>
				<button id="introBeforeBtn" onclick="updateIntroduce();">edit</button>
		 </div>
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
	  