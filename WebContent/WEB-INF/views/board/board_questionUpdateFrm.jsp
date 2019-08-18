<%@page import="board.model.vo.Board_QuestionComment"%>
<%@page import="user.model.vo.User"%>
<%@page import="user.controller.UserLoginEndServlet"%>
<%@page import="user.controller.UserLogoutServlet"%>
<%@page import="board.model.vo.Board_Question"%>
<%@page import="java.util.List"%>
<%@page import="java.sql.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header-menu.jsp"%>

<%

 Board_Question bq = (Board_Question)request.getAttribute("bq");

 //List<Board_QuestionComment> commentList = (List<Board_QuestionComment>)request.getAttribute("commentList");

 
%>

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
<%-- <script src="<%=request.getContextPath()%>/vendor/jquery/jquery.min.js"></script>
<script
	src="<%=request.getContextPath()%>/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
 --%>
<!-- Plugin JavaScript -->
<%-- <script
	src="<%=request.getContextPath()%>/vendor/jquery-easing/jquery.easing.min.js"></script>
 --%>
<!-- Contact form JavaScript -->
<%-- <script src="<%=request.getContextPath()%>/js/jqBootstrapValidation.js"></script>
<script src="<%=request.getContextPath()%>/js/contact_me.js"></script>
 --%>
<!-- Custom scripts for this template -->
<script src="<%=request.getContextPath()%>/js/agency.min.js"></script>
<script src="<%=request.getContextPath()%>/js/jquery-3.4.1.js"></script>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
	integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
	crossorigin="anonymous"></script>

<style>
header {
	height: 200px;
}

.intro-text {
	padding-top: 50px;
}
/*전체컨테이너 */
div#container {
	background: background-color:#F0F0F0;
	width: 960px;
	margin: 0 auto;
}

.btn.btn-primary {
	width: 294px;
}

#q-container {
	width: 700px;
	margin: 0 auto;
	text-align: center;
	position: -50px;
	left: 265px;
	transition: 0.5s;
	top: 100px;
}

#q-container .tab {
	list-style: none;
	margin: 0;
	padding: 0;
	overflow: hidden;
}
/* Float the list items side by side */
#q-container .tab li {
	float: left;
	width: 33.3333%;
	border-bottom: 1px solid;
}
/* Style the links inside the list items */
#q-container .tab li a {
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
#q-container .tabcontent {
	display: none;
	background-color: black;
	padding: 6px 12px;
	color: #fff;
}

#q-container ul.tab li.current {
	color: #222;
	border: 1px solid;
	border-bottom: 0;
}

#q-container .tabcontent.current {
	display: block;
	background-color: white;
	color: black;
	border: 1px solid;
	border-top: 0px;
}

board_containerfrm {
	width: 600px;
	margin: 0 auto;
	text-align: center;
}
/*게시글 작성버튼*/
#btn-add {
	float: right;
	margin: 0 0 8px;
}

table#tbl-board {
	width: 100%;
	margin: 0 auto;
	border: 1px solid black;
	border-collapse: collapse;
	clear: both;
}

table#tbl-board th, table#tbl-board td {
	border: 1px solid;
	padding: 5px 0;
	text-align: center;
}

form#board_containerfrm {
	margin-left: 8px;
	margin-top: 100px;
}

div.board_search {
	width: 700px;
}

#select_box {
	position: relative;
	width: 200px;
	height: 32px;
	background:
		url(http://cfile1.uf.tistory.com/image/27423E43565F8EF627B215) 0
		center no-repeat;
}

div.sub_content ul {
	list-style: none;
}

div.sub_content {
	height: 300px;
}

div.postscript_area {
	height: 244px;
	background: #f5f5f5;
	border-radius: 10px;
}

ul.post_con {
	padding-left: 20px;
	/* padding-bottom: 25px; */
	padding-right: 20px;
	padding-top: 30px;
	height: 241px;
}

hr {
	border: 3px solid rgb(00, 00, 66);
}

li.post-font {
	text-align: left;
}

form{
margin-left: 210px;
}
td{
padding-top: 10px;
}

input.btn-outline-success {
margin-top: 10px;
}
</style>

<script>
 /* $(()=>{
	location.href="#"
}); */

 

</script>



<!-- Header -->

