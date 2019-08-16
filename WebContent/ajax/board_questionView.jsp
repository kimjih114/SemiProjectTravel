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
  userLoggedIn =(User)session.getAttribute("userLoggedIn");
 Board_Question bq = (Board_Question)request.getAttribute("bq");

 List<Board_QuestionComment> commentList = (List<Board_QuestionComment>)request.getAttribute("commentList");

 
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
	margin-bottom: 100px;
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

#tbl-comment {
	margin: 0 auto;
}

hr {
	border: 3px solid rgb(00, 00, 66);
}

li.post-font {
	text-align: left;
}

table#tbl-board-view {
	width: 700px;
	height: 250px;
}

div.comment-editor button#btn-insert {
	width: 60px;
	height: 50px;
	color: white;
	background-color: #30f;
	position: relative;
	top: -20px;
	color: white;
}

/*댓글등록버튼*/
div#comment-container button#btn-insert {
	width: 60px;
	height: 50px;
	color: white;
	background: #3300ff;
	position: relative;
	top: -20px;
}

/*댓글테이블*/
table#tbl-comment {
	width: 580px;
	margin: 0 auto;
	border-collapse: collapse;
	clear: both;
	margin-top: 30px;
	margin-bottom: 30px;
}

table#tbl-comment tr td {
	border-bottom: 1px solid;
	border-top: 1px solid;
	padding: 5px;
	text-align: left;
	line-height: 120%;
}

table#tbl-comment tr td:first-of-type {
	padding: 5px 5px 5px 50px;
}

table#tbl-comment tr td:last-of-type {
	text-align: right;
	width: 100px;
}

table#tbl-comment button.btn-reply {
	display: none;
}

table#tbl-comment tr:hover {
	background: lightgray;
}

table#tbl-comment tr:hover button.btn-reply {
	display: inline;
}

table#tbl-comment sub.comment-writer {
	color: navy;
	font-size: 14px
}

table#tbl-comment sub.comment-date {
	color: tomato;
	font-size: 10px
}

table#tbl-comment tr.level2 {
	color: gray;
	font-size: 14px;
}

table#tbl-comment tr.level2 td:first-of-type {
	padding-left: 100px;
}

table#tbl-comment tr.level2 sub.comment-writer {
	color: #8e8eff;
	font-size: 14px
}

table#tbl-comment tr.level2 sub.comment-date {
	color: #ff9c8a;
	font-size: 10px
}

/*답글관련*/
table#tbl-comment textarea {
	margin: 4px 0 0;
}

table#tbl-comment button.btn-insert2 {
	width: 60px;
	height: 23px;
	color: white;
	background: #30f;
	position: relative;
	top: -5px;
	left: 10px;
}

table#tbl-comment button.btn-delete {
	background: red;
	color: white;
	display: none;
}

table#tbl-comment tr:hover button.btn-delete {
	display: inline;
}
</style>

<script>
  $(()=>{
	location.href="#"
}); 

/* $(function() {
	  var select = $("select#color");

	  select.change(function() {
	    var select_name = $(this).children("option:selected").text();
	    $(this).siblings("label").text(select_name);
	  });
	}); */
  
 <%-- 
