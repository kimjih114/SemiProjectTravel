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
    List<String> blockedLoggedInList = new SNSService().selectOneIdBlocked(userLoggedIn.getUserId());
    
%>
<style>
.rightNav {
 	position: fixed;
    text-align: center;
    top: 300px;
    left: 768px;
    display: -webkit-box;
    display: -ms-flexbox;
    /*display: fixed;*/
    -webkit-box-direction: normal;
    -ms-flex-direction: column;
    flex-direction: column;

    /*height: 100vh;*/
	padding:5px;
    
}

.return-top{
	border:1px solid black;
	width:100px;
	text-align: center;
	left: 800px;
	bottom:468px;
	position:fixed;
 	font-weight:700;
 	cursor:pointer;
 	 	z-index:-2;

}

#autoS2{
	display:none;
	z-index:10;
	background: white;
	width: 182px;
	overflow:hidden;
	border: 1px solid gray;
	position: absolute;
	top: 78px;
	left: 31px;
	padding: 0;
	margin: 0;
	text-align:left;
}
#autoS2 li{
	padding: 0 10px;
	list-style: none;
	z-index:10;
	cursor: pointer;
	width:182px;
}
#autoS2 li.sel{
	background: gray;
	color: white;
	z-index:10;
}
#followerSearch {
	width:540px;
	margin:0 auto;
	position: absolute;
	float:left;
	text-align:left;
	left:10px;
	transition: 0.5s;
	top:10px;
}
#follower-container {
	width:540px;
	margin:0 auto;
	text-align:center;
	position: absolute;
	left:220px;
	transition: 0.5s;
	top:30px;
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
var blockedLoggedInList = new Array();


console.log(followLoggedInList);
console.log(blockLoggedInList);
console.log(blockedLoggedInList);



