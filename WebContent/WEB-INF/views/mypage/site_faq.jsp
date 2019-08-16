<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사이트 이용안내</title>
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
	
	//console.log("q1값은?"+q1);
	//console.log("몇나옴?+"+q1.indexOf(searchKwd));//-1이 나오면 검색내용이 없는거
	
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
	
	
	<input type="search" id="search-term" placeholder="사이트 이용안내 검색어" aria-label="검색"/>
	<button type="submit" title="검색" class="btn_total_search" aria-label="Search" onclick="searchKeyword();">검색</button>
		
	<h3 id="site_faq">사이트 이용안내</h3>
	<div class="question" id="q1_1">
		<span class="txt_q">Q.</span>&nbsp;
		<b>
			<!-- 질문 -->
			홈페이지 이용시 로그인이 안됩니다.
		</b>
		<input type="hidden" id="q1" value="홈페이지 이용시 로그인이 안됩니다."/>
	</div>
	<br />
	
	<div id="q1_2">
	  <div id="reply">
		<div class="answer">
			<span class="txt_a">A.</span>
			<div class="txt_box">
				<p>
					<!-- 답안 -->
					아래의 로그인 오류 메세지가 뜰 경우에는 아이디 및 비밀번호 재입력을 하셔야 <br />
					로그인 하실 수 있습니다.
					<br /><br />
					<strong>[로그인 오류 메세지 유형]</strong>
					<br />
					로그인에 실패하셨습니다.
					<br />
					회원 아이디 또는 비밀번호를 다시 확인하시 후 로그인 해주시기 바랍니다.
				</p>
			</div>
		</div>
	</div>
  </div>
	<hr />
	
	
	<div class="question" id="q2_1">
		<span class="txt_q">Q.</span>&nbsp;
		<b>
			<!-- 질문 -->
			미성년자는 웹회원 가입이 불가능한가요?
		</b>
		<input type="hidden" id="q2" value="미성년자는 웹회원 가입이 불가능한가요?" />
	</div>
	<br />
	
  <div id="q2_2">
	<div id="reply">
		<div class="answer">
			<span class="txt_a">A.</span>
			<div class="txt_box">
				<p>
					<!-- 답안 -->
					본페이지는 만 14세 이상부터 회원가입 가능합니다. <br />
				</p>
			</div>
		</div>
	</div>
  </div>
	<hr />
	
	
	<div class="question" id="q3_1">
		<span class="txt_q">Q.</span>&nbsp;
		<b>
			<!-- 질문 -->
			웹회원 가입이 안됩니다.
		</b>
		<input type="hidden" id="q3" value="웹회원 가입이 안됩니다." />
	</div>
	<br />
	
  <div id="q3_2">
	<div id="reply">
		<div class="answer">
			<span class="txt_a">A.</span>
			<div class="txt_box">
				<p>
					<!-- 답안 -->
					<strong>[웹회원 가입조건]</strong>
					<br />
					실명확인이 가능한 만 14세 이상의 고객이어야 합니다. <br />
					실명확인이 가능한 본인 인증을 통해 이용해 주시기 바랍니다. <br />
					회원 아이디 또는 비밀번호를 다시 확인하시 후 로그인 해주시기 바랍니다.
				</p>
			</div>
		</div>
	</div>
  </div>
	<hr />
	
	
	<div class="question" id="q4_1">
		<span class="txt_q">Q.</span>&nbsp;
		<b>
			<!-- 질문 -->
			홈페이지 회원 탈퇴는 어떻게 하나요?
		</b>
		<input type="hidden" id="q4" value="홈페이지 회원 탈퇴는 어떻게 하나요?" />
	</div>
	<br />
	
  <div id="q4_2">
	<div id="reply">
		<div class="answer">
			<span class="txt_a">A.</span>
			<div class="txt_box">
				<p>
					<!-- 답안 -->
					<strong>[이용방법]</strong><br />
					로그인 후 마이페이지 (상단 > 예약/확인 결제 클릭)에서 '회원탈퇴'하실 수 있습니다.
				</p>
			</div>
		</div>
	</div>
  </div>
	<hr />
	
	
	<div class="question" id="q5_1">
		<span class="txt_q">Q.</span>&nbsp;
		<b>
			<!-- 질문 -->
			홈페이지 회원 아이디를 변경할 수 있나요?
		</b>
		<input type="hidden" id="q5" value="홈페이지 회원 아이디를 변경할 수 있나요?" />
	</div>
	<br />
	
  <div id="q5_2">	
	<div id="reply">
		<div class="answer">
			<span class="txt_a">A.</span>
			<div class="txt_box">
				<p>
					<!-- 답안 -->
					로그인 후 아이디 변경을 하실 수가 있습니다. <br />
					접근경로 방법: 로그인 > 정보변경 > 회원정보 변경 내 기본정보 [아이디 변경하기]
				</p>
			</div>
		</div>
	</div>
  </div>	
	<hr />
	
	
	<div class="question" id="q6_1">
		<span class="txt_q">Q.</span>&nbsp;
		<b>
			<!-- 질문 -->
			아이디 분실했는데 어떻게 하나요?
		</b>
		<input type="hidden" id="q6" value="아이디 분실했는데 어떻게 하나요?" />
	</div>
	<br />
	
  <div id="q6_2">	
	<div id="reply">
		<div class="answer">
			<span class="txt_a">A.</span>
			<div class="txt_box">
				<p>
					<!-- 답안 -->
					로그인 창 > 아이디 찾기로 접속하여 회원가입시 등록한 성함, 연락처, 생년월일 <br />
					입력하시면 아이디 확인 가능합니다.
				</p>
			</div>
		</div>
	</div>
  </div>	
	<hr />
	
	
	<div class="question" id="q7_1">
		<span class="txt_q">Q.</span>&nbsp;
		<b>
			<!-- 질문 -->
			비밀변호 변경은 어디에서 하나요?
		</b>
		<input type="hidden" id="q7" value="비밀변호 변경은 어디에서 하나요?" />
	</div>
	<br />
	
  <div id="q7_2">	
	<div id="reply">
		<div class="answer">
			<span class="txt_a">A.</span>
			<div class="txt_box">
				<p>
					<!-- 답안 -->
					접근경로 방법: 로그인 > 정보변경 > 회원정보 변경 내 비밀번호 변경
				</p>
			</div>
		</div>
	</div>
  </div>	
	<hr />
	
	
	<div class="question" id="q8_1">
		<span class="txt_q">Q.</span>&nbsp;
		<b>
			<!-- 질문 -->
			로그인 시 휴면계정 안내가 됩니다. 어떻게 해야 하나요?
		</b>
		<input type="hidden" id="q8" value="로그인 시 휴면계정 안내가 됩니다. 어떻게 해야 하나요?" />
	</div>
	<br />
	
  <div id="q8_2">	
	<div id="reply">
		<div class="answer">
			<span class="txt_a">A.</span>
			<div class="txt_box">
				<p>
					<!-- 답안 -->
					로그인 시 아이디가 휴면처리 되어있다면 본인인증을 통하여 휴면 해제를 <br />
					하실 수 있습니다.
				</p>
			</div>
		</div>
	</div>
  </div>	
	<hr />
	
	
	<div class="question" id="q9_1">
		<span class="txt_q">Q.</span>&nbsp;
		<b>
			<!-- 질문 -->
			휴면계정 회원도 아이디 & 비밀번호 찾기 이용 가능한가요?
		</b>
		<input type="hidden" id="q9" value="휴면계정 회원도 아이디 & 비밀번호 찾기 이용 가능한가요?" />
	</div>
	<br />
	
  <div id="q9_2">	
	<div id="reply">
		<div class="answer">
			<span class="txt_a">A.</span>
			<div class="txt_box">
				<p>
					<!-- 답안 -->
					휴면 계정의 경우 로그인 후 본인 인증을 통해 해제가 가능하며, 휴면 계정인 경우 <br />
					본인인증을 통해 가입한 회원이라 해도 아이디/비밀번호 찾기 서비스 이용이 <br />
					불가한 점 양해 부탁드립니다.
				</p>
			</div>
		</div>
	</div>
  </div>	
	<hr />
	
	
	<div class="question" id="q10_1">
		<span class="txt_q">Q.</span>&nbsp;
		<b>
			<!-- 질문 -->
			홈페이지 정보변경에 웹회원 유지기간이 무엇인가요?
		</b>
		<input type="hidden" id="q10" value="홈페이지 정보변경에 웹회원 유지기간이 무엇인가요?" />
	</div>
	<br />
	
  <div id="q10_2">	
	<div id="reply">
		<div class="answer">
			<span class="txt_a">A.</span>
			<div class="txt_box">
				<p>
					<!-- 답안 -->
					가입고객은 가입 후 1년간 로그인 이력이 없는 경우 휴면 계정으로 전환이 됩니다. <br />
					이때 정보변경 내 확인되는 웹회원 유지기간을 선택하면, 고객님께서 선택한 기간까지 휴면 계정으로 전환되지 않습니다. <br />
					설정은 "마이페이지 > 나의 정보 관리 > 웹회원 유지기간" 메뉴에서 할 수 있습니다.
				</p>
			</div>
		</div>
	</div>
  </div>	
	<hr />
	
	
	<div class="question" id="q11_1">
		<span class="txt_q">Q.</span>&nbsp;
		<b>
			<!-- 질문 -->
			기타 개인정보에 관련하여 문의하고 싶습니다.
		</b>
		<input type="hidden" id="q11" value="기타 개인정보에 관련하여 문의하고 싶습니다." />
	</div>
	<br />
	
  <div id="q11_2">	
	<div id="reply">
		<div class="answer">
			<span class="txt_a">A.</span>
			<div class="txt_box">
				<p>
					<!-- 답안 -->
					고객센터 페이지 내 "상담문의"에 문의주시면 성심껏 도와드리도록 하겠습니다. <br />
				</p>
			</div>
		</div>
	</div>
  </div>	
	<hr />
	
	
	<div class="question" id="q12_1">
		<span class="txt_q">Q.</span>&nbsp;
		<b>
			<!-- 질문 -->
			여행이력 확인하려면 어떻게 하나요?
		</b>
		<input type="hidden" id="q12" value="여행이력 확인하려면 어떻게 하나요?" />
	</div>
	<br />
	
  <div id="q12_2">	
	<div id="reply">
		<div class="answer">
			<span class="txt_a">A.</span>
			<div class="txt_box">
				<p>
					<!-- 답안 -->
					로그인을 하여 홈페이지 상단 [마이페이지]내 [예약확인/결제]페이지에 들어가면 <br />
					[예약내역]탭에서 고객님께서 더녀오신 여행이력 확인이 가능합니다. 
				</p>
			</div>
		</div>
	</div>
  </div>	
	<hr />
	
	
	<div class="question" id="q13_1">
		<span class="txt_q">Q.</span>&nbsp;
		<b>
			<!-- 질문 -->
			회원정보 내 휴대전화번호와 이메일주소 그리고 주소 변경을 하고 싶습니다.
		</b>
		<input type="hidden" id="q13" value="회원정보 내 휴대전화번호와 이메일주소 그리고 주소 변경을 하고 싶습니다." />
	</div>
	<br />
	
  <div id="q13_2">	
	<div id="reply">
		<div class="answer">
			<span class="txt_a">A.</span>
			<div class="txt_box">
				<p>
					<!-- 답안 -->
					로그인을 하여 홈페이지 상단 "정보변경"을 클릭하여 회원정보 변경 페이지에 <br />
					들어가면 회원 개인정보를 변경할 수 있습니다. 변경된 개인벙보를 입력 후 하단 <br />
					"저장하기"를 클릭하여 주면 완료됩니다.
				</p>
			</div>
		</div>
	</div>
  </div>	
	<hr />
	
	<div class="question" id="q14_1">
		<span class="txt_q">Q.</span>&nbsp;
		<b>
			<!-- 질문 -->
			아이디를 정상적으로 입력했는데 "입력하신 아이디가 존재하지 않습니다."(아이디 양식에 맞지 않습니다.)라고 확인됩니다.
		</b>
		<input type="hidden" id="q14" value='아이디를 정상적으로 입력했는데 "입력하신 아이디가 존재하지 않습니다."(아이디 양식에 맞지 않습니다.)라고 확인됩니다.' />
	</div>
	<br />
	
  <div id="q14_2">	
	<div id="reply">
		<div class="answer">
			<span class="txt_a">A.</span>
			<div class="txt_box">
				<p>
					<!-- 답안 -->
					아이디가 정상적으로 처리되지 않으면, 아이디 찾기를 통해 정확한 아이디 정보를 <br />
					확인 후 로그인 해 주시기 바랍니다. <br />
					* 아이디 찾기 경로: 로그인 > [아이디 찾기]
				</p>
			</div>
		</div>
	</div>
  </div>	
	<hr />
	
	
	<div class="question" id="q15_1">
		<span class="txt_q">Q.</span>&nbsp;
		<b>
			<!-- 질문 -->
			개인정보 열람 및 정정을 하고 싶을 때는 어떻게 하나요?
		</b>
		<input type="hidden" id="q15" value="개인정보 열람 및 정정을 하고 싶을 때는 어떻게 하나요?" />
	</div>
	<br />
	
  <div id="q15_2">	
	<div id="reply">
		<div class="answer">
			<span class="txt_a">A.</span>
			<div class="txt_box">
				<p>
					<!-- 답안 -->
					고객님의 개인정보 열람 및 정정을 위해서는 웹사이트에 접속 후 <br />
					[마이페이지]의 [나의 정보관리]를 클릭하여 열람 또는 정정하실 수 있습니다.
				</p>
			</div>
		</div>
	</div>
  </div>	
	
</div>
</body>
</html>