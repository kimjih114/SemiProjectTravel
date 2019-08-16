<%@page import="sns.model.service.SNSService"%>
<%@page import="user.model.service.UserService"%>
<%@page import="user.model.vo.User"%>
<%@page import="sns.model.vo.ProfileSNS"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String mypage = request.getParameter("mypage");
    User userLoggedIn = (User)session.getAttribute("userLoggedIn");
    User mypageUser = new UserService().selectOne(mypage);
    
    List<String> followLoggedInList = new SNSService().selectOneIdFollow(userLoggedIn.getUserId());
    List<String> blockLoggedInList = new SNSService().selectOneIdBlock(userLoggedIn.getUserId());
    
%>
<style>
#follower-container {
	width:540px;
	margin:0 auto;
	text-align:center;
	position: absolute;
	left:220px;
	transition: 0.5s;
	top:10px;
}


#follower-container .tab {
	list-style: none;
	margin: 0;
	padding: 0;
	overflow: hidden;
}
/* Float the list items side by side */
#follower-container .tab li {
	float: left;
	width: 33.3333%;
	border-bottom: 1px solid;
}
/* Style the links inside the list items */
#follower-container .tab li a {
	display: inline-block;
	color: #000;
	text-align: center;
	text-decoration: none;
	padding: 14px 16px;
	font-size: 17px;
	transition:0.3s;
	cursor: pointer;
}
/* Style the tab content */
#follower-container .tabcontent {
	display: none;
	background-color:black;
	padding: 6px 5px;
	color:#fff;
}
#follower-container ul.tab li.current{
	background-color: #fed136;
	color: #222;
	border:1px solid;
	border-bottom: 0;
}
#follower-container .tabcontent.current {
	display: block;
	background: white;
	color: black;
	border: 1px solid;
	border-top: 0px;
	border-collapse: collapse;
	
}
div.followListContainer{
	margin:0 auto;
}
table.followList{
	width: 527px;
	border:1px solid black;
	
}
table.followList td{
	width: 527px;
	padding: 8px;
}
.followerSearch{
	width: 200px;
	float:left;
margin-bottom: 10px
}

.firstRow{
	margin-left: 5px;
	color: gray;
	float: left;
	diplay:inline;
	font-size:0.8em;
}

.firstRow .followerURL{
	font-weight: 700;
	font-size: 1.2em;
	color: black;
}

.ub-btns{
	display:inline;
	float:right;
}

.magni{
	float:left;
	margin: 4px 3px;
}

.header-profile-circle{
	margin-right: 5px;
}
</style>
<script>

var followLoggedInList = new Array();
var blockLoggedInList = new Array();




$(()=>{
	
	<%if(followLoggedInList!=null){%>
	<%for(String id : followLoggedInList){%>
	followLoggedInList .push('<%=id%>');
	<%} }%>
	<%if(blockLoggedInList!=null){%>
	<%for(String id : blockLoggedInList){%>
	blockLoggedInList.push('<%=id%>');
	<%} }%>
	
	var param = {
			mypage : '<%=mypage%>'
	}
	
	$.ajax({
		url:"<%=request.getContextPath() %>/gson/sns/followerOneList.do",
		type:"get",
		data:param,
		dataType:"json",
		success: function(data){
			$(data).each((i,u)=>{
				var html = '';
				if(u.userIntroduce==undefined){
					u.userIntroduce='안녕하세요. 저는 '+u.userNickname+'입니다.';
				} 
				
				if(u.userIntroduce.length >= 10){
					u.userIntroduce= u.userIntroduce.substr(0, 10) + "...";
				}
				
				html+="<tr>";
				html+="<td>";
				html+="<div class='firstRow'>";
				html+="<img src='<%=request.getContextPath() %>/upload/profile/"+u.profileRenamedFilename+"' class='header-profile-circle'  width='40' height='40' />";
				html+="<a href='<%=request.getContextPath() %>/story/storyMain?mypage="+u.userId+"' class='followerURL'>"+u.userNickname+"</a>";
				if(u.userType=='S'){
					html+="<img src='<%=request.getContextPath() %>/img/checkmark.png' alt='''  width='20' height='20'  />";
				}		
				html+="&nbsp;<span class='followerIntro'>@"+u.userId+"</span>";
				html+="</div>"
				html+="<div class='ub-btns'>"
					if(u.userId != '<%=userLoggedIn.getUserId() %>'){
						if(followLoggedInList.includes(u.userId)){
							html+="<div class='whiteArea' style='display:inline; margin-right:2px;'><button type='button' class='btn btn-danger' class='followerBtn' style='margin-right:2px;' value='"+u.userId+"' onclick='unfollower(this);'>Unfollow</button></div>";
							html+="<div class='darkArea' style='display:inline;'></div>";
						} else if(blockLoggedInList.includes(u.userId)) {
							html+="<div class='whiteArea' style='display:inline; margin-right:2px;'></div>";
							html+="<div class='darkArea' style='display:inline;'><button type='button' value='"+u.userId+"' class='btn btn-light' onclick='unblocker(this);''>Unblock</button></div>";
						} else {
							html+="<div class='whiteArea' style='display:inline; margin-right:2px;'><button type='button' class='btn btn-success' value='"+u.userId+"' onclick='follower(this);'>Follow</button></div>";
							html+="<div class='darkArea' style='display:inline;'><button type='button' class='btn btn-dark' value='"+u.userId+"' onclick='block(this);'>Block</button></div>";
						}
					}
				html+="</div>";	
				html+="</td>";
				html+="</tr>";
				
				$("#followerList").append(html);
			});
			
		},
		error: function(jqxhr, textStatus, errorThrown){
			console.log("ajax처리실패!");
			console.log(jqxhr, textStatus, errorThrown);
		}
	});

});





