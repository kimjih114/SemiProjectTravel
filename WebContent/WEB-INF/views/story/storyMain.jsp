<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header-menu.jsp" %>
<%@ include file="/WEB-INF/views/story/sidenav.jsp" %>

   <div id="container-sns"></div>
	  

 <script>
	$(function() {
	$('ul.tab li').click(function() {
		var activeTab = $(this).attr('data-tab');
		$('ul.tab li').removeClass('current');
		$('.tabcontent').removeClass('current');
		$(this).addClass('current');
		$('#' + activeTab).addClass('current');
	})
});
	
$("#post").click(function(){
	$("#tab-container").removeClass('post-unpushed');
	$("#tab-container").addClass('post-pushed');
		
	$("#postFrm").css('display', 'block');
	
	$.ajax({
		url: "<%=request.getContextPath() %>/ajax/travelsrch.jsp", 
		type: "get",
		dataType: "html",
		success: function(data){
			$("#travelsrch").html(data);
		},
		error: function(jqxhr, textStatus, errorThrown){
			console.log("ajax처리실패!");
			console.log(jqxhr, textStatus, errorThrown);
		}
	});
	
})
	
	
	
	
</script>
</body>
</html>










