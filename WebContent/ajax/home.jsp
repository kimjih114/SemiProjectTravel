<%@page import="sns.model.service.SNSService"%>
<%@page import="user.model.service.UserService"%>
<%@page import="user.model.vo.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%
	User userLoggedIn = (User)session.getAttribute("userLoggedIn");
	String mypage = request.getParameter("mypage");
	User mypageUser = new UserService().selectOne(mypage);
 	
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

#autoS{
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
#autoS li{
	padding: 0 10px;
	list-style: none;
	z-index:10;
	cursor: pointer;
	width:182px;
}
#autoS li.sel{
	background: gray;
	color: white;
	z-index:10;
}



#tab-container {
	width:540px;
	margin:0 auto;
	text-align:center;
	position: absolute;
	left:220px;
	transition: 0.5s;
	top:50px;
}


#tab-container .tab {
	list-style: none;
	margin: 0;
	padding: 0;
	overflow: hidden;
}
/* Float the list items side by side */
#tab-container .tab li {
	float: left;
	width: 33.3333%;
	border-bottom: 1px solid;
}
/* Style the links inside the list items */
#tab-container .tab li a {
	display: inline-block;
	color: #000;
	text-align: center;
	text-decoration: none;
	padding: 14px 16px;
	font-size: 1em;
	transition:0.3s;
	cursor: pointer;
}
/* Style the tab content */
#tab-container .tabcontent {
	display: none;
	background-color:black;
	padding: 6px 5px;
	color:#fff;
}
#tab-container ul.tab li.current{
	background-color: #fed136;
	color: #222;
	border:1px solid;
	border-bottom: 0;
}
#tab-container .tabcontent.current {
	display: block;
	background: white;
	color: black;
	border: 1px solid;
	border-top: 0px;
	border-collapse: collapse;
	
}

#post{
	position: absolute;
	top:10px;
	left: 698px;
	border: 1px solid;
}

#post{
	cursor: pointer;
}
#postFrm{
	width:540px;
	margin:0 auto;
	text-align:center;
	position: absolute;
	left:220px;
	top: 50px;
	display:none;
	border : 1px solid;
	border-collapse: collapse;
	padding: 10px;
	z-index: 99;
	background: white;
}


#postFrm td{
	padding: 10px;
	width: 520px;
	text-align:left;
	/* border:1px solid;
	border-collpase: collapse; */
}
#postFrm td.review-img{
	padding-top: 0px;
	width: 50px;
	height: 50px;
}


.imgs_wrap{
	display:none;
	text-align: center;
    vertical-align: middle;
    table-layout: fixed;
    width:100%;
}

.imgs_wrap img{
	width: 95px;
	height: 95px;
	margin: 0 2px;
}

.imgs{
	display: table-cell;
	max-width: 100px;
	font-size:0.8em;
}



</style>
    <!-- post폼 -->
<button id="post" class="btn btn-primary">post</button>
	<form action="" name="snsUpload"
					id="snsUpload"
					method="post"
					enctype="multipart/form-data">
	<table id="postFrm">
		<tr>
			<td style="font-weight: 700;">소중한 여행후기를 공유해주세요!</td>
		</tr>
		<tr>
			<td style="padding-bottom: 0px;">
				<div class="travelsrch"></div>
			</td>
		</tr>
		<tr>
			<td>
				<label for="reviewContent" style="font-weight: 700;">어떤 여행을 하셨나요?</label>
				<textarea name="reviewContent" id="reviewContent" cols="59" rows="5" required></textarea>
				<div id="contentIdList">
				</div>
			</td>
		</tr>
		<tr>
			<td style="margin-bottom:3px;">
					<label for="" style="font-weight: 700;">첨부이미지</label>
					<span style="font-size:0.5em; color:gray;">최대 5개까지 등록 가능합니다.</span><br>
					
					<input name="fileupload" id="fileupload" type="file" accept="image/*" style="margin-bottom:10px;" multiple />
					<div style="display:table;">
						<div class="imgs_wrap">
						
						
						</div>
					</div>	
			</td>
		</tr>
		<tr>
			<td>
					<input type="radio" name="boardtype" id="public" value="P" checked />
					<label for="public">전체공개</label> &nbsp;
					<input type="radio" name="boardtype" id="followOnly" value="F" />
					<label for="followOnly">팔로워공개</label> &nbsp;
					<input type="radio" name="boardtype" id="locked" value="L" />
					<label for="locked">비공개</label>
				<br>
				<input type="submit" id="btnSubmit" class='btn btn-primary' value="포스트 등록" style="float:right; margin-top : 10px;">
			</td>
		</tr>
	</table>
