<%@page import="user.model.vo.User"%>
<%@page import="sns.model.vo.ProfileSNS"%>
<%@page import="sns.model.vo.BoardSNS"%>
<%@page import="sns.model.service.SNSService"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%
	String mypage = request.getParameter("mypage");
	User userLoggedIn = (User)session.getAttribute("userLoggedIn");
	ProfileSNS userLoggedInProfile = new SNSService().selectOneProfile(userLoggedIn.getUserId());
%>

<script>
var mBeforeHtml = '';
var mcontentids = new Array();
var mcontenttypes = new Array();
var mcontentthumbnails = new Array();
var mcontenttitles = new Array();
var mcontentaddresses = new Array();
var mfilesTempArr = new Array();
var mcontentgrades = new Array();
var mcontentoldfilenames = new Array();

$(()=>{
	pageMore(10000);
});


function openCoCo(btn) {
	if ($(".mcomment-editor").css("display") == "none"){
		$(btn).parent().parent().parent().next().css("display", "block");
		$(".mcomment-editor").css("display", "block");
		$(btn).removeClass('btn-primary').addClass('btn-dark');
		$(btn).text('취소');
	}
	else if ($(".mcomment-editor").css("display") == "block"){
		$(btn).parent().parent().parent().next().css("display", "block");
		$(".mcomment-editor").css("display", "none");
		$(btn).removeClass('btn-dark').addClass('btn-primary');
		$(btn).text('답글');
	}
	

}
function openComment(comment){

	if($(comment).parent().next().css("display") == "none"){
		$(comment).parent().next().css("display", "block");
	}
	else if($(comment).parent().next().css("display") == "block"){
		$(comment).parent().next().css("display", "none");
	}
	
}

function updateCommentFrm(btn){
	console.log($(btn).val());
	var commentNo = $(btn).val();
	var content = $(btn).attr('content');
	var html = '';
	
	var oldHtml = $(btn).parent().parent().html();
	
	if($(btn).parent().parent().parent().attr('class')=='level2'){
		html+="<div class='comment-editor'>"
			html+="<textarea style='float:left;' name='boardCommentContent' class='boardCommentContent' cols='36' rows='3'>"+content+"</textarea>";
			html+="<button type='button' class='btn btn-dark' onclick='cancelUpdateComment(this);' value='"+oldHtml+"' style='float:right; width:63px; height:63px; margin: 0 2px;'>취소</button>";	
			html+="<button type='button' class='btn btn-primary' onclick='updateComment(this)' value='"+commentNo+"' style='float:right; width:63px; height:63px;  margin: 0 2px;'>수정</button>";	
			
	}
	else{
	html+="<div class='comment-editor'>"
	html+="<textarea style='float:left;' name='boardCommentContent' class='boardCommentContent' cols='42' rows='3'>"+content+"</textarea>";
	html+="<button type='button' class='btn btn-dark' onclick='cancelUpdateComment(this);' value='"+oldHtml+"' style='float:right; width:66px; height:63px; margin: 0 2px;'>취소</button>";	
	html+="<button type='button' class='btn btn-primary' onclick='updateComment(this)' value='"+commentNo+"' style='float:right; width:66px; height:63px;  margin: 0 2px;'>수정</button>";	
	}
	html+="</div>";
	html+="<table class='tbl-comment'>";
		
	$(btn).parent().parent().html(html);
	
}

function updateComment(btn){
	var commentNo = $(btn).val();
	var commentContent = $(btn).prev().prev().val();
	var commentNickname = '<%=userLoggedInProfile.getProfileUserNickname() %>';
	var commentProfile = '<%=userLoggedInProfile.getProfileRenamedFilename() %>';

	
	var param = {
			commentNo : commentNo,
			commentNickname : commentNickname,
			commentProfile : commentProfile,
			commentContent : commentContent
	}
			$.ajax({
				url: "<%=request.getContextPath() %>/gson/sns/updateComment.do", 
				data : param,
				dataType: 'json',
				type : 'post',
				success: function(data){
			
					var html =''
					if(data.commentLevel==1){
						html+="<td class='timeline-boardcontent-sns' style='width:529px;'>";
						html+="<a href='<%=request.getContextPath() %>/story/storyMain?mypage="+data.commentWriter+"'class='comment-writer' style='color:black; font-weight:700; font-size:1.2em; margin-right:3px;'><img src='<%=request.getContextPath()%>/upload/profile/"+data.commentProfile+"' class='header-profile-circle' width='30' height='30' />"+data.commentNickname+"@"+data.commentWriter+"</a>";
						html+="<span class='comment-date' style='font-size:0.8em; color:gray'>"+data.commentUpdateDate+"</span>";
						html+="<br />";
						html+="<span style='padding: 10px;'>"+data.commentContent+"</span>";
						html+="<div>"
								html+="<button class='btn btn-primary' value='' onclick='openCoCo(this)' style='float:right;'>답글</button>";
								html+="<button class='btn btn-danger' value='"+data.commentNo+"' boardNo='"+data.boardNo+"' onclick='deleteComment(this);' style='float:right; margin-right: 2px;'>삭제</button>	";	
								html+="<button class='btn btn-success' content='"+data.commentContent+"' onclick='updateCommentFrm(this)' value='"+data.commentNo+"' style='float:right; margin-right: 2px;'>수정</button>	";	
								html+="</div>"
							html+="</td>";
					}
					
					else{
						html+="<td class='timeline-boardcontent-sns' style='float:right; width:472px;'>";
						html+="<a href='<%=request.getContextPath() %>/story/storyMain?mypage="+data.commentWriter+"'class='comment-writer' style='color:black; font-weight:700; font-size:1.2em; margin-right:3px;'><img src='<%=request.getContextPath()%>/upload/profile/"+data.commentProfile+"' class='header-profile-circle' width='30' height='30' />"+data.commentNickname+"@"+data.commentWriter+"</a>";
						html+="<span class='comment-date'  style='font-size:0.8em; color:gray'>"+data.commentUpdateDate+"</span>";
						html+="<br />";
						html+="<span style='padding: 10px;'>"+data.commentContent+"</span>";
							html+="<div>"
							html+="<button class='btn btn-danger' value='"+data.commentNo+"' boardNo='"+data.boardNo+"' onclick='deleteComment(this);' style='float:right; margin-right: 2px;'>삭제</button>	";	
							html+="<button class='btn btn-success' value='"+data.commentNo+"' content='"+data.commentContent+"' onclick='updateCommentFrm(this)' style='float:right; margin-right: 2px;'>수정</button>	";	
							html+="</div>";
							html+="</td>";
						}
						
						
					
					$("#comment"+data.commentNo).html(html);
				},
				error: function(jqxhr, textStatus, errorThrown){
					console.log("ajax처리실패!");
					console.log(jqxhr, textStatus, errorThrown);
				},
				complete:function(data){	
					$(btn).prev().val('');
				}
			});
	
	
}

