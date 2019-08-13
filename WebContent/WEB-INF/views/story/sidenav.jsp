<%@page import="sns.model.vo.FollowSNS"%>
<%@page import="java.util.List"%>
<%@page import="sns.model.service.SNSService"%>
<%@page import="user.model.service.UserService"%>
<%@page import="sns.model.vo.ProfileSNS"%>
<%@page import="user.model.vo.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header-menu.jsp" %>  
 
<%
	String mypage = request.getParameter("mypage");
	User mypageUser = new UserService().selectOne(mypage);
 	System.out.println("mypage="+mypage);
 	System.out.println("userLoggedIn="+userLoggedIn);
 	ProfileSNS profileSNS = (ProfileSNS)request.getAttribute("profileSNS");
 	
 	List<String> followLoggedInList = new SNSService().selectOneIdFollow(userLoggedIn.getUserId());
	System.out.println("followLoggedInList="+followLoggedInList);
	System.out.println("followLoggedInList.contains(mypage)="+followLoggedInList.contains(mypage));
	

%> 


<script type="text/javascript">

function updateHeaderText(){
	var headertext = $("#headerBefore").text();
	
	var html = "<input type='text' id='headerAfter' name='headerAfter' value='"+headertext+"'/>";
	html += "<button id='headerAfterBtn' onclick='headerTextModify();' style='margin-left:10px;'>edit</button>"
	$("#headerBeforeBtn").remove();
	
	$("#headerFrm").html(html);
	
}

function updateNickName(){
	var nickname = $("#nickBefore").text();
	
	var html = "<input type='text' id='nickAfter' name='nickafter' value='"+nickname+"' size='10' />";
	html += "<button id='nickAfterBtn' onclick='nickNameModify();' style='margin-left:10px;'>edit</button>"
	$("#nickBeforeBtn").remove();
	
	$("#nickFrm").html(html);
	
}