<header class="masthead">
	<div class="container">
		<div class="intro-text" style="padding-top: 100px;">
			<h1>
				<a href="<%=request.getContextPath()%>/boardquestion/boardList"
					style='color: white;'>1:1문의</a>
			</h1>
			<!-- <a class="btn btn-primary btn-xl text-uppercase js-scroll-trigger" href="#services"> -->
		</div>
	</div>
</header>


<!-- 메뉴폼 -->
<div id="q-container">

	<div id="board_containerfrm">
		<div class="sub_content">
			<hr />
			<div class="postscript_area">
				<ul class="post_con">
					<li class="post_title"><h4>1:1문의</h4></li>
					<li class="post_font">업무와 관련 문의 및 요청사항을 작성하는 게시판입니다. <br />
						1:1 문의는 타인에게 내용이 공개되지 않으므로 더 자세한 답변을 받을 수 있습니다. <br /> <br /> <br />유람은
						고객님의 목소리를 소중히 여깁니다. <br /> 문의주신 내용은 확인 즉시 , 빠르게 답변 드리겠습니다. <br />
						답변은 전화상담이 아닌 온라인으로만 진행됩니다.<br /> <br />

					</li>
				</ul>

				<hr />
			</div>
		</div>
		<div class="board_search">

			<form action="<%=request.getContextPath()%>/board/qboardUpdateEnd" 
				method="post" enctype = "multipart/form-data">
				<input type="hidden" name="qboardNo" value="<%=bq.getQboardNo()%>" />
				<table id="tbl-board-view">
					<tr>
						<th>제목</th>
						<td><input type="text" name="qboardTitle"
							value="<%=bq.getQboardTitle() %>" required /></td>
					</tr>
					<tr>
						<th>작성자</th>
						<td><input type="text" name="qboardWriter"
							value="<%=bq.getQboardWriter() %>" required readonly /></td>
					</tr>
					<tr>
						<th>첨부파일</th>
						<td style="position: relative;">
							<!-- 
						첨부파일관련 사용자 시나리오:
						1. 첨부파일이 없는 경우
						2. 첨부파일이 있는 경우
							- 파일관련 수정을 하지 않는 경우: upFile=null
							- 새로운 파일을 첨부한 경우: upFile있음. 기존파일은 삭제
							- 기존파일만 삭제하는 경우(delFile): upFile=null
						
					 --> <!-- 파일태그 value속성은 보안상 이유로 임의 변경이 불가함. -->
					  <input type="file" name="upFile" /> 
					  <span id="fname"> 
					  <%=bq.getQboardFileName()!=null? bq.getQboardNewFileName():""%>
					  </span> <%--첨부파일이 있는 경우 기존파일 삭제용 --%>
					   <%if(bq.getQboardFileName()!=null){ %><br /> 
						<input type="checkbox" name="delFile" id="delFile" /> 
						<label for="delFile">첨부파일삭제</label>
						 <% } %> 
						<input type="hidden" name="oldOName" value="<%=bq.getQboardFileName()!=null?bq.getQboardFileName():""%>" />
						<input type="hidden" name="oldRName" value="<%=bq.getQboardNewFileName()!=null?bq.getQboardNewFileName():""%>" />
						</td>
					</tr>
					<tr>
						<th>내용</th>
						<td><textarea name="qboardContent" cols="40" rows="5" style='height: 120px; width: 360px;' required><%=bq.getQboardContent() %></textarea>
						</td>
					</tr>
					<tr>
						<th colspan="2"><input type="submit" value="수정" class="btn btn-outline-success"
							onclick="return qboardValidate();" /></th>
					</tr>



		<script>
		$("[name=upFile]").change(function(){
			console.log($(this).val());
			//사용자가 파일을 선택한 경우
			if($(this).val() != ""){
				$("#fname").hide();
				
				$("#delFile").hide().next().hide();
			}
			//사용자가 파일선택을 취소한 경우
			else{
				$("#fname").show();
				
				$("#delFile").show().next().show();
			}
		});
		
		
		function qboardValidate(){
			var content = $("[name= qboardContent]").val(); 
			if(content.trim().length ==0 ){
				alert("내용을 입력하세요"); 
				return false; 				
			}
			return true; 		
		}

		</script>

				</table>
			</form>
		</div>

	</div>
</div>


</body>
</html>