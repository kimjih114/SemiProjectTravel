<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header-menu.jsp" %>
 <!-- Bootstrap core CSS -->
  <link href="<%=request.getContextPath() %>/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

  <!-- Custom fonts for this template -->
  <link href="<%=request.getContextPath() %>/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
  <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" type="text/css">
  <link href='https://fonts.googleapis.com/css?family=Kaushan+Script' rel='stylesheet' type='text/css'>
  <link href='https://fonts.googleapis.com/css?family=Droid+Serif:400,700,400italic,700italic' rel='stylesheet' type='text/css'>
  <link href='https://fonts.googleapis.com/css?family=Roboto+Slab:400,100,300,700' rel='stylesheet' type='text/css'>

  <!-- Custom styles for this template -->
  <link href="<%=request.getContextPath() %>/css/agency.min.css" rel="stylesheet">
  
  <!-- Bootstrap core JavaScript -->
  <script src="<%=request.getContextPath() %>/vendor/jquery/jquery.min.js"></script>
  <script src="<%=request.getContextPath() %>/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

  <!-- Plugin JavaScript -->
  <script src="<%=request.getContextPath() %>/vendor/jquery-easing/jquery.easing.min.js"></script>

  <!-- Contact form JavaScript -->
  <script src="<%=request.getContextPath() %>/js/jqBootstrapValidation.js"></script>
  <script src="<%=request.getContextPath() %>/js/contact_me.js"></script>

  <!-- Custom scripts for this template -->
  <script src="<%=request.getContextPath() %>/js/agency.min.js"></script>

<style>
.page-top{
	width: 1024px;
	position : relative;
}

#profile-header{
	padding-bottom: 20px;
	margin: 0;
	background-color:#fed136;
} 
  
#sideNav {
    text-align: center;
    top: 0;
    left: 0;
    display: -webkit-box;
    display: -ms-flexbox;
    display: fixed;
    -webkit-box-orient: vertical;
    -webkit-box-direction: normal;
    -ms-flex-direction: column;
    flex-direction: column;
	width: 250px;
    /*height: 100vh;*/
    background: #fed136; 
}

.profile-circle{
	max-width: 10rem;
    max-height: 10rem;
    border: 0.5rem solid #212529;
    border-radius: 100%;
    min-width: 0;
    min-height: 0;
}
#sideNav .navbar-nav .nav-item .nav-link {
  font-weight: 800;
  letter-spacing: 0.05rem;
  text-transform: uppercase;
}

#sideNav .navbar-toggler:focus {
  outline-color: #d48a6e;
}

a .nav-link js-scroll-trigger{
	color: #007bff;
    text-decoration: none;
    background-color: transparent;

}
table{
	margin: 10 auto;
	margin-bottom: 30px;
}

table tr :hover{
	cursor: pointer;
	color: orangered;
	
}

table td{
	padding: 10px;
	border-bottom: 1px solid #212529;
	border-collapse: collapse;
    border-right: 0;
    border-left:0;
    height: 50px;
}

#sideNav, table {
	font-size: 90%;
    font-weight: 400;
   /* padding: .75em 0;*/
    letter-spacing: 1px;
}

div#profile-header{
	margin: 0 auto;
}

section#page-top{
	position: relative;
}

.myPost{
	position: absolute;
	top:0;
	left: 260px;
	border:1px solid;
	padding: 10px;
	
}
#content{
	position : absolute;
	top : -15%;
	left : 22.5%;
}
#content table{
	border-collapse : collapse;
	text-align : center;
	line-height:1.5;
	border-top : 1px solid #ccc;
}
#content table th{
	font-weight : bold;
	vertical-align : top;
	color : #fff;
	background : orange;
}
#content table td{
	vertical-align : top;
	border-collapse: collapse;
	border-bottom : 1px solid orange;
}

#content table tr:nth-child(2n){
	background-color:#f7f2eb;
}



/* FAQ */
a{
	color : black;
}

section#content{
	width: 950px;
}

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
	$("#q16_1").css("display","block");
	$("#q16_2").css("display","block");
	$("#q17_1").css("display","block");
	$("#q17_2").css("display","block");
	$("#q18_1").css("display","block");
	$("#q18_2").css("display","block");
	
	var searchKwd = $("#search-term").val();
	var q16 = $("#q16").val();
	var q17 = $("#q17").val();
	var q18 = $("#q18").val();
	
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

<header class="masthead" style="height:300px;">
    <div class="container">
      <div class="intro-text" style="padding-top:140px; !important">
        <div class="intro-heading text-uppercase">
       		예약내역
        </div>
     </div>
    </div>
  </header>
  
  <form action="" name="memomsgFrm">
	<input type="hidden" name="userId" />
  </form>
  
  <section id="page-top" style="padding:0px; !important;">
  <nav id="sideNav">
	<div id="profile-header">
      <img class="profile-circle"  style="margin: 50px auto 12px;" src="<%=request.getContextPath() %>/upload/profile/<%=loggedIn.getFileName() %>" alt="">
      <p class="userprofile-userId"><span style="font-weight: 700;">@닉네임</span>님, 환영합니다!
      <button>여행이야기 홈</button>
   </div>

   <table id="tbl-usermenu0">
   	 <tr>
   		<td id="modifyUserInfo">회원정보수정</td>
   	</tr>
	<tr>
   		<td id="gomsg">메시지</td>
   	</tr>
   	</table>
   	<table id="tbl-usermenu1">
   		<tr>
   			<td><a href="<%=request.getContextPath()%>/mypage/myReservationView?userId=<%=userLoggedIn.getUserId()%>">예약내역</a></td>
   		</tr>
   		<tr>
   			<td><a href="<%=request.getContextPath()%>/mypage/myReservationDelView?userId=<%=userLoggedIn.getUserId()%>">취소내역</a></td>
   		</tr>
   		<tr>
   			<td><a href="<%=request.getContextPath()%>/mypage/myBasketView?userId=<%=userLoggedIn.getUserId()%>">장바구니</a></td>
   		</tr>
   	</table>

	<table id="tbl-usermenu4" style="margin-bottom:0px; !important">
	<tr>
    	<td><a href="<%=request.getContextPath()%>/search/FAQ">FAQ</a></td>
    </tr>
    
    <tr>
    	<td id="QuestionList">1:1문의</td>
    </tr>
    
	</table>
  </nav>
<section id="content">
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
 </section>
</section>

<script>
$("#QuestionList").on("click", function(){
	var userId = '<%=userLoggedIn.getUserId() %>';	
	console.log("userLoggedIn"+userId);
	location.href="<%=request.getContextPath()%>/boardquestion/boardList?userId="+userId; 
});

$("#gomsg").on("click", function(){
		var userId = '<%=userLoggedIn.getUserId() %>';	
		console.log("userLoggedIn"+userId);
	 	
	 	
			var url="<%=request.getContextPath()%>/chat/chatroom.do?userId="+userId;
			var title="popup"; 
			var status = "width=420px, height=400px, left=150px, top=0px";
			var popup = open("", title, status);
			
			var frm = document.memomsgFrm;
			frm.userId.value= userId;
			frm.action = url;
			frm.target=title;
			frm.method= "post"; 
		frm.submit();
	});
</script>

</body>
</html>