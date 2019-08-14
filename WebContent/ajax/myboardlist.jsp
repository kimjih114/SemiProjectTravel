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
			cPage:cPage
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
				html+="<tr>";
				html+="<td class='timeline-boardcontent-sns'>";
				html+="<img src='<%=request.getContextPath()%>/upload/profile/"+bs.profileSNS.profileRenamedFilename+"' class='header-profile-circle' width='30' height='30' />";
				html+="<span style='font-weight: 600'>"+bs.profileSNS.userNickname+" </span>";
				html+="<span style='font-size: 0.8em; color: gray;''>"+bs.boardDate+"</span>";
				html+="<span style='float: right;'>메뉴</span>";
				html+="</td>";
				html+="</tr>";
				html+="<tr>";
				html+="<td class='timeline-boardcontent-sns' id='boardcontent_img'>"
				html+="<div id='carouselExampleControls' class='carousel slide' data-ride='carousel'>";
				if(bs.imageSNSList!=null){
					html+="<div class='carousel-inner'>";
					for(j=0; j<bs.imageSNSList.length;j++){
						if(bs.imageSNSList[j]!=null){
							if(j==0){
								html+="<div class='carousel-item active'>";
				
							} else if(j>0){
								html+="<div class='carousel-item'>";
							}
							html+="<img src='<%=request.getContextPath()%>/upload/board/"+bs.imageSNSList[j].renamedFileName+"' class='d-block w-100' alt='...'>";
							html+="</div>";		
						}	
					}	
				}
				html+="</div>";
				html+="<a class='carousel-control-prev' href='#carouselExampleControls' role='button' data-slide='prev'>";
				html+="<span class=;carousel-control-prev-icon' aria-hidden='true'></span>"
				html+="<span class='sr-only'>Previous</span>";
				html+="</a>";
				html+="<a class='carousel-control-next' href='#carouselExampleControls' role='button' data-slide='next'>";
				html+="<span class='carousel-control-next-icon' aria-hidden='true'></span>";
				html+="<span class='sr-only'>Next</span>";
				html+="</a>";
				html+="</div>";
				html+="</td>";
				html+="</tr>";
				html+="<tr>";
				html+="<td>";
				html+="<table style='border: 1px solid;'>"
				html+="<tr>";
				html+="<td style='width: 175.67px; height: 175.67px; border: 1px solid;'>관련여행지1</td>";
				html+="<td style='width: 175.67px; height: 175.67px; border: 1px solid;'>관련여행지2</td>";
				html+="<td style='width: 175.67px; height: 175.67px; border: 1px solid;'>관련여행지3</td>";					
				html+="</tr>";
				html+="</table>";
				html+="</td>";
				html+="</tr>";
				html+="<tr>";
				html+="<td class='timeline-boardcontent-sns'>"+bs.boardContent+"</td>";
				html+="</tr>";
				html+="<tr>";
				html+="<td class='timeline-boardcontent-sns'>";
				html+="<span style='float: right;'>좋아요(12)</span>";
				html+="</td>";
				html+="</tr>";
				html+="<tr>";
				html+="<td class='timeline-boardcontent-sns'>댓글(3)</td>";
				html+="</tr>";
				html+="<tr>";
				html+="<td class='timeline-boardcontent-sns'>";
				html+="<span class='nick_sns'>@abcde</span>&nbsp;";
				html+="<span style='float:right;'>&nbsp;&nbsp;좋아요&nbsp;&nbsp;팔로잉&nbsp;&nbsp;블랙리스트</span>";
				html+="</td>";		
				html+="</tr>";
				html+="<tr><td stlye='height: 10px;'></td></tr>";
			});

			html+="<tr id='trMore'><td id='tdMore'>&nbsp;</td></tr>";
			
		$("#myBoardList").append(html);
		

		$("#tdMore").click(function(e){
			var nextPage = Number($(e.target).val()) + 1;
			pageMore(nextPage);
			$(this).remove();
		});
		
		//cPage값을 #btn-more에 저장하기
		$("#tdMore").val(cPage).text("더보기("+cPage+"/<%=totalPage %>)");
		
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
	<style>#tdMore{text-align:center; padding: 10px; cursor:pointer; }</style>
	
	
	
<table class="timeline-board-sns" id="myBoardList">
</table>


