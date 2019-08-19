<%@page import="java.util.List"%>
<%@page import="user.model.vo.User"%>
<%@page import="sns.model.service.SNSService"%>
<%@page import="sns.model.vo.ProfileSNS"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	User userLoggedIn = (User) session.getAttribute("userLoggedIn");
	ProfileSNS profile = new SNSService().selectOneProfile(userLoggedIn.getUserId());
	List<String> blockLoggedInList = new SNSService().selectOneIdBlock(userLoggedIn.getUserId());
%>
<style>
table.blackList{
	width: 527px;
	border:1px solid black;
	
}
table.blackList td{
	width: 527px;
	padding: 8px;
}
table.blackList tr{
	width: 527px;
	border:1px solid black;
}
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
		text-align: left;
}

.sectionContent {
	margin-left: 20px;
	flost: left;
	text-align: left;
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

.firstRow{
	margin-left: 5px;
	color: gray;
	float: left;
	diplay:inline;
	font-size:0.8em;
}

.firstRow .blackURL{
	font-weight: 700;
	font-size: 1.2em;
	color: black;
}

.ub-btns{
	display:inline;
	float:right;
}

</style>

<script>

var blockLoggedInList = new Array();

$(()=>{

	<%if(blockLoggedInList!=null){%>
	<%for(String id : blockLoggedInList){%>
		blockLoggedInList.push('<%=id%>');
	<%} }%>
	
	console.log(blockLoggedInList);
	
	var param = {
			userBlocking : '<%=userLoggedIn.getUserId()%>'
	}
	
	$.ajax({
		url:"<%=request.getContextPath() %>/gson/sns/blackList.do",
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
				html+="<a href='<%=request.getContextPath() %>/story/storyMain?mypage="+u.profileUserId+"' class='blackURL'>"+u.profileUserNickname+"</a>";
				if(u.profileUserType=='S'){
					html+="<img src='<%=request.getContextPath() %>/img/checkmark.png' alt='''  width='20' height='20'  />";
				}		
				html+="&nbsp;<span class='blackIntro'>@"+u.profileUserId+"</span>";
				html+="</div>"
				html+="<div class='ub-btns'>"

				html+="<div class='darkArea' style='display:inline;'><button type='button' value='"+u.profileUserId+"' class='btn btn-light' onclick='unblockerr(this);''>Unblock</button></div>";

				html+="</div>";	
				html+="</td>";
				html+="</tr>";
				
				$("#blackList").append(html);
			});
			
		},
		error: function(jqxhr, textStatus, errorThrown){
			console.log("ajax처리실패!");
			console.log(jqxhr, textStatus, errorThrown);
		}
	});

});



function unblockerr(btn){
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
				blockLoggedInList.pop($(btn).val());
				
				$(btn).parent().parent().parent().remove();
			},
			error : function(data){
				console.log("ajax처리실패");
			},
			complete: function(data){
				blockLoggedInList = [];
				
			}
		}) 
	
}

function headerTextModify(){
	
	var headertext = $("#SmodifyText").val();

	if(headertext.length==0){
		alert('내용을 입력해주세요.');
		return;
	}
	
	if(headertext.length>20){
		alert('최대 20글자까지 가능합니다.');
		return;
	}
	
	
	
}

</script>



<div id="setting-container">
	<form action="<%=request.getContextPath()%>/setting/updateSet?mypage="<%=userLoggedIn.getUserId()%>
		name="settingUpdateFrm" id="settingUpdateFrm" method="post"  enctype="multipart/form-data"
	><input type="hidden" name="setName" value="<%=userLoggedIn.getUserId()%>"/>
		<table>
			<tr>
				<td>
					<table>
						<tr>
							<th><span class="sectionTitle">프로필 수정</span></th>
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
					  		</span>
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
						<tr style='width:510px;'>
							<th class="sectionTitle" style='width:510px;'>레이아웃</th>
						</tr>
						<tr style='width:510px;'>
							<td class="sectionContent" style='width:510px;'>
								헤더 텍스트
								<%if(profile.getHeaderText() !=null){%>
								<input type="text" name="SmodifyText" onclick='headerTextModify();' id="SmodifyText"
								value='<%=profile.getHeaderText()%>' style="width:300px"/>
								<%} else{%>
								<input type="text" name="SmodifyText" onclick='headerTextModify();' id="SmodifyText"
								value='텍스트를 바꿔주세요!(20자 이내)' style="width:300px"/>
								<%} %>							
							</td>

						</tr>
						<tr style='width:510px;'>
							<td class="sectionContent" style='width:510px;'>헤더 이미지 <img
								src='<%=request.getContextPath()%>/upload/profile/<%=profile.getHeaderRenamedFilename()%>'
								class='header-profile' width='40' height='40' /> 
							 <input type="file" name="SmodifyHeader" id="SmodifyHeader" />
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
						<tr style='width:510px;'>
							<td class="sectionContent" style='width:510px; padding: 10px;'>테마 
							<input type="radio" value="#fec503"  name="themaColor"  id="themaColor" class="orange" style="margin: 0px 5px;"
							<% if(profile.getThemeColor() == null){%>checked<%}%>/>기본
							<input type="radio" value="red"  name="themaColor"   id="themaColor" class="red" style="margin: 0px 5px;"
							 <% if("red".equals(profile.getThemeColor())){%>checked<%}%>/>빨강
							<input type="radio" value="#007bff"  name="themaColor"   id="themaColor" class="red" style="margin: 0px 5px;"
							 <% if("#007bff".equals(profile.getThemeColor())){%>checked<%}%>/>파랑
							<input type="radio" value="green"  name="themaColor"   id="themaColor" class="red" style="margin: 0px 5px;"
							 <% if("green".equals(profile.getThemeColor())){%>checked<%}%>/>초록
						</tr>
						
						<tr style='width:510px;'>
							<th colspan="2"><input type="submit" class="btn btn-outline-warning" value="변경하기"/></th>
						
						</tr>
					</table>
				</td>
			</tr>
			<tr>
				<th class="sectionTitle">블랙리스트 
				</th>
			</tr>
			<tr><td class="sectionContent">
				<div class="BlackListContainer">
	
					<table class="blackList" id="blackList">
	
					</table>
		    
				</div>
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