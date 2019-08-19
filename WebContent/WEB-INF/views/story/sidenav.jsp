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
 	ProfileSNS profileSNS = (ProfileSNS)request.getAttribute("profileSNS");
 	userLoggedIn = (User)session.getAttribute("userLoggedIn");
	List<String> blockLoggedInList = new SNSService().selectOneIdBlock(userLoggedIn.getUserId());
 	List<String> followLoggedInList = new SNSService().selectOneIdFollow(userLoggedIn.getUserId());
 
	

%> 


<script type="text/javascript">

function updateHeaderText(){
	var headertext = $("#headerBefore").text();
	
	var html = "<input type='text' id='headerAfter' name='headerAfter' value='"+headertext+"'/ size='20'>";
	html += "<button id='headerAfterBtn' class='btn btn-light' onclick='headerTextModify();' style='margin-left:10px; width:60px;'>edit</button>"
	$("#headerBeforeBtn").remove();
	
	$("#headerFrm").html(html);
	
}

function updateNickName(){
	var nickname = $("#nickBefore").text();
	
	var html = "<input type='text' id='nickAfter' name='nickafter' value='"+nickname+"' size='10' />";
	html += "<button id='nickAfterBtn'class='btn btn-light' onclick='nickNameModify();' style='margin-left:10px; width:60px;'>edit</button>"
	$("#nickBeforeBtn").remove();
	
	$("#nickFrm").html(html);
	
}

function updateIntroduce(){
	var intro = $("#introBefore").text();
	
	var html = "<textarea name='introAfter' id='introAfter' cols='20' rows='4'>"+intro+"</textarea>";
	html += "<button id='introAfterBtn' class='btn btn-light' onclick='introModify();' style='float:right; margin-right: 14px; width:60px;'>edit</button>"
	$("#introBeforeBtn").remove();
	
	$("#introFrm").html(html);
	
}

function headerTextModify(){
	var headertext = $("#headerAfter").val();

	if(headertext.length==0){
		alert('내용을 입력해주세요.');
		return;
	}
	
	if(headertext.length>20){
		alert('최대 20글자까지 가능합니다.');
		return;
	}
	
	
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
			var html = "<a href='<%=request.getContextPath() %>/story/storyMain?mypage=<%=mypage %>' style='color:white' id='headerBefore'>"+headertext+"</a>";
			html+="&nbsp;<button id='headerBeforeBtn' class='btn btn-light' style='width:60px;' onclick='updateHeaderText();'>edit</button>";
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

	if(nickname.length==0){
		alert('닉네임을 입력해주세요.');
		return;
	}
	

	if(nickname.length>8){
		alert('최대 8글자까지 가능합니다.');
		return;
	}
	
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
			html+="<button id='nickBeforeBtn' class='btn btn-light' onclick='updateNickName();' style='width:60px;'>edit</button>";
			
			
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
	

	if(intro.length==0){
		alert('소개를 입력해주세요.');
		return;
	}
	

	if(intro.length>20){
		alert('최대 20글자까지 가능합니다.');
		return;
	}
	
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
			html+="<button id='introBeforeBtn' class='btn btn-light' style='width:60px;' onclick='updateIntroduce();'>edit</button>";
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
					if($('.followerTr').length>0){
						$('.followerTr').remove();
						$('.follower').remove();				
					}
					
					var html = "<tr class='followerTr'><td class='follower'>팔로워</td></tr>";
					$("#tbl-followmenu").append(html);
					
					$(".follower").on("click", function(){
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
					
					$("#followBtn").removeClass("btn-success");
					$("#followBtn").addClass("btn-danger");
					$("#followBtn").html("Unfollow");
					$("#followBtn").off('click')
					$("#followBtn").on('click', unfollow);
					
					$('.blackArea').html('');
					
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
					
				}
			,
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
					$("#followBtn").removeClass("btn-danger");
					$("#followBtn").addClass("btn-success");
					$("#followBtn").html("Follow");
					$("#followBtn").off('click');
					$("#followBtn").on('click', follow);
					
					$('.followerTr').remove();
					$('.follower').remove();
					
					$('.blackArea').html("<button type='button' class='btn btn-dark' id='blockBtn' onclick='block();'>Block</button>");
					
					if($('#follower-container').length>0){
						location.href='<%=request.getContextPath() %>/story/storyMain?mypage=<%=mypage %>';
					}
			},
			error : function(data){
				console.log("ajax처리실패");
			},
			complete: function(data){
				
				
			}
		}) 

}
	
function block(){
	var param={
		userBlocking : '<%=userLoggedIn.getUserId() %>',
		userBlocked : '<%=mypageUser.getUserId() %>'    		
	}

	$.ajax({
		url : '<%=request.getContextPath()%>/gson/sns/block.do',
		data : param,
		dataType: 'json',
		type : 'post',
		success : function(data){
				$("#followBtn").remove();
				$("#blockBtn").removeClass("btn-dark");
				$("#blockBtn").addClass("btn-light");
				$("#blockBtn").text("Unblock");
				$("#blockBtn").css("width", "105px");
				
				$("#blockBtn").off("click");
				$("#blockBtn").on("click", unblock);
		},
		error : function(data){
			console.log("ajax처리실패");
		},
		complete: function(data){
			
			
		}
	}) 

}

