<%@page import="user.model.vo.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
 <%
	//User userLoggedIn = (User)session.getAttribute("userLoggedIn");
 
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
	width: 405px;
	height:300px;
	/* margin: 0 auto; */
	padding: 10px;
}
#msg-container{
	height: 300px;
	overflow-y: scroll;
}

.jumbotron{
width: 405px;
height: 100px;
background-color: #20C88E;
}
.lead{
 color:#fed136;
 font-weight: bold;
}
.my-4, #msg-container{
border: 1px solid rgb(00,00,66);
border-radius: 5px;
}
#msg-container, .jumbotron{
    margin-bottom: 10px;
}

</style>
<!-- </head> -->
<script>

$(()=>{

	var host = location.host; 
	var ws = new WebSocket('ws://'+host+"<%=request.getContextPath()%>/chat/messagechat");
	
	ws.onopen = e =>{
		console.log("소켓 열림"); 
	};
	
	ws.onmessage = e =>{
		var o = JSON.parse(e.data);
		
		if(o.type === 'message'){
			var html="<li class='list-group-item'>";
			html += "<span class='badge badge-dark'>"+o.sender+"</span>";
			html += "&nbsp;&nbsp;"+o.msg;
			html += "</li>";
			
			$("#msg-container ul").append(html);
			
			var scrollHeight = $("#msg-container").prop("scrollHeight");
			$("#msg-container").scrollTop(scrollHeight);
		}else if(o.type ==="dm"){
			alert(o.sender+":"+o.msg); 
		}
		
		
	} 
	ws.onerror = e =>{
		
		console.log("소켓 에러남~"); 
		
	}//서버와 연결 종료시 핸들러
	ws.onclose = e => {
		console.log("ws close!");
	}
	
	//메세지 전송
	$("#send").click(()=>{
		var o = {
			type: "message",
			msg: $("#msg").val(),
			sender: "<%=request.getParameter("userId")%>",
			time: Date.now()
		}
		
		var s = JSON.stringify(o); 
		ws.send(s);
		
		$("#msg").val('').focus(); 
		
		
	});
	
	//접속한 친구 목록 가져오기  
	$("#dm-client").focus(()=>{
		
		$.ajax({
			url:"<%=request.getContextPath()%>/chat/msgList.do",
			dataType:"json",
			success: function(data){
				var html = "<option value='' disabled>접속자 목록</option>";
				
				$.each(data, (i,userId)=>{
					html +="<option value='"+userId+"'>"; 
					html+=userId;
					html+="</option>"; 
									
				});
				$("#dm-client").html(html); 
			},
				error: function(jpxhr, textStatus,err){
					console.log("ajax처리 실패");
					console.log(jpxhr, textStatus, err); 
				}
		});

	});
	
	$("#dm-send").click(()=>{
		var dm = $("#dm-msg").val().trim(); 
		if(dm.length== 0 || $("#dm-client option:selected").val()== "")
			return;
		
		var dm ={
				type:"dm",
				msg:$("#dm-msg").val(),
				sender:"<%=request.getParameter("userId")%>",
				receiver:$("#dm-client option:selected").val(),
				time:Date.now()
		}
		
		var param = {
				dm: JSON.stringify(dm)
		}
		
		$.ajax({
			url:"<%=request.getContextPath()%>/chat/messageSendDM.do",
			data:param, 
			dataType:"json",
			success: data =>{
				console.log(data);
			},
			error:(jpxhr, textStatus, err)=>{
				console.log("ajax처리 실패"); 
				console.log(jpxhr, textStatus,err); 
			}
			
		});
		
		
	});
	
	
	
	
	
	
});




</script>




<%-- 
<form action="">
<input type="hidden" name="userId" value="<%=userLoggedIn.getUserId() %>" />
</form> --%>
<body>

	<div class="jumbotron">

	  <p class="lead" >안녕하세요, 유람 채팅방입니다.</p>
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
		    		id="send">보내기</button>
		  </div>
		</div>
		<hr style="margin: 10px 0"/>
		<!-- DM 영역 -->
		<div id="dm-container" class="input-group mb-3">
		  <div class="input-group-prepend">
		    <label class="input-group-text" 
		    	   for="dm-client">DM</label>
		  </div>
		  <select class="custom-select" 
		  		  id="dm-client">
		    <option selected>접속한 친구 목록</option>
		  </select>
		</div>
		<div class="input-group mb-3">
		  <input type="text" 
		  		 class="form-control" 
		  		 id="dm-msg">
		  <div class="input-group-append">
		    <button class="btn btn-info"
		    		type="button"
		    		id="dm-send">보내기</button>
		  </div>
		</div>		
	
	</section>
	

</body>
</html>