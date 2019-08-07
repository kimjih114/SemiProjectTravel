<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header-menu.jsp"%>

<!-- Bootstrap core CSS -->
<link
	href="<%=request.getContextPath()%>/vendor/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">

<!-- Custom fonts for this template -->
<link
	href="<%=request.getContextPath()%>/vendor/fontawesome-free/css/all.min.css"
	rel="stylesheet" type="text/css">
<link href="https://fonts.googleapis.com/css?family=Montserrat:400,700"
	rel="stylesheet" type="text/css">
<link href='https://fonts.googleapis.com/css?family=Kaushan+Script'
	rel='stylesheet' type='text/css'>
<link
	href='https://fonts.googleapis.com/css?family=Droid+Serif:400,700,400italic,700italic'
	rel='stylesheet' type='text/css'>
<link
	href='https://fonts.googleapis.com/css?family=Roboto+Slab:400,100,300,700'
	rel='stylesheet' type='text/css'>

<!-- Custom styles for this template -->
<link href="<%=request.getContextPath()%>/css/agency.min.css"
	rel="stylesheet">

<!-- Bootstrap core JavaScript -->
<script src="<%=request.getContextPath()%>/vendor/jquery/jquery.min.js"></script>
<script
	src="<%=request.getContextPath()%>/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

<!-- Plugin JavaScript -->
<script
	src="<%=request.getContextPath()%>/vendor/jquery-easing/jquery.easing.min.js"></script>

<!-- Contact form JavaScript -->
<script src="<%=request.getContextPath()%>/js/jqBootstrapValidation.js"></script>
<script src="<%=request.getContextPath()%>/js/contact_me.js"></script>

<!-- Custom scripts for this template -->
<script src="<%=request.getContextPath()%>/js/agency.min.js"></script>
<html>
<header class="masthead" style="height: 300px;">
	<div class="container">
		<div class="intro-text" style="padding-top: 140px; !important">
			<div class="intro-heading text-uppercase">1:1문의</div>
		</div>
	</div>
</header>

<style>

/* section#board-container>form{
        margin: 0 auto; 
        width:250px;

} */
<
style> /*@media (min-width: 992px)*/ .page-top {
	position: relative;
}

#profile-header {
	padding-bottom: 20px;
	margin: 0;
	background-color: #fed136;
}

#sideNav {
	text-align: center;
	top: 0;
	left: 0;
	display: -webkit-box;
	display: -ms-flexbox;
	/*display: fixed;*/
	-webkit-box-orient: vertical;
	-webkit-box-direction: normal;
	-ms-flex-direction: column;
	flex-direction: column;
	width: 230px;
	/*height: 100vh;*/
	background: #fed136;
	/*min-width: 250px;*/
}

.profile-circle {
	max-width: 10rem;
	max-height: 10rem;
	border: 0.5rem solid #212529;
	border-radius: 100%;
}

#sideNav .navbar-nav .nav-item .nav-link {
	font-weight: 800;
	letter-spacing: 0.05rem;
	text-transform: uppercase;
}

#sideNav .navbar-toggler:focus {
	outline-color: #d48a6e;
}

a .nav-link js-scroll-trigger {
	color: #007bff;
	text-decoration: none;
	background-color: transparent;
}

.tbl-usermenu {
	margin: 10 auto;
	margin-bottom: 30px;
}

.tbl-usermenu tr :hover {
	cursor: pointer;
	color: orangered;
}

.tbl-usermenu td {
	padding: 10px;
	border-bottom: 1px solid #212529;
	border-collapse: collapse;
	border-right: 0;
	border-left: 0;
	height: 50px;
}

#sideNav, table {
	font-size: 90%;
	font-weight: 400;
	/* padding: .75em 0;*/
	letter-spacing: 1px;
}

div#profile-header {
	margin: 0 auto;
}

.main-section {
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
	width: 56%;
	/*height: 100vh;*/
	background: lightgray;

	/*min-width: 800px;*/
}

#tab-container {
	width: 720px;
	margin: 0 auto;
/* 	text-align: center; */
	position: absolute;
	position:0px;
	left: 240px;
	transition: 0.5s;
	top:-40px;
	right:10px;
}

.post-unpushed {
	top: 50px;
}

.post-pushed {
	top: 500px;
}

#tab-container .tab {
	list-style: none;
	margin: 0;
	padding: 0;
	overflow: hidden;
}
/* Float the list items side by side */
#tab-container .tab li {
	float: left;
	width: 33.3333%;
	border-bottom: 1px solid;
}
/* Style the links inside the list items */
#tab-container .tab li a {
	display: inline-block;
	color: #000;
	text-align: center;
	text-decoration: none;
	padding: 14px 16px;
	font-size: 17px;
	transition: 0.3s;
	cursor: pointer;
}
/* Style the tab content */
#tab-container .tabcontent {
	display: none;
	background-color: black;
	padding: 6px 12px;
	color: #fff;
}

#tab-container ul.tab li.current {
	background-color: #fed136;
	color: #222;
	border: 1px solid;
	border-bottom: 0;
}

#tab-container .tabcontent.current {
	display: block;
	background-color: white;
	color: black;
	border: 1px solid;
	border-top: 0px;
}

#postFrm {
	width: 550px;
	margin: 0 auto;
	text-align: center;
	position: absolute;
	left: 240px;
	top: 50px;
	border: 1px solid;
}