function unblock(){
	var param={
			userBlocking : '<%=userLoggedIn.getUserId() %>',
			userBlocked : '<%=mypageUser.getUserId() %>'    		
		}

		$.ajax({
			url : '<%=request.getContextPath()%>/gson/sns/unblock.do',
			data : param,
			dataType: 'json',
			type : 'post',
			success : function(data){
					$(".greenArea").append("<button type='button' class='btn btn-success' id='followBtn' onclick='follow();'>Follow</button>");
					
					$("#blockBtn").removeClass("btn-light");
					$("#blockBtn").addClass("btn-dark");
					$("#blockBtn").text("block");
					$("#blockBtn").css("width", "81.36px");
					
					$("#blockBtn").off("click");
					$("#blockBtn").on("click", block);
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
				<a href='<%=request.getContextPath() %>/story/storyMain?mypage=<%=mypage %>' style='color:white' id="headerBefore"><%=profileSNS.getHeaderText()!=null? profileSNS.getHeaderText() : profileSNS.getProfileUserNickname()+"의 홈" %></a>
				<%if(userLoggedIn!=null && mypage.equals(userLoggedIn.getUserId())) { %>
					<button id="headerBeforeBtn" onclick="updateHeaderText();" style='margin-left:10px;' class="btn btn-light">edit</button>
				<%}%>
			</div>
        </div>
     </div>
  </header>
  
  
  
  
  <form action="" name="memomsgFrm">
	<input type="hidden" name="userId" />
</form>
  
  
  
<section class="page-top" style="padding:0px;">
	  <nav id="sideNav">
		<div id="profile-header">
	      <img class="profile-circle"  style="margin: 50px auto 12px;" src="<%=request.getContextPath() %>/upload/profile/<%=mypageUser.getFileName()%>" alt="">
	      <div id="nickFrm">
	      	<span id="nickBefore" style="font-weight: 700;"><%=profileSNS.getProfileUserNickname() %></span>
	      	<%if(userLoggedIn!=null && mypage.equals(userLoggedIn.getUserId())) { %>
	      		<button id="nickBeforeBtn" onclick="updateNickName();" class="btn btn-light">edit</button>
	      	<%}%>
	      	</div>
	      	<div id="introFrm" style="margin-top: 10px;">
			<span id="introBefore"><%=profileSNS.getProfileUserIntroduce()!=null? profileSNS.getProfileUserIntroduce(): "안녕하세요. 저는 " + profileSNS.getProfileUserNickname() +"입니다." %></span>
			<%if(userLoggedIn!=null && mypage.equals(userLoggedIn.getUserId())) { %>
					<button id="introBeforeBtn" onclick="updateIntroduce();" class="btn btn-light">edit</button>
			<%} %>
	 		</div>
	 
	      	<% if(userLoggedIn!=null && !mypage.equals(userLoggedIn.getUserId())){%>
					<%if(followLoggedInList.contains(mypage)){	%>
						 <div class='greenArea'><button type="button" class="btn btn-danger" id="followBtn" onclick="unfollow();">Unfollow</button></div>
						 <div class='blackArea'></div>
					<%} else{%>
							<%if(blockLoggedInList.contains(mypage)){ %>
								<div class='greenArea'></div>
								<div class='blackArea'><button type="button" id="blockBtn" class="btn btn-light" onclick="unblock();">Unblock</button></div>
							<%} else { %>
						<div class='greenArea'><button type="button" class="btn btn-success" id="followBtn" onclick="follow();">Follow</button></div>
						<div class='blackArea'><button type="button" id="blockBtn" class="btn btn-dark" onclick="block();">Block</button></div>
					<% }
					}
			} %>
	   </div>
	    <table class="tbl-usermenu">
	   		<tr>
	  			<td id="gohome">홈</td>
	   		</tr>
	   	</table>
	   	<table class="tbl-usermenu" id="tbl-followmenu">
   	 		<%if(userLoggedIn!=null && userLoggedIn.getUserId().equals(mypage)) {%>
		   		<tr>
		   			<td id="gomsg">메시지</td>
		   		</tr>
	   		<%} %>
	   		<tr>
	   			<td>검색</td>
	   		</tr>
	   		
	   		<%if((userLoggedIn!=null && mypage.equals(userLoggedIn.getUserId())) ||  !mypage.equals(userLoggedIn.getUserId()) && followLoggedInList.contains(mypage)){%>
		   		<tr class="followerTr">
		   			<td class="follower">팔로워</td>
		   		</tr>
			<% }%>
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
	padding-bottom: 40px;
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

.blackArea, .greenArea {
	display: inline;
	text-align: center;
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
	margin: 10px auto;
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
.btn-dark,{
	width:81.36px;
}
.btn-light{
	width:105px;
}

#headerBeforeBtn, #nickBeforeBtn, #introBeforeBtn{
	width: 60px;
}

</style>
<script>
$(()=>{
var param = {
mypage : '<%=mypage%>'
				}
				$.ajax({	 
					
					url: "<%=request.getContextPath() %>/ajax/home.jsp",
					data:param,
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
	});

 	$("#gohome").on("click", function(){
 		var param = {
 				 mypage : '<%=mypage%>'
 			}
 			$.ajax({	 
 				
 				url: "<%=request.getContextPath() %>/ajax/home.jsp",
 				data:param,
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
 	});

 	
 	$(".follower").on("click", function(){
 		
 		
 		var param = {
 				mypage : '<%=mypage %>'
 		}
 		
 	 	
 		$.ajax({
			url: "<%=request.getContextPath() %>/ajax/follower.jsp",
			data:param,
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
 			var status = "width=420px, height=400px, left=150px, top=0px";
 			var popup = open("", title, status);
 			
 			var frm = document.memomsgFrm;
 			frm.userId.value= userId;
 			frm.action = url;
 			frm.target=title;
 			frm.method= "post"; 
			frm.submit();
 		
 	});
</script>
	  