$(()=>{
	
	<%if(followLoggedInList!=null){%>
	<%for(String id : followLoggedInList){%>
	followLoggedInList .push('<%=id%>');
	<%} }%>
	<%if(blockLoggedInList!=null){%>
	<%for(String id : blockLoggedInList){%>
	blockLoggedInList.push('<%=id%>');
	<%} }%>
	<%if(blockedLoggedInList!=null){%>
	<%for(String id : blockedLoggedInList){%>
	blockedLoggedInList.push('<%=id%>');
	<%} }%>
	
	console.log(followLoggedInList);
	console.log(blockLoggedInList);
	console.log(blockedLoggedInList);
	
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
				
				html+="<tr>";
				html+="<td>";
				html+="<div class='firstRow'>";
				html+="<img src='<%=request.getContextPath() %>/upload/profile/"+u.profileRenamedFilename+"' class='header-profile-circle'  width='40' height='40' />";
				html+="<a href='<%=request.getContextPath() %>/story/storyMain?mypage="+u.profileUserId+"' class='followerURL'>"+u.profileUserNickname+"</a>";
				if(u.profileUserType=='S'){
					html+="<img src='<%=request.getContextPath() %>/img/checkmark.png' alt=''  width='20' height='20'  />";
				}		
				html+="&nbsp;<span class='followerIntro'>@"+u.profileUserId+"</span>";
				html+="</div>"
				html+="<div class='ub-btns'>"
					if(u.profileUserId != '<%=userLoggedIn.getUserId()%>'){
						if(followLoggedInList.includes(u.profileUserId)){
							html+="<div class='whiteArea' style='display:inline; margin-right:2px;'><button type='button' class='btn btn-danger' class='followerBtn' style='margin-right:2px;' value='"+u.profileUserId+"' onclick='unfollower(this);'>Unfollow</button></div>";
							html+="<div class='darkArea' style='display:inline;'></div>";
						}
						else if(blockLoggedInList.includes(u.profileUserId)){
							if('<%=userLoggedIn.getUserId()%>' == '<%=mypage %>' || blockedLoggedInList.includes(u.profileUserId)) return;
							html+="<div class='whiteArea' style='display:inline; margin-right:2px;'></div>";
							html+="<div class='darkArea' style='display:inline;'><button type='button' value='"+u.profileUserId+"' class='btn btn-light' onclick='unblocker(this);''>Unblock</button></div>";
						}
						else {
							html+="<div class='whiteArea' style='display:inline; margin-right:2px;'><button type='button' class='btn btn-success' value='"+u.profileUserId+"' onclick='follower(this);'>Follow</button></div>";
							html+="<div class='darkArea' style='display:inline;'><button type='button' class='btn btn-dark' value='"+u.profileUserId+"' onclick='blocker(this);'>Block</button></div>";
						}
					}else if(u.profileUserId == '<%=userLoggedIn.getUserId()%>'){
						
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
						
						html+="<tr>";
						html+="<td>";
						html+="<div class='firstRow'>";
						html+="<img src='<%=request.getContextPath() %>/upload/profile/"+u.profileRenamedFilename+"' class='header-profile-circle'  width='40' height='40' />";
						html+="<a href='<%=request.getContextPath() %>/story/storyMain?mypage="+u.profileUserId+"' class='followerURL'>"+u.profileUserNickname+"</a>";
						if(u.profileUserType=='S'){
							html+="<img src='<%=request.getContextPath() %>/img/checkmark.png' alt='''  width='20' height='20'  />";
						}		
						html+="&nbsp;<span class='followerId'>@"+u.profileUserId+"</span>";
						html+="</div>"
						html+="<div class='ub-btns'>"
							if(u.profileUserId != '<%=userLoggedIn.getUserId()%>'){
								if(followLoggedInList.includes(u.profileUserId)){
									html+="<div class='whiteArea' style='display:inline; margin-right:2px;'><button type='button' class='btn btn-danger' class='followerBtn' style='margin-right:2px;' value='"+u.profileUserId+"' onclick='unfollower(this);'>Unfollow</button></div>";
									html+="<div class='darkArea' style='display:inline;'></div>";
								}
								else if(blockLoggedInList.includes(u.profileUserId)){
									if('<%=userLoggedIn.getUserId()%>' == '<%=mypage %>' || blockedLoggedInList.includes(u.profileUserId)) return;
									html+="<div class='whiteArea' style='display:inline; margin-right:2px;'></div>";
									html+="<div class='darkArea' style='display:inline;'><button type='button' value='"+u.profileUserId+"' class='btn btn-light' onclick='unblocker(this);''>Unblock</button></div>";
								}
								else {
									html+="<div class='whiteArea' style='display:inline; margin-right:2px;'><button type='button' class='btn btn-success' value='"+u.profileUserId+"' onclick='follower(this);'>Follow</button></div>";
									html+="<div class='darkArea' style='display:inline;'><button type='button' class='btn btn-dark' value='"+u.profileUserId+"' onclick='blocker(this);'>Block</button></div>";
								}
							}else if(u.profileUserId == '<%=userLoggedIn.getUserId()%>'){
								
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
						
						html+="<tr>";
						html+="<td>";
						html+="<div class='firstRow'>";
						html+="<img src='<%=request.getContextPath() %>/upload/profile/"+u.profileRenamedFilename+"' class='header-profile-circle'  width='40' height='40' />";
						html+="<a href='<%=request.getContextPath() %>/story/storyMain?mypage="+u.profileUserId+"' class='followerURL'>"+u.profileUserNickname+"</a>";
						if(u.profileUserType=='S'){
							html+="<img src='<%=request.getContextPath() %>/img/checkmark.png' alt='''  width='20' height='20'  />";
						}		
						html+="&nbsp;<span class='followerIntro'>@"+u.profileUserId+"</span>";
						html+="</div>"
						html+="<div class='ub-btns'>"
							if(u.profileUserId != '<%=userLoggedIn.getUserId()%>'){
								if(followLoggedInList.includes(u.profileUserId)){
									html+="<div class='whiteArea' style='display:inline; margin-right:2px;'><button type='button' class='btn btn-danger' class='followerBtn' style='margin-right:2px;' value='"+u.profileUserId+"' onclick='unfollower(this);'>Unfollow</button></div>";
									html+="<div class='darkArea' style='display:inline;'></div>";
								}
								else if(blockLoggedInList.includes(u.profileUserId)){
									if('<%=userLoggedIn.getUserId()%>' == '<%=mypage %>' || blockedLoggedInList.includes(u.profileUserId)) return;
									html+="<div class='whiteArea' style='display:inline; margin-right:2px;'></div>";
									html+="<div class='darkArea' style='display:inline;'><button type='button' value='"+u.profileUserId+"' class='btn btn-light' onclick='unblocker(this);''>Unblock</button></div>";
								}
								else {
									html+="<div class='whiteArea' style='display:inline; margin-right:2px;'><button type='button' class='btn btn-success' value='"+u.profileUserId+"' onclick='follower(this);'>Follow</button></div>";
									html+="<div class='darkArea' style='display:inline;'><button type='button' class='btn btn-dark' value='"+u.profileUserId+"' onclick='blocker(this);'>Block</button></div>";
								}
							}else if(u.profileUserId == '<%=userLoggedIn.getUserId()%>'){
								
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
							
							
							html+="<tr>";
							html+="<td>";
							html+="<div class='firstRow'>";
							html+="<img src='<%=request.getContextPath() %>/upload/profile/"+u.profileRenamedFilename+"' class='header-profile-circle'  width='40' height='40' />";
							html+="<a href='<%=request.getContextPath() %>/story/storyMain?mypage="+u.profileUserId+"' class='followerURL'>"+u.profileUserNickname+"</a>";
							if(u.profileUserType=='S'){
								html+="<img src='<%=request.getContextPath() %>/img/checkmark.png' alt='''  width='20' height='20'  />";
							}		
							html+="&nbsp;<span class='followerIntro'>@"+u.profileUserId+"</span>";
							html+="</div>"
							html+="<div class='ub-btns'>"
							if(u.profileUserId != '<%=userLoggedIn.getUserId()%>'){
								if(followLoggedInList.includes(u.profileUserId)){
									html+="<div class='whiteArea' style='display:inline; margin-right:2px;'><button type='button' class='btn btn-danger' class='followerBtn' style='margin-right:2px;' value='"+u.profileUserId+"' onclick='unfollower(this);'>Unfollow</button></div>";
									html+="<div class='darkArea' style='display:inline;'></div>";
								}
								else if(blockLoggedInList.includes(u.profileUserId)){
									if('<%=userLoggedIn.getUserId()%>' == '<%=mypage %>' || blockedLoggedInList.includes(u.profileUserId)) return;
									html+="<div class='whiteArea' style='display:inline; margin-right:2px;'></div>";
									html+="<div class='darkArea' style='display:inline;'><button type='button' value='"+u.profileUserId+"' class='btn btn-light' onclick='unblocker(this);''>Unblock</button></div>";
								}
								else {
									html+="<div class='whiteArea' style='display:inline; margin-right:2px;'><button type='button' class='btn btn-success' value='"+u.profileUserId+"' onclick='follower(this);'>Follow</button></div>";
									html+="<div class='darkArea' style='display:inline;'><button type='button' class='btn btn-dark' value='"+u.profileUserId+"' onclick='blocker(this);'>Block</button></div>";
								}
							}else if(u.profileUserId == '<%=userLoggedIn.getUserId()%>'){
								
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
							
							
							html+="<tr>";
							html+="<td>";
							html+="<div class='firstRow'>";
							html+="<img src='<%=request.getContextPath() %>/upload/profile/"+u.profileRenamedFilename+"' class='header-profile-circle'  width='40' height='40' />";
							html+="<a href='<%=request.getContextPath() %>/story/storyMain?mypage="+u.profileUserId+"' class='followerURL'>"+u.profileUserNickname+"</a>";
							if(u.profileUserType=='S'){
								html+="<img src='<%=request.getContextPath() %>/img/checkmark.png' alt='''  width='20' height='20'  />";
							}		
							html+="&nbsp;<span class='followerIntro'>@"+u.profileUserId+"</span>";
							html+="</div>"
							html+="<div class='ub-btns'>"
								if(u.profileUserId != '<%=userLoggedIn.getUserId()%>'){
									if(followLoggedInList.includes(u.profileUserId)){
										html+="<div class='whiteArea' style='display:inline; margin-right:2px;'><button type='button' class='btn btn-danger' class='followerBtn' style='margin-right:2px;' value='"+u.profileUserId+"' onclick='unfollower(this);'>Unfollow</button></div>";
										html+="<div class='darkArea' style='display:inline;'></div>";
									}
									else if(blockLoggedInList.includes(u.profileUserId)){
										if('<%=userLoggedIn.getUserId()%>' == '<%=mypage %>' || blockedLoggedInList.includes(u.profileUserId)) return;
										html+="<div class='whiteArea' style='display:inline; margin-right:2px;'></div>";
										html+="<div class='darkArea' style='display:inline;'><button type='button' value='"+u.profileUserId+"' class='btn btn-light' onclick='unblocker(this);''>Unblock</button></div>";
									}
									else {
										html+="<div class='whiteArea' style='display:inline; margin-right:2px;'><button type='button' class='btn btn-success' value='"+u.profileUserId+"' onclick='follower(this);'>Follow</button></div>";
										html+="<div class='darkArea' style='display:inline;'><button type='button' class='btn btn-dark' value='"+u.profileUserId+"' onclick='blocker(this);'>Block</button></div>";
									}
								}else if(u.profileUserId == '<%=userLoggedIn.getUserId()%>'){
									
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
	console.log($(btn).prop('value'));
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
				
				followLoggedInList.pop(followLoggedInList.indexOf($(btn).val()));
				if('<%=userLoggedIn.getUserId()%>'=='<%=mypage %>'){
					$(btn).parent().parent().parent().remove();
					return;
				}
				
				
				$(btn).parent().next().html("<button type='button' class='btn btn-dark' value='"+$(btn).val()+"' onclick='blocker(this);'>Block</button>");
				
				$(btn).removeClass("btn-danger");
				$(btn).addClass("btn-success");
				$(btn).html("Follow");
				$(btn).off('click');
				$(btn).on('click', follower);
				
				
				
				
				
			},
			error : function(data){
				console.log("ajax처리실패");
			},
			complete: function(data){
				followLoggedInList.splice(followLoggedInList.indexOf($(btn).val),1);
			}
		}) 

	}
	
function follower(btn){
	console.log($(btn).prop('value'));
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
			
			
			followLoggedInList.push($(btn).val());

			if('<%=userLoggedIn.getUserId()%>'=='<%=mypage %>'){
				$(btn).parent().parent().parent().remove();
				return;
			}
			
			$(btn).parent().next().html('');
			
			$(btn).removeClass("btn-success");
			$(btn).addClass("btn-danger");
			$(btn).html("Unfollow");
			$(btn).off('click')
			$(btn).on('click', unfollower);
			
			
			
		},
		error : function(data){
			console.log("ajax처리실패");
		},
		complete: function(data){
			followLoggedInList.push($(btn).val());
			
		}
	}) 

}
function blocker(btn){
	console.log($(btn).prop('value'));
	var param={
			userBlocking : '<%=userLoggedIn.getUserId() %>',
			userBlocked : $(btn).val()    		
		}

		$.ajax({
			url : '<%=request.getContextPath()%>/gson/sns/block.do',
			data : param,
			dataType: 'json',
			type : 'post',
			success : function(data){
					blockLoggedInList.push($(btn).val());
					
					if('<%=userLoggedIn.getUserId()%>'=='<%=mypage %>'){
						$(btn).parent().parent().parent().remove();
						return;
					}
				
					$(btn).parent().prev().children().remove();
					$(btn).removeClass("btn-dark");
					$(btn).addClass("btn-light");
					$(btn).text("Unblock");
					$(btn).css("width", "105px");
					
					$(btn).off("click");
					$(btn).on("click", unblocker);
			},
			error : function(data){
				console.log("ajax처리실패");
			},
			complete: function(data){
				blockLoggedInList.push($(btn).val);
				
			}
		}) 
	
}

