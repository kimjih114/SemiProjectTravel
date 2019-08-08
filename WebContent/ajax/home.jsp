<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<style>
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
}

#postFrm tr{
	/* border : 1px solid;
	border-collapse: collapse; */
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



</style>
    
<div id="post">post</div>

	<table id="postFrm">
		<tr>
			<td style="font-weight: 700;">소중한 여행후기를 공유해주세요!</td>
		</tr>
		<tr>
			<td style="font-weight: 700;">
				<div class="travelsrch" style="float: left;"></div>
			</td>
		</tr>
		<tr>
			<td>
				<label for="reviewContent" style="font-weight: 700;">어떤 여행을 하셨나요?</label>
				<textarea name="reviewContent" id="reviewContent" cols="55" rows="5"></textarea>
				<!-- <table>
					<tr>
						<td style="padding:0px;">
							<div class="img-review" style="border:1px solid; width: 50px; height: 50px;"></div>
						</td>
					</tr>
				</table> -->
			</td>
		</tr>
		<tr>
			<td>
				<button type="button" style="float:right;">포스트 등록</button>
			</td>
		</tr>
	</table>
		  <div id="tab-container" class="post-unpushed">
			<ul class="tab">
				<li class="current" data-tab="tab1"><a>타임라인</a></li>
				<li data-tab="tab2"><a>추천</a></li>
				<li data-tab="tab3"><a>스크랩</a></li>
			</ul>
		
			<div id="tab1" class="tabcontent current">
				<div class="timeline-sns">
					<table class="timeline-board-sns">
						<tr>
							<td class="timeline-boardcontent-sns"><img src="<%=request.getContextPath() %>/img/profile.jpg" class="header-profile-circle"  width="30" height="30" />
							    <span style="font-weight:600">@닉네임</span>님이 리뷰를 남기셨습니다.
							  	<span style="float:right;">메뉴</span>
						</tr>
						<tr>
							<td class="timeline-boardcontent-sns" id="boardcontent_img">
								<div id="carouselExampleControls" class="carousel slide" data-ride="carousel">
								  <div class="carousel-inner">
								    <div class="carousel-item active">
								      <img src="<%=request.getContextPath() %>/img/이동욱.jpg" class="d-block w-100" alt="...">
								    </div>
								    <div class="carousel-item">
								      <img src="<%=request.getContextPath() %>/img/profile.jpg" class="d-block w-100" alt="...">
								    </div>
								    <div class="carousel-item">
								      <img src="<%=request.getContextPath() %>/img/이동욱.jpg" class="d-block w-100" alt="...">
								    </div>
								  </div>
								  <a class="carousel-control-prev" href="#carouselExampleControls" role="button" data-slide="prev">
								    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
								    <span class="sr-only">Previous</span>
								  </a>
								  <a class="carousel-control-next" href="#carouselExampleControls" role="button" data-slide="next">
								    <span class="carousel-control-next-icon" aria-hidden="true"></span>
								    <span class="sr-only">Next</span>
								  </a>
								</div>
							</td>
						</tr>
						<tr>
							<td>
								<table style="border: 1px solid;">
									<tr>
										<td style="width: 175.67px; height: 175.67px; border:1px solid;">관련여행지 1</td>
										<td style="width: 175.67px; height: 175.67px; border:1px solid;">관련여행지 2</td>
										<td style="width: 175.67px; height: 175.67px; border:1px solid;">관련여행지 3</td>
									</tr>
								</table>
							</td>
						</tr>
						<tr>
							<td class="timeline-boardcontent-sns">Lorem ipsum dolor sit amet, consectetur adipisicing elit. A tempore labore atque tenetur dolore recusandae nemo sunt commodi aliquid aut voluptatum hic nostrum velit aperiam consectetur temporibus eius harum cumque?</td>
						</tr>
						<tr>
							<td class="timeline-boardcontent-sns"><span style="float:right;">좋아요(12)&nbsp;&nbsp;스크랩(2)</span></td>
						</tr>
						<tr>
							<td class="timeline-boardcontent-sns">댓글(3)</td>
						</tr>
						<tr>
							<td class="timeline-boardcontent-sns"><span class="nick_sns">@abcde</span>&nbsp;Lorem ipsum dolor sit amet, consectetur adipisicing elit. Doloribus necessitatibus sequi dignissimos obcaecati non harum laudantium sed delectus at alias ducimus porro odio aut dolores vel totam aperiam ex eaque. <span style="float:right;">&nbsp;&nbsp;좋아요&nbsp;&nbsp;팔로잉&nbsp;&nbsp;블랙리스트</span></td>		
						</tr>
						<tr>
							<td class="timeline-boardcontent-sns"><span class="nick_sns">@qwerty</span>&nbsp;Lorem ipsum dolor sit amet, consectetur adipisicing elit. Eum enim reprehenderit delectus itaque distinctio maxime optio nobis impedit magnam repellendus incidunt quaerat ex architecto nemo quod dolore officia amet accusantium.</td>
						</tr>
						<tr>
							<td class="timeline-boardcontent-sns"><span class="nick_sns">@seulgi</span>&nbsp;Lorem ipsum dolor sit amet, consectetur adipisicing elit. Vitae magni minus a quos non veritatis ut omnis praesentium hic repellat suscipit libero voluptatem iste totam impedit id necessitatibus et tenetur.</td>
						</tr>
					</table>
		    	</div>
			</div>
		
			<div id="tab2" class="tabcontent">
				<h3>좋아요</h3>
				<p>Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of "de Finibus Bonorum et Malorum" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, "Lorem ipsum dolor sit amet..", comes from a line in section 1.10.32.</p>
			</div>
		
			<div id="tab3" class="tabcontent">
				<h3>스크랩</h3>
					<p>It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for 'lorem ipsum' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).</p>
				</div>
		</div>
<script>
$(()=>{
	location.href="#"
})

$(function() {
	$('ul.tab li').click(function() {
		var activeTab = $(this).attr('data-tab');
		$('ul.tab li').removeClass('current');
		$('.tabcontent').removeClass('current');
		$(this).addClass('current');
		$('#' + activeTab).addClass('current');
	})
});
	
$("#post").click(function(){
	$("#tab-container").removeClass('post-unpushed');
	$("#tab-container").addClass('post-pushed');
		
	$("#postFrm").css('display', 'block');
	
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


	
	

</script>