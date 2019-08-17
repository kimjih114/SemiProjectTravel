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
#rightNav {
    text-align: center;
    top: 10px;
    left: 769px;
    display: -webkit-box;
    display: -ms-flexbox;
    /*display: fixed;*/
    -webkit-box-direction: normal;
    -ms-flex-direction: column;
    flex-direction: column;
    width: 230px;
    /*height: 100vh;*/
	border: 1px solid;
 	position: absolute;
    
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
			
			</div>
		
			<div id="tab2" class="tabcontent">
				
			<div class='timeline-board-sns' id='newPost'>
			
			
			</div>	
			
			<div id="tab2Content"></div>
			
			</div>
		
			<div id="tab3" class="tabcontent">

			</div>
		
		<!--  <table id="rightNav">
			<tr>
				<td><input type="search" id="searchSNS" placeholder="검색" onfocus='popupSearchFrm' /></td>
			</tr>
			<tr>
				<td>
					<span>추천팔로워</span>
				</td>
			</tr>
			<tr>
				<td>
					<span>추천리뷰</span>
				</td>
			</tr>
			
	    </table>-->
		
		
<script>
var newPostHtml = '';

document.addEventListener('keydown', function(event) {
    if (event.keyCode === 13) {
        event.preventDefault();
    }
}, true);

var filesTempArr = [];

$(function() {
	$('ul.tab li').click(function() {
		var activeTab = $(this).attr('data-tab');
		$('ul.tab li').removeClass('current');
		$('.tabcontent').removeClass('current');
		$(this).addClass('current');
		$('#' + activeTab).addClass('current');

		if($(this).attr('data-tab')=='tab2'){
			var param = {
					mypage : '<%=mypage %>'
			}
			
				$.ajax({
					url: "<%=request.getContextPath() %>/ajax/myboardlist.jsp", 
					data: param,
					type: "get",
					dataType: "html",
					success: function(data){
						$("#tab2Content").html(data);
						$("#newPost").html('');
					},
					error: function(jqxhr, textStatus, errorThrown){
						console.log("ajax처리실패!");
						console.log(jqxhr, textStatus, errorThrown);
					}
				});

			
		}

	})
});
	
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
									html+="<span class=;carousel-control-prev-icon' aria-hidden='true'></span>"
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

									html+="<span style='float: right; margin-right:10px;' ><img src='<%=request.getContextPath() %>/img/beforelike.png' alt='' style='padding-top:2px; padding-bottom:-2px; width: 20px; height:20px'/>1&nbsp;&nbsp;<img src='<%=request.getContextPath() %>/img/alarm.png' alt='' style='width: 20px; height:20px'/></span>";
									
									html+="</td>";
									html+="</tr>";
								}
							
								html+="<tr>";
								html+="<td class='timeline-boardcontent-sns' >댓글(3)</td>";
								html+="</tr>";
								html+="<tr>";
								html+="<td class='timeline-boardcontent-sns'>";
								html+="<span class='nick_sns'>@abcde</span>&nbsp;";
								html+="<span style='float:right;'>좋아요&nbsp;&nbsp;신고</span>";
								html+="</td>";		
								html+="</tr>";
								html+="</table>";
								html+="</div>";
							}
						
						html += newPostHtml;
						
						$("#newPost").html(html);
						
						newPostHtml = html;
						
							
						},
						error: function(jqxhr, textStatus, errorThrown){
							console.log("ajax처리실패!");
							console.log(jqxhr, textStatus, errorThrown);
							
						}
					});	
	         
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


	







</script>