function unblocker(btn){
	var param={
			userBlocking : '<%=userLoggedIn.getUserId() %>',
			userBlocked : $(btn).val()    		
		}

		$.ajax({
			url : '<%=request.getContextPath()%>/gson/sns/unblock.do',
			data : param,
			dataType: 'json',
			type : 'post',
			success : function(data){
				blockLoggedInList.pop(blockLoggedInList.IndexOf($(btn).val()));
				
				$(btn).parent().prev().html("<button type='button' class='btn btn-success' value='"+$(btn).val()+"' onclick='follower(this);'>Follow</button>");

				$(btn).removeClass("btn-light");
				$(btn).addClass("btn-dark");
				$(btn).text("block");
				$(btn).css("width", "81.36px");
				
				$(btn).off("click");
				$(btn).on("click", blocker);
			},
			error : function(data){
				console.log("ajax처리실패");
			},
			complete: function(data){
				blockLoggedInList = [];
				
			}
		}) 
	
}

$(function(){
	  $(".return-top").hide(); 
	     
	     $(window).scroll(function () {
	         if ($(this).scrollTop() > 100) { 
	             $('.return-top').fadeIn();
	         } else {
	             $('.return-top').fadeOut();
	         }
	     });
	             
	     $('.return-top').click(function () {
	         $('body,html').animate({
	             scrollTop: 0 
	         }, 1000);  
	         return false;
	     });
	}); 