function deleteComment(btn){
	var commentNo = $(btn).val();
	var boardNo = $(btn).attr('boardNo');
	if(confirm("해당 댓글을 삭제하시겠습니까?")){
		$.ajax({
			url: "<%=request.getContextPath() %>/gson/sns/deleteComment.do", 
			data : "commentNo="+commentNo,
			dataType: 'json',
			type : 'post',
			success: function(data){
				
				$("#comment"+commentNo).remove();
				
				var cntString = $('#commentcnt'+boardNo).html().substring(3, $('#commentcnt'+boardNo).html().indexOf(')'));
				var cnt = Number($('#commentcnt'+boardNo).html().substring(3, $('#commentcnt'+boardNo).html().indexOf(')')));
			
				$('#commentcnt'+boardNo).html('댓글('+(cnt-1)+')');
				
				
			},
			error: function(jqxhr, textStatus, errorThrown){
				console.log("ajax처리실패!");
				console.log(jqxhr, textStatus, errorThrown);
			},
			complete:function(data){	
				$(btn).prev().val('');
			}
		});
	}
	
}




function cancelUpdateComment(btn){
	
	$(btn).parent().parent().html($(btn).val());
	
}


function insertComment(btn){
	var commentContent = $(btn).prev().val();
	
	if(commentContent.length==0){
		alert("내용을 입력해주세요.");
		return;
	}
	
	if(commentContent.length>300){
		alert("최대 300글자까지 가능합니다.");
		return;
	}
	
	var param = {
			boardNo : $(btn).val(),
			commentWriter : '<%=userLoggedIn.getUserId() %>',
			commentLevel : 1,
			commentNickname : '<%=userLoggedInProfile.getProfileUserNickname() %>',
			commentProfile : '<%=userLoggedInProfile.getProfileRenamedFilename() %>', 
			commentContent : commentContent
			
	}
			$.ajax({
				url: "<%=request.getContextPath() %>/gson/sns/insertComment.do", 
				data : param,
				dataType: 'json',
				type : 'post',
				success: function(data){
					
					var html ='';
						html+="<tr class='level1' newL1='newL1' id='comment"+data.commentNo+"'>";
						html+="<td class='timeline-boardcontent-sns' style='width:529px;'>";
						html+="<a href='<%=request.getContextPath() %>/story/storyMain?mypage="+data.commentWriter+"'class='comment-writer' style='color:black; font-weight:700; font-size:1.2em; margin-right:3px;'><img src='<%=request.getContextPath()%>/upload/profile/"+data.commentProfile+"' class='header-profile-circle' width='30' height='30' />"+data.commentNickname+"@"+data.commentWriter+"</a>";
						html+="<span class='comment-date' style='font-size:0.8em; color:gray'>"+data.commentUpdateDate+"</span>";
						html+="<br />";
						html+="<span style='padding: 10px;'><span style='color:red; font-weight:700;'>new</span>&nbsp;"+data.commentContent+"</span>";
						html+="<div>"
							html+="<button class='btn btn-primary' value='' onclick='openCoCo(this)' style='float:right;'>답글</button>";
							html+="<button class='btn btn-danger' value='"+data.commentNo+"' boardNo='"+data.boardNo+"' onclick='deleteComment(this);' style='float:right; margin-right: 2px;'>삭제</button>	";	
							html+="<button class='btn btn-success' onclick='updateCommentFrm(this)' content='"+data.commentContent+"' value='"+data.commentNo+"' style='float:right; margin-right: 2px;'>수정</button>	";	
							html+="</div>"
						html+="</td>";
						html+="</tr>";
						
					
						html+="<tr style='float:right;'><td>"
							html+="<div class='mcomment-editor' style='display:none; float: right;'>"
 								html+="<textarea style='margin:7px 2px; float:left;' name='boardCommentContent' class='boardCommentContent' cols='45' rows='3'></textarea>";
								html+="<button type='button' class='btn btn-primary' onclick='insertCoCo(this)' value='"+data.boardNo+"' style='width:76px; height:68px; margin:5px 2px;'>등록</button>";	
							html+="</div>";
						html+="</td>";
						html+="</tr>";
						
						
						var cntString = $('#commentcnt'+$(btn).val()).html().substring(3, $('#commentcnt'+$(btn).val()).html().indexOf(')'));
						var cnt = Number($('#commentcnt'+$(btn).val()).html().substring(3, $('#commentcnt'+$(btn).val()).html().indexOf(')')));
					
						$('#commentcnt'+$(btn).val()).html('댓글('+(cnt+1)+')');
						
						$(btn).parent().parent().append(html);
						
				},
				error: function(jqxhr, textStatus, errorThrown){
					console.log("ajax처리실패!");
					console.log(jqxhr, textStatus, errorThrown);
				},
				complete:function(data){	
					$(btn).prev().val('');
				}
			});
	
}
function insertCoCo(btn){
	var commentContent = $(btn).prev().val();

	var level = 2;
	
	var commentRef = $(btn).parent().parent().parent().prev().attr('id').substring(7);
	
	if(commentContent.length==0){
		alert("내용을 입력해주세요.");
		return;
	}
	
	if(commentContent.length>300){
		alert("최대 300글자까지 가능합니다.");
		return;
	}
	
	
	var param = {
			boardNo : $(btn).val(),
			commentWriter : '<%=userLoggedIn.getUserId() %>',
			commentLevel : 2,
			commentRef: commentRef,
			commentNickname : '<%=userLoggedInProfile.getProfileUserNickname() %>',
			commentProfile : '<%=userLoggedInProfile.getProfileRenamedFilename() %>', 
			commentContent : commentContent
			
	}
			$.ajax({
				url: "<%=request.getContextPath() %>/gson/sns/insertComment.do", 
				data : param,
				dataType: 'json',
				type : 'post',
				success: function(data){
					
					var html =''
					
						html+="<tr class=level2 id='comment"+data.commentNo+"' style='float:right;'>";
						html+="<td class='timeline-boardcontent-sns'  style='width:472px; float:right'>";
						html+="<a href='<%=request.getContextPath() %>/story/storyMain?mypage="+data.commentWriter+"'class='comment-writer' style='color:black; font-weight:700; font-size:1.2em; margin-right:3px;'><img src='<%=request.getContextPath()%>/upload/profile/"+data.commentProfile+"' class='header-profile-circle' width='30' height='30' />"+data.commentNickname+"@"+data.commentWriter+"</a>";
						html+="<span class='comment-date' style='font-size:0.8em; color:gray'>"+data.commentUpdateDate+"</span>";
						html+="<br />";
						html+="<span style='padding: 10px;'><span style='color:red; font-weight:700;'>new</span>&nbsp;"+data.commentContent+"</span>";
						html+="<div>"
							html+="<button class='btn btn-danger' value='"+data.commentNo+"' boardNo='"+data.boardNo+"' onclick='deleteComment(this);' style='float:right; margin-right: 2px;'>삭제</button>	";	
							html+="<button class='btn btn-success' onclick='updateCommentFrm(this)' content='"+data.commentContent+"' value='"+data.commentNo+"' style='float:right; margin-right: 2px;'>수정</button>	";	
							html+="</div>"
						html+="</td>";
						html+="</tr>";
						
						var cntString = $('#commentcnt'+$(btn).val()).html().substring(3, $('#commentcnt'+$(btn).val()).html().indexOf(')'));
						var cnt = Number($('#commentcnt'+$(btn).val()).html().substring(3, $('#commentcnt'+$(btn).val()).html().indexOf(')')));
					
						$('#commentcnt'+$(btn).val()).html('댓글('+(cnt+1)+')');
						
						//$(btn).parent().parent().parent().append(html);
						
console.log($(btn).parent().parent().parent().prev().attr('newL1'));
//console.log($(btn).parent().parent().parent().siblings().last());
//console.log($(btn).parent().parent().parent().nextUntil($(".level1")));
						//$(btn).parent().parent().parent().last($('tr')).append(html);
						//$(btn).parent().parent().parent().siblings().last();
				
					if($(btn).parent().parent().parent().prev().attr('newL1')=='newL1'){
						$(btn).parent().parent().parent().append(html);
					} else{
						//$(btn).parent().parent().parent().append(html);
						$(btn).parent().parent().parent().nextUntil($(".level1")).last('tr').append(html);
					}
						
				},
				error: function(jqxhr, textStatus, errorThrown){
					console.log("ajax처리실패!");
					console.log(jqxhr, textStatus, errorThrown);
				},
				complete:function(data){	
					$(btn).prev().val('');
				}
			});
	
}


