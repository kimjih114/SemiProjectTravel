<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

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
padding-bottom: 25px;
padding-right: 20px;
}

hr{
border: 3px solid rgb(00,00,66);
}
</style>

<script>
$(()=>{
	location.href="#"
})

$(function() {
	  var select = $("select#color");

	  select.change(function() {
	    var select_name = $(this).children("option:selected").text();
	    $(this).siblings("label").text(select_name);
	  });
	});


</script>



<!-- 메뉴폼 -->

 <div id="q-container">
 
 
 
 
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

			<fieldset style="padding-right:10px;">
	
			<%
				if (true) {
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

	</div>
			
	</body>
</html>