</form>

<!-- 게시글 -->
  
		  <div id="tab-container">
			<ul class="tab">
				<li class="current" data-tab="tab1"><a>타임라인</a></li>			
				<li data-tab="tab2"><a><%=userLoggedIn!=null && userLoggedIn.getUserId().equals(mypage) ? "나의리뷰" : mypageUser.getUsernickName() + "의리뷰" %></a></li>
				<li data-tab="tab3"><a><%=userLoggedIn!=null && userLoggedIn.getUserId().equals(mypage) ? "좋아요" : mypageUser.getUsernickName() +"의좋아요" %></a></li>
			</ul>
		
			<div id="tab1" class="tabcontent current">
			
				<div class='timeline-board-sns' id='newPost1'>
				
				
				</div>	
				
				<div id="tab1Content">
				
				
				</div>
			</div>
			
			<div id="tab2" class="tabcontent">
				
				<div class='timeline-board-sns' id='newPost2'>
				
				
				</div>	
				
				<div id="tab2Content">
				
				
				</div>
			
			</div>
		
		
		
			<div id="tab3" class="tabcontent">
			
			
				<div id="tab3Content"></div>
				
				</div>
		
	
			</div>
		
		<table class="rightNav">
		<tr>
			<th style='font-size: 2em; float:left; padding-left:27px;'>빠른유저검색</th>
		</tr>
			<tr>
				<td><div>
						<img src="<%=request.getContextPath() %>/img/magnifying-glass.png" class="magni" width='20' height='20'/>
						<input type="search" class="searchSNS" id="searchSNS1" style='display:abolute;' />
						<ul id="autoS" style="z-index:99;">
						
						</ul>
					</div>
				</td>
			</tr>
	    </table>
	    
	   <div class='return-top'>맨 위로 가기</div>

		
<script>
var newPostHtml = '';

document.addEventListener('keydown', function(event) {
    if (event.keyCode === 13) {
        event.preventDefault();
    }
}, true);

var filesTempArr = [];

$(function() {
	$.ajax({
		url: "<%=request.getContextPath() %>/ajax/mytimeline.jsp", 
		data: "mypage="+'<%=mypage %>',
		type: "get",
		dataType: "html",
		success: function(data){
			$("#tab1Content").html(data);
			$("#newPost1").html('');
		},
		error: function(jqxhr, textStatus, errorThrown){
			console.log("ajax처리실패!");
			console.log(jqxhr, textStatus, errorThrown);
		}, complete: function(){
				
			}
	});

	
	
	
	$('ul.tab li').click(function() {
		var activeTab = $(this).attr('data-tab');
		$('ul.tab li').removeClass('current');
		$('.tabcontent').removeClass('current');
		$(this).addClass('current');
		$('#' + activeTab).addClass('current');

		if($(this).attr('data-tab')=='tab1'){
			
				$.ajax({
					url: "<%=request.getContextPath() %>/ajax/mytimeline.jsp", 
					data: "mypage="+'<%=mypage %>',
					type: "get",
					dataType: "html",
					success: function(data){
						$("#tab1Content").html(data);
						$("#newPost1").html('');
					},
					error: function(jqxhr, textStatus, errorThrown){
						console.log("ajax처리실패!");
						console.log(jqxhr, textStatus, errorThrown);
					}, complete: function(){
	 					
	 				}
				});

			
			}
		
		
		 if($(this).attr('data-tab')=='tab2'){
			
				$.ajax({
					url: "<%=request.getContextPath() %>/ajax/myboardlist.jsp", 
					data: "mypage="+'<%=mypage %>',
					type: "get",
					dataType: "html",
					success: function(data){
						$("#tab2Content").html(data);
						$("#newPost2").html('');
					},
					error: function(jqxhr, textStatus, errorThrown){
						console.log("ajax처리실패!");
						console.log(jqxhr, textStatus, errorThrown);
					}, complete: function(){
	 					
	 				}
				});

			
		}
		
		if($(this).attr('data-tab')=='tab3'){
		
				$.ajax({
					url: "<%=request.getContextPath() %>/ajax/mylikelist.jsp", 
					data: "mypage="+'<%=mypage %>',
					type: "get",
					dataType: "html",
					success: function(data){
						$("#tab3Content").html(data);
			
					},
					error: function(jqxhr, textStatus, errorThrown){
						console.log("ajax처리실패!");
						console.log(jqxhr, textStatus, errorThrown);
					}, complete: function(){
	 					
	 				}
				});

			
		}

	})
});