function like(img){
	var boardNo =$(img).attr('boardNo');
	console.log($(img).prop('src'));
	if($(img).prop('src')== 'http://localhost:8080/trav/img/beforelike.png'){
		var param = {
				boardNo : boardNo,
				userId : '<%=userLoggedIn.getUserId() %>'
		}
				$.ajax({
					url: "<%=request.getContextPath() %>/gson/sns/like.do", 
					data : param,
					dataType: 'json',
					type : 'post',
					success: function(data){
						$(img).prop('src', '<%=request.getContextPath() %>/img/afterlike.png');
						$(img).next().html(data.length);
						
					},
					error: function(jqxhr, textStatus, errorThrown){
						console.log("ajax처리실패!");
						console.log(jqxhr, textStatus, errorThrown);
					},
					complete:function(data){	
						
					}
				});
	}
	else if ($(img).prop('src')== 'http://localhost:8080/trav/img/afterlike.png'){
		var param = {
				boardNo : boardNo,
				userId : '<%=userLoggedIn.getUserId() %>'
		}
				$.ajax({
					url: "<%=request.getContextPath() %>/gson/sns/unlike.do", 
					data : param,
					dataType: 'json',
					type : 'post',
					success: function(data){
						$(img).prop('src', '<%=request.getContextPath() %>/img/beforelike.png');
						$(img).next().html(data.length);
						
					},
					error: function(jqxhr, textStatus, errorThrown){
						console.log("ajax처리실패!");
						console.log(jqxhr, textStatus, errorThrown);
					},
					complete:function(data){	
						
					}
				});
	}
	
}






function deleteBoardSNS(boardNo){
	
	if(!confirm("게시물을 삭제하시겠습니까?")){
		return;
	}
	var param={
		boardNo : boardNo
	}
	
		$.ajax({
			url : '<%=request.getContextPath()%>/gson/sns/deleteBoardSNS.do',
			data : param,
			dataType: 'json',
			type : 'post',
			success : function(data){				
				$(document.querySelector('#boardNo'+boardNo)).remove();
			},
			error : function(data){
				console.log("ajax처리실패");
			}
		}) 
	
}

