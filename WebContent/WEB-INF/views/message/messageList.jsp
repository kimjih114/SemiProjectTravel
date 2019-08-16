<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
 <%
 
 
 %>   
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메시지</title>
<script src="<%=request.getContextPath()%>/js/jquery-3.4.1.js"></script>
<script src="<%=request.getContextPath()%>/js/jquery-3.4.1.js"></script>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>

<style>
#chat-container{
	width: 600px;
	margin: 0 auto;
	padding: 10px;
}
#msg-container{
	height: 600px;
	overflow-y: scroll;
}

.jumbotron{
width: 600px;
height: 200px;
}
</style>
</head>

<body>

	<div class="jumbotron">
	  <p class="lead">안녕하세요, 유람 채팅방입니다.</p>
	  <hr class="my-4">
	</div>
	
	<section id="chat-container">
		<!-- 메세지목록 -->
		<div id="msg-container">
			<ul class="list-group list-group-flush"></ul>
		</div>
		<!-- 사용자입력 -->
		<div class="input-group mb-3">
		  <input type="text" 
		  		 class="form-control" 
		  		 id="msg">
		  <div class="input-group-append">
		    <button class="btn btn-info"
		    		type="button"
		    		id="send">Send</button>
		  </div>
		</div>
		<hr style="margin: 30px 0"/>
		<!-- DM 영역 -->
		<div id="dm-container" class="input-group mb-3">
		  <div class="input-group-prepend">
		    <label class="input-group-text" 
		    	   for="dm-client">DM</label>
		  </div>
		  <select class="custom-select" 
		  		  id="dm-client">
		    <option selected>접속자 목록</option>
		  </select>
		</div>
		<div class="input-group mb-3">
		  <input type="text" 
		  		 class="form-control" 
		  		 id="dm-msg">
		  <div class="input-group-append">
		    <button class="btn btn-info"
		    		type="button"
		    		id="dm-send">Send</button>
		  </div>
		</div>		
	
	</section>
	

</body>
</html>