$(()=>{
 
 	$(".unlikes").on('click', function(){
 		if($(this).val()!=null){
 		
 			
 			
 			$.ajax({
 				url: "<%=request.getContextPath() %>/ajax/travelsrch.jsp", 
 				type: "get",
 				dataType: "html",
 				success: function(data){
 					$(this).removeClass('unlikes');
 					$(this).addClass('likes');
 					$(this).children('img').html('').html("<img src='<%=request.getContextPath() %>/img/beforelike.png' alt='' style='padding-top:2px; padding-bottom:-2px; width: 20px; height:20px'/>");
 				
 				},
 				error: function(jqxhr, textStatus, errorThrown){
 					console.log("ajax처리실패!");
 					console.log(jqxhr, textStatus, errorThrown);
 				}
 			});
 		}
 	})	
})

$("#post").click(function(){
	
	if($(".snsModify").length>0){
		return;
	}
	
	$(this).text("back").css("left","695px");
	
	if($("#postFrm").css('display')=='block'){
		$("#postFrm").css('display', 'none');
		$("#tab-container").css("opacity", "1");
		$("#post").text("post").css("left","698px");
		return;
	}
	
	contentids = [];
	grades=[];
	filesTempArr=[];
	contenttypes=[];
	contentthumbnails  = [];
	contenttitles = [];
	contentaddresses = [];
	
	$("#postFrm").css('display', 'none');
	$("#tab-container").css("opacity", "1");
	$("#fileupload").val("");
	$("#reviewContent").val('');
	$(".imgs").remove();
	$("#public").prop('checked', true);
	
	$("#postFrm").css('display', 'block');
	$("#tab-container").css("opacity", "0.5");
	$.ajax({
		url: "<%=request.getContextPath() %>/ajax/travelsrch.jsp", 
		type: "get",
		dataType: "html",
		success: function(data){
			$(".travelsrch").html(data);
		},
		error: function(jqxhr, textStatus, errorThrown){
			console.log("ajax처리실패!");
			console.log(jqxhr, textStatus, errorThrown);
		}
	});
	
})

var sel_files=[];

$(document).ready(function(){
	if($(".imgs").length==0){
		$(".imgs_wrap").css("display", "none");
	}
	$("#fileupload").on("change", handleImgsFilesSelect);
});

function handleImgsFilesSelect(e){
	if($(".imgs").length>0){
		$(".imgs").each(function(){
			$(this).remove();
		})
	};
		$(".imgs_wrap").css("display", "block");
	
	var files = e.target.files;
	var filesArr = Array.prototype.slice.call(files);
	var filesArrLen = filesArr.length;
	var filesTempArrLen = filesTempArr.length;
	
	if(filesArrLen>5){	
		$("#fileupload").val("");
		alert("첨부파일은 5개까지만 가능합니다.");
		return;
	}

	for(var i=0; i<filesArrLen; i++){
		filesTempArr.push(filesArr[i]);
	}
	
	filesArr.forEach(function(f){
		if(!f.type.match("image.*")){
			$("#fileupload").val("");
			alert(f.name+"은(는) 이미지가 아닙니다.");
			return;
		}
	
		sel_files.push(f);
		
		var reader = new FileReader();
		reader.onload = function(e){
			var html = "<div class='imgs'><img src=\""+e.target.result+"\" />";
		 	var filename = f.name;
		 	
		 	if(filename.length>7){
		 		var dot = filename.substring(filename.indexOf('.'));
		 		filename = filename.substr(0, 7) + "..." +  dot;
		 	}
			html += "<div><span>"+filename+"</span><br>";
			html += "<span>("+(f.size)/1000+"kb)</span><div></div>";
			$(".imgs_wrap").append(html);
			
		}
		reader.readAsDataURL(f);
	});
}

