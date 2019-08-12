<%@page import="sns.model.vo.ProfileSNS"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String mypage = request.getParameter("mypage");
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
	border:1px solid black;
	padding: 10px;
	border-collapse: collapse;
}
#followerSearch{
	width: 200px;
	float:left;
	margin: 10px;
}

</style>
<script>
$(()=>{
	var param = {
			mypage : '<%=mypage%>'
	}
	$.ajax({
		url:"<%=request.getContextPath() %>/gson/sns/followOneList.do",
		type:"get",
		data:param,
		dataType:"json",
		success: function(data){
			console.log(data);
			var html='';
			$(data).each((i,u)=>{
				html = "<tr>";
				html += "<td>"+u.userId+"</td>";
				html += "<td>"+u.userNickname+"</td>";
				html += "<td>"+u.userIntroduce+"</td>";
				html += "</tr>";
				console.log(html);
			
			});
			
			$(".followList").html(html);
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
	})
});

</script>

 <div id="follower-container">
			<ul class="tab">
				<li class="current" data-tab="tab1"><a>팔로워</a></li>
				<li data-tab="tab2"><a>내가 팔로우한 사람</a></li>
				<li data-tab="tab3"><a>나를 팔로우한 사람</a></li>
			</ul>
		
			<div id="tab1" class="tabcontent current">
				<div class="followListContainer">
					<input type="search" name="followerSearch" id="followerSearch" />
					<table class="followList">
						
					</table>
		    	</div>
			</div>
		
			<div id="tab2" class="tabcontent">
				<h3>좋아요</h3>
				<p>Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of "de Finibus Bonorum et Malorum" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, "Lorem ipsum dolor sit amet..", comes from a line in section 1.10.32.</p>
			</div>
			<div id="tab3" class="tabcontent">
				<h3>좋아요</h3>
				<p>Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of "de Finibus Bonorum et Malorum" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, "Lorem ipsum dolor sit amet..", comes from a line in section 1.10.32.</p>
			</div>

		</div>