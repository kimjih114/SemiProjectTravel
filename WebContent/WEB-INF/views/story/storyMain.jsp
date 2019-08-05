<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header-menu.jsp" %>

 <!-- Bootstrap core CSS -->
  <link href="<%=request.getContextPath() %>/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

  <!-- Custom fonts for this template -->
  <link href="<%=request.getContextPath() %>/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
  <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" type="text/css">
  <link href='https://fonts.googleapis.com/css?family=Kaushan+Script' rel='stylesheet' type='text/css'>
  <link href='https://fonts.googleapis.com/css?family=Droid+Serif:400,700,400italic,700italic' rel='stylesheet' type='text/css'>
  <link href='https://fonts.googleapis.com/css?family=Roboto+Slab:400,100,300,700' rel='stylesheet' type='text/css'>

  <!-- Custom styles for this template -->
  <link href="<%=request.getContextPath() %>/css/agency.min.css" rel="stylesheet">
  
  <!-- Bootstrap core JavaScript -->
  <script src="<%=request.getContextPath() %>/vendor/jquery/jquery.min.js"></script>
  <script src="<%=request.getContextPath() %>/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

  <!-- Plugin JavaScript -->
  <script src="<%=request.getContextPath() %>/vendor/jquery-easing/jquery.easing.min.js"></script>

  <!-- Contact form JavaScript -->
  <script src="<%=request.getContextPath() %>/js/jqBootstrapValidation.js"></script>
  <script src="<%=request.getContextPath() %>/js/contact_me.js"></script>

  <!-- Custom scripts for this template -->
  <script src="<%=request.getContextPath() %>/js/agency.min.js"></script>
  <style>
  /*@media (min-width: 992px)*/
.page-top{
	position: relative;
}

#profile-header{
	padding-bottom: 20px;
	margin: 0;
	background-color:#fed136;
} 
  
#sideNav {
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
    width: 22%;
    /*height: 100vh;*/
    background: #fed136; 
    /*min-width: 250px;*/
}
.profile-circle{
	max-width: 10rem;
    max-height: 10rem;
    border: 0.5rem solid #212529;
    border-radius: 100%;
}
#sideNav .navbar-nav .nav-item .nav-link {
  font-weight: 800;
  letter-spacing: 0.05rem;
  text-transform: uppercase;
}

#sideNav .navbar-toggler:focus {
  outline-color: #d48a6e;
}

a .nav-link js-scroll-trigger{
	color: #007bff;
    text-decoration: none;
    background-color: transparent;

}
table{
	margin: 10 auto;
	margin-bottom: 30px;
}

table tr :hover{
	cursor: pointer;
	color: orangered;
	
}

table td{
	padding: 10px;
	border-bottom: 1px solid #212529;
	border-collapse: collapse;
    border-right: 0;
    border-left:0;
    height: 50px;
}

#sideNav, table {
	font-size: 90%;
    font-weight: 400;
   /* padding: .75em 0;*/
    letter-spacing: 1px;
}

div#profile-header{
	margin: 0 auto;
}

.main-section{
    text-align: center;
    top: 0;
    left: 0;
    display: -webkit-box;
    display: -ms-flexbox;
    display: fixed;
    -webkit-box-orient: vertical;
    -webkit-box-direction: normal;
    -ms-flex-direction: column;
    flex-direction: column;
    width: 56%;
    /*height: 100vh;*/
    background: lightgray;
    
    /*min-width: 800px;*/
	
}
.sideDiv{
	text-align: center;
    top: 0;
    right: 0;
    display: -webkit-box;
    display: -ms-flexbox;
    display: fixed;
    -webkit-box-orient: vertical;
    -webkit-box-direction: normal;
    -ms-flex-direction: column;
    flex-direction: column;
    width: 300px;
    /*height: 100vh;*/
    background: red; 
    /*min-width: 250px;*/
    position: fixed;
}