$("#searchSNS2").keyup(e=>{
	
   	var $sel = $(".sel");
   	var $li = $("#autoS2 li");
   	
   	if(e.key == "ArrowDown"){
   		if($sel.length == 0){
   			$li.eq(0).addClass("sel");
   		}	
   		else if($sel.is($li.last())){
   			
   		}
   		else{
   			$sel.removeClass("sel").next().addClass("sel");
   		}
   	}
   	else if(e.key == "ArrowUp"){
   		if($sel.length == 0){
   			
   		}	
   		else if($sel.is($li.first())){
   			$sel.removeClass("sel");
   		}
   		else{
   			$sel.removeClass("sel").prev().addClass("sel");
   		}
   	}
   	
   	else if(e.key == "Enter"){
   		$(e.target).val($sel.text());
   		$("#searchSNS2").val($(e.target).text());
   		$("#autoS2").hide().children().remove();
   		
   		location.href='<%=request.getContextPath() %>/story/storyMain?mypage='+$sel.text().substring($sel.text().lastIndexOf('@')+1);

   	}
   	else{
   		var search = $("#searchSNS2").val().trim();
   		if(search.length == 0){
   			return;
   		}else{
   			$.ajax({
   				url: "<%=request.getContextPath() %>/gson/sns/profileSNSList.do?search="+search,
   				type: "get",
   				dataType: "json",
   				success:function(data){
   					var html = "";
   					if(data==null || data.length==0){						
							$("#autoS2").hide();
   					}
   					else{	
   					$.each(data,(i,p)=>{				
   						html += "<li><img src='<%=request.getContextPath() %>/upload/profile/"+p.profileRenamedFilename+"' class='header-profile-circle'  width='20' height='20' />"+p.profileUserNickname+"@"+p.profileUserId+"</li>";		
   					});
						
					$("#autoS2").html(html)
							.fadeIn(200);
   					}	
   					
   					$("#autoS2 li").on("click", (e=>{						
   						$("#searchSNS2").val($(e.target).text());
   						//#autoComplete 감춤
   						$("#autoS2").hide().children().remove();
   						
   						location.href='<%=request.getContextPath() %>/story/storyMain?mypage='+$(e.target).text().substring($(e.target).text().lastIndexOf('@')+1);

  
   					})).hover(e=>{
   						$(e.target).addClass("sel").siblings().removeClass("sel");			
   					}, e=>{
   						$(e.target).removeClass("sel");
   					});
   					
   				},
   				error:function(){
   					
   				}
   			
   			});	
   		}
   	};
  


});
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

					<table class="followList" id="followerList">
					
					</table>
		    	</div>
			</div>
		
			<div id="tab2" class="tabcontent">
				<div class="followListContainer">
	
					<table class="followList" id="followingList">
					
					</table>
		    	</div>
			</div>
			<div id="tab3" class="tabcontent">
			<%if(userLoggedIn!=null && userLoggedIn.getUserId().equals(mypage)){ %>
				<div class="followListContainer">
			
					<table class="followList" id="followedList">
					
					</table>
		    	</div>
		    <% } else{%>
		    	<div class="followListContainer">

					<table class="followList" id="followerWithList">
					
					</table>
		    	</div>
		   	<%} %>
		    </div>
		    
		</div>
<table class="rightNav">
		<tr>
			<th style='font-size: 2em; float:left; padding-left:27px;'>빠른유저검색</th>
		</tr>
			<tr>
				<td><div>
						<img src="<%=request.getContextPath() %>/img/magnifying-glass.png" class="magni" width='20' height='20'/>
						<input type="search" class="searchSNS" id="searchSNS2" style='display:abolute;' />
						<ul id="autoS2" style="z-index:99;">
						
						</ul>
					</div>
				</td>
			</tr>
	    </table>
	    
	   <div class='return-top'>맨 위로 가기</div>

		