function updateIntroduce(){
	var intro = $("#introBefore").text();
	
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

function follow(){
	var param={
			userFollowing : '<%=userLoggedIn.getUserId() %>',
			userFollowed : '<%=mypageUser.getUserId() %>'    		
		}
	
		$.ajax({
			url : '<%=request.getContextPath()%>/gson/sns/follow.do',
			data : param,
			dataType: 'json',
			type : 'post',
			success : function(data){
				console.log("follow working");
				
				$("#followBtn").removeClass("btn-success");
				$("#followBtn").addClass("btn-danger");
				$("#followBtn").html("Unfollow");
				$("#followBtn").off('click')
				$("#followBtn").on('click', unfollow);
				console.log("ajax처리성공!")
			},
			error : function(data){
				console.log("ajax처리실패");
			},
			complete: function(data){
				
			}
		})
}

function unfollow(){
		var param={
			userFollowing : '<%=userLoggedIn.getUserId() %>',
			userFollowed : '<%=mypageUser.getUserId() %>'    		
		}
	
		$.ajax({
			url : '<%=request.getContextPath()%>/gson/sns/unFollow.do',
			data : param,
			dataType: 'json',
			type : 'post',
			success : function(data){
				console.log("unfollow working");
				
				$("#followBtn").removeClass("btn-danger");
				$("#followBtn").addClass("btn-success");
				$("#followBtn").html("Follow");
				$("#followBtn").off('click');
				$("#followBtn").on('click', follow);
				
			},
			error : function(data){
				console.log("ajax처리실패");
			},
			complete: function(data){
			
				
			}
		}) 

	}


	
</script>
 <header class="masthead" style="height:300px;">
      <div class="intro-text" style="padding-top:140px; !important">
        <div class="intro-heading text-uppercase">
       		<div id="headerFrm">
				<span id="headerBefore"><%=profileSNS.getHeaderText()!=null? profileSNS.getHeaderText() : profileSNS.getUserNickname()+"의 홈" %></span>
				<%if(userLoggedIn!=null && mypage.equals(userLoggedIn.getUserId())) { %>
					<button id="headerBeforeBtn" onclick="updateHeaderText();" style='margin-left:10px;'>edit</button>
				<%}%>
			</div>
        </div>
     </div>
  </header>
  
<section class="page-top" style="padding:0px; !important;">
	  <nav id="sideNav">
		<div id="profile-header">
	      <img class="profile-circle"  style="margin: 50px auto 12px;" src="<%=request.getContextPath() %>/upload/profile/<%=mypageUser.getFileName()%>" alt="">
	      <div id="nickFrm">
	      	<span id="nickBefore" style="font-weight: 700;"><%=profileSNS.getUserNickname() %></span>
	      	<%if(userLoggedIn!=null && mypage.equals(userLoggedIn.getUserId())) { %>
	      		<button id="nickBeforeBtn" onclick="updateNickName();">edit</button>
	      	<%}
	      	else if(userLoggedIn!=null && !mypage.equals(userLoggedIn.getUserId())){%>
					<%if(followLoggedInList.contains(mypage)){	%>
						 <br>
						 <button type="button" class="btn btn-danger" id="followBtn" onclick="unfollow();">Unfollow</button>
						 <button type="button" class="btn btn-dark">Block</button>
					<%} else{ %>
						<br>
						<button type="button" class="btn btn-success" id="followBtn" onclick="follow();">Follow</button>
						<button type="button" class="btn btn-dark">Block</button>
					<% }
			} %>
		</div>

	      <div id="introFrm" style="margin: 10px 0 50px;">
				<span id="introBefore"><%=profileSNS.getUserIntroduce()!=null? profileSNS.getUserIntroduce(): "안녕하세요. 저는 " + profileSNS.getUserNickname() +"입니다." %></span>
				<%if(userLoggedIn!=null && mypage.equals(userLoggedIn.getUserId())) { %>
						<button id="introBeforeBtn" onclick="updateIntroduce();">edit</button>
				<%} %>
		 </div>
		 
		 
		 
	   </div>
	    <table class="tbl-usermenu">
	   		<tr>
	  			<td id="gohome">홈</td>
	   		</tr>
	   	</table>
	   	<table class="tbl-usermenu">
   	 		<%if(userLoggedIn!=null && userLoggedIn.getUserId().equals(mypage)) {%>
	   		<tr>
	   			<td>메시지</td>
	   		</tr>
	   		<%} %>
	   		<tr>
	   			<td>검색</td>
	   		</tr>
	   		
	   	
	   		<tr>
	   			<td id="follower">팔로워</td>
	   		</tr>

	   	</table>
	   	<%if(userLoggedIn!=null && userLoggedIn.getUserId().equals(mypage)) {%>
	    <table class="tbl-usermenu">
	    <tr>
	   		<td id="setting">설정</td>
	   	</tr>
		</table>
		<%} %>
		<table class="tbl-usermenu" style="margin-bottom:0px; !important">
	    <tr>
	    	<td>FAQ</td>
	    </tr>
	    
	    <tr>
	    	<td id="QuestionList">1:1문의</td>
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
	background-color:<%=profileSNS.getThemeColor()!=null? profileSNS.getThemeColor() : "#fed136" %>;
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
    background:<%=profileSNS.getThemeColor()!=null? profileSNS.getThemeColor() : "#fed136" %>; 
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

.tbl-usermenu td{
	width: 210px;

}

.nick_sns{
	font-weight: 700;
}
.btn-dark{
	width:81.36px;
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
 
 	$("#follower").on("click", function(){
 		$.ajax({
			url: "<%=request.getContextPath() %>/ajax/follower.jsp",
			data:"mypage="+'<%=mypage%>',
			success: function(data){
				$("#container-sns").html(data);
				console.log("ajax처리성공!");
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
	<%-- 	
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
	}) --%>

 	$("#QuestionList").on("click", function(){
		location.href="<%=request.getContextPath()%>/boardquestion/boardList"; 
	})

	</script>
	  