#tab-container {
	width:550px;
	margin:0 auto;
	text-align:center;
	position: absolute;
	top:10px;
	left:240px;
}
#tab-container .tab {
	list-style: none;
	margin: 0;
	padding: 0;
	overflow: hidden;
}
/* Float the list items side by side */
#tab-container .tab li {
	float: left;
	width: 33.3333%;
	border-bottom: 1px solid;
}
/* Style the links inside the list items */
#tab-container .tab li a {
	display: inline-block;
	color: #000;
	text-align: center;
	text-decoration: none;
	padding: 14px 16px;
	font-size: 17px;
	transition:0.3s;
	cursor: pointer;
}
/* Style the tab content */
#tab-container .tabcontent {
	display: none;
	background-color:black;
	padding: 6px 12px;
	color:#fff;
}
#tab-container ul.tab li.current{
	background-color: #fed136;
	color: #222;
	border:1px solid;
	border-bottom: 0;
}
#tab-container .tabcontent.current {
	display: block;
	background-color: white;
	color: black;
	border: 1px solid;
	border-top: 0px;
	
}
#boardFrm{
	margin-bottom: 10px;
	padding: 10px;
}


</style>
  
 <header class="masthead" style="height:300px;">
      <div class="intro-text" style="padding-top:140px; !important">
        <div class="intro-heading text-uppercase">
       		@userId의 페이지입니다.(유저가설정가능)
        </div>
     </div>
  </header>
  
<section class="page-top" style="padding:0px; !important; overflow-x: auto">
	  <nav id="sideNav">
		<div id="profile-header">
	      <img class="profile-circle"  style="margin: 50px auto 12px;" src="<%=request.getContextPath() %>/img/profile.jpg" alt="">
	      <p class="userprofile-userId">@userId <button>edit</button></p>
	      <p class="userIntroduce" style="margin-bottom: 50px;">안녕하세요. 저는 userId입니다. 좋아하는 여행지는 #서촌입니다.<button>edit</button></p>
	   </div>
	   <table id="tbl-usermenu1">
	   		<tr>
	   			<td>알림 (new가 반짝반짝)</td>
	   		</tr>
	   	</table>
	   	<table id="tbl-usermenu2">
	   		<tr>
	   			<td>팔로워</td>
	   		</tr>
	   		<tr>
	   			<td>메시지</td>
	   		</tr>
	   		
	   	</table>
	   	
	    <table id="tbl-usermenu3">
	    <tr>
	   		<td>설정</td>
	   	</tr>
		</table>
	
		<table id="tbl-usermenu4" style="margin-bottom:0px; !important">
	    <tr>
	    	<td>FAQ</td>
	    </tr>
	    
	    <tr>
	    	<td>1:1문의</td>
	    </tr>
	    
	    <tr>
	    	<td>공지사항</td>
	    </tr> 	
		</table>
	  </nav>
		<div id="tab-container">
			<form action="" id="boardFrm">
				<textarea name="boardContent" id="boardContent" cols="55" rows="3"></textarea>
			
			</form>
			<ul class="tab">
				<li class="current" data-tab="tab1"><a>타임라인</a></li>
				<li data-tab="tab2"><a>좋아요</a></li>
				<li data-tab="tab3"><a>스크랩</a></li>
			</ul>
	
			<div id="tab1" class="tabcontent current">
				<div class="timeline">
				
				
					<div id="timeline-list">
						
					</div>
	    		</div>
			</div>
	
			<div id="tab2" class="tabcontent">
				<h3>좋아요</h3>
				<p>Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of "de Finibus Bonorum et Malorum" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, "Lorem ipsum dolor sit amet..", comes from a line in section 1.10.32.</p>
			</div>
	
			<div id="tab3" class="tabcontent">
				<h3>스크랩</h3>
				<p>It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for 'lorem ipsum' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).</p>
			</div>
	</div>
	  	
		<div class="sideDiv">
			<div class="search-trend">ㅎ</div>
			<div class="recommend">ㅎ </div>
		</div>
 </section>
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
</script>
</body>
</html>