$("#btnSubmit").click(function(event){
	var formData = new FormData();
	
	event.preventDefault();
	
	var grades = [];
	
	if($(".contentid").length>0){
		$(".contentid").each(function(i, elem){
			var grade = $(this).parent().parent().parent().children('.starRev').children('.starR.on').length;
		   	grades.push(grade);
		});
	}

	 formData.append("boardWriter",'<%=userLoggedIn.getUserId() %>');
	 formData.append("boardContent", $("#reviewContent").val());
	 formData.append("boardType", $('input[name="boardtype"]:checked').val());
	 formData.append("contentId1",contentids[0]);
	 formData.append("contentId2",contentids[1]);
	 formData.append("contentId3",contentids[2]);
	 formData.append("contentType1", contenttypes[0]);
	 formData.append("contentType2", contenttypes[1]);
	 formData.append("contentType3", contenttypes[2]);
	 formData.append("contentThumbnail1", contentthumbnails[0]);
	 formData.append("contentThumbnail2", contentthumbnails[1]);
	 formData.append("contentThumbnail3", contentthumbnails[2]);
	 formData.append("contentTitle1", contenttitles[0]);
	 formData.append("contentTitle2", contenttitles[1]);
	 formData.append("contentTitle3", contenttitles[2]);
	 formData.append("contentAddress1", contentaddresses[0]);
	 formData.append("contentAddress2", contentaddresses[1]);
	 formData.append("contentAddress3", contentaddresses[2]);
	 formData.append("grade1",grades[0]);
	 formData.append("grade2",grades[1]);
	 formData.append("grade3",grades[2]);
	 	
		
	// 파일 데이터
	 for(var i=0, filesTempArrLen = filesTempArr.length; i<filesTempArrLen; i++) {
	    formData.append("file"+(i+1), filesTempArr[i]);
	    formData.append("filename"+(i+1), filesTempArr[i].name);
	 }

	
	$.ajax({
	     type : "POST",
	     url : "<%=request.getContextPath()%>/gson/sns/insertBoard.do",
	     data : formData,
	     enctype:"multipart/form-data",
	     processData: false,
	     contentType: false,
	     success : function(data) {
	         alert("게시글 등록 성공 :D!");
	         <%if(userLoggedIn.getUserId().equals(mypage)){%>
	         $.ajax({
					url: "<%=request.getContextPath()%>/gson/sns/boardOne.do",
					data: "boardNo="+data,
					type: "get",
					dataType: "json",
					success: function(data){
						if(data!=null){
							
							console.log(data);
							var html = "";
						
								html+="<div id='container"+data.boardSNS.boardNo+"'>";
								html+="<table class='tbl-boardsns' id='boardNo"+data.boardSNS.boardNo+"'>"
								html+="<tr>";
								html+="<td class='timeline-boardcontent-sns'>";
								html+="<img src='<%=request.getContextPath()%>/upload/profile/"+data.profileSNS.profileRenamedFilename+"' class='header-profile-circle' width='30' height='30' />";
								html+="<span style='font-weight: 600'><a class='nickname-sns' href='<%=request.getContextPath() %>/story/storyMain?mypage="+data.boardSNS.boardWriter+"'>"+data.profileSNS.profileUserNickname+"</a></span>";
								
								if(data.profileUserType=='S'){
									html+="<img src='<%=request.getContextPath() %>/img/checkmark.png' alt=''  width='20' height='20'  />";
								}		
								var type = '';
								if(data.boardSNS.boardType=='P'){
									type = '';
								}
								
								if(data.boardSNS.boardType=='F'){
									type = '(팔로워 공개)';
								}
								
								if(data.boardSNS.boardType=='L'){
									type = '(비공개)'
								}
							
								
								html+="<span style='font-weight: 600; color:black;'>"+type+"</span>";
								html+="<span style='font-size: 0.8em; color: gray;''>"+data.boardSNS.boardUpdateDate+"</span>";
								html+="<span style='float: right;'>";
								if(data.boardSNS.boardWriter=='<%=userLoggedIn.getUserId()%>'){
									html+="<button class='btn btn-success' onclick='updateBoardSNSFrm("+data.boardSNS.boardNo+")' style='margin-right:2px;'>수정</button>";
									html+="<button class='btn btn-danger' onclick='deleteBoardSNS("+data.boardSNS.boardNo+");'>삭제</button>";
								} 
								
								html+="</span>";
								html+="</td>";
								html+="</tr>";
								if(data.imageSNSList.length>0){
									html+="<tr>";
									html+="<td>"
									html+="<div id='carouselExampleControls"+data.boardSNS.boardNo+"' class='carousel slide' data-ride='carousel'>";
									html+="<div class='carousel-inner'>";
									for(j=0; j<data.imageSNSList.length; j++){
										if(j==0){
											html+="<div class='carousel-item active'>";
										} else if(j>0){
											html+="<div class='carousel-item'>";
										}
										html+="<img src='<%=request.getContextPath()%>/upload/board/"+data.imageSNSList[j].renamedFileName+"' class='d-block w-100' alt='...'>";
										html+="</div>";		
									}
									html+="</div>";
									html+="<a class='carousel-control-prev' href='#carouselExampleControls"+data.boardSNS.boardNo+"' role='button' data-slide='prev'>";
									html+="<span class='carousel-control-prev-icon' aria-hidden='true'></span>"
									html+="<span class='sr-only'>Previous</span>";
									html+="</a>";
									html+="<a class='carousel-control-next' href='#carouselExampleControls"+data.boardSNS.boardNo+"' role='button' data-slide='next'>";
									html+="<span class='carousel-control-next-icon' aria-hidden='true'></span>";
									html+="<span class='sr-only'>Next</span>";
									html+="</a>";
									html+="</div>";
									html+="</td>";
									html+="</tr>";
								}
								if(data.gradeSNSList.length>0){
									html+="<tr>";
									html+="<td style='padding:1px !important;'>";
									html+="<table>";
									html+="<tr>"
									for(k=0; k<data.gradeSNSList.length; k++){
										html+="<td class='tbl-td'>";
										html+="<div class='card h-100'>";
											html+="<a href='#' class='goInfo'>";
											html+="<img class='card-img-top' src='"+data.gradeSNSList[k].contentThumbnail+"'></a>";
											html+="<div class='caption'>";
											html+="<div class='caption-text' ><a href='<%=request.getContextPath()%>/travel/detailPage?contentId="+data.gradeSNSList[k].contentId+"&contentTypeId="+data.gradeSNSList[k].contentType+"' target='_blank'>"+data.gradeSNSList[k].contentTitle+"</a>";
											html+="<div class='contentid' style='display:none'>"+data.gradeSNSList[k].contentId+"</div></h4>"
											if(data.gradeSNSList[k].contentAddress!=null){
												html+="<p class='card-text'>"+data.gradeSNSList[k].contentAddress+"</p>"
											}
											html+="</div>"
											html+="</div>"
											html+="</div>"
											
											html+="<div class='starRev'>"
												for(var l=0; l<data.gradeSNSList[k].grade; l++){
													html+="<span class='starR on'>별</span>";
												}
												for(var m=0; m<5-data.gradeSNSList[k].grade; m++){
													html+="<span class='starR'>별</span>";
												}
											html+="</div>";
											html+="</td>";
									}
										html+="</tr>";
										html+="</table>";
										html+="</td>";
									html+="</tr>";
								}		
								
								if(data.boardSNS.boardContent!=null){
									html+="<tr>";
									html+="<td class='timeline-boardcontent-sns' style='text-align:left; padding: 10px; margin:10px;'><a class='nickname-sns' href='<%=request.getContextPath() %>/story/storyMain?mypage="+data.boardSNS.boardWriter+"'>@"+data.boardSNS.boardWriter+"</a>&nbsp;"+data.boardSNS.boardContent;
									
									if('<%=userLoggedIn.getUserId() %>' == data.boardSNS.boardWriter){
										html+="<span class='likes' style='float: right; margin-right:10px;' ><img src='<%=request.getContextPath() %>/img/beforelike.png' alt='' style='padding-top:2px; padding-bottom:-2px; width: 20px; height:20px'/>0</span>";
									} else{
										html+="<span class='likes' value='"+tl.boardSNS.boardNo+"' style='float: right; margin-right:10px; cursor:pointer' ><img src='<%=request.getContextPath() %>/img/beforelike.png' alt='' style='padding-top:2px; padding-bottom:-2px; width: 20px; height:20px'/>0</span>";
									}
									
									html+="</td>";
									html+="</tr>";
									
								}
								

								html+="<tr>";

								if(data.commentSNSList.length>0){
									html+="<td id='commentcnt"+data.boardSNS.boardNo+"' value='"+data.commentSNSList.length+"' class='timeline-boardcontent-sns' style='cursor:pointer;' onclick='openComment(this);'>댓글("+data.commentSNSList.length+")</td>";
								} else{
									html+="<td id='commentcnt"+data.boardSNS.boardNo+"' value='"+data.commentSNSList.length+"' class='timeline-boardcontent-sns' style='cursor:pointer;' onclick='openComment(this);'>댓글(0)</td>";
								}
								
								html+="</td>";		
								html+="</tr>";
								html+="<tr style='display:none;'><td>"
									html+="<div class='comment-editor'>"
								
								html+="<textarea style='float:left; margin:5px;' name='boardCommentContent' class='boardCommentContent' cols='51' rows='3'></textarea>";
								html+="<button type='button' class='btn btn-primary' onclick='insertComment(this);' value='"+data.boardSNS.boardNo+"' style='float:right; width:76px; height:68px; margin:5px 5px 5px 2px;'>등록</button>";	
							
								html+="</div>";
								html+="<table class='tbl-comment'>";
								if(data.commentSNSList.length>0){
									for(var y=0; y<data.commentSNSList.length; y++){
										if(data.commentSNSList[y].commentLevel==1){
											html+="<tr class=level1 id='comment"+data.commentSNSList[y].commentNo+"'>";
											html+="<td class='timeline-boardcontent-sns' style='width:529px;'>";
											html+="<a href='<%=request.getContextPath() %>/story/storyMain?mypage="+data.commentSNSList[y].commentWriter+"'class='comment-writer' style='color:black; font-weight:700; font-size:1.2em; margin-right:3px;'><img src='<%=request.getContextPath()%>/upload/profile/"+data.commentSNSList[y].commentProfile+"' class='header-profile-circle' width='30' height='30' />"+data.commentSNSList[y].commentNickname+"@"+data.commentSNSList[y].commentWriter+"</a>";
											html+="<span class='comment-date'  style='font-size:0.8em; color:gray'>"+data.commentSNSList[y].commentUpdateDate+"</span>";
											html+="<br />";
											html+="<span style='padding: 10px;'>"+data.commentSNSList[y].commentContent+"</span>";
											if('<%=userLoggedIn.getUserId() %>' == data.commentSNSList[y].commentWriter){
												html+="<div>"
												html+="<button class='btn btn-primary' value='"+data.commentSNSList[y].commentNo+"' onclick='openCoCo(this);' style='float:right;'>답글</button>";
												html+="<button class='btn btn-danger' value='"+data.commentSNSList[y].commentNo+"' boardNo='"+data.commentSNSList[y].boardNo+"' onclick='deleteComment(this);' style='float:right; margin-right: 2px;'>삭제</button>	";	
												html+="<button class='btn btn-success' value='"+data.commentSNSList[y].commentNo+"' content='"+data.commentSNSList[y].commentContent+"' onclick='updateCommentFrm(this)' style='float:right; margin-right: 2px;'>수정</button>	";	
												html+="</div>"
											} else{
												html+="<div>"
												html+="<button class='btn btn-primary' onclick='openCoCo(this);' value='"+data.commentSNSList[y].commentNo+"' style='float:right;'>답글</button>";
												html+="</div>"
											}
											html+="</td>";
											html+="</tr>";
											
											html+="<tr style='display:none; float:right;'><td>"
												html+="<div class='mcomment-editor' style='float:right; display:none'>"
													html+="<textarea style='margin:7px 2px; float:left;' name='boardCommentContent' class='boardCommentContent' cols='45' rows='3'></textarea>";
													html+="<button type='button' class='btn btn-primary' onclick='insertCoCo(this)' value='"+data.boardSNS.boardNo+"' style='width:76px; height:68px; margin:5px 2px;'>등록</button>";	
												html+="</div>";
											html+="</td>";
											html+="</tr>";
											
										}
										if(data.commentSNSList[y].commentLevel==2){
											html+="<tr class='level2' id='comment"+data.commentSNSList[y].commentNo+"'>";
											html+="<td class='timeline-boardcontent-sns' style='float:right; width:472px;'>";
											html+="<a href='<%=request.getContextPath() %>/story/storyMain?mypage="+data.commentSNSList[y].commentWriter+"'class='comment-writer' style='color:black; font-weight:700; font-size:1.2em; margin-right:3px;'><img src='<%=request.getContextPath()%>/upload/profile/"+data.commentSNSList[y].commentProfile+"' class='header-profile-circle' width='30' height='30' />"+data.commentSNSList[y].commentNickname+"@"+data.commentSNSList[y].commentWriter+"</a>";
											html+="<span class='comment-date'  style='font-size:0.8em; color:gray'>"+data.commentSNSList[y].commentUpdateDate+"</span>";
											html+="<br />";
											html+="<span style='padding: 10px;'>"+data.commentSNSList[y].commentContent+"</span>";
											if('<%=userLoggedIn.getUserId() %>' == data.commentSNSList[y].commentWriter){
												html+="<div>"
												html+="<button class='btn btn-danger' value='"+data.commentSNSList[y].commentNo+"' boardNo='"+data.commentSNSList[y].boardNo+"' onclick='deleteComment(this);' style='float:right; margin-right: 2px;'>삭제</button>	";	
												html+="<button class='btn btn-success' value='"+data.commentSNSList[y].commentNo+"' content='"+data.commentSNSList[y].commentContent+"' onclick='updateCommentFrm(this)' style='float:right; margin-right: 2px;'>수정</button>	";	
												html+="</div>"
											}
											html+="</td>";
											html+="</tr>";
										}
									}
								}
							html+="</table>";
							html+="</td></tr>"
							
								html+="</table>";
								html+="</div>";
							}
						
						html += newPostHtml;
						
						if($(".current").attr('data-tab')=='tab1'){
							$("#newPost1").html(html);
							
						}else if($(".current").attr('data-tab')=='tab2'){
							$("#newPost2").html(html);
							
						}
						
						
				
				
						
						newPostHtml = html;
						
							
						},
						error: function(jqxhr, textStatus, errorThrown){
							console.log("ajax처리실패!");
							console.log(jqxhr, textStatus, errorThrown);
							
						}
					});	
	     <%}%>
	         
	     },
	     error : function(err) {
	         alert(err.status);
	     },
	     complete: function(){
	     	contentids = [];
			grades=[];
			filesTempArr=[];
			contenttypes=[];
			contentthumbnails  = [];
			contenttitles = [];
			contentaddresses = [];
			
			$("#postFrm").css('display', 'none');
			$("#tab-container").css("opacity", "1");
			$("#fileupload").val("");
			$("#reviewContent").val('');
			$(".imgs").remove();
			$("#public").prop('checked', true);
			$("#post").text("post").css("left","698px");
			
			
			
	     }
	})
	     
	 	
   
	     

	 	
});



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




$("#searchSNS1").keyup(e=>{
	
   	var $sel = $(".sel");
   	var $li = $("#autoS li");
   	
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
   		$("#searchSNS1").val($(e.target).text());
   		$("#autoS").hide().children().remove();
   		
   		location.href='<%=request.getContextPath() %>/story/storyMain?mypage='+$sel.text().substring($sel.text().lastIndexOf('@')+1);

   	}
   	else{
   		var search = $("#searchSNS1").val().trim();
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
							$("#autoS").hide();
   					}
   					else{	
   					$.each(data,(i,p)=>{				
   						html += "<li><img src='<%=request.getContextPath() %>/upload/profile/"+p.profileRenamedFilename+"' class='header-profile-circle'  width='20' height='20' />"+p.profileUserNickname+"@"+p.profileUserId+"</li>";		
   					});
						
					$("#autoS").html(html)
							.fadeIn(200);
   					}	
   					
   					$("#autoS li").on("click", (e=>{						
   						$("#searchSNS1").val($(e.target).text());
   						//#autoComplete 감춤
   						$("#autoS").hide().children().remove();
   						
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