#post {
	position: absolute;
	top: 10px;
	left: 730px;
}

#timline-sns {
	border: 1px solid;
}

#timeline-board-sns {
	border: 1px solid;
}

#timeline-board-sns td {
	padding: 10px;
}

board_containerfrm{
width: 600px; 
margin:0 auto;
text-align:center; 

}
/*게시글 작성버튼*/
#btn-add{
	float:right;
	margin: 0 0 8px;
}
table#tbl-board{width:100%; margin:0 auto; border:1px solid black; border-collapse:collapse; clear:both; }
table#tbl-board th, table#tbl-board td {border:1px solid; padding: 5px 0; text-align:center;} 
form#board_containerfrm{
margin-left: 8px;
margin-top:400px;

}


div.board_search{
width:700px;
}

#select_box {
  position: relative;
  width: 200px;
  height: 32px;
  background: url(http://cfile1.uf.tistory.com/image/27423E43565F8EF627B215) 0 center no-repeat;
 
}
div.sub_content ul{
  list-style:none;
}
div.sub_content {
 height: 300px;

}
div.postscript_area{
height:244px;
background: #f5f5f5;
border-radius: 10px;
}

ul.post_con{
padding-left: 20px;
padding-bottom: 25px;
padding-right: 20px;
}

hr{
border: 3px solid rgb(00,00,66);
}
</style>

<script>
$(function() {
	  var select = $("select#color");

	  select.change(function() {
	    var select_name = $(this).children("option:selected").text();
	    $(this).siblings("label").text(select_name);
	  });
	});


</script>



<!-- 메뉴폼 -->

<section class="page-top" style="padding: 0px; !important;">
	<nav id="sideNav">
		<div id="profile-header">
			<img class="profile-circle" style="margin: 50px auto 12px;"
				src="<%=request.getContextPath()%>/img/profile.jpg" alt="">
			<p class="userprofile-userId">
				@userId
				<button>edit</button>
			</p>
			<p class="userIntroduce" style="margin-bottom: 50px;">
				안녕하세요. 저는 userId입니다. 좋아하는 여행지는 #서촌입니다.
				<button>edit</button>
			</p>
		</div>
		<table class="tbl-usermenu">
			<tr>
				<td>알림 (new가 반짝반짝)</td>
			</tr>
		</table>
		<table class="tbl-usermenu">
			<tr>
				<td>팔로워</td>
			</tr>
			<tr>
				<td>메시지</td>
			</tr>

		</table>

		<table class="tbl-usermenu">
			<tr>
				<td>설정</td>
			</tr>
		</table>

		<table class="tbl-usermenu" style="margin-bottom: 0px; !important">
			<tr>
				<td>FAQ</td>
			</tr>

			<tr>
				<td>1:1문의</td>
			</tr>

			<tr>
				<td>공지사항</td>
			</tr>
		</table>
	</nav>

</section>

 <div id="tab-container" class="post-unpushed">
 
 
 
 
	<form action="" id="board_containerfrm">
 <div class="sub_content">
                            <hr />
                        <div class="postscript_area">
                            <ul class="post_con">
                                <li class="post_title">업무와 관련 문의 및 요청사항을 작성하는 게시판입니다.</li>
                                <li class="post_font">글을 남겨주시면 빠른 시일내에 답변해드리겠습니다. 여러분의 소중한 의견을 기다립니다.<br />
                                    <br />
                                    해당 게시판의 게시물은 사이트를 방문하는 모든 방문자가 확인할 수 있으므로 문의 및 요청사항 작성시 개인 정보가 포함되지 않도록 주의
                            바랍니다.<br />
                                    <br />
                                    게시판의 효과적인 운영을 위하여 비방, 욕설, 음란한 표현, 상업적인 광고, 동일한 내용 반복게시, 특정인의 개인정보 유출 등 홈페이지의
                            정상적인 운영을 저해하는 내용은 게시자에게 통보하지 않고 삭제될 수 있음을 알려드립니다.
                                </li>
                            </ul>
            
						<hr />
                        </div>
 </div>
		<div class="board_search">

			<fieldset>
	
			<%
				if (userLoggedIn != null) {
			%>
			<input type="button" class="btn btn-secondary btn-sm" id="btn-add" onclick="goBoardQuestionForm();" value="글쓰기">				
			<!-- 로그인한 경우 글쓰기 가능하게 하기  -->

			<script>
        
        function geBoardQuestionForm(){
			location.href="<%=request.getContextPath()%>/board/boardQuestionForm";

				}
			</script>

			<%
				}
			%>
				</fieldset>
			</div>
			</form>


			<!-- //게시판 검색폼 -->
			<!-- board s -->

			<table id="tbl-board">

				<tr>
					<th>번호</th>
					<th>제목</th> <!-- 첨부파일 같이 넣 -->
					<th>작성자</th>

					<th>작성일</th>
					<th>진행상태</th>
				</tr>

				<tbody>

					<tr class="tr_notice">
						<td>번호넣</td>
						<td>제목넣</td>
						<td>작성자넣</td>
			
						<td>작성일 넣</td>
						<td>진행상태넣</td>
					</tr>




				</tbody>
			</table>
		</form>

	</div>
			
	</body>
</html>