function updateBoardSNSFrm(boardNo){
	if($("#postFrm").css('display')=='block'){
		return;
	}
	if($(".snsModify").length>0){
		return;
	}
	
	mBeforeHtml=$(document.querySelector('#container'+boardNo)).html();
	
	mcontentids = [];
	mcontenttypes = [];
	mcontentthumbnails = [];
	mcontenttitles = [];
	mcontentaddresses = [];
	mfilesTempArr = [];
	mcontentgrades = [];
	mcontentoldfilenames = [];
	
	var param={
			boardNo : boardNo
		}
			$.ajax({
				url : '<%=request.getContextPath()%>/gson/sns/updateBoardSNSFrm.do',
				data : param,
				dataType: 'json',
				type : 'post',
				success : function(data){	
					$(document.getElementById("container"+boardNo)).html('');
					
					var html = '';
					html += "<form action='' name='snsModify'";
					html += "class='snsModify'";
					html += "method='post'";
					html += "enctype='multipart/form-data' style='border:1px solid black; margin-bottom:10px; padding: 10px;'>";
					html += "<table class='postFrm' style='padding:10px;'>";
					html += "<tr>";
					html += "<td style='padding: 10px; width: 508px; text-align:left; font-weight: 700'>여행 후기를 수정합니다.</td>";
					html += "</tr>";
					html += "<tr>";
					html += "<td style='padding: 10px; width: 508px; text-align:left;'>";
					html += "<div class='travelsrchM'></div>";
					html += "</td>";
					html += "</tr>";
					html += "<tr>";
					html += "<td style='width: 508px; text-align:left; padding-left:10px;'>";
					html += "<label for='reviewContent' style='font-weight: 700; margin-bottom:5px; float:left;'>어떤 여행을 하셨나요?</label>";
					html += "<textarea name='reviewContent' id='mreviewContent' cols='56' rows='5' required>"+data.boardSNS.boardContent+"</textarea>";
					html += "</td>";
					html += "</tr>";
					html+="<tr>";
					html += "<td style='padding: 10px; width: 508px; text-align:left; position: relative'>";
					html += "<label for='' style='font-weight: 700; float:left;'>첨부이미지</label>";
					html += "<span style='font-size:0.5em; color:gray; float:left;'>10mb이하 최대 5개까지 등록 가능합니다.</span>";
					
					if (data.imageSNSList.length==1){
						var fname = data.imageSNSList[0].renamedFileName;
						if(fname.length>7){
							var fdot = fname.substring(fname.indexOf("."));
							fnmae = fname.substr(0, 7) + "..." + fdot;
						}
						html += "<div class='mpanel' style='position: absolute; left:83px; top:41px; background:white; z-index:1; width:200px;'>"+fname+"</div>";
					} else if (data.imageSNSList.length>1){
						html += "<div class='mpanel'  style='position: absolute; left:83px; top:41px; background:white; z-index:1;  width:200px;'>파일 "+data.imageSNSList.length+"개</div>";
					} else {
						html += "<div class='mpanel' style='position: absolute; left:83px; top:41px; background:white; z-index:1;  width:200px;'></div>";
					}
					
					html += "<input name='fileupload' id='fileModify' type='file' accept='image/*' style='float:left; width:500px;' multiple />";
					html += "<div style='display:table; '>";
					
					if(data.imageSNSList.length>0){
						html += "<div class='mimgs_wrap' style='display: block;  margin-top:10px; text-align: center; vertical-align: middle; table-layout: fixed; width:100%;'>";
					}
					else{
						html += "<div class='mimgs_wrap' style='display:none; margin-top:10px;  text-align: center; vertical-align: middle; table-layout: fixed; width:100%;'>";
					}
					if(data.imageSNSList.length>0){
						for(var t=0; t<data.imageSNSList.length; t++){
							mcontentoldfilenames.push(data.imageSNSList[t].renamedFileName);
							
							html += "<div class='mimgs' style='display: table-cell; max-width: 100px; font-size:0.8em;'>";
							html+="<img src='<%=request.getContextPath() %>/upload/board/"+data.imageSNSList[t].renamedFileName+"' style='width: 95px; height: 95px; margin: 0 2px;' />";
						 	var filename = data.imageSNSList[t].originalFileName;
						 	
						 	if(filename.length>7){
						 		var dot = filename.substring(filename.lastIndexOf('.'));
						 		filename = filename.substr(0, 7) + "..." +  dot;
						 	}
						 	html+="<span>"+filename+"</span></div>";
						}
					}
					html += "</div>";
					html+="<input type='checkbox' name='delFile' id='delFile' />";
					html+="<label for='delFile'>첨부파일삭제</label>";
					html += "</td>";
					html +="</tr>";
					html += "<tr>";
					html += "<td style='padding: 10px; width: 508px; text-align:left;'>";		
					if(data.boardSNS.boardType=='P'){
						html += "<input type='radio' name='mboardtype' value='P' checked />";
						html += "<label for='public'>전체공개</label> &nbsp;";
						html += "<input type='radio' name='mboardtype' value='F' />";
						html += "<label for='followOnly'>팔로워공개</label> &nbsp;";
						html += "<input type='radio' name='mboardtype' value='L' />";
						html += "<label for='locked'>비공개</label>";
					}
					else if(data.boardSNS.boardType=='F'){
						html += "<input type='radio' name='mboardtype' value='P' />";
						html += "<label for='public'>전체공개</label> &nbsp;";
						html += "<input type='radio' name='mboardtype' value='F' checked />";
						html += "<label for='followOnly'>팔로워공개</label> &nbsp;";
						html += "<input type='radio' name='mboardtype' value='L' />";
						html += "<label for='locked'>비공개</label>";
					}
					if(data.boardSNS.boardType=='L'){
						html += "<input type='radio' name='mboardtype' value='P' />";
						html += "<label for='public'>전체공개</label> &nbsp;";
						html += "<input type='radio' name='mboardtype' value='F' />";
						html += "<label for='followOnly'>팔로워공개</label> &nbsp;";
						html += "<input type='radio' name='mboardtype' value='L' checked  />";
						html += "<label for='locked'>비공개</label>";
					}
					html += "<br>";
					html+="<span style='float: right;'>";
					html+="<button class='btn btn-success' onclick='updateBoardSNS("+data.boardSNS.boardNo+")' style='margin-right:2px;'>수정</button>";
					html+="<button class='btn btn-dark' onclick='modifyCancel("+data.boardSNS.boardNo+");'>취소</button>";
					html+="</span>";
					html += "</td>";
					html += "</tr>";
					html += "</table>";
					html += "</form>";
					$(document.querySelector('#container'+boardNo)).html('');
					$(document.querySelector('#container'+boardNo)).html(html);
					
					if(data.gradeSNSList!=null){
						for(var g=0; g<data.gradeSNSList.length; g++){
							mcontentids.push(data.gradeSNSList[g].contentId);
							mcontenttypes.push(data.gradeSNSList[g].contentType);
							mcontentthumbnails.push(data.gradeSNSList[g].contentThumbnail);
							mcontenttitles.push(data.gradeSNSList[g].contentTitle);
							mcontentaddresses.push(data.gradeSNSList[g].contentAddress);
							mcontentgrades.push(data.gradeSNSList[g].grade);
						}
					}
					
					var parameter = {
							mcontentids : mcontentids,
							mcontenttypes : mcontenttypes,
							mcontentthumbnails : mcontentthumbnails,
							mcontenttitles : mcontenttitles,
							mcontentaddresses : mcontentaddresses,
							mcontentgrades : mcontentgrades
					}
					
					jQuery.ajaxSettings.traditional = true;
					
					$.ajax({
						url: "<%=request.getContextPath() %>/ajax/travelsrchM.jsp", 
						data: parameter,
						type: "post",
						success: function(data){
							$(".travelsrchM").html(data);
						},
						error: function(jqxhr, textStatus, errorThrown){
							console.log("ajax처리실패!");
							console.log(jqxhr, textStatus, errorThrown);
						}
					});
					
					$("#fileModify").on("change", mHandleImgsFilesSelect);
					
					if($(".mimgs").length==0){
						$(".mimgs_wrap").css("display", "none");
					}
					
					$(".tbl-td").children(".starRev").css("margin-top", "23px");
					
				},
				error : function(data){
					console.log("ajax처리실패");
					
				}, complete :  function(data){
				
				}
			}) 
	
}


var msel_files=[];

