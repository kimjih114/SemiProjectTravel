<%@page import="user.model.vo.User"%>
<%@page import="sns.model.service.SNSService"%>
<%@page import="sns.model.vo.ProfileSNS"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	User userLoggedIn = (User) session.getAttribute("userLoggedIn");
	ProfileSNS profile = new SNSService().selectOneProfile(userLoggedIn.getUserId());
%>
<style>
#setting-container {
	width: 1000px;
	margin: 0 auto;
	text-align: center;
	position: absolute;
	left: 220px;
	transition: 0.5s;
	top: 50px;
}

.sectionTitle {
	font-size: 1.5em;
	font-weight: 700px;
	float: left;
}

.sectionContent {
	margin-left: 20px;
}

#setting-container td {
	float: left;
	padding: 10px;
	marign: 10px;
}

.header-profile-circle {
	margin-right: 5px;
	border: 1px solid black;
	border-radius: 100%;
}

#namePanel {
	background: white;
	z-index: 1;
}

#profileSection {
	position: relative;
}

#namePanel {
	position: absolute;
	left: 345px;
	top: 19px;
	width: 100px;
	padding: 0px;
}
</style>





<div id="setting-container">
	<form action="<%=request.getContextPath()%>/setting/updateSet?mypage="<%=userLoggedIn.getUserId()%>
		name="settingUpdateFrm" id="settingUpdateFrm" method="post"  enctype="multipart/form-data"
	><input type="hidden" name="setName" value="<%=userLoggedIn.getUserId()%>"/>
		<table>
			<tr>
				<td>
					<table>
						<tr>
							<td><span class="sectionTitle">프로필 수정</span></td>
						</tr>
						<tr>
							<td class="sectionContent">닉네임 
							<input type="text" name="SmodifyNick" id="SmodifyNick"
								value="<%=profile.getProfileUserNickname()%>" />
							</td>
						</tr>
						<tr>
							<td class="sectionContent" id="profileSection">프로필 이미지
							 <img src='<%=request.getContextPath()%>/upload/profile/<%=profile.getProfileRenamedFilename()%>'
								class='header-profile-circle' width='40' height='40' />
							<input type="file" name="SmodifyProfile" id="SmodifyProfile" class="btn btn-outline-secondary"/> <br />
							  <span id="fname"> 
					 		 <%=profile.getProfileOriginalFilename()!=null? profile.getProfileRenamedFilename():""%>
					  		</span> <%--첨부파일이 있는 경우 기존파일 삭제용 --%>
					   		<%if(profile.getProfileOriginalFilename()!=null){ %><br /> 
							<input type="checkbox" name="delFile" id="delFile" /> 
							<label for="delFile">첨부파일삭제</label>
							 <% } %> 
							<input type="hidden" name="oldprofileOName" value="<%=profile.getProfileOriginalFilename()!=null?profile.getProfileOriginalFilename():""%>" />
							<input type="hidden" name="oldprofileRName" value="<%=profile.getProfileRenamedFilename()!=null?profile.getProfileRenamedFilename():""%>" />
						
							</td>


						</tr>
					</table>
				</td>
			</tr>
			<tr>
				<td>
					<table>
						<tr>
							
							<th class="sectionTitle">레이아웃</th>
							<td>
								<input type="text" name="SmodifyText" id="SmodifyText"
								value='<%=profile.getHeaderText()%>'/>
							
							</td>

						</tr>
						<tr>
							<td class="sectionContent">헤더 이미지 <img
								src='<%=request.getContextPath()%>/upload/profile/<%=profile.getHeaderRenamedFilename()%>'
								class='header-profile' width='40' height='40' /> 
								<input type="file" name="SmodifyHeader" id="SmodifyHeader" /> <br />
							 <span id="fname"> 
					 		 <%=profile.getHeaderOriginalFilename()!=null? profile.getHeaderRenamedFilename():""%>
					  		</span> <%--첨부파일이 있는 경우 기존파일 삭제용 --%>
					   		<%if(profile.getHeaderOriginalFilename()!=null){ %><br /> 
							<input type="checkbox" name="delFile" id="delFile" /> 
							<label for="delFile">첨부파일삭제</label>
							 <% } %> 
							<input type="hidden" name="oldHeaderOName" value="<%=profile.getProfileOriginalFilename()!=null?profile.getProfileOriginalFilename():""%>" />
							<input type="hidden" name="oldHeaderRName" value="<%=profile.getHeaderRenamedFilename()!=null?profile.getProfileRenamedFilename():""%>" />
						

							</td>
						</tr>
						<tr>
							<td class="sectionContent">테마 
							<input type="radio" value="#fec503"  name="themaColor"  id="themaColor" class="orange"
							<% if(profile.getThemeColor() == null){%>checked<%}%>/>기본
							<input type="radio" value="red"  name="themaColor"   id="themaColor" class="red"
							 <% if("red".equals(profile.getThemeColor())){%>checked<%}%>/>빨강
							<input type="radio" value="#007bff"  name="themaColor"   id="themaColor" class="red"
							 <% if("#007bff".equals(profile.getThemeColor())){%>checked<%}%>/>파랑
							<input type="radio" value="green"  name="themaColor"   id="themaColor" class="red"
							 <% if("green".equals(profile.getThemeColor())){%>checked<%}%>/>초록
						</tr>
						
						<tr>
							<th colspan="2"><input type="submit" class="btn btn-outline-warning" value="변경하기"/></th>
						
						</tr>
					</table>
				</td>
			</tr>

		</table>
	</form>
</div>

<script>
	$("[name=SmodifyHeader]").change(function(){
		console.log($(this).val());
			//사용자가 파일선택한경우 
			if(($this).val() != ""){
				$("#fname").hide(); 
				$("#delFile").hide().next().hide();
			}else{
				$("#fname").show();
				
				$("#delFile").show().next().show();
			}
		});
	$("[name=SmodifyProfile]").change(function(){
		console.log($(this).val());
			//사용자가 파일선택한경우 
			if(($this).val() != ""){
				$("#fname").hide(); 
				$("#delFile").hide().next().hide();
			}else{
				$("#fname").show();
				
				$("#delFile").show().next().show();
			}
		});
	
	
</script>