$(function() {
	$('ul.tab li').click(function() {	
		var activeTab = $(this).attr('data-tab');
		$('ul.tab li').removeClass('current');
		$('.tabcontent').removeClass('current');
		$(this).addClass('current');
		$('#' + activeTab).addClass('current');
		
		if($(this).attr('data-tab')=='tab1'){
			var param = {
					mypage : '<%=mypage%>'
			}
			$.ajax({
				url:"<%=request.getContextPath() %>/gson/sns/followerOneList.do",
				type:"get",
				data:param,
				dataType:"json",
				success: function(data){
					
					$("#followerList").html('');
					$(data).each((i,u)=>{
						var html = '';
						if(u.userIntroduce==undefined){
							u.userIntroduce='안녕하세요. 저는 '+u.userNickname+'입니다.';
						} 
						
						if(u.userIntroduce.length >= 10){
							u.userIntroduce= u.userIntroduce.substr(0, 10) + "...";
						}
						
						html+="<tr>";
						html+="<td>";
						html+="<div class='firstRow'>";
						html+="<img src='<%=request.getContextPath() %>/upload/profile/"+u.profileRenamedFilename+"' class='header-profile-circle'  width='40' height='40' />";
						html+="<a href='<%=request.getContextPath() %>/story/storyMain?mypage="+u.userId+"' class='followerURL'>"+u.userNickname+"</a>";
						if(u.userType=='S'){
							html+="<img src='<%=request.getContextPath() %>/img/checkmark.png' alt='''  width='20' height='20'  />";
						}		
						html+="&nbsp;<span class='followerId'>@"+u.userId+"</span>";
						html+="</div>"
						html+="<div class='ub-btns'>"
							if(u.userId != '<%=userLoggedIn.getUserId() %>'){
								if(followLoggedInList.includes(u.userId)){
									html+="<div class='whiteArea' style='display:inline; margin-right:2px;'><button type='button' class='btn btn-danger' class='followerBtn' style='margin-right:2px;' value='"+u.userId+"' onclick='unfollower(this);'>Unfollow</button></div>";
									html+="<div class='darkArea' style='display:inline;'></div>";
								} else if(blockLoggedInList.includes(u.userId)) {
									html+="<div class='whiteArea' style='display:inline; margin-right:2px;'></div>";
									html+="<div class='darkArea' style='display:inline;'><button type='button' value='"+u.userId+"' class='btn btn-light' onclick='unblocker(this);''>Unblock</button></div>";
								} else if(followLoggedInList.includes(u.userId)==false) {
									html+="<div class='whiteArea' style='display:inline; margin-right:2px;'><button type='button' class='btn btn-success'id='followBtn' value='"+u.userId+"' onclick='follower(this);'>Follow</button></div>";
									html+="<div class='darkArea' style='display:inline;'><button type='button' value='"+u.userId+"' class='btn btn-dark' onclick='blocker(this);'>Block</button></div>";
								}
							}
						html+="</div>";	
						html+="</td>";
						html+="</tr>";
						
						$("#followerList").append(html);
					});
					
				},
				error: function(jqxhr, textStatus, errorThrown){
					console.log("ajax처리실패!");
					console.log(jqxhr, textStatus, errorThrown);
				}
			});
		} 
		
		else if($(this).attr('data-tab')=='tab2'){
			var param = {
					mypage : '<%=mypage%>'
			}
			$.ajax({
				url:"<%=request.getContextPath() %>/gson/sns/followOneList.do",
				type:"get",
				data:param,
				dataType:"json",
				success: function(data){
					$("#followingList").html('');
				
					$(data).each((i,u)=>{
						var html = '';
						if(u.userIntroduce==undefined){
							u.userIntroduce='안녕하세요. 저는 '+u.userNickname+'입니다.';
						} 
						
						if(u.userIntroduce.length >= 10){
							u.userIntroduce= u.userIntroduce.substr(0, 10) + "...";
						}
						
						html+="<tr>";
						html+="<td>";
						html+="<div class='firstRow'>";
						html+="<img src='<%=request.getContextPath() %>/upload/profile/"+u.profileRenamedFilename+"' class='header-profile-circle'  width='40' height='40' />";
						html+="<a href='<%=request.getContextPath() %>/story/storyMain?mypage="+u.userId+"' class='followerURL'>"+u.userNickname+"</a>";
						if(u.userType=='S'){
							html+="<img src='<%=request.getContextPath() %>/img/checkmark.png' alt='''  width='20' height='20'  />";
						}		
						html+="&nbsp;<span class='followerIntro'>@"+u.userId+"</span>";
						html+="</div>"
						html+="<div class='ub-btns'>"
							if(u.userId != '<%=userLoggedIn.getUserId() %>'){
								if(followLoggedInList.includes(u.userId)){
									html+="<div class='whiteArea' style='display:inline; margin-right:2px;'><button type='button' class='btn btn-danger' class='followerBtn' style='margin-right:2px;' value='"+u.userId+"' onclick='unfollower(this);'>Unfollow</button></div>";
									html+="<div class='darkArea' style='display:inline;'></div>";
								} else if(blockLoggedInList.includes(u.userId)) {
									html+="<div class='whiteArea' style='display:inline; margin-right:2px;'></div>";
									html+="<div class='darkArea' style='display:inline;'><button type='button' class='btn btn-light' value='"+u.userId+"' onclick='unblocker(this);''>Unblock</button></div>";
								} else {
									html+="<div class='whiteArea' style='display:inline; margin-right:2px;'><button type='button' class='btn btn-success' value='"+u.userId+"' value='"+u.userId+"' onclick='follower(this);'>Follow</button></div>";
									html+="<div class='darkArea' style='display:inline;'><button type='button' class='btn btn-dark' value='"+u.userId+"' onclick='blocker(this);'>Block</button></div>";
								}
							}
						html+="</div>";	
						html+="</td>";
						html+="</tr>";
					
						
						$("#followingList").append(html);
					});
					
				},
				error: function(jqxhr, textStatus, errorThrown){
					console.log("ajax처리실패!");
					console.log(jqxhr, textStatus, errorThrown);
				}
			});
			
		}else if($(this).attr('data-tab')=='tab3'){
			var param1 = {
					userLoggedIn : '<%=userLoggedIn.getUserId()%>',
					mypage : '<%=mypage %>'
			}
			
			
			if($("#tab3").children().children(".followList").attr('id')=='followedList'){
				$.ajax({
					url:"<%=request.getContextPath() %>/gson/sns/followedOneList.do",
					type:"get",
					data: param1,
					dataType:"json",
					success: function(data){
						
						console.log(data);
						$("#followedList").html('');
						console.log(data);
						
						$(data).each((i,u)=>{
							var html = '';
							if(u.userIntroduce==undefined){
								u.userIntroduce='안녕하세요. 저는 '+u.userNickname+'입니다.';
							} 
							
							if(u.userIntroduce.length >= 10){
								u.userIntroduce= u.userIntroduce.substr(0, 10) + "...";
							}
							
							html+="<tr>";
							html+="<td>";
							html+="<div class='firstRow'>";
							html+="<img src='<%=request.getContextPath() %>/upload/profile/"+u.profileRenamedFilename+"' class='header-profile-circle'  width='40' height='40' />";
							html+="<a href='<%=request.getContextPath() %>/story/storyMain?mypage="+u.userId+"' class='followerURL'>"+u.userNickname+"</a>";
							if(u.userType=='S'){
								html+="<img src='<%=request.getContextPath() %>/img/checkmark.png' alt='''  width='20' height='20'  />";
							}		
							html+="&nbsp;<span class='followerIntro'>@"+u.userId+"</span>";
							html+="</div>"
							html+="<div class='ub-btns'>"
								if(u.userId != '<%=userLoggedIn.getUserId() %>'){
									if(followLoggedInList.includes(u.userId)){
										html+="<div class='whiteArea' style='display:inline; margin-right:2px;'><button type='button' class='btn btn-danger' class='followerBtn' style='margin-right:2px;' value='"+u.userId+"' onclick='unfollower(this);'>Unfollow</button></div>";
										html+="<div class='darkArea' display:inline;></div>";
									} else if(blockLoggedInList.includes(u.userId)) {
										html+="<div class='whiteArea' style='display:inline; margin-right:2px;'></div>";
										html+="<div class='darkArea' style='display:inline;'><button type='button' value='"+u.userId+"' class='btn btn-light' onclick='unblocker(this);''>Unblock</button></div>";
									} else {
										html+="<div class='whiteArea' style='display:inline; margin-right:2px;'><button type='button' class='btn btn-success'value='"+u.userId+"' onclick='follower(this);'>Follow</button></div>";
										html+="<div class='darkArea' style='display:inline;'><button type='button' value='"+u.userId+"' class='btn btn-dark' onclick='blocker(this);'>Block</button></div>";
									}
								}
							html+="</div>";	
							html+="</td>";
							html+="</tr>";
						
							
							$("#followedList").append(html);
						});
						
					},
					error: function(jqxhr, textStatus, errorThrown){
						console.log("ajax처리실패!");
						console.log(jqxhr, textStatus, errorThrown);
					}
				});
			
			}else if($("#tab3").children().children(".followList").attr('id')=='followerWithList'){
				$.ajax({
					url:"<%=request.getContextPath() %>/gson/sns/followerWithList.do",
					type:"get",
					data:param1,
					dataType:"json",
					success: function(data){
			
						$("#followerWithList").html('');
					
						$(data).each((i,u)=>{							
							var html = '';
							if(u.userIntroduce==undefined){
								u.userIntroduce='안녕하세요. 저는 '+u.userNickname+'입니다.';
							} 
							
							if(u.userIntroduce.length >= 10){
								u.userIntroduce= u.userIntroduce.substr(0, 10) + "...";
							}
							
							html+="<tr>";
							html+="<td>";
							html+="<div class='firstRow'>";
							html+="<img src='<%=request.getContextPath() %>/upload/profile/"+u.profileRenamedFilename+"' class='header-profile-circle'  width='40' height='40' />";
							html+="<a href='<%=request.getContextPath() %>/story/storyMain?mypage="+u.userId+"' class='followerURL'>"+u.userNickname+"</a>";
							if(u.userType=='S'){
								html+="<img src='<%=request.getContextPath() %>/img/checkmark.png' alt='''  width='20' height='20'  />";
							}		
							html+="&nbsp;<span class='followerIntro'>@"+u.userId+"</span>";
							html+="</div>"
							html+="<div class='ub-btns'>"
								if(u.userId != '<%=userLoggedIn.getUserId() %>'){
									if(followLoggedInList.includes(u.userId)){
										html+="<div class='whiteArea' style='display:inline; margin-right:2px;'><button type='button' class='btn btn-danger' style='margin-right:2px; value='"+u.userId+"' onclick='unfollower(this);'>Unfollow</button></div>";
										html+="<div class='darkArea' style='display:inline;'></div>";
									} else if(blockLoggedInList.includes(u.userId)) {
										html+="<div class='whiteArea' style='display:inline; margin-right:2px;'></div>";
										html+="<div class='darkArea' style='display:inline;'><button type='button' class='btn btn-light' value='"+u.userId+"' onclick='unblocker(this);'>Unblock</button></div>";
									} else {
										html+="<div class='whiteArea' style='display:inline; margin-right:2px;'><button type='button' class='btn btn-success'value='"+u.userId+"' onclick='follower(this);'>Follow</button></div>";
										html+="<div class='darkArea' style='display:inline;'><button type='button' value='"+u.userId+"'  class='btn btn-dark' onclick='blocker(this);'>Block</button></div>";
									}
								}
							html+="</div>";	
							html+="</td>";
							html+="</tr>";
						
							
							$("#followerWithList").append(html);
						});
						
					},
					error: function(jqxhr, textStatus, errorThrown){
						console.log("ajax처리실패!");
						console.log(jqxhr, textStatus, errorThrown);
					}
				});			
			}
			
		}
		
	})
});