function mHandleImgsFilesSelect(e){
	var mfiles = e.target.files;
	var mfilesArr = Array.prototype.slice.call(mfiles);
	var mfilesArrLen = mfilesArr.length;
	
	if(mfilesArrLen>5){	
		$("#fileModify").val("");
		alert("첨부파일은 5개까지만 가능합니다.");
		return;
	}
	
	if($(".mimgs").length>0){
		$(".mimgs").each(function(){
			$(this).remove();
		})
		
		$(".mpanel").remove();
	};
	$(".mimgs_wrap").css("display", "block");

	for(var i=0; i<mfilesArrLen; i++){
		mfilesTempArr.push(mfilesArr[i]);
	}
	
	mfilesArr.forEach(function(f){
		if(!f.type.match("image.*")){
			$("#fileModify").val("");
			alert(f.name+"은(는) 이미지가 아닙니다.");
			return;
		}
	
		msel_files.push(f);
		
		var mreader = new FileReader();
		mreader.onload = function(e){
			
			var html = "<div class='mimgs' style='display: table-cell; max-width: 100px; font-size:0.8em;'>";
			html +="<img src=\""+e.target.result+"\" / style='width: 95px; height: 95px; margin: 0 2px;' />";
			var mfilename = f.name;
		 	
			if(mfilename.length>7){
		 		var mdot = mfilename.substring(mfilename.indexOf('.'));
		 		mfilename = mfilename.substr(0, 7) + "..." + mdot;
		 	}

			html += "<span>"+mfilename+"</span><br>";
			html += "<span>("+(f.size)/1000+"kb)</span><div></div>";
			
			$(".mimgs_wrap").append(html);
			
		}
			
			
		mreader.readAsDataURL(f);
		
	});
}



function updateBoardSNS(boardNo){
	event.preventDefault();
	var formData = new FormData();
	
	var mcontentgrades = [];
	
	
	
	if($(".mcontentid").length>0){
		$(".mcontentid").each(function(i, elem){
			var grade = $(this).parent().parent().parent().children('.mstarRev').children('.mstarR.on').length;
		   	mcontentgrades.push(grade);
		});
	}
	
	console.log(mcontentids);
	console.log(mcontenttypes);
	console.log(mcontentthumbnails);
	console.log(mcontenttitles);
	console.log(mfilesTempArr);
	console.log(mcontentgrades);
	console.log(mcontentoldfilenames);

	 formData.append("boardNo", boardNo);
	 formData.append("boardContent", $("#mreviewContent").val());
	 formData.append("boardWriter", '<%=userLoggedIn.getUserId() %>');
	 formData.append("boardType", $('input[name="mboardtype"]:checked').val());
	 formData.append("contentId1",mcontentids[0]);
	 formData.append("contentId2",mcontentids[1]);
	 formData.append("contentId3",mcontentids[2]);
	 formData.append("contentType1", mcontenttypes[0]);
	 formData.append("contentType2", mcontenttypes[1]);
	 formData.append("contentType3", mcontenttypes[2]);
	 formData.append("contentThumbnail1", mcontentthumbnails[0]);
	 formData.append("contentThumbnail2", mcontentthumbnails[1]);
	 formData.append("contentThumbnail3", mcontentthumbnails[2]);
	 formData.append("contentTitle1", mcontenttitles[0]);
	 formData.append("contentTitle2", mcontenttitles[1]);
	 formData.append("contentTitle3", mcontenttitles[2]);
	 formData.append("contentAddress1", mcontentaddresses[0]);
	 formData.append("contentAddress2", mcontentaddresses[1]);
	 formData.append("contentAddress3", mcontentaddresses[2]);
	 formData.append("grade1",mcontentgrades[0]);
	 formData.append("grade2",mcontentgrades[1]);
	 formData.append("grade3",mcontentgrades[2]);
	 formData.append("oldname1",mcontentoldfilenames[0]);
	 formData.append("oldname2",mcontentoldfilenames[1]);
	 formData.append("oldname3",mcontentoldfilenames[2]);
	 formData.append("oldname4",mcontentoldfilenames[3]);
	 formData.append("oldname5",mcontentoldfilenames[4]);
	 formData.append("delFile", $("#delFile").val());
	 formData.append("file1", mfilesTempArr[0]);
	 formData.append("file2", mfilesTempArr[1]);
	 formData.append("file3", mfilesTempArr[2]);
	 formData.append("file4", mfilesTempArr[3]);
	 formData.append("file5", mfilesTempArr[4]);
	 
		
	// 파일 데이터
	 for(var i=0; i<mfilesTempArr.length; i++) {
	    formData.append("file"+(i+1), mfilesTempArr[i]);
	 }

	
	$.ajax({
	     type : "POST",
	     url : "<%=request.getContextPath()%>/gson/sns/updateBoardSNS.do",
	     data : formData,
	     enctype:"multipart/form-data",
	     processData: false,
	     contentType: false,
	     success : function(data) {
	$(".tbl-td").children(".starRev").css("margin-top", "0px");
	    	 
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
								html+="<a class='nickname-sns' href='<%=request.getContextPath() %>/story/storyMain?mypage="+data.boardSNS.boardWriter+"'><img src='<%=request.getContextPath()%>/upload/profile/"+data.profileSNS.profileRenamedFilename+"' class='header-profile-circle' width='30' height='30' />";
								html+="<span style='font-weight: 600'>"+data.profileSNS.profileUserNickname+"</span></a><";
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
									html+="<td class='timeline-boardcontent-sns' style='text-align:left; padding: 10px; margin:10px; border:none;'><a class='nickname-sns' href='<%=request.getContextPath() %>/story/storyMain?mypage="+data.boardSNS.boardWriter+"'>@"+data.boardSNS.boardWriter+"</a>&nbsp;"+data.boardSNS.boardContent;

							
									if(data.LikeSNSList.length>0){
											html+="<span style='float: right; margin-right:10px;' ><img src='<%=request.getContextPath() %>/img/afterlike.png' alt='' style='padding-top:2px; padding-bottom:-2px; width: 20px; height:20px'/><span>"+data.likeSNSList.length+"</span></span>";
										
									}else{
										
											html+="<span style='float: right; margin-right:10px;' ><img src='<%=request.getContextPath() %>/img/beforelike.png' alt='' style='padding-top:2px; padding-bottom:-2px; width: 20px; height:20px'/><span>0/span></span>";
										
									}
									
									html+="</td>";
									html+="</tr>";
								}
							
								html+="<tr>";
								if(data.commentSNSList.length>0){
									html+="<td class='timeline-boardcontent-sns' style='cursor:pointer;' onclick='openComment(this)' >댓글("+data.commentSNSList.length+")</td>";
								} else{
									html+="<td class='timeline-boardcontent-sns' style='cursor:pointer;'>댓글(0)</td>";
								}
								
								
								
								
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
						
						
						
						
						$(document.querySelector('#container'+boardNo)).html(html);
						
							
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
	    	 
	    	 mcontentids = [];
	    	 mcontenttypes = [];
	    	 mcontentthumbnails = [];
	    	 mcontenttitles = [];
	    	 mcontentaddresses = [];
	    	 mfilesTempArr = [];
	    	 mcontentgrades = [];
			 
			$("#fileupModify").val("");
			$("#mreviewContent").val('');
			$(".mimgs").remove();
			
			
			
	     }
	})
}

