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
<!-- Bootstrap core CSS -->
  <link href="/trav/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

  <!-- Custom fonts for this template -->
  <link href="/trav/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
  <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" type="text/css">
  <link href='https://fonts.googleapis.com/css?family=Kaushan+Script' rel='stylesheet' type='text/css'>
  <link href='https://fonts.googleapis.com/css?family=Droid+Serif:400,700,400italic,700italic' rel='stylesheet' type='text/css'>
  <link href='https://fonts.googleapis.com/css?family=Roboto+Slab:400,100,300,700' rel='stylesheet' type='text/css'>

  <!-- Custom styles for this template -->
  <link href="/trav/css/agency.min.css" rel="stylesheet">
  
  <!-- Bootstrap core JavaScript -->
  <script src="/trav/vendor/jquery/jquery.min.js"></script>
  <script src="/trav/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

  <!-- Plugin JavaScript -->
  <script src="/trav/vendor/jquery-easing/jquery.easing.min.js"></script>

  <!-- Contact form JavaScript -->
  <script src="/trav/js/jqBootstrapValidation.js"></script>
  <script src="/trav/js/contact_me.js"></script>

  <!-- Custom scripts for this template -->
  <script src="/trav/js/agency.min.js"></script>


<script>

var mcontentids = new Array();
var mcontenttypes = new Array();
var mcontentthumbnails = new Array();
var mcontenttitles = new Array();
var mcontentaddresses = new Array();
$(()=>{
	pageMore(10000);
});

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
	console.log();
	
	$(document.querySelector('#container'+boardNo)).html('');
	
	var param={
			boardNo : boardNo
		}
			$.ajax({
				url : '<%=request.getContextPath()%>/gson/sns/updateBoardSNSFrm.do',
				data : param,
				dataType: 'json',
				type : 'post',
				success : function(data){	
					var html = '';
					html += "<form action='' name='snsUpload'";
					html += "class='snsUpload'";
					html += "method='post'";
					html += "enctype='multipart/form-data' style='border:1px solid black; padding: 10px; margin-bottom:10px;'>";
					html += "<table class='postFrm' style='padding:10px;'>";
					html += "<tr>";
					html += "<td style='font-weight: 700; padding:10px; text-align:left;'>여행 후기를 수정합니다.</td>";
					html += "</tr>";
					html += "<tr>";
					html += "<td style='style='font-weight: 700; float:left; padding:10px'>";
					html += "<div class='travelsrchM' style='padding: 10px;'></div>";
					html += "</td>";
					html += "</tr>";
					html += "<tr>";
					html += "<td style='font-weight: 700; float:left; padding:10px;'>";
					html += "<label for='reviewContent' style='font-weight: 700; float:left;'>어떤 여행을 하셨나요?</label>";
					html += "<textarea name='reviewContent' id='reviewContent' cols='58' rows='5' required></textarea>";
					html += "<div id='contentIdList'>";
					html += "</div>";
					html += "</td>";
					html += "</tr>";
					html += "<tr>";
					html += "<td style='float:left; padding:10px; text-align:left;'>";
					html += "<label for='' style='font-weight: 700;  float:left; margin-bottom:10px;'>첨부이미지</label>";
					html += "<span style='font-size:0.5em; color:gray;'>최대 5개까지 등록 가능합니다.</span><br>";
					html += "<input name='fileupload' id='fileupload' type='file' accept='image/*' style='margin-bottom:10px;' multiple />";
					html += "<div style='display:table;'>";
					html += "<div class='imgs_wrap'></div>";
					html += "</div>";
					html += "</td>";
					html += "</tr>";
					html += "<tr>";
					html += "<td style='float:left; padding:10px;'>";
					html += "<input type='radio' name='boardtype' id='public' value='P' checked />";
					html += "<label for='public'>전체공개</label> &nbsp;";
					html += "<input type='radio' name='boardtype' id='followOnly' value='F' />";
					html += "<label for='followOnly'>팔로워공개</label> &nbsp;";
					html += "<input type='radio' name='boardtype' id='locked' value='L' />";
					html += "<label for='locked'>비공개</label>";
					html += "<br>";
					html += "<input type='submit' id='btnSubmit' value='포스트 등록' style='float:right; margin-top : 10px;''>";
					html += "</td>";
					html += "</tr>";
					html += "</table>";
					html += "</form>";
					
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
			console.log(data);
			
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
					html+="<td>";
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
				
				html+="<t>";
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
			pageMore($(this).prev().attr('id').substr(7));
			$(this).remove();
		});
		
		//마지막 페이지인 경우, 더보기 버튼 비활성화
		if($('.tbl-boardsns').last().attr('id').substr(7) <= '<%=lastBoardNo%>'){
			$("#trMore").remove();
		}
			
		},
		error: function(jqxhr, textStatus, errorThrown){
			console.log("ajax처리실패!");
			console.log(jqxhr, textStatus, errorThrown);
		}
	});
	
	
	
	
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
	marign:0 auto;
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
	
	#post{
	position: absolute;
	top:10px;
	left: 698px;
	border: 1px solid;
}


</style>
	
	
	
<div class="timeline-board-sns" id="myBoardList">



</div>