function unfollower(btn){
		var param={
			userFollowing : '<%=userLoggedIn.getUserId() %>',
			userFollowed : $(btn).val()
		}
	
		$.ajax({
			url : '<%=request.getContextPath()%>/gson/sns/unFollow.do',
			data : param,
			dataType: 'json',
			type : 'post',
			success : function(data){
				if('<%=userLoggedIn.getUserId()%>'=='<%=mypage %>'){
					$(btn).parent().parent().parent().remove();
					return;
				}
				
				
				
			},
			error : function(data){
				console.log("ajax처리실패");
			},
			complete: function(data){
				followLoggedInList.remove($(btn).val());
			}
		}) 

	}
	
function follower(btn){
	var param={
		userFollowing : '<%=userLoggedIn.getUserId() %>',
		userFollowed : $(btn).val()
	}

	$.ajax({
		url : '<%=request.getContextPath()%>/gson/sns/follow.do',
		data : param,
		dataType: 'json',
		type : 'post',
		success : function(data){	

			if('<%=userLoggedIn.getUserId()%>'=='<%=mypage %>'){
				$(btn).parent().parent().parent().remove();
				return;
			}
			
			
			$(btn).removeClass("btn-success");
			$(btn).addClass("btn-danger");
			$(btn).html("Unfollow");
			$(btn).off('click')
			$(btn).on('click', unfollow);
			
			$('.darkArea').html('');
			
			
		},
		error : function(data){
			console.log("ajax처리실패");
		},
		complete: function(data){
			followLoggedInList.push($(btn).val());
			
		}
	}) 

}