function pageMore(boardNo){
	var param = {
			boardNo : boardNo,
			mypage:'<%=mypage %>'
	}
	$.ajax({
		url: "<%=request.getContextPath()%>/gson/sns/myBoardSNSList.do",
		data: param,
		type: "get",
		dataType: "json",
		success: function(data){
			if(data!=null){
				console.log(data);
				var html = "";
				
				$.each(data,(i,tl)=>{
					html+="<div id='container"+tl.boardSNS.boardNo+"'>";
					html+="<table class='tbl-boardsns' id='boardNo"+tl.boardSNS.boardNo+"'>"
					html+="<tr>";
					html+="<td class='timeline-boardcontent-sns'>";
					html+="<a class='nickname-sns' href='<%=request.getContextPath() %>/story/storyMain?mypage="+tl.boardSNS.boardWriter+"'><img src='<%=request.getContextPath()%>/upload/profile/"+tl.profileSNS.profileRenamedFilename+"' class='header-profile-circle' width='30' height='30' />";
					html+="<span style='font-weight: 600'>"+tl.profileSNS.profileUserNickname+"</span></a>";
					
					var type = '';
					if(tl.boardSNS.boardType=='P'){
						type = '';
					}
					
					if(tl.boardSNS.boardType=='F'){
						type = '(팔로워 공개)';
					}
					
					if(tl.boardSNS.boardType=='L'){
						type = '(비공개)'
					}
					
					
					html+="<span style='font-weight: 600; color:black;'>"+type+"</span>";
					
					
					html+="<span style='font-size: 0.8em; color: gray;''>"+tl.boardSNS.boardUpdateDate+"</span>";
					html+="<span style='float: right;'>";
					if(tl.boardSNS.boardWriter=='<%=userLoggedIn.getUserId()%>'){
						html+="<button class='btn btn-success' onclick='updateBoardSNSFrm("+tl.boardSNS.boardNo+")' style='margin-right:2px;'>수정</button>";
						html+="<button class='btn btn-danger' onclick='deleteBoardSNS("+tl.boardSNS.boardNo+");'>삭제</button>";
					} 
					
					html+="</span>";
					html+="</td>";
					html+="</tr>";
					if(tl.imageSNSList.length>0){
						html+="<tr>";
						html+="<td>"
						html+="<div id='carouselExampleControls"+tl.boardSNS.boardNo+"' class='carousel slide' data-ride='carousel'>";
						html+="<div class='carousel-inner'>";
						for(j=0; j<tl.imageSNSList.length; j++){
							if(j==0){
								html+="<div class='carousel-item active'>";
							} else if(j>0){
								html+="<div class='carousel-item'>";
							}
							html+="<img src='<%=request.getContextPath()%>/upload/board/"+tl.imageSNSList[j].renamedFileName+"' class='d-block w-100' alt='...'>";
							html+="</div>";		
						}
						html+="</div>";
						html+="<a class='carousel-control-prev' href='#carouselExampleControls"+tl.boardSNS.boardNo+"' role='button' data-slide='prev'>";
						html+="<span class=;carousel-control-prev-icon' aria-hidden='true'></span>"
						html+="<span class='sr-only'>Previous</span>";
						html+="</a>";
						html+="<a class='carousel-control-next' href='#carouselExampleControls"+tl.boardSNS.boardNo+"' role='button' data-slide='next'>";
						html+="<span class='carousel-control-next-icon' aria-hidden='true'></span>";
						html+="<span class='sr-only'>Next</span>";
						html+="</a>";
						html+="</div>";
						html+="</td>";
						html+="</tr>";
					}
					if(tl.gradeSNSList.length>0){
						html+="<tr>";
						html+="<td style='padding:1px !important;'>";
						html+="<table>";
						html+="<tr>"
						for(k=0; k<tl.gradeSNSList.length; k++){
							html+="<td class='tbl-td'>";
							html+="<div class='card h-100'>";
								html+="<a href='#' class='goInfo'>";
								html+="<img class='card-img-top' src='"+tl.gradeSNSList[k].contentThumbnail+"'></a>";
								html+="<div class='caption'>";
								html+="<div class='caption-text' ><a href='<%=request.getContextPath()%>/travel/detailPage?contentId="+tl.gradeSNSList[k].contentId+"&contentTypeId="+tl.gradeSNSList[k].contentType+"' target='_blank'>"+tl.gradeSNSList[k].contentTitle+"</a>";
								html+="<div class='contentid' style='display:none'>"+tl.gradeSNSList[k].contentId+"</div></h4>"
								if(tl.gradeSNSList[k].contentAddress!=null){
									html+="<p class='card-text'>"+tl.gradeSNSList[k].contentAddress+"</p>"
								}
								html+="</div>"
								html+="</div>"
								html+="</div>"
								
								html+="<div class='starRev'>"
									for(var l=0; l<tl.gradeSNSList[k].grade; l++){
										html+="<span class='starR on'>별</span>";
									}
									for(var m=0; m<5-tl.gradeSNSList[k].grade; m++){
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
					
					if(tl.boardSNS.boardContent!=null){
						html+="<tr>";
						html+="<td class='timeline-boardcontent-sns' style='text-align:left; padding: 10px; margin:10px; border:none;'><a class='nickname-sns' href='<%=request.getContextPath() %>/story/storyMain?mypage="+tl.boardSNS.boardWriter+"'>@"+tl.boardSNS.boardWriter+"</a>&nbsp;"+tl.boardSNS.boardContent;
						
						if(tl.likeSNSList.length>0){
							var cnt = 0;
							
							if('<%=userLoggedIn.getUserId() %>' == tl.boardSNS.boardWriter){
								html+="<span style='float: right; margin-right:10px;' ><img vale='"+tl.boardSNS.boardNo+"' src='<%=request.getContextPath() %>/img/afterlike.png' alt='' style='padding-top:2px; padding-bottom:-2px; width: 20px; height:20px'/><span>"+tl.likeSNSList.length+"</span></span>";
							} else{
								for(var y=0; y<tl.likeSNSList.length; y++){
									if(tl.likeSNSList[y].userId=='<%=userLoggedIn.getUserId()%>'){
										cnt++;
									}
								}
								
								if(cnt>0){
									html+="<span style='float: right; margin-right:10px; cursor:pointer' ><img class='likes' onclick='like(this);' boardNo='"+tl.boardSNS.boardNo+"' src='<%=request.getContextPath() %>/img/afterlike.png' alt='' style='padding-top:2px; padding-bottom:-2px; width: 20px; height:20px'/><span class='likeCnt'>"+tl.likeSNSList.length+"</span>&nbsp;&nbsp;<img src='<%=request.getContextPath() %>/img/alarm.png' alt='' style='width: 20px; height:20px; cursor:pointer;'/></span>";
								}
								else {
									html+="<span style='float: right; margin-right:10px; cursor:pointer' ><img class='likes' onclick='like(this);' boardNo='"+tl.boardSNS.boardNo+"' src='<%=request.getContextPath() %>/img/beforelike.png' alt='' style='padding-top:2px; padding-bottom:-2px; width: 20px; height:20px'/><span class='likeCnt'>"+tl.likeSNSList.length+"</span>&nbsp;&nbsp;<img src='<%=request.getContextPath() %>/img/alarm.png' alt='' style='width: 20px; height:20px; cursor:pointer;'/></span>";
								}
							}
						}else{
							if('<%=userLoggedIn.getUserId() %>' == tl.boardSNS.boardWriter){
								html+="<span style='float: right; margin-right:10px;' ><img src='<%=request.getContextPath() %>/img/beforelike.png' alt='' style='padding-top:2px; padding-bottom:-2px; width: 20px; height:20px'/><span>0</span></span>";
							} else{
								html+="<span style='float: right; margin-right:10px; cursor:pointer'><img vale='"+tl.boardSNS.boardNo+"' class='likes' onclick='like(this);' boardNo='"+tl.boardSNS.boardNo+"' src='<%=request.getContextPath() %>/img/beforelike.png' alt='' style='padding-top:2px; padding-bottom:-2px; width: 20px; height:20px'/><span class='likeCnt'>0</span>&nbsp;&nbsp;<img src='<%=request.getContextPath() %>/img/alarm.png' alt='' style='width: 20px; height:20px'/></span>";
							}
						}
						
						
						html+="</td>";
						html+="</tr>";
					}
					html+="<tr>";
					if(tl.commentSNSList.length>0){
						html+="<td id='commentcnt"+tl.boardSNS.boardNo+"' value='"+tl.commentSNSList.length+"' class='timeline-boardcontent-sns' style='cursor:pointer;' onclick='openComment(this);'>댓글("+tl.commentSNSList.length+")</td>";
					} else{
						html+="<td id='commentcnt"+tl.boardSNS.boardNo+"' value='"+tl.commentSNSList.length+"' class='timeline-boardcontent-sns' style='cursor:pointer;' onclick='openComment(this);'>댓글(0)</td>";
					}
					html+="</td>";		
					html+="</tr>";
					html+="<tr style='display:none;'><td>"
						html+="<div class='comment-editor'>"
							
						html+="<textarea style='float:left; margin:5px;' name='boardCommentContent' class='boardCommentContent' cols='51' rows='3'></textarea>";
						html+="<button type='button' class='btn btn-primary' onclick='insertComment(this);' value='"+tl.boardSNS.boardNo+"' style='float:right; width:76px; height:68px; margin:5px 5px 5px 2px;'>등록</button>";	
					
						html+="</div>";
						html+="<table class='tbl-comment'>";
						if(tl.commentSNSList.length>0){
							for(var y=0; y<tl.commentSNSList.length; y++){
								if(tl.commentSNSList[y].commentLevel==1){
									html+="<tr class=level1 id='comment"+tl.commentSNSList[y].commentNo+"'>";
									html+="<td class='timeline-boardcontent-sns' style='width:529px;'>";
									html+="<a href='<%=request.getContextPath() %>/story/storyMain?mypage="+tl.commentSNSList[y].commentWriter+"'class='comment-writer' style='color:black; font-weight:700; font-size:1.2em; margin-right:3px;'><img src='<%=request.getContextPath()%>/upload/profile/"+tl.commentSNSList[y].commentProfile+"' class='header-profile-circle' width='30' height='30' />"+tl.commentSNSList[y].commentNickname+"@"+tl.commentSNSList[y].commentWriter+"</a>";
									html+="<span class='comment-date'  style='font-size:0.8em; color:gray'>"+tl.commentSNSList[y].commentUpdateDate+"</span>";
									html+="<br />";
									html+="<span style='padding: 10px;'>"+tl.commentSNSList[y].commentContent+"</span>";
									if('<%=userLoggedIn.getUserId() %>' == tl.commentSNSList[y].commentWriter){
										html+="<div>"
										html+="<button class='btn btn-primary' value='"+tl.commentSNSList[y].commentNo+"' onclick='openCoCo(this);' style='float:right;'>답글</button>";
										html+="<button class='btn btn-danger' value='"+tl.commentSNSList[y].commentNo+"' boardNo='"+tl.commentSNSList[y].boardNo+"' onclick='deleteComment(this);' style='float:right; margin-right: 2px;'>삭제</button>	";	
										html+="<button class='btn btn-success' value='"+tl.commentSNSList[y].commentNo+"' content='"+tl.commentSNSList[y].commentContent+"' onclick='updateCommentFrm(this)' style='float:right; margin-right: 2px;'>수정</button>	";	
										html+="</div>"
									} else{
										html+="<div>"
										html+="<button class='btn btn-primary' onclick='openCoCo(this);' value='"+tl.commentSNSList[y].commentNo+"' style='float:right;'>답글</button>";
										html+="</div>"
									}
									html+="</td>";
									html+="</tr>";
									
									<!--여기 -->
									html+="<tr style='display:none; float:right;'><td>"
										html+="<div class='mcomment-editor' style='float:right; display:none'>"
											html+="<textarea style='margin:7px 2px; float:left;' name='boardCommentContent' class='boardCommentContent' cols='45' rows='3'></textarea>";
											html+="<button type='button' class='btn btn-primary' onclick='insertCoCo(this)' value='"+tl.boardSNS.boardNo+"' style='width:76px; height:68px; margin:5px 2px;'>등록</button>";	
										html+="</div>";
									html+="</td>";
									html+="</tr>";
									
								}
								if(tl.commentSNSList[y].commentLevel==2){
									html+="<tr class='level2' id='comment"+tl.commentSNSList[y].commentNo+"'>";
									html+="<td class='timeline-boardcontent-sns' style='float:right; width:472px;'>";
									html+="<a href='<%=request.getContextPath() %>/story/storyMain?mypage="+tl.commentSNSList[y].commentWriter+"'class='comment-writer' style='color:black; font-weight:700; font-size:1.2em; margin-right:3px;'><img src='<%=request.getContextPath()%>/upload/profile/"+tl.commentSNSList[y].commentProfile+"' class='header-profile-circle' width='30' height='30' />"+tl.commentSNSList[y].commentNickname+"@"+tl.commentSNSList[y].commentWriter+"</a>";
									html+="<span class='comment-date'  style='font-size:0.8em; color:gray'>"+tl.commentSNSList[y].commentUpdateDate+"</span>";
									html+="<br />";
									html+="<span style='padding: 10px;'>"+tl.commentSNSList[y].commentContent+"</span>";
									if('<%=userLoggedIn.getUserId() %>' == tl.commentSNSList[y].commentWriter){
										html+="<div>"
										html+="<button class='btn btn-danger' value='"+tl.commentSNSList[y].commentNo+"' boardNo='"+tl.commentSNSList[y].boardNo+"' onclick='deleteComment(this);' style='float:right; margin-right: 2px;'>삭제</button>	";	
										html+="<button class='btn btn-success' value='"+tl.commentSNSList[y].commentNo+"' content='"+tl.commentSNSList[y].commentContent+"' onclick='updateCommentFrm(this)' style='float:right; margin-right: 2px;'>수정</button>	";	
										html+="</div>"
									}
									html+="</td>";
									html+="</tr>";
								}
							}
						}
							html+="</table>";
						
		
					
					html+="</td></tr>"
					
					html+="</table>"
					html+="</div>";
					
					
				});
				
				if((<%=new SNSService().selectBoardSNSCnt(mypage) %> - $(".tbl-boardsns").length) >0){
					html+="<div id='trMore'>더보기</div>";
				}
				
			$("#myBoardList").append(html);
	
			$("#trMore").click(function(e){
				pageMore(parseInt($(this).prev().attr('id').substr(9)));
				$(this).remove();
			});
			
			//마지막 페이지인 경우, 더보기 버튼 비활성화
			if(<%=new SNSService().selectBoardSNSCnt(mypage)>0 %>){
				if($('.tbl-boardsns').last().attr('id').substr(7) <= <%=new SNSService().selectLastBoardNo(mypage) %>){
						$("#trMore").remove();
				}
			}
			
			
			}
			
		},
		error: function(jqxhr, textStatus, errorThrown){
			console.log("ajax처리실패!");
			console.log(jqxhr, textStatus, errorThrown);
			
		}
	});
}


function modifyCancel(boardNo){
	$(".tbl-td").children(".starRev").css("margin-top", "0px");
	$(document.getElementById("container"+boardNo)).html('').html(mBeforeHtml);
	
	mcontentids = [];
	mcontenttypes = [];
	mcontentthumbnails = [];
	mcontenttitles = [];
	mcontentaddresses = [];
	mfilesTempArr = [];
	mcontentgrades = [];
	
	$("#fileModify").val("");
	$("#mreviewContent").val('');
	$(".mimgs").remove();
	
}


</script>	
	<style>#tdMore{text-align:center; padding: 10px; cursor:pointer; }

.w-100{
 	width:532px;
 	height:532px;
}

.timeline-boardcontent-sns{
	border: 1px solid black;
}
.wrapper{
	position:relative;
}
#mautoComplete{
	display: none;
	background: white;
	min-width: 253px;
	border: 1px solid gray;
	position: absolute;
	top: 22px;
	left: 0px;
	padding: 0;
	margin: 0;
}
#mautoComplete li{
	padding: 0 10px;
	list-style: none;
	cursor: pointer;
}
#mautoComplete li.sel{
	background: gray;
	color: white;
}

