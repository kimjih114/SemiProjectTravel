<%@page import="user.model.vo.User"%>
<%@page import="user.controller.UserLoginEndServlet"%>
<%@page import="user.controller.UserLogoutServlet"%>
<%@page import="board.model.vo.Board_Question"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%

User userLoggedIn = (User)session.getAttribute("userLoggedIn");

System.out.println("userLoggedIn@userLogin.jsp=" + userLoggedIn);
  List<Board_Question> list = (List<Board_Question>)request.getAttribute("list"); 
  System.out.println("board_question.jsp list="+list);
 //페이지 바 
 String pageBar = (String)request.getAttribute("pageBar"); 
%>


<style>
#q-container {
	width:700px;
	margin:0 auto;
	text-align:center;
	position: absolute;
	left:265px;
	transition: 0.5s;
	top:-344px;
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
/* padding-bottom: 25px; */
padding-right: 20px;
height: 241px;
}

hr{
border: 3px solid rgb(00,00,66);
}
li.post-font{
text-align:left;
}
</style>

<script>
 $(()=>{
	location.href="#"
})

/* $(function() {
	  var select = $("select#color");

	  select.change(function() {
	    var select_name = $(this).children("option:selected").text();
	    $(this).siblings("label").text(select_name);
	  });
	});

 */




</script>



<!-- 메뉴폼 -->

 <div id="q-container">

	<form action="" id="board_containerfrm">
 		<div class="sub_content">
                            <hr />
                        <div class="postscript_area">
                            <ul class="post_con">
                                <li class="post_title"><h4>1:1문의</h4></li>
                                <li class="post_font">
                                		업무와 관련 문의 및 요청사항을 작성하는 게시판입니다. <br />
                                		1:1 문의는 타인에게 내용이 공개되지 않으므로 더 자세한 답변을 받을 수 있습니다. <br /> <br />
                                		회원은 <a href="<%=request.getContextPath()%>/user/userLoginFrm">로그인</a>후 문의가 가능합니다. <br />
                                		<br />유람은 고객님의 목소리를 소중히 여깁니다. <br />
                                		문의주신 내용은 확인 즉시 , 빠르게 답변 드리겠습니다.  <br />
                                		답변은 전화상담이 아닌 온라인으로만 진행됩니다.<br />
                                    <br />
           							
                                </li>
                            </ul>
            
						<hr />
                        </div>
 </div>
		<div class="board_search">

			<fieldset style="padding-right:10px;">
	
			<%
				 if(userLoggedIn != null) { 
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
					<% for(Board_Question bq: list){ %>
					
					<tr class="tr_notice">
						<td><%=bq.getQboardNo() %></td>
						<td>
							<%=bq.getQboardContent() %>
						</td>
						<td><%=bq.getQboardWriter() %></td>
			
						<td><%=bq.getQboardDate() %></td>  <!-- 작성일 넣 -->
						<td><%=bq.getQboardStatus() %></td> <!-- 진행상태넣 -->
					</tr>



	<% } %>
				</tbody>
			</table>

	</div>
			
	</body>
</html>