</script>

 <div id="follower-container">
			<ul class="tab">
			<%if(userLoggedIn!=null && userLoggedIn.getUserId().equals(mypage)){ %>
				<li class="current" data-tab="tab1"><a>팔로우</a></li>
				<li data-tab="tab2"><a>팔로잉</a></li>
				<li data-tab="tab3"><a>나를 팔로잉한 사람</a></li>
			<% } else if(userLoggedIn!=null && !userLoggedIn.getUserId().equals(mypage)){%>
				<li class="current" data-tab="tab1"><a><%=mypageUser.getUsernickName() %>의 팔로우</a></li>
				<li data-tab="tab2"><a><%=mypageUser.getUsernickName() %>의 팔로잉</a></li>
				<li data-tab="tab3"><a>함께 팔로우한 사람</a></li>
			<% } %>
			</ul>
		
			<div id="tab1" class="tabcontent current">
				<div class="followListContainer">
					<img src="<%=request.getContextPath() %>/img/magnifying-glass.png" class="magni" alt="" width='20' height='20'/>
					<input type="search" name="followerSearch" class="followerSearch" id="followerSearch1" />
					
					<table class="followList" id="followerList">
					
					</table>
		    	</div>
			</div>
		
			<div id="tab2" class="tabcontent">
				<div class="followListContainer">
				<img src="<%=request.getContextPath() %>/img/magnifying-glass.png" class="magni" width='20' height='20'/>
					<input type="search" name="followerSearch" class="followerSearch" id="followerSearch2" />
					<table class="followList" id="followingList">
					
					</table>
		    	</div>
			</div>
			<div id="tab3" class="tabcontent">
			<%if(userLoggedIn!=null && userLoggedIn.getUserId().equals(mypage)){ %>
				<div class="followListContainer">
					<img src="<%=request.getContextPath() %>/img/magnifying-glass.png" class="magni" width='20' height='20'/>
					<input type="search" name="followerSearch" class="followerSearch" id="followerSearch3" />
					<table class="followList" id="followedList">
					
					</table>
		    	</div>
		    <% } else{%>
		    	<div class="followListContainer">
					<img src="<%=request.getContextPath() %>/img/magnifying-glass.png" class="magni" width='20' height='20'/>
					<input type="search" name="followerSearch" class="followerSearch" id="followerSearch4" />
					<table class="followList" id="followerWithList">
					
					</table>
		    	</div>
		   	<%} %>
		    </div>

		</div>