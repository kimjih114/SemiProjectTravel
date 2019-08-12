
<%@page import="user.model.vo.User"%>
<%@page import="user.controller.UserLoginEndServlet"%>
<%@page import="user.controller.UserLogoutServlet"%>
<%@page import="board.model.vo.Board_Question"%>
<%@page import="java.util.List"%>
<%@page import="java.sql.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%

User userLoggedIn = (User)session.getAttribute("userLoggedIn");

  List<Board_Question> list = (List<Board_Question>)request.getAttribute("list"); 
 
 Board_Question qb = new Board_Question();

	
 /*//페이지 바 
 String pageBar = (String)request.getAttribute("pageBar");  */
 
%>


<style>
#q-container {
	width:700px;
	margin:0 auto;
	text-align:center;
	position: absolute;
	left:265px;
	transition: 0.5s;
	top:100px;
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
#tbl-board>table{
border-collapse: collapse;
border-radius: 10px;

}

#tbl-board>table, #tbl-board>table>td{
width:700px;
border : 1px solid gray;



}
#post_font_a:hover{
	color:#007bff;
}

#tbl-board>table>tbody>tr:first-child{
background:#fed136;
}


.form-control{
width: 200px;
margin-bottom: 10px;
margin-top: 10px;
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


function qboardValidate(){
	var content = $("[name= qboardContent]").val(); 
	if(content.trim().length==0) {
		alert("내용을 입력해주세요!"); 
		return false; 
	}
	
	return true;
}

 
 
 

</script>



<!-- 메뉴폼 -->

 <div id="q-container">

	<div  id="board_containerfrm">
 		<div class="sub_content">
                            <hr />
                        <div class="postscript_area">
                            <ul class="post_con">
                                <li class="post_title"><h4>1:1문의</h4></li>
                                <li class="post_font">
                                		업무와 관련 문의 및 요청사항을 작성하는 게시판입니다. <br />
                                		1:1 문의는 타인에게 내용이 공개되지 않으므로 더 자세한 답변을 받을 수 있습니다. <br /> <br />
                      
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
		
			<form action="<%=request.getContextPath() %>/board/boardQuestionFrm" method="post"
	      enctype="multipart/form-data">
		<table id="tbl-board-view">
			<tr>
				<th>제목</th>
				<td><input class="form-control" type="text" name="qboardTitle" required/></td>
			</tr>		
			<tr>
				<th>작성자</th>
				<td> <input class="form-control" type="text"  name="qboardWriter"
					 value="<%=userLoggedIn.getUserId()%>" required readonly> </td>
			</tr>		
			<tr>
				<th>첨부파일</th>
				<td><input type="file" name="upFile"/></td>
			</tr>
			
					
			<tr>
				<th class="text-control">내용</th>
				<td>
				<div class="input-group">
  					<div class="input-group-prepend">
    				
  					</div>
 					<textarea class="text-control" aria-label="With textarea" 
 					 		name="qboardContent"  required></textarea>	
					</div>	 	  
				</td>
			</tr>		
			<tr>
				<th colspan="2">
					<input type="submit" 
						   value="등록" 
						   onclick="return qboardValidate();"/>
				</th>
			</tr>		
		
		</table>
	</form>
			
			</div>
	</div>


		
			

	</div>
			
	</body>
</html>