function fileDownload(oName, rName){
	//ie에서 요청한 한글파일명은 오류를 유발하므로,
	//유니코드 문자로 직접변환함.
	oName = encodeURIComponent(oName);
	console.log(oName);
	console.log(rName);
	
	location.href = "<%=request.getContextPath()%>/board/qboardFileDownload"
				  + "?oName=" + oName
				  + "&rName=" + rName;
} --%>

 
 $(()=>{
	 

$(".btn-reply").on("click", (e)=>{
	var tr = $("<tr></tr>");
	var html = "<td style='display:none; text-align:left;' colspan='2'>";
	html += "<form action='<%=request.getContextPath()%>/board/qboardCommentInsert' method='post'>";
	html += "<input type='hidden' name='qboardRef' value='<%=bq.getQboardNo()%>'/>";
	html += "<input type='hidden' name='qboardCommentWriter' value='<%=userLoggedIn.getUserId()%>'/>";
	html += "<input type='hidden' name='qboardCommentLevel' value='2'/>";
	html += "<input type='hidden' name='qboardCommentRef' value='"+e.target.value+"'/>";
	html += "<textarea name='qboardCommentContent' cols='60' rows='1'></textarea>";
	html += "<button type='submit' class='btn btn-info'>등록</button>";
	html += "</form>";
	html +="</td>";
	tr.html(html);
	
	
	tr.insertAfter($(e.target).parent().parent())
	  .children("td")
	  .slideDown(800)
	  .children("form")
	  .submit((e)=>{
		 console.log($(e.target));
		 var len = $(e.target).children("textarea")
		 					  .val()
		 					  .trim()
		 					  .length;
		 if(len == 0)
			 e.preventDefault();
		 
	  })
	  .find("textarea").focus();
	
	//한번 댓글폼 생성후 이벤트핸들러 제거
	$(e.target).off('click');
	
});

$(()=>{ 
	
	  $("[name='qboardCommentFrm']").submit((e)=>{
		  
		  var len=$("#qboardCommentContent").val().trim().length;
		console.log(len+"콘솔 나오냐?"); 
		
		  if(len==0) {
			e.prevnetDefalut();
		}
	  });
	
	}); 

	
$(()=>{
//삭제버튼 클릭시
$(".btn-delete").click(function(){
if(!confirm("글을 삭제하시겠습니까?")) return;
//삭제처리후 돌아올 현재게시판번호도 함께 전송함.
	location.href="<%=request.getContextPath()%>/board/qboardCommentDelete?qboardNo=<%=bq.getQboardNo()%>&del="+$(this).val();
});
	
});
});



</script>



<!-- Header -->

<header class="masthead">
	<div class="container">
		<div class="intro-text" style="padding-top: 100px;">
			<h1>
				<a href="<%=request.getContextPath()%>/boardquestion/adminboardList?userId=<%=userLoggedIn.getUserId() %>"
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


			<table id="tbl-board-view">
				<tr>
					<th style="width: 297px;">제목</th>
					<td><input class="form-control" type="text" name="qboardTitle"
						value="<%=bq.getQboardTitle()%>" required /></td>
				</tr>
				<tr>
					<th>작성자</th>
					<td><input class="form-control" type="text"
						name="qboardWriter" value="<%=bq.getQboardWriter()%>" required
						readonly></td>
				</tr>
				<tr>
					<th>첨부파일</th>
					<td>
						<%
							if (bq.getQboardFileName() != null) {
						%> <a
						href="javascript:fileDownload('<%=bq.getQboardFileName()%>','<%=bq.getQboardNewFileName()%>');">
							<img src="<%=request.getContextPath()%>/images/file.png" alt="" />
							<!-- 사용자가 업로드한 파일명 --> <%=bq.getQboardFileName()%>
					</a> <%
 	}else{%>
 					첨부파일이 없습니다.	
 <%	}
 %>
					</td>
				</tr>
			

				<tr>
					<td>
						<div class="input-group" style="left:163px;width:388px;">
  				<div class="input-group-prepend">
   				 <span class="input-group-text">내용</span>
  			</div>
  			<textarea class="form-control" aria-label="With textarea" cols="50" rows="3"><%= bq.getQboardContent() %></textarea>
			</div>
					</td>

				</tr>

				<%
					if (userLoggedIn != null && (bq.getQboardWriter().equals(userLoggedIn.getUserId())
							|| "admin".equals(userLoggedIn.getUserId()))) {
				%>
				<tr>
					<th colspan="2" style="padding-left: 547px;"><input type="button"  class="btn btn-info"value="수정"
						onclick="updateqBoard();" /> <input type="button"  class="btn btn-danger"value="삭제"
						onclick="deleteqBoard();" /></th>
				</tr>

				<form action="<%=request.getContextPath()%>/board/adminqboardDelete"
					name="qboardDeleteFrm" method="post">
					<input type="hidden" name="qboardNo" value="<%=bq.getQboardNo()%>" />
					<input type="hidden" name="newFileName"
						value="<%=bq.getQboardNewFileName() != null ? bq.getQboardNewFileName() : ""%>" />

				</form>

				<script>
		
		function updateqBoard(){
			location.href = "<%=request.getContextPath()%>/board/adminboardUpdateForm?qboardNo=<%=bq.getQboardNo()%>";
		}
		
		function deleteqBoard(){
			if(!confirm("정말 삭제 하시겠습니까?")){
				return;
			}
			$("[name=qboardDeleteFrm]").submit();
		}
	
		</script>

				<%
					}
				%>

			</table>

			<hr style="margin-top: 30px;" />
			<div id="comment-container">
				<div class="comment-editor">
					<form
						action="<%=request.getContextPath()%>/board/qboardCommentInsert"
						name="qboardCommentFrm" method="post">
						<input type="hidden" name="qboardRef"
							value="<%=bq.getQboardNo()%>" /> <input type="hidden"
							name="qboardCommentWriter"
							value="<%=userLoggedIn != null ? userLoggedIn.getUserId() : ""%>" />
						<input type="hidden" name="qboardCommentLevel" value="1" /> <input
							type="hidden" name="qboardCommentRef" value="0" />
						<!-- 댓글인 경우 참조댓글이 없으므로 0으로 초기화 -->
						<div class="input-group" style="margin-left: 80px;">
							<div class="input-group-prepend">
								<span class="input-group-text">댓글</span>
								<textarea name="qboardCommentContent" id="qboardCommentContent"
									cols="60" rows="3"></textarea>
							</div>

							<button type="submit" id="btn-insert" class="btn btn-info"
								style="top: 20px; left: 10px;">등록</button>
						</div>
					</form>



				</div>
				<!-- 댓글목록테이블 -->
				<table id="tbl-comment" style="margin-left: 79px;">
					<%
						if (commentList != null) {
							for (Board_QuestionComment bc : commentList) {
								if (bc.getQboardCommentLevel() == 1) {
					%>
					<tr class=level1>
						<td><sub class=comment-writer><%=bc.getQboardCommentWriter()%></sub>
							<sub class=comment-date><%=bc.getQboardCommentDate()%></sub> <br />
							<%=bc.getQboardCommentContent()%></td>
						<td>
							<button class="btn-reply btn btn-info"
								value="<%=bc.getQboardComment_no()%>">답글</button> <%
 						if (userLoggedIn != null && ("admin".equals(userLoggedIn.getUserId())
 						|| bc.getQboardCommentWriter().equals(userLoggedIn.getUserId()))) {
 %>
							<button class="btn-delete btn btn-danger" value="<%=bc.getQboardComment_no()%>">삭제</button>
							<%
								}
							%>
						</td>
					</tr>
					<%
						} else {
					%>
					<tr class=level2>
						<td><sub class=comment-writer><%=bc.getQboardCommentWriter()%></sub>
							<sub class=comment-date><%=bc.getQboardCommentDate()%></sub> <br />
							<%=bc.getQboardCommentContent()%></td>
						<td>
							<%-- 삭제버튼 추가 --%> <%
 	if (userLoggedIn != null && ("admin".equals(userLoggedIn.getUserId())
 						|| bc.getQboardCommentWriter().equals(userLoggedIn.getUserId()))) {
 %>
							<button class="btn-delete btn btn-danger"
								value="<%=bc.getQboardComment_no()%>">삭제</button> <%
 	}
 %>
						</td>
						<td></td>
					</tr>



					<%
						} //end of if : level1, level2

							} //end of for	
						}
					%>
				</table>


			</div>




		</div>

	</div>
</div>


</body>
</html>