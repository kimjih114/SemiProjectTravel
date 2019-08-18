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

function pageMore(boardNo){
	var param = {
			boardNo : boardNo,
			mypage:'<%=mypage %>'
	}
	$.ajax({
		url: "<%=request.getContextPath()%>/gson/sns/myLikeSNSList.do",
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
					html+="<img src='<%=request.getContextPath()%>/upload/profile/"+tl.profileSNS.profileRenamedFilename+"' class='header-profile-circle' width='30' height='30' />";
					html+="<span style='font-weight: 600'><a class='nickname-sns' href='<%=request.getContextPath() %>/story/storyMain?mypage="+tl.boardSNS.boardWriter+"'>"+tl.profileSNS.profileUserNickname+"</a></span>";
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
									if(cnt>0){
										html+="<span style='float: right; margin-right:10px; cursor:pointer' ><img class='likes' onclick='like(this);' boardNo='"+tl.boardSNS.boardNo+"' src='<%=request.getContextPath() %>/img/afterlike.png' alt='' style='padding-top:2px; padding-bottom:-2px; width: 20px; height:20px'/><span class='likeCnt'>"+tl.likeSNSList.length+"</span>&nbsp;&nbsp;<img src='<%=request.getContextPath() %>/img/alarm.png' alt='' style='width: 20px; height:20px'/></span>";
									}
									else {
										html+="<span style='float: right; margin-right:10px; cursor:pointer' ><img class='likes' onclick='like(this);' boardNo='"+tl.boardSNS.boardNo+"' src='<%=request.getContextPath() %>/img/beforelike.png' alt='' style='padding-top:2px; padding-bottom:-2px; width: 20px; height:20px'/><span class='likeCnt'>"+tl.likeSNSList.length+"</span>&nbsp;&nbsp;<img src='<%=request.getContextPath() %>/img/alarm.png' alt='' style='width: 20px; height:20px'/></span>";
									}
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
						html+="<td class='timeline-boardcontent-sns' style='cursor:pointer; onclick=openComment();'>댓글("+tl.commentSNSList.length+")</td>";
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
