<%@page import="sns.model.vo.ProfileSNS"%>
<%@page import="sns.model.vo.BoardSNS"%>
<%@page import="sns.model.service.SNSService"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%
	String mypage = request.getParameter("mypage");
	int totalPage = Integer.parseInt(request.getParameter("totalPage"));
	
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
$(()=>{
	pageMore(1);
});

function pageMore(cPage){
	var param = {
			cPage:cPage,
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
			
			$.each(data,(i,bs)=>{
				html+="<table class='tbl-boardsns'>"
				html+="<tr>";
				html+="<td class='timeline-boardcontent-sns'>";
				html+="<img src='<%=request.getContextPath()%>/upload/profile/"+bs.profileSNS.profileRenamedFilename+"' class='header-profile-circle' width='30' height='30' />";
				html+="<span style='font-weight: 600'>"+bs.profileSNS.userNickname+"</span>";
				html+="<span style='font-size: 0.8em; color: gray;''>"+bs.boardDate+"</span>";
				html+="<span style='float: right;'>팔/언팔 블락</span>";
				html+="</td>";
				html+="</tr>";
				if(bs.imageSNSList!=null){
					html+="<tr>";
					html+="<td>"
					html+="<div id='carouselExampleControls"+bs.boardNo+"' class='carousel slide' data-ride='carousel'>";
					html+="<div class='carousel-inner'>";
					for(j=0; j<bs.imageSNSList.length; j++){
						if(j==0){
							html+="<div class='carousel-item active'>";
						} else if(j>0){
							html+="<div class='carousel-item'>";
						}
						html+="<img src='<%=request.getContextPath()%>/upload/board/"+bs.imageSNSList[j].renamedFileName+"' class='d-block w-100' alt='...'>";
						html+="</div>";		
					}
					html+="</div>";
					html+="<a class='carousel-control-prev' href='#carouselExampleControls"+bs.boardNo+"' role='button' data-slide='prev'>";
					html+="<span class=;carousel-control-prev-icon' aria-hidden='true'></span>"
					html+="<span class='sr-only'>Previous</span>";
					html+="</a>";
					html+="<a class='carousel-control-next' href='#carouselExampleControls"+bs.boardNo+"' role='button' data-slide='next'>";
					html+="<span class='carousel-control-next-icon' aria-hidden='true'></span>";
					html+="<span class='sr-only'>Next</span>";
					html+="</a>";
					html+="</div>";
					html+="</td>";
					html+="</tr>";
				}
				if(bs.gradeSNSList!=null){
					html+="<tr>";
					html+="<td>";
					html+="<table>";
					html+="<tr>"
					for(k=0; k<bs.gradeSNSList.length; k++){
						html+="<td class='tbl-td'>";
						html+="<div class='card h-100'>";
							html+="<a href='#' class='goInfo'>";
							html+="<img class='card-img-top' src='"+bs.gradeSNSList[k].contentThumbnail+"'></a>";
							html+="<div class='caption'>";
							html+="<div class='caption-text' ><a href='<%=request.getContextPath()%>/travel/detailPage?contentId="+bs.gradeSNSList[k].contentId+"&contentTypeId="+bs.gradeSNSList[k].contentType+"'>"+bs.gradeSNSList[k].contentTitle+"</a>";
							html+="<div class='contentid' style='display:none'>"+bs.gradeSNSList[k].contentId+"</div></h4>"
							html+="<p class='card-text'>"+bs.gradeSNSList[k].contentAddress+"</p>"
							html+="</div>"
							html+="</div>"
							html+="</div>"
							
							html+="<div class='starRev'>"
								for(var l=0; l<bs.gradeSNSList[k].grade; l++){
									html+="<span class='starR on'>별</span>";
								}
								for(var m=0; m<5-bs.gradeSNSList[k].grade; m++){
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
				
				if(bs.boardContent!=null){
					html+="<tr>";
					html+="<td style='text-align:left; padding: 10px; margin:10px;'><a class='nickname-sns' href='<%=request.getContextPath() %>/story/storyMain?mypage='"+bs.boardWriter+"'>@"+bs.profileSNS.userNickname+"</a>&nbsp;"+bs.boardContent+"</td>";
					html+="</tr>";
				}
				
				html+="<tr>";
				html+="<td>";
				html+="<span style='float: right;'>좋아요&nbsp;&nbsp;신고</span>";
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
			});
			if(<%=totalPage%> >0){
				html+="<div id='trMore'>&nbsp;</div>";
			}
		$("#myBoardList").append(html);
		

		$("#trMore").click(function(e){
			var nextPage = Number($(e.target).val()) + 1;
			pageMore(nextPage);
			$(this).remove();
		});
		
		//cPage값을 #btn-more에 저장하기
		$("#trMore").val(cPage).text("더보기("+cPage+"/<%=totalPage %>)");
		
		//마지막 페이지인 경우, 더보기 버튼 비활성화
		if(cPage == <%=totalPage%>){
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
	
.timeline-boardcontent-sns{
	border: 1px solid black;
}
.wrapper{
	position:relative;
}
#autoComplete{
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
#autoComplete li{
	padding: 0 10px;
	list-style: none;
	cursor: pointer;
}
#autoComplete li.sel{
	background: gray;
	color: white;
}

#search{
	margin-bottom: 5px;
}
#searchFrm{
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
















</style>
	
	
	
<div class="timeline-board-sns" id="myBoardList">



</divs>