#msearch{
	margin-bottom: 5px;
}
#msearchFrm{
	display: inline;
	position: relative;
}
.row{
padding: 0 10px;
text-align: center;
}
.row .card-img-top, .goInfo{
width: 150px; height:  150px;
position: relative;
}
.card-img-top{
	border:1px solid gray;
	width: 150px;
	height: 150px;
}

.h-100{
width: 150px;
border: 1px solid transparent;
padding: 0 2px;

}

.card-text{
	font-size: 0.8em;
}

div.caption{
	display:block;
	width: 150px; height: 150px;
	position: absolute;
    top:0px;
    padding: 0px;
    opacity: 0; 
    background: rgb(0, 0, 0, 0.5);
    cursor: pointer;   
    text-align: center;
    vertical-align: middle;
}

.h-100:hover .caption{
	opacity: 1;
}
p.card-text{
	color: white;
}
.row{
	display: table;
}
.row div{
    display: table-cell;

}

.caption-text{
	width: 150px;
	height: 150px;
	text-align: center;
	display:table-cell;
	vertical-align: middle;
}

.cc{
	position: absolute;
	color:#fec503;
	top:1px;
	left:135px;
	curser:pointer;
	
}
.starR{
  background: url('http://miuu227.godohosting.com/images/icon/ico_review.png') no-repeat right 0;
  background-size: auto 100%;
  width: 30px;
  height: 30px;
  display:table-cell;
  text-indent: -9999px;
  cursor: pointer;
}
.starR.on{background-position:0 0;}

.starRev{
	margin:0 auto;
}
}
	



.tbl-td {
	width: 173px; height: 173px; 
}
.tbl-td .card-img-top, .goInfo {
	width: 173px; height: 173px; position: relative;
}
.tbl-td .card-img-top{
	border: 1px black solid;
	width: 173px;
	height: 173px;
		
	}
	
.tbl-td .h-100{
	width: 174px;
	
	padding: 0;
	
}
	
.tbl-td	div.caption{
		display:block;
		width: 173px; height: 173px;
		position: absolute;
	    top:0px;
	    padding: 0px;
	    opacity: 0; 
	    background: rgb(0, 0, 0, 0.5);
	    cursor: pointer;   
	    text-align: center;
	    vertical-align: middle;
	}
	
.tbl-td	.h-100:hover .caption{
		opacity: 1;
	}
.tbl-td	p.card-text{
		color: white;
	}
	
.tbl-td .card-text, a{
	font-size: 1em;
}
	
.tbl-td	.caption-text{
		width: 173px;
		height: 173px;
		text-align: center;
		display:table-cell;
		vertical-align: middle;
	}
.tbl-td	.starR{
	background: url('http://miuu227.godohosting.com/images/icon/ico_review.png') no-repeat right 0;
	background-size: auto 100%;
	width: 30px;
	height: 30px;
	display:table-cell;
	text-indent: -9999px;
	cursor:none;
		  
}
.tbl-td	.starR.on{background-position:0 0;}
		
.tbl-td	.starRev{
	margin:0 auto;
	width:150px;
}					


.tbl-boardsns{
	margin-bottom: 10px;
	border: 1px solid black;
}

.nickname-sns{
	font-size:1.2em;
	font-weight: 700;
	color:black;
}



#trMore{
	cursor:pointer;
	padding-bottom: 10px;
}



</style>

	
<div class="timeline-board-sns" id="myBoardList">



</div>
