<%@page import="sns.model.vo.ProfileSNS"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/story/sidenav.jsp" %>
<!-- Bootstrap core CSS -->
 <link href="/trav/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

  <!-- Custom fonts for this template -->
  <link href="/trav/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
  <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" type="text/css">
  <link href='https://fonts.googleapis.com/css?family=Kaushan+Script' rel='stylesheet' type='text/css'>
  <link href='https://fonts.googleapis.com/css?family=Droid+Serif:400,700,400italic,700italic' rel='stylesheet' type='text/css'>
  <link href='https://fonts.googleapis.com/css?family=Roboto+Slab:400,100,300,700' rel='stylesheet' type='text/css'>

  <!-- Custom styles for this template -->
  <link href="/trav/css/agency.min.css" rel="stylesheet">
  
  <!-- Bootstrap core JavaScript -->
  <script src="/trav/vendor/jquery/jquery.min.js"></script>
  <script src="/trav/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

  <!-- Plugin JavaScript -->
  <script src="/trav/vendor/jquery-easing/jquery.easing.min.js"></script>

  <!-- Contact form JavaScript -->
  <script src="/trav/js/jqBootstrapValidation.js"></script>
  <script src="/trav/js/contact_me.js"></script>

  <!-- Custom scripts for this template -->
  <script src="/trav/js/agency.min.js"></script>


   <div id="container-sns"></div>
	  
 </section>
 
 <nav id="rightbar"></nav>
 
 <style>
 #rightbar{
   text-align: center;
    top: 0;
    left: 0;
    display: -webkit-box;
    display: -ms-flexbox;
    /*display: fixed;*/
    -webkit-box-orient: vertical;
    -webkit-box-direction: normal;
    -ms-flex-direction: column;
    flex-direction: column;
    width: 210px;
    /*height: 100vh;*/
    background: #fed136; 
    /*min-width: 250px;*/
 }
 </style>
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










