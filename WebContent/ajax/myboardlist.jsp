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
<script>
$(()=>{
	pageMore(1);
	
	$("#tdMore").click((e)=>{
		var nextPage = Number($(e.target).val()) + 1;
		pageMore(nextPage);
	});
	
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
				
				console.log(bs.imageSNS1);
				console.log(bs.imageSNS5);
				html+="<tr>";
				html+="<td class='timeline-boardcontent-sns'>";
				html+="<img src='<%=request.getContextPath()%>/upload/profile/"+bs.profileSNS.profileRenamedFilename+"' class='header-profile-circle' width='30' height='30' />";
				html+="<span style='font-weight: 600'>"+bs.profileSNS.userNickname+" </span>";
				html+="<span style='font-size: 0.8em; color: gray;''>"+bs.boardDate+"</span>";
				html+="<span style='float: right;'>메뉴</span>";
				html+="</td>";
				html+="</tr>";
				html+="<tr>";
				if(bs.imageSNS1!==undefined){
				html+="<td class='timeline-boardcontent-sns' id='boardcontent_img'>"
				html+="<div id='carouselExampleControls' class='carousel slide' data-ride='carousel'>";
				html+="<div class='carousel-inner'>";
				    html+="<div class='carousel-item active'>";
					html+="<img src='<%=request.getContextPath()%>/upload/board/"+bs.imageSNS1.renamedFileName+"' class='d-block w-100' alt='...'>";
					html+="</div>";		
				if(bs.imageSNS2!==undefined){
				    html+="<div class='carousel-item'>";
					html+="<img src='<%=request.getContextPath()%>/upload/board/"+bs.imageSNS2.renamedFileName+"' class='d-block w-100' alt='...'>";
					html+="</div>";
				}			
				if(bs.imageSNS3!==undefined){
				    html+="<div class='carousel-item'>";
					html+="<img src='<%=request.getContextPath()%>/upload/board/"+bs.imageSNS3.renamedFileName+"' class='d-block w-100' alt='...'>";
					html+="</div>";
				}			
				if(bs.imageSNS4!==undefined){
				    html+="<div class='carousel-item'>";
					html+="<img src='<%=request.getContextPath()%>/upload/board/"+bs.imageSNS4.renamedFileName+"' class='d-block w-100' alt='...'>";
					html+="</div>";
				}			
				if(bs.imageSNS5!==undefined){
				    html+="<div class='carousel-item'>";
					html+="<img src='<%=request.getContextPath()%>/upload/board/"+bs.imageSNS5.renamedFileName+"' class='d-block w-100' alt='...'>";
					html+="</div>";
				}			
				html+="</div>";
				html+="<a class='carousel-control-prev' href='#carouselExampleControls' role='button' data-slide='prev'>";
				html+="<span class='carousel-control-prev-icon' aria-hidden='true'></span>"
				html+="<span class='sr-only'>Previous</span>";
				html+="</a>";
				html+="<a class='carousel-control-next' href='#carouselExampleControls' role='button' data-slide='next'>";
				html+="<span class='carousel-control-next-icon' aria-hidden='true'></span>";
				html+="<span class='sr-only'>Next</span>";
				html+="</a>";
				html+="</div>";
				html+="</td>";
				}
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
				html+="<tr><td stlye='height: 10px;'></td></tr>";

			});
			
		$("#myBoardList").append(html);
		
		//cPage값을 #btn-more에 저장하기
		$("#tdMore").val(cPage).text("더보기");
		
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
	<style>#tdMore{text-align:center; padding: 10px; }</style>
	
	
	
<table class="timeline-board-sns" id="myBoardList">
	<tr id="trMore">
		<td id="tdMore">&nbsp;</td>
	</tr>
</table>


