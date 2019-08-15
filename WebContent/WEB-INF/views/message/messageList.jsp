<%@page import="user.model.vo.User"%>
<%@page import="java.util.List"%>
<%@page import="storymsg.model.vo.Msg"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
 <%
 User userLoggedIn = (User)session.getAttribute("userLoggedIn");
 List<Msg>list =(List<Msg>)request.getAttribute("msgList");
 
 %>   
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메시지</title>
<script src="<%=request.getContextPath()%>/js/jquery-3.4.1.js"></script>
<style>
tr.tr_notice>td{
padding-right: 20px;
padding-left: 25px;
}
#msgform>h3{
text-align: center;
color:#fed136;
}
table#tbl-board{
width: 500px;
text-align: center;
}

</style>
</head>
<body>

		<div id="msgform">
		   <h3>메시지함</h3>
		<table id="tbl-board">

				<tbody>
				<% for(Msg m: list) {%>
					<tr class="tr_notice">
						<td><%=m.getMsgSender() %></td> 
						<td><a href=""><%=m.getMsgContent() %></a></td>  <!--메시지 내용 클릭하면     -->
						<td>
						<% if(m.getMsgCnt()==0){
						%>읽지않음
						<%}else{ %>
						읽음
						<%} %>
						
						</td>
						<td>시간</td> <!--sql에서 select sysdte  -->
					</tr>

				</tbody>
			<%} %>
			</table>
			<hr />
		
		
		
		</div>























</body>
</html>