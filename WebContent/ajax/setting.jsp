<%@page import="user.model.vo.User"%>
<%@page import="sns.model.service.SNSService"%>
<%@page import="sns.model.vo.ProfileSNS"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	User userLoggedIn = (User)session.getAttribute("userLoggedIn");
	ProfileSNS profile = new SNSService().selectOneProfile(userLoggedIn.getUserId());

%>
 <style>
#setting-container {
	width:1000px;
	margin:0 auto;
	text-align:center;
	position: absolute;
	left:220px;
	transition: 0.5s;
	top:50px;
}
.sectionTitle{
	font-size: 1.5em;
	font-weight: 700px;
	float:left;
	
}
.sectionContent{
	margin-left:20px;
}


#setting-container td{
	float:left;
	padding:10px;
	marign:10px;
}
.header-profile-circle{
	margin-right: 5px;
	border: 1px solid black;
	border-radius : 100%;
}
#namePanel{
	background: white;
	z-index:1;
}

#profileSection{
	position: relative;
}

#namePanel{
	position: absolute;
	left:205px;
	top:19px;
	width:100px;
	padding:0px;
	
}
 
 </style>
 <div id="setting-container">
 <form action="">
	<table>
		<tr>
			<td>
				<table>
					<tr>
						<td>
							<span class="sectionTitle">프로필 수정</span>
						</td>
					</tr>
					<tr>
						<td class="sectionContent">닉네임
							<input type="text" name="SmodifyNick" id="SmodifyNick" value="<%=profile.getProfileUserNickname() %>" />
						</td>
					</tr>
					<tr>
						<td class="sectionContent" id="profileSection">
							<img src='<%=request.getContextPath() %>/upload/profile/<%=profile.getProfileRenamedFilename() %>' class='header-profile-circle'  width='40' height='40' />
							프로필 이미지
							<input type="file" name="SmodifyProfile" id="SmodifyProfile" />
							<div id="namePanel"><%=profile.getProfileOriginalFilename() %></div>
						</td>
					</tr>
				</table>
			</td>
		</tr>
		<tr>
			<td>
				<table>
					<tr>
						<td>
							<span class="sectionTitle">레이아웃</span>
						</td>
					</tr>
					<tr>
						<td class="sectionContent">헤더 이미지
							<input type="file" name="SmodifyHeader" id="SmodifyHeader" />
						</td>
					</tr>
					<tr>
						<td class="sectionContent">테마
							
					
						</td>
					</tr>
				</table>
			</td>
		</tr>
		
	</table>
	</form>
</div>

<script>


</script>