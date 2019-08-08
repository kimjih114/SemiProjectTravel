<%@page import="user.model.vo.User" %>
<%@page import="java.util.List" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <script src="<%=request.getContextPath()%>/jquery/jquery-3.4.1.js"></script>
<%
	List<User> list=(List<User>)request.getAttribute("list");
%>

<table id="tbl-user">
<tr>
	<td>아이디</td>
	<td>닉네임</td>
	<td>이름</td>
	<td>성별</td>
	<td>생년월일</td>
	<td>이메일</td>
	<td>사진</td>
	<td>관심 여행지</td>
	<td>관심 프로그램</td>
	<td>등록일</td>
</tr>
<%if(!list.isEmpty()){
	for(User u : list){	
%>
<tr>
	<td><%=u.getUserId() %></td>
	<td><%=u.getUsernickName()%></td>
	<td><%=u.getUserName() %></td>
	<td><%=u.getUserGender() %></td>
	<td><%=u.getUserEmail() %></td>
	<td><img src="<%=request.getContextPath() %>/upload/enroll/<%=u.getFileName() %>" alt="" /></td>
	<td><%=u.getUserDefaultPlace() %></td>	
	<td><%=u.getUserDefaultActivity() %></td>	
	<td><%=u.getUserEnrollDate() %></td>
</tr>

<%
		}	
	}
%>
</table>