<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 예약/결제</title>
<script src="<%=request.getContextPath()%>/js/jquery-3.4.1.js"></script>
<style>
.faq_page{
	padding: 13px 0;
	border: 3px solid brown;
	background: lightgray;
}

.container_out{
	color: green;
	background: darkgray;
}

h2 h_title{
	margin-botton: 19px;
	padding-top: 41px;
	font-weight: 600;
	color: #252525;
	line-height: 20px;
}

.question{
	width: 600px;
	margin: 0 auto;
	border: 1px solid black;
	background: gold;
}

.answer{
	width: 600px;
	margin: 0 auto;
	border: 1px solid grey;
	background: lavender;
}
</style>
<script>
function searchKeyword(){
	$("#q1_1").css("display","block");
	$("#q1_2").css("display","block");
	$("#q2_1").css("display","block");
	$("#q2_2").css("display","block");
	$("#q3_1").css("display","block");
	$("#q3_2").css("display","block");
	$("#q4_1").css("display","block");
	$("#q4_2").css("display","block");
	$("#q5_1").css("display","block");
	$("#q5_2").css("display","block");
	$("#q6_1").css("display","block");
	$("#q6_2").css("display","block");
	$("#q7_1").css("display","block");
	$("#q7_2").css("display","block");
	$("#q8_1").css("display","block");
	$("#q8_2").css("display","block");
	$("#q9_1").css("display","block");
	$("#q9_2").css("display","block");
	$("#q10_1").css("display","block");
	$("#q10_2").css("display","block");
	$("#q11_1").css("display","block");
	$("#q11_2").css("display","block");
	$("#q12_1").css("display","block");
	$("#q12_2").css("display","block");
	$("#q13_1").css("display","block");
	$("#q13_2").css("display","block");
	$("#q14_1").css("display","block");
	$("#q14_2").css("display","block");
	$("#q15_1").css("display","block");
	$("#q15_2").css("display","block");
	$("#q16_1").css("display","block");
	$("#q16_2").css("display","block");
	$("#q17_1").css("display","block");
	$("#q17_2").css("display","block");
	$("#q18_1").css("display","block");
	$("#q18_2").css("display","block");
	
	var searchKwd = $("#search-term").val();
	var q1 = $("#q1").val();
	var q2 = $("#q2").val();
	var q3 = $("#q3").val();
	var q4 = $("#q4").val();
	var q5 = $("#q5").val();
	var q6 = $("#q6").val();
	var q7 = $("#q7").val();
	var q8 = $("#q8").val();
	var q9 = $("#q9").val();
	var q10 = $("#q10").val();
	var q11 = $("#q11").val();
	var q12 = $("#q12").val();
	var q13 = $("#q13").val();
	var q14 = $("#q14").val();
	var q15 = $("#q15").val();
	var q16 = $("#q16").val();
	var q17 = $("#q17").val();
	var q18 = $("#q18").val();
	
	if(q1.indexOf(searchKwd) == -1){
		$("#q1_1").css("display","none");
		$("#q1_2").css("display","none");
	}
	
	if(q2.indexOf(searchKwd) == -1){
		$("#q2_1").css("display","none");
		$("#q2_2").css("display","none");
	}
	
	if(q3.indexOf(searchKwd) == -1){
		$("#q3_1").css("display","none");
		$("#q3_2").css("display","none");
	}
	
	if(q4.indexOf(searchKwd) == -1){
		$("#q4_1").css("display","none");
		$("#q4_2").css("display","none");
	}
	
	if(q5.indexOf(searchKwd) == -1){
		$("#q5_1").css("display","none");
		$("#q5_2").css("display","none");
	}
	
	if(q6.indexOf(searchKwd) == -1){
		$("#q6_1").css("display","none");
		$("#q6_2").css("display","none");
	}
	
	if(q7.indexOf(searchKwd) == -1){
		$("#q7_1").css("display","none");
		$("#q7_2").css("display","none");
	}
	
	if(q8.indexOf(searchKwd) == -1){
		$("#q8_1").css("display","none");
		$("#q8_2").css("display","none");
	}
	
	if(q9.indexOf(searchKwd) == -1){
		$("#q9_1").css("display","none");
		$("#q9_2").css("display","none");
	}
	
	if(q10.indexOf(searchKwd) == -1){
		$("#q10_1").css("display","none");
		$("#q10_2").css("display","none");
	}
	
	if(q11.indexOf(searchKwd) == -1){
		$("#q11_1").css("display","none");
		$("#q11_2").css("display","none");
	}
	
	if(q12.indexOf(searchKwd) == -1){
		$("#q12_1").css("display","none");
		$("#q12_2").css("display","none");
	}
	
	if(q13.indexOf(searchKwd) == -1){
		$("#q13_1").css("display","none");
		$("#q13_2").css("display","none");
	}
	
	if(q14.indexOf(searchKwd) == -1){
		$("#q14_1").css("display","none");
		$("#q14_2").css("display","none");
	}
	
	if(q15.indexOf(searchKwd) == -1){
		$("#q15_1").css("display","none");
		$("#q15_2").css("display","none");
	}
	
	if(q16.indexOf(searchKwd) == -1){
		$("#q16_1").css("display","none");
		$("#q16_2").css("display","none");
	}
	
	if(q17.indexOf(searchKwd) == -1){
		$("#q17_1").css("display","none");
		$("#q17_2").css("display","none");
	}
	
	if(q18.indexOf(searchKwd) == -1){
		$("#q18_1").css("display","none");
		$("#q18_2").css("display","none");
	}
}
</script>
</head>
<body>
<div class="faq_page">
	<div class="container_out">
		<div class="container_in">
			<h2 class="h_title">자주 하는 질문</h2>
			<div class="frequently_ask_contents">
				<div class="category_area">
					<h3 class="cate_title">카테고리 선택</h3>
					<div class="cate_conts">
						<ul class="cate_list">
							<li class="list_category01">
								<a href="<%=request.getContextPath()%>/search/site_faq">사이트 이용안내</a>
							</li>
							<li class="list_category01">
								<a href="<%=request.getContextPath()%>/search/reserve_faq">상품 예약/결제</a>
							</li>
							<li class="list_category01">
								<a href="<%=request.getContextPath()%>/search/FAQ">자주 찾는 질문(전체)</a>
							</li>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	
	<input type="search" id="search-term" placeholder="상품 예약/결제 검색어" aria-label="검색"/>
	<button type="submit" title="검색" class="btn_total_search" aria-label="Search" onclick="searchKeyword();">검색</button>

	<h3 id="reserve_faq">상품 예약/결제</h3>
	<div class="question" id="q16_1">
		<span class="txt_q">Q.</span>&nbsp;
		<b>
			<!-- 질문 -->
			예약은 어떻게 조회하나요?
		</b>
		<input type="hidden" id="q16" value="예약은 어떻게 조회하나요?" />
	</div>
	<br />
	
  <div id="q16_2">	
	<div id="reply">
		<div class="answer">
			<span class="txt_a">A.</span>
			<div class="txt_box">
				<p>
					<!-- 답안 -->
					예약한 상품은 마이페이지 예약확인/결제 에서 내역을 확인 할 수 있습니다. <br />
					접근방법 경로: 로그인 후 > 마이페이지 > 예약확인/결제
				</p>
			</div>
		</div>
	</div>
  </div>	
	<hr />
	
	
	<div class="question" id="q17_1">
		<span class="txt_q">Q.</span>&nbsp;
		<b>
			<!-- 질문 -->
			본 사이트에서 신용카드 결제를 했는데 카드 전표 영수증은 어디서 받을 수 있나요?
		</b>
		<input type="hidden" id="q17" value="본 사이트에서 신용카드 결제를 했는데 카드 전표 영수증은 어디서 받을 수 있나요?" />
	</div>
	<br />
	
  <div id="q17_2">	
	<div id="reply">
		<div class="answer">
			<span class="txt_a">A.</span>
			<div class="txt_box">
				<p>
					<!-- 답안 -->
					접근방법 경로: 로그인 후 > 마이페이지 > 예약확인/결제 > 기간별 조회 > <br />
					[예약코드] 클릭 > 결제내역 > 영수증 출력
				</p>
			</div>
		</div>
	</div>
  </div>	
	<hr />
	
	
	<div class="question" id="q18_1">
		<span class="txt_q">Q.</span>&nbsp;
		<b>
			<!-- 질문 -->
			현금영수증은 어떻게 발급 받을 수 있나요?
		</b>
		<input type="hidden" id="q18" value="현금영수증은 어떻게 발급 받을 수 있나요?" />
	</div>
	<br />
	
  <div id="q18_2">	
	<div id="reply">
		<div class="answer">
			<span class="txt_a">A.</span>
			<div class="txt_box">
				<p>
					<!-- 답안 -->
					[마이페이지] > [예약확인결제란] 접속 후 현금영수증 버튼 선택 시 신청 가능합니다.
				</p>
			</div>
		</div>
	</div>
  </div>

</div>
</body>
</html>