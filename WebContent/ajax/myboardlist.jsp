<%@page import="user.model.vo.User"%>
<%@page import="sns.model.vo.ProfileSNS"%>
<%@page import="sns.model.vo.BoardSNS"%>
<%@page import="sns.model.service.SNSService"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%
	String mypage = request.getParameter("mypage");
	int totalContents = Integer.parseInt(request.getParameter("totalContents"));
	int lastBoardNo = Integer.parseInt(request.getParameter("lastBoardNo"));
	
	User userLoggedIn = (User)session.getAttribute("userLoggedIn");
	
%>



<script>
var mcontentids = new Array();
var mcontenttypes = new Array();
var mcontentthumbnails = new Array();
var mcontenttitles = new Array();
var mcontentaddresses = new Array();
var mfilesTempArr = new Array();

var mBeforeHtml = "";

$(()=>{
	pageMore(10000);
});


var msel_files=[];

function mHandleImgsFilesSelect(e){
	if($(".mimgs").length>0){
		$(".mimgs").each(function(){
			$(this).remove();
		})
	};
		$(".mimgs_wrap").css("display", "block");
	
	var mfiles = e.target.files;
	var mfilesArr = Array.prototype.slice.call(mfiles);
	var mfilesArrLen = mfilesArr.length;
	var mfilesTempArrLen = mfilesTempArr.length;
	
	if(mfilesArrLen>5){	
		$("#fileModify").val("");
		alert("첨부파일은 5개까지만 가능합니다.");
		return;
	}

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
			var html = "<div class='mimgs'><img src=\""+e.target.result+"\" />";
		 	var mfilename = f.name;
		 	
		 	if(mfilename.length>7){
		 		var mdot = mfilename.substring(mfilename.indexOf('.'));
		 		mfilename = mfilename.substr(0, 7) + "..." + mdot;
		 	}
			html += "<div><span>"+mfilename+"</span><br>";
			html += "<span>("+(f.size)/1000+"kb)</span><div></div>";
			$(".mimgs_wrap").append(html);
			
		}
		mreader.readAsDataURL(f);
		
		$(".panel").remove();
	});
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




function updateBoardSNS(boardNo){
	
	if($("#postFrm").css('display')=='block'){
		return;
	}
	if($(".snsModify").length>0){
		return;
	}
	
	mBeforeHtml=$(document.querySelector('#container'+boardNo)).html();
	

	$(".tbl-td").children(".starRev").css("margin-top", "23px");
	
	var param={
			boardNo : boardNo
		}
			$.ajax({
				url : '<%=request.getContextPath()%>/gson/sns/updateBoardSNSFrm.do',
				data : param,
				dataType: 'json',
				type : 'post',
				success : function(data){
					console.log(data);
					
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
					html += "<textarea name='reviewContent' id='reviewContent' cols='56' rows='5' required>"+data.boardSNS.boardContent+"</textarea>";
					html += "<div id='contentIdList'>";
					html += "</div>";
					html += "</td>";
					html += "</tr>";
					
					
					html+="<tr>";
					html += "<td style='padding: 10px; width: 508px; text-align:left;'>";
					html += "<label for='' style='font-weight: 700; float:left;'>첨부이미지</label>";
					html += "<span style='font-size:0.5em; color:gray; float:left;'>최대 5개까지 등록 가능합니다.</span><br>";
					html += "<input name='fileupload' type='file' accept='image/*' style='float:left; width:500px;' multiple />";
					html += "<div style='display:table; '>";
					
					if(data.imageSNSList.length>0){
						html += "<div class='mimgs_wrap' style='display: block;  margin-top:10px; text-align: center; vertical-align: middle; table-layout: fixed; width:100%;'>";
					}
					else{
						html += "<div class='mimgs_wrap' style='display:none; margin-top:10px;  text-align: center; vertical-align: middle; table-layout: fixed; width:100%;'>";
					}
					if(data.imageSNSList.length>0){
						for(var t=0; t<data.imageSNSList.length; t++){
							html += "<div class='mimgs' style='display: table-cell; max-width: 100px; font-size:0.8em;'>";
							html+="<img src='<%=request.getContextPath() %>/upload/board/"+data.imageSNSList[t].renamedFileName+"' style='width: 95px; height: 95px; margin: 0 2px;' />";
						 	var filename = data.imageSNSList[t].originalFileName;
						 	
						 	if(filename.length>7){
						 		var dot = filename.substring(filename.indexOf('.'));
						 		filename = filename.substr(0, 7) + "..." +  dot;
						 	}
						 	
							html += "<div><span>"+filename+"</span>";
							html += "</div>";
								html += "</div>";
						}
					}
					
					
					html += "</div>";	
					html += "</td>";
					html +="</tr>";
					html += "<tr>";
					html += "<td style='padding: 10px; width: 508px; text-align:left;'>";		
					if(data.boardSNS.boardType=='P'){
						html += "<input type='radio' name='boardtype' value='P' checked />";
						html += "<label for='public'>전체공개</label> &nbsp;";
						html += "<input type='radio' name='boardtype' value='F' />";
						html += "<label for='followOnly'>팔로워공개</label> &nbsp;";
						html += "<input type='radio' name='boardtype' value='L' />";
						html += "<label for='locked'>비공개</label>";
					}
					else if(data.boardSNS.boardType=='F'){
						html += "<input type='radio' name='boardtype' value='P' />";
						html += "<label for='public'>전체공개</label> &nbsp;";
						html += "<input type='radio' name='boardtype' value='F' checked />";
						html += "<label for='followOnly'>팔로워공개</label> &nbsp;";
						html += "<input type='radio' name='boardtype' value='L' />";
						html += "<label for='locked'>비공개</label>";
					}
					if(data.boardSNS.boardType=='L'){
						html += "<input type='radio' name='boardtype' value='P' />";
						html += "<label for='public'>전체공개</label> &nbsp;";
						html += "<input type='radio' name='boardtype' value='F' />";
						html += "<label for='followOnly'>팔로워공개</label> &nbsp;";
						html += "<input type='radio' name='boardtype' value='L' checked  />";
						html += "<label for='locked'>비공개</label>";
					}
					html += "<br>";
					html+="<span style='float: right;'>";
					html+="<button class='btn btn-success' style='margin-right:2px;'>수정</button>";
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
						}
					}
					
					var parameter = {
							mcontentids : mcontentids,
							mcontenttypes : mcontenttypes,
							mcontentthumbnails : mcontentthumbnails,
							mcontenttitles : mcontenttitles,
							mcontentaddresses : mcontentaddresses
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
				},
				error : function(data){
					console.log("ajax처리실패");
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
				var html = "";
				
				$.each(data,(i,tl)=>{
					html+="<div id='container"+tl.boardSNS.boardNo+"'>";
					html+="<table class='tbl-boardsns' id='boardNo"+tl.boardSNS.boardNo+"'>"
					html+="<tr>";
					html+="<td class='timeline-boardcontent-sns'>";
					html+="<img src='<%=request.getContextPath()%>/upload/profile/"+tl.profileSNS.profileRenamedFilename+"' class='header-profile-circle' width='30' height='30' />";
					html+="<span style='font-weight: 600'><a class='nickname-sns' href='<%=request.getContextPath() %>/story/storyMain?mypage="+tl.boardSNS.boardWriter+"'>"+tl.profileSNS.userNickname+"</a></span>";
					html+="<span style='font-size: 0.8em; color: gray;''>"+tl.boardSNS.boardDate+"</span>";
					html+="<span style='float: right;'>";
					if(tl.boardSNS.boardWriter=='<%=userLoggedIn.getUserId()%>'){
						html+="<button class='btn btn-success' onclick='updateBoardSNS("+tl.boardSNS.boardNo+")' style='margin-right:2px;'>수정</button>";
						html+="<button class='btn btn-danger' onclick='deleteBoardSNS("+tl.boardSNS.boardNo+");'>삭제</button>";
					} 
					
					html+="</span>";
					html+="</td>";
					html+="</tr>";
					if(tl.imageSNSList!=null){
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
					if(tl.gradeSNSList!=null){
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
								html+="<p class='card-text'>"+tl.gradeSNSList[k].contentAddress+"</p>"
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
						html+="<td class='timeline-boardcontent-sns' style='text-align:left; padding: 10px; margin:10px;'><a class='nickname-sns' href='<%=request.getContextPath() %>/story/storyMain?mypage="+tl.boardSNS.boardWriter+"'>@"+tl.boardSNS.boardWriter+"</a>&nbsp;"+tl.boardSNS.boardContent+"</td>";
						html+="</tr>";
					}
					
					
					html+="<tr>";
					html+="<td>";
					html+="<span style='float: right; margin:10px;' ><img src='<%=request.getContextPath() %>/img/beforelike.png' alt='' style='padding-top:2px; padding-bottom:-2px; width: 20px; height:20px'/>1&nbsp;&nbsp;<img src='<%=request.getContextPath() %>/img/alarm.png' alt='' style='width: 20px; height:20px'/></span>";
					html+="</td>";
					html+="</tr>";
					html+="<tr>";
					html+="<td class='timeline-boardcontent-sns' >댓글(3)</td>";
					html+="</tr>";
					html+="<tr>";
					html+="<td class='timeline-boardcontent-sns'>";
					html+="<span class='nick_sns'>@abcde</span>&nbsp;";
					html+="<span style='float:right;'>좋아요&nbsp;&nbsp;신고</span>";
					html+="</td>";		
					html+="</tr>";
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
			if($('.tbl-boardsns').last().attr('id').substr(7) <= '<%=lastBoardNo%>'){
				$("#trMore").remove();
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
	$(document.getElementById("container"+boardNo)).html('').html(mBeforeHtml);
	
	mcontentids = [];
	mcontenttypes = [];
	mcontentthumbnails = [];
	mcontenttitles = [];
	mcontentaddresses = [];
	mfilesTempArr = [];
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


