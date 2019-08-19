<%@page import="java.util.Date"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
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


<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>


<%
	String contentId=request.getParameter("contentId");
	String contentTypeId=request.getParameter("contentTypeId");
	String title=request.getParameter("title");
	String basket=request.getParameter("basket");
	String sDate=request.getParameter("startDate");
	String eDate=request.getParameter("endDate");
	System.out.println(sDate);
	System.out.println(eDate);
	Date date=new Date();
	System.out.println(date.getMonth()+1); //현재 월
%>

<script>
	
	$(function(){
		//달력
		 $.datepicker.regional['ko'] = {
			        closeText: '닫기',
			        prevText: '이전달',
			        nextText: '다음달',
			        currentText: '오늘',
			        monthNames: ['1월(JAN)','2월(FEB)','3월(MAR)','4월(APR)','5월(MAY)','6월(JUN)',
			        '7월(JUL)','8월(AUG)','9월(SEP)','10월(OCT)','11월(NOV)','12월(DEC)'],
			        monthNamesShort: ['1월','2월','3월','4월','5월','6월',
			        '7월','8월','9월','10월','11월','12월'],
			        dayNames: ['일','월','화','수','목','금','토'],
			        dayNamesShort: ['일','월','화','수','목','금','토'],
			        dayNamesMin: ['일','월','화','수','목','금','토'],
			        weekHeader: 'Wk',
			        dateFormat: 'yy-mm-dd',
			        firstDay: 0,
			        isRTL: false,
			        showMonthAfterYear: true,
			        yearSuffix: '',
			        showOn: 'both',
			        buttonImage: "http://jqueryui.com/resources/demos/datepicker/images/calendar.gif",
		            buttonImageOnly: true,
			        changeMonth: true,
			        changeYear: true,
			        showButtonPanel: true,
			        yearRange: 'c-99:c+99',
			        minDate: 0,
			    };
			    $.datepicker.setDefaults($.datepicker.regional['ko']);
 
			    $('#sdate').datepicker();		    
			    $('#sdate').datepicker("option", "maxDate", $("#edate").val());
			    $('#sdate').datepicker("option", "onClose", function ( selectedDate ) {
			        $("#edate").datepicker( "option", "minDate", selectedDate );
			        
			    });
			    
			    $('#edate').datepicker();			    
			    $('#edate').datepicker("option", "minDate",$("#sdate").val());
			    $('#edate').datepicker("option", "onClose", function ( selectedDate ) {
			        $("#sdate").datepicker( "option", "maxDate", selectedDate );
			    });
			    	
			    
			    
				if("basket"=="<%=basket%>"){
					$("#search").css("display","block");
					$("#h5").css("margin-left","350px");
					 $("#sdate").datepicker( "setDate", "<%=sDate%>");
					 $("#edate").datepicker( "setDate", "<%=eDate%>");
					var day=0;
					var weekend1=0; //주말여부1
					var weekend2=0; //주말여부2
					var numberMonth1=0;
					var numberMonth2=0;
					var roomList=new Array;
					
					$.ajax({
						type : "get",
						url : "<%=request.getContextPath()%>/travel/roomSearch.do?sdate=<%=sDate%>&edate=<%=eDate%>&contentId=<%=contentId%>",
						dataType : "json",
						async : false,
						success:function(data){
							console.log("data값은?"+data);
							$(data).each((i,u)=>{		
								roomList.push(u.roomName);
				
							});
						},
						error:function(jqxhr,textStatus,errorThrown){
							
						}
						
					});
					
					$.ajax({
						type : "get",
						url : "<%=request.getContextPath()%>/travel/dateDay.do?sDate=<%=sDate%>&eDate=<%=eDate%>",
						dataType : "json",
						async : false,
						success:function(data){
							day=data;
							
						},
						error:function(jqxhr,textStatus,errorThrown){
							
						}
						
					});
					
					//주말여부 
					$.ajax({
						type : "get",
						url : "<%=request.getContextPath()%>/travel/weekendDay.do?sDate=<%=sDate%>&eDate=<%=eDate%>",
						dataType : "json",
						async : false,
						success:function(data){
							weekend1=data[0];
							weekend2=data[1];
							
							var month1="<%=sDate%>";
							var month2="<%=eDate%>";
							
							numberMonth1=Number(month1.split("-")[1]);
							numberMonth2=Number(month2.split("-")[1]);
							console.log(numberMonth1);
							console.log(numberMonth2);
							
						},
						error:function(jqxhr,textStatus,errorThrown){
							
						}
						
					});
					
					$.ajax({
						url: "http://api.visitkorea.or.kr/openapi/service/rest/KorService/detailInfo?ServiceKey=Q3FUrD0IPezrGaAAYbNChhRz7RbeL7Iz0iFE1bEgU1NqkrU8PJw6M2yp%2BC0y7cdykSInV0eNP1Tl0ClQP9TDjw%3D%3D&contentTypeId=<%=contentTypeId%>&contentId=<%=contentId%>&MobileOS=ETC&MobileApp=TourAPI3.0_Guide&listYN=Y",
						type: "get",
						dataType: "xml",
						success:function(data){
							var $root=$(data).find(":root");
							
							var $items=$root.find("item");
							var html="";
							
							var $root=$(data).find(":root");				
							var $items=$root.find("item");
							var html1 = "";
							
							$items.each(function(i,m){						
								var bool=false;
									
									if(roomList.length!=0){
										
										for(var i=0;i<roomList.length;i++){
											
											if(roomList[i]==$(m).find("roomtitle").text()){
												bool=true;
											}
										}
										
										if(bool==true){
											
											html1+="<h1 class='my-4'></h1>";
											html1+="<div class='row'>";
											html1+="<div class='col-md-8'><img class='img-fluid' src='"+$(m).find("roomimg1").text()+"' alt=''></div>";
											html1+="<div class='col-md-4'>";
											html1+="<h3 class='my-3'>"+$(m).find("roomtitle").text()+"</h3>";
											html1+="<p>객실크기:"+$(m).find("roomsize1").text()+"</p>";
											html1+="<p>기준인원:"+$(m).find("roommaxcount").text()+"</p>";
											html1+="<p>객실소개:"+$(m).find("roomintro").text()+"</p>";
											html1+="<p>비수기주중최소:"+$(m).find("roomoffseasonminfee1").text()+"(성수기:"+$(m).find("roomoffseasonminfee2").text()+")</p>";
											html1+="<p>비수기주말최소:"+$(m).find("roompeakseasonminfee1").text()+"(성수기:"+$(m).find("roompeakseasonminfee2").text()+")</p>";
											html1+="<h3 class='my-3'>예약불가</h3>";
											html1+="</div></div>";
											html1+="<h3 class='my-4'></h3>";	
											html1+="<div class='row'>";
											html1+="<div class='col-md-3 col-sm-6 mb-4'>";
											html1+="<a href='#'><img class='img-fluid' src='"+$(m).find("roomimg1").text()+"' alt=''></a>";
											html1+="</div>";
											html1+="<div class='col-md-3 col-sm-6 mb-4'><a href='#'><img class='img-fluid' src='"+$(m).find("roomimg2").text()+"' alt=''></a></div>";
											html1+="<div class='col-md-3 col-sm-6 mb-4'><a href='#'><img class='img-fluid' src='"+$(m).find("roomimg3").text()+"' alt=''></a></div>";
											html1+=" </div>";
										}
					
										if(bool==false){
											
											html1+="<h1 class='my-4'></h1>";
											html1+="<div class='row'>";
											html1+="<div class='col-md-8'><img class='img-fluid' src='"+$(m).find("roomimg1").text()+"' alt=''></div>";
											html1+="<div class='col-md-4'>";
											html1+="<h3 class='my-3'>"+$(m).find("roomtitle").text()+"</h3>";
											html1+="<p>객실크기:"+$(m).find("roomsize1").text()+"</p>";
											html1+="<p>기준인원:"+$(m).find("roommaxcount").text()+"</p>";
											html1+="<p>객실소개:"+$(m).find("roomintro").text()+"</p>";
											html1+="<p>비수기주중최소:"+$(m).find("roomoffseasonminfee1").text()+"(성수기:"+$(m).find("roomoffseasonminfee2").text()+")</p>";
											html1+="<p>비수기주말최소:"+$(m).find("roompeakseasonminfee1").text()+"(성수기:"+$(m).find("roompeakseasonminfee2").text()+")</p>";															
																			
											if(((numberMonth1<7||numberMonth1>8)&&(numberMonth2<7||numberMonth2>8))&&((weekend1!=1&&weekend1!=7)&&(weekend2!=1&&weekend2!=7))){
											html1+="<span class='my-3'><button type='button' onclick='rsvCheck("+$(m).find("roomoffseasonminfee1").text()*day+","+'"'+$(m).find("roomtitle").text()+'"'+");'>"+day+"박:"+$(m).find("roomoffseasonminfee1").text()*day+"원 예약하기</button></span>";
											html1+="<span class='my-3'><button type='button' onclick='basketCheck("+$(m).find("roomoffseasonminfee1").text()*day+","+'"'+$(m).find("roomtitle").text()+'"'+");'>장바구니 담기</button></span>";
											}else if(((numberMonth1<7||numberMonth1>8)&&(numberMonth2<7||numberMonth2>8))&&((weekend1==1||weekend1==7)||(weekend2==1||weekend2==7))){
											html1+="<span class='my-3'><button type='button' onclick='rsvCheck("+$(m).find("roompeakseasonminfee1").text()*day+","+'"'+$(m).find("roomtitle").text()+'"'+");'>"+day+"박:"+$(m).find("roompeakseasonminfee1").text()*day+"원 예약하기</button></span>";
											html1+="<span class='my-3'><button type='button' onclick='basketCheck("+$(m).find("roompeakseasonminfee1").text()*day+","+'"'+$(m).find("roomtitle").text()+'"'+");'>장바구니 담기</button></span>";
											}else if(((numberMonth1==7||numberMonth1==8)||(numberMonth2==7||numberMonth2==8))&&((weekend1!=1&&weekend1!=7)&&(weekend2!=1&&weekend2!=7))){
											html1+="<span class='my-3'><button type='button' onclick='rsvCheck("+$(m).find("roomoffseasonminfee2").text()*day+","+'"'+$(m).find("roomtitle").text()+'"'+");'>"+day+"박:"+$(m).find("roomoffseasonminfee2").text()*day+"원 예약하기</button></span>";
											html1+="<span class='my-3'><button type='button' onclick='basketCheck("+$(m).find("roomoffseasonminfee2").text()*day+","+'"'+$(m).find("roomtitle").text()+'"'+");'>장바구니 담기</button></span>";
											}else if(((numberMonth1==7||numberMonth1==8)||(numberMonth2==7||numberMonth2==8))&&((weekend1==1||weekend1==7)||(weekend2==1||weekend2==7))){
											html1+="<span class='my-3'><button type='button' onclick='rsvCheck("+$(m).find("roompeakseasonminfee2").text()*day+","+'"'+$(m).find("roomtitle").text()+'"'+");'>"+day+"박:"+$(m).find("roompeakseasonminfee2").text()*day+"원 예약하기</button></span>";	
											html1+="<span class='my-3'><button type='button' onclick='basketCheck("+$(m).find("roompeakseasonminfee2").text()*day+","+'"'+$(m).find("roomtitle").text()+'"'+");'>장바구니 담기</button></span>";
											}
											
											
											html1+="</div></div>";
											html1+="<h3 class='my-4'></h3>";	
											html1+="<div class='row'>";
											html1+="<div class='col-md-3 col-sm-6 mb-4'>";
											html1+="<a href='#'><img class='img-fluid' src='"+$(m).find("roomimg1").text()+"' alt=''></a>";
											html1+="</div>";
											html1+="<div class='col-md-3 col-sm-6 mb-4'><a href='#'><img class='img-fluid' src='"+$(m).find("roomimg2").text()+"' alt=''></a></div>";
											html1+="<div class='col-md-3 col-sm-6 mb-4'><a href='#'><img class='img-fluid' src='"+$(m).find("roomimg3").text()+"' alt=''></a></div>";
											html1+=" </div>";
										}
										
									}else{
										
										html1+="<h1 class='my-4'></h1>";
										html1+="<div class='row'>";
										html1+="<div class='col-md-8'><img class='img-fluid' src='"+$(m).find("roomimg1").text()+"' alt=''></div>";
										html1+="<div class='col-md-4'>";
										html1+="<h3 class='my-3'>"+$(m).find("roomtitle").text()+"</h3>";
										html1+="<p>객실크기:"+$(m).find("roomsize1").text()+"</p>";
										html1+="<p>기준인원:"+$(m).find("roommaxcount").text()+"</p>";
										html1+="<p>객실소개:"+$(m).find("roomintro").text()+"</p>";
										html1+="<p>비수기주중최소:"+$(m).find("roomoffseasonminfee1").text()+"(성수기:"+$(m).find("roomoffseasonminfee2").text()+")</p>";
										html1+="<p>비수기주말최소:"+$(m).find("roompeakseasonminfee1").text()+"(성수기:"+$(m).find("roompeakseasonminfee2").text()+")</p>";							
										html1+="<input type='hidden' id='roomTitle' value='"+$(m).find("roomtitle").text()+"'>";									
										if(((numberMonth1<7||numberMonth1>8)&&(numberMonth2<7||numberMonth2>8))&&((weekend1!=1&&weekend1!=7)&&(weekend2!=1&&weekend2!=7))){
										html1+="<span class='my-3'><button type='button' onclick='rsvCheck("+$(m).find("roomoffseasonminfee1").text()*day+","+'"'+$(m).find("roomtitle").text()+'"'+");'>"+day+"박:"+$(m).find("roomoffseasonminfee1").text()*day+"원 예약하기</button></span>";
										html1+="<span class='my-3'><button type='button' onclick='basketCheck("+$(m).find("roomoffseasonminfee1").text()*day+","+'"'+$(m).find("roomtitle").text()+'"'+");'>장바구니 담기</button></span>";
										}else if(((numberMonth1<7||numberMonth1>8)&&(numberMonth2<7||numberMonth2>8))&&((weekend1==1||weekend1==7)||(weekend2==1||weekend2==7))){
										html1+="<span class='my-3'><button type='button' onclick='rsvCheck("+$(m).find("roompeakseasonminfee1").text()*day+","+'"'+$(m).find("roomtitle").text()+'"'+");'>"+day+"박:"+$(m).find("roompeakseasonminfee1").text()*day+"원 예약하기</button></span>";
										html1+="<span class='my-3'><button type='button' onclick='basketCheck("+$(m).find("roompeakseasonminfee1").text()*day+","+'"'+$(m).find("roomtitle").text()+'"'+");'>장바구니 담기</button></span>";
										}else if(((numberMonth1==7||numberMonth1==8)||(numberMonth2==7||numberMonth2==8))&&((weekend1!=1&&weekend1!=7)&&(weekend2!=1&&weekend2!=7))){
										html1+="<span class='my-3'><button type='button' onclick='rsvCheck("+$(m).find("roomoffseasonminfee2").text()*day+","+'"'+$(m).find("roomtitle").text()+'"'+");'>"+day+"박:"+$(m).find("roomoffseasonminfee2").text()*day+"원 예약하기</button></span>";
										html1+="<span class='my-3'><button type='button' onclick='basketCheck("+$(m).find("roomoffseasonminfee2").text()*day+","+'"'+$(m).find("roomtitle").text()+'"'+");'>장바구니 담기</button></span>";
										}else if(((numberMonth1==7||numberMonth1==8)||(numberMonth2==7||numberMonth2==8))&&((weekend1==1||weekend1==7)||(weekend2==1||weekend2==7))){
										html1+="<span class='my-3'><button type='button' onclick='rsvCheck("+$(m).find("roompeakseasonminfee2").text()*day+","+'"'+$(m).find("roomtitle").text()+'"'+");'>"+day+"박:"+$(m).find("roompeakseasonminfee2").text()*day+"원 예약하기</button></span>";	
										html1+="<span class='my-3'><button type='button' onclick='basketCheck("+$(m).find("roompeakseasonminfee2").text()*day+","+'"'+$(m).find("roomtitle").text()+'"'+");'>장바구니 담기</button></span>";
										}
										
										html1+="</div></div>";
										html1+="<h3 class='my-4'></h3>";	
										html1+="<div class='row'>";
										html1+="<div class='col-md-3 col-sm-6 mb-4'>";
										html1+="<a href='#'><img class='img-fluid' src='"+$(m).find("roomimg1").text()+"' alt=''></a>";
										html1+="</div>";
										html1+="<div class='col-md-3 col-sm-6 mb-4'><a href='#'><img class='img-fluid' src='"+$(m).find("roomimg2").text()+"' alt=''></a></div>";
										html1+="<div class='col-md-3 col-sm-6 mb-4'><a href='#'><img class='img-fluid' src='"+$(m).find("roomimg3").text()+"' alt=''></a></div>";
										html1+=" </div>";
									}
									

							});
							$("#contents").html(html1);
							
						},
						error:function(jqxhr,textStatus,errorThrown){
							
						}
					});
				}
	});
	
	function search(){
		$("#search").css("display","block");
		$("#h5").css("margin-left","350px");
		var day=0; // 일수여부
		var weekend1=0; //주말여부1
		var weekend2=0; //주말여부2
		var numberMonth1=0;
		var numberMonth2=0;
		var roomList=new Array;
		var queryString = $("form[name=searchForm]").serialize();
		
		$.ajax({
			type : "get",
			url : "<%=request.getContextPath()%>/travel/roomSearch.do",
			data : queryString,
			dataType : "json",
			async : false,
			success:function(data){
				console.log("data값은?"+data);
				$(data).each((i,u)=>{		
					roomList.push(u.roomName);
					
					
				});
			},
			error:function(jqxhr,textStatus,errorThrown){
				
			}
			
		});
		var sDate=$("#sdate").val();
		var eDate=$("#edate").val();
		$.ajax({
			type : "get",
			url : "<%=request.getContextPath()%>/travel/dateDay.do?sDate="+sDate+"&eDate="+eDate+"",
			dataType : "json",
			async : false,
			success:function(data){
				day=data;
				
			},
			error:function(jqxhr,textStatus,errorThrown){
				
			}
			
		});
		//주말여부 
		$.ajax({
			type : "get",
			url : "<%=request.getContextPath()%>/travel/weekendDay.do?sDate="+sDate+"&eDate="+eDate+"",
			dataType : "json",
			async : false,
			success:function(data){
				weekend1=data[0];
				weekend2=data[1];
				var month1=sDate.split("-")[1];
				var month2=eDate.split("-")[1];
				numberMonth1=Number(month1);
				numberMonth2=Number(month2);
				
			},
			error:function(jqxhr,textStatus,errorThrown){
				
			}
			
		});
		
		$.ajax({
			url: "http://api.visitkorea.or.kr/openapi/service/rest/KorService/detailInfo?ServiceKey=Q3FUrD0IPezrGaAAYbNChhRz7RbeL7Iz0iFE1bEgU1NqkrU8PJw6M2yp%2BC0y7cdykSInV0eNP1Tl0ClQP9TDjw%3D%3D&contentTypeId=<%=contentTypeId%>&contentId=<%=contentId%>&MobileOS=ETC&MobileApp=TourAPI3.0_Guide&listYN=Y",
			type: "get",
			dataType: "xml",
			success:function(data){
				var $root=$(data).find(":root");
				
				var $items=$root.find("item");
				var html="";
				
				var $root=$(data).find(":root");				
				var $items=$root.find("item");
				var html1 = "";
				
				$items.each(function(i,m){						
					var bool=false;
						
						if(roomList.length!=0){
							
							for(var i=0;i<roomList.length;i++){
								
								if(roomList[i]==$(m).find("roomtitle").text()){
									bool=true;
								}
							}
							
							if(bool==true){
								
								html1+="<h1 class='my-4'></h1>";
								html1+="<div class='row'>";
								html1+="<div class='col-md-8'><img class='img-fluid' src='"+$(m).find("roomimg1").text()+"' alt=''></div>";
								html1+="<div class='col-md-4'>";
								html1+="<h3 class='my-3'>"+$(m).find("roomtitle").text()+"</h3>";
								html1+="<p>객실크기:"+$(m).find("roomsize1").text()+"</p>";
								html1+="<p>기준인원:"+$(m).find("roommaxcount").text()+"</p>";
								html1+="<p>객실소개:"+$(m).find("roomintro").text()+"</p>";
								html1+="<p>비수기주중최소:"+$(m).find("roomoffseasonminfee1").text()+"(성수기:"+$(m).find("roomoffseasonminfee2").text()+")</p>";
								html1+="<p>비수기주말최소:"+$(m).find("roompeakseasonminfee1").text()+"(성수기:"+$(m).find("roompeakseasonminfee2").text()+")</p>";
								html1+="<h3 class='my-3'>예약불가</h3>";
								html1+="</div></div>";
								html1+="<h3 class='my-4'></h3>";	
								html1+="<div class='row'>";
								html1+="<div class='col-md-3 col-sm-6 mb-4'>";
								html1+="<a href='#'><img class='img-fluid' src='"+$(m).find("roomimg1").text()+"' alt=''></a>";
								html1+="</div>";
								html1+="<div class='col-md-3 col-sm-6 mb-4'><a href='#'><img class='img-fluid' src='"+$(m).find("roomimg2").text()+"' alt=''></a></div>";
								html1+="<div class='col-md-3 col-sm-6 mb-4'><a href='#'><img class='img-fluid' src='"+$(m).find("roomimg3").text()+"' alt=''></a></div>";
								html1+=" </div>";
							}
		
							if(bool==false){
								
								html1+="<h1 class='my-4'></h1>";
								html1+="<div class='row'>";
								html1+="<div class='col-md-8'><img class='img-fluid' src='"+$(m).find("roomimg1").text()+"' alt=''></div>";
								html1+="<div class='col-md-4'>";
								html1+="<h3 class='my-3'>"+$(m).find("roomtitle").text()+"</h3>";
								html1+="<p>객실크기:"+$(m).find("roomsize1").text()+"</p>";
								html1+="<p>기준인원:"+$(m).find("roommaxcount").text()+"</p>";
								html1+="<p>객실소개:"+$(m).find("roomintro").text()+"</p>";
								html1+="<p>비수기주중최소:"+$(m).find("roomoffseasonminfee1").text()+"(성수기:"+$(m).find("roomoffseasonminfee2").text()+")</p>";
								html1+="<p>비수기주말최소:"+$(m).find("roompeakseasonminfee1").text()+"(성수기:"+$(m).find("roompeakseasonminfee2").text()+")</p>";															
																
								if(((numberMonth1<7||numberMonth1>8)&&(numberMonth2<7||numberMonth2>8))&&((weekend1!=1&&weekend1!=7)&&(weekend2!=1&&weekend2!=7))){
								html1+="<span class='my-3'><button type='button' onclick='rsvCheck("+$(m).find("roomoffseasonminfee1").text()*day+","+'"'+$(m).find("roomtitle").text()+'"'+");'>"+day+"박:"+$(m).find("roomoffseasonminfee1").text()*day+"원 예약하기</button></span>";
								html1+="<span class='my-3'><button type='button' onclick='basketCheck("+$(m).find("roomoffseasonminfee1").text()*day+","+'"'+$(m).find("roomtitle").text()+'"'+");'>장바구니 담기</button></span>";
								}else if(((numberMonth1<7||numberMonth1>8)&&(numberMonth2<7||numberMonth2>8))&&((weekend1==1||weekend1==7)||(weekend2==1||weekend2==7))){
								html1+="<span class='my-3'><button type='button' onclick='rsvCheck("+$(m).find("roompeakseasonminfee1").text()*day+","+'"'+$(m).find("roomtitle").text()+'"'+");'>"+day+"박:"+$(m).find("roompeakseasonminfee1").text()*day+"원 예약하기</button></span>";
								html1+="<span class='my-3'><button type='button' onclick='basketCheck("+$(m).find("roompeakseasonminfee1").text()*day+","+'"'+$(m).find("roomtitle").text()+'"'+");'>장바구니 담기</button></span>";
								}else if(((numberMonth1==7||numberMonth1==8)||(numberMonth2==7||numberMonth2==8))&&((weekend1!=1&&weekend1!=7)&&(weekend2!=1&&weekend2!=7))){
								html1+="<span class='my-3'><button type='button' onclick='rsvCheck("+$(m).find("roomoffseasonminfee2").text()*day+","+'"'+$(m).find("roomtitle").text()+'"'+");'>"+day+"박:"+$(m).find("roomoffseasonminfee2").text()*day+"원 예약하기</button></span>";
								html1+="<span class='my-3'><button type='button' onclick='basketCheck("+$(m).find("roomoffseasonminfee2").text()*day+","+'"'+$(m).find("roomtitle").text()+'"'+");'>장바구니 담기</button></span>";
								}else if(((numberMonth1==7||numberMonth1==8)||(numberMonth2==7||numberMonth2==8))&&((weekend1==1||weekend1==7)||(weekend2==1||weekend2==7))){
								html1+="<span class='my-3'><button type='button' onclick='rsvCheck("+$(m).find("roompeakseasonminfee2").text()*day+","+'"'+$(m).find("roomtitle").text()+'"'+");'>"+day+"박:"+$(m).find("roompeakseasonminfee2").text()*day+"원 예약하기</button></span>";	
								html1+="<span class='my-3'><button type='button' onclick='basketCheck("+$(m).find("roompeakseasonminfee2").text()*day+","+'"'+$(m).find("roomtitle").text()+'"'+");'>장바구니 담기</button></span>";
								}
								
											
								html1+="</div></div>";
								html1+="<h3 class='my-4'></h3>";	
								html1+="<div class='row'>";
								html1+="<div class='col-md-3 col-sm-6 mb-4'>";
								html1+="<a href='#'><img class='img-fluid' src='"+$(m).find("roomimg1").text()+"' alt=''></a>";
								html1+="</div>";
								html1+="<div class='col-md-3 col-sm-6 mb-4'><a href='#'><img class='img-fluid' src='"+$(m).find("roomimg2").text()+"' alt=''></a></div>";
								html1+="<div class='col-md-3 col-sm-6 mb-4'><a href='#'><img class='img-fluid' src='"+$(m).find("roomimg3").text()+"' alt=''></a></div>";
								html1+=" </div>";
							}
							
						}else{
							
							html1+="<h1 class='my-4'></h1>";
							html1+="<div class='row'>";
							html1+="<div class='col-md-8'><img class='img-fluid' src='"+$(m).find("roomimg1").text()+"' alt=''></div>";
							html1+="<div class='col-md-4'>";
							html1+="<h3 class='my-3'>"+$(m).find("roomtitle").text()+"</h3>";
							html1+="<p>객실크기:"+$(m).find("roomsize1").text()+"</p>";
							html1+="<p>기준인원:"+$(m).find("roommaxcount").text()+"</p>";
							html1+="<p>객실소개:"+$(m).find("roomintro").text()+"</p>";
							html1+="<p>비수기주중최소:"+$(m).find("roomoffseasonminfee1").text()+"(성수기:"+$(m).find("roomoffseasonminfee2").text()+")</p>";
							html1+="<p>비수기주말최소:"+$(m).find("roompeakseasonminfee1").text()+"(성수기:"+$(m).find("roompeakseasonminfee2").text()+")</p>";							
							html1+="<input type='hidden' id='roomTitle' value='"+$(m).find("roomtitle").text()+"'>";									
							if(((numberMonth1<7||numberMonth1>8)&&(numberMonth2<7||numberMonth2>8))&&((weekend1!=1&&weekend1!=7)&&(weekend2!=1&&weekend2!=7))){
							html1+="<span class='my-3'><button type='button' onclick='rsvCheck("+$(m).find("roomoffseasonminfee1").text()*day+","+'"'+$(m).find("roomtitle").text()+'"'+");'>"+day+"박:"+$(m).find("roomoffseasonminfee1").text()*day+"원 예약하기</button></span>";
							html1+="<span class='my-3'><button type='button' onclick='basketCheck("+$(m).find("roomoffseasonminfee1").text()*day+","+'"'+$(m).find("roomtitle").text()+'"'+");'>장바구니 담기</button></span>";
							}else if(((numberMonth1<7||numberMonth1>8)&&(numberMonth2<7||numberMonth2>8))&&((weekend1==1||weekend1==7)||(weekend2==1||weekend2==7))){
							html1+="<span class='my-3'><button type='button' onclick='rsvCheck("+$(m).find("roompeakseasonminfee1").text()*day+","+'"'+$(m).find("roomtitle").text()+'"'+");'>"+day+"박:"+$(m).find("roompeakseasonminfee1").text()*day+"원 예약하기</button></span>";
							html1+="<span class='my-3'><button type='button' onclick='basketCheck("+$(m).find("roompeakseasonminfee1").text()*day+","+'"'+$(m).find("roomtitle").text()+'"'+");'>장바구니 담기</button></span>";
							}else if(((numberMonth1==7||numberMonth1==8)||(numberMonth2==7||numberMonth2==8))&&((weekend1!=1&&weekend1!=7)&&(weekend2!=1&&weekend2!=7))){
							html1+="<span class='my-3'><button type='button' onclick='rsvCheck("+$(m).find("roomoffseasonminfee2").text()*day+","+'"'+$(m).find("roomtitle").text()+'"'+");'>"+day+"박:"+$(m).find("roomoffseasonminfee2").text()*day+"원 예약하기</button></span>";
							html1+="<span class='my-3'><button type='button' onclick='basketCheck("+$(m).find("roomoffseasonminfee2").text()*day+","+'"'+$(m).find("roomtitle").text()+'"'+");'>장바구니 담기</button></span>";
							}else if(((numberMonth1==7||numberMonth1==8)||(numberMonth2==7||numberMonth2==8))&&((weekend1==1||weekend1==7)||(weekend2==1||weekend2==7))){
							html1+="<span class='my-3'><button type='button' onclick='rsvCheck("+$(m).find("roompeakseasonminfee2").text()*day+","+'"'+$(m).find("roomtitle").text()+'"'+");'>"+day+"박:"+$(m).find("roompeakseasonminfee2").text()*day+"원 예약하기</button></span>";	
							html1+="<span class='my-3'><button type='button' onclick='basketCheck("+$(m).find("roompeakseasonminfee2").text()*day+","+'"'+$(m).find("roomtitle").text()+'"'+");'>장바구니 담기</button></span>";
							}
							
							html1+="</div></div>";
							html1+="<h3 class='my-4'></h3>";	
							html1+="<div class='row'>";
							html1+="<div class='col-md-3 col-sm-6 mb-4'>";
							html1+="<a href='#'><img class='img-fluid' src='"+$(m).find("roomimg1").text()+"' alt=''></a>";
							html1+="</div>";
							html1+="<div class='col-md-3 col-sm-6 mb-4'><a href='#'><img class='img-fluid' src='"+$(m).find("roomimg2").text()+"' alt=''></a></div>";
							html1+="<div class='col-md-3 col-sm-6 mb-4'><a href='#'><img class='img-fluid' src='"+$(m).find("roomimg3").text()+"' alt=''></a></div>";
							html1+=" </div>";
						}
						

				});
				$("#contents").html(html1);
				
			},
			error:function(jqxhr,textStatus,errorThrown){
				
			}
		});
		
		
	}
	
	function searchList(e){
		
		console.log(e.key);
		
		var $sel = $(".sel");
		var $li = $("#autoComplete li");
		
		if(e.key == "ArrowDown"){
			if($sel.length == 0){
				$li.eq(0).addClass("sel");
			}	
			else if($sel.is($li.last())){
				
			}
			else{
				$sel.removeClass("sel").next().addClass("sel");
			}
		}
		else if(e.key == "ArrowUp"){
			if($sel.length == 0){
				
			}	
			else if($sel.is($li.first())){
				$sel.removeClass("sel");
			}
			else{
				$sel.removeClass("sel").prev().addClass("sel");
			}
		}
		else if(e.key == "Enter"){
			
			$(e.target).val($sel.text());
			
			$("#autoComplete").hide().children().remove();
			
			
		}
		else{
			var search = $("#search").val().trim();
			console.log(search);
			if(search.length == 0){
				return;
			}else{
				$.ajax({
					url: "<%=request.getContextPath()%>/sns/followSNS.do",
					type: "get",
					data:"search="+search+"&userId=<%=userLoggedIn.getUserId()%>",
					dataType: "json",
					success:function(data){
						
						if(!data.length){							
							$("#autoComplete").hide();
						}
						
						var html = "";
						$.each(data,function(i,m){																			
								html += "<li>"+m+"</li>";															
								$("#autoComplete").html(html)
												  .fadeIn(200);	
						});
						
						$("#autoComplete li").click(e=>{
							
							$("#search").val($(e.target).text());
							//#autoComplete 감춤
							$("#autoComplete").hide().children().remove();
			
						}).hover(e=>{
							$(e.target).addClass("sel").siblings().removeClass("sel");			
						}, e=>{
							$(e.target).removeClass("sel");
						}); 
						
					},
					error:function(){
						
					}
				
				});	
			}
		}

	}
	
	function basketCheck(price,roomTitle){
		var bCheck="";
		
		console.log("가격은?="+price);
		var startDate=$("#sdate").val();
		var endDate=$("#edate").val();
		var friendId=$("#search").val();
		
		//장바구니에 넣음 상품 있는지 없는지 체크
		$.ajax({
			type : "get",
			url : "<%=request.getContextPath()%>/travel/basketCheck?title=<%=title%>&roomTitle="+roomTitle+"&startDate="+startDate+"&endDate="+endDate+"&price="+price+"&userId=<%=userLoggedIn.getUserId()%>&contentId=<%=contentId%>&contentTypeId=<%=contentTypeId%>",			
			dataType : "json",
			async : false,
			success:function(data){
				bCheck=data;
				
			},
			error:function(jqxhr,textStatus,errorThrown){
				
			}
			
		});
		
		if(bCheck!=null){
			alert("이미 장바구니에 있습니다.");
			return;
		}
		
		
		
		$.ajax({
			type : "get",
			url : "<%=request.getContextPath()%>/travel/reservationBasket?title=<%=title%>&roomTitle="+roomTitle+"&startDate="+startDate+"&endDate="+endDate+"&price="+price+"&userId=<%=userLoggedIn.getUserId()%>&contentId=<%=contentId%>&contentTypeId=<%=contentTypeId%>",			
			dataType : "json",
			success:function(data){
				alert('장바구니에 담겼습니다.');
				
			},
			error:function(jqxhr,textStatus,errorThrown){
				
			}
			
		});
	}
	
	function rsvCheck(price,roomTitle){

		var startDate=$("#sdate").val();
		var endDate=$("#edate").val();
		var friendId=$("#search").val();

		//결제하는 순간 장바구니에 같은 상품이있으면 제거하는 코드
		
		$.ajax({
			type : "get",
			url : "<%=request.getContextPath()%>/mypage/reservationAfterBasketDel?contentId=<%=contentId%>&userId=<%=userLoggedIn.getUserId()%>&roomName="+roomTitle+"&startDate="+startDate+"&endDate="+endDate,			
			dataType : "json",
			async : false,
			success:function(data){
	
			},
			error:function(jqxhr,textStatus,errorThrown){
				
			}
			
		});

		location.href="<%=request.getContextPath()%>/travel/reservationInsert?title=<%=title%>&roomTitle="+roomTitle+"&startDate="+startDate+"&endDate="+endDate+"&friendId="+friendId+"&price="+price+"&userId=<%=userLoggedIn.getUserId()%>&contentId=<%=contentId%>&contentTypeId=<%=contentTypeId%>";
		
		<%-- var IMP = window.IMP;
		IMP.init('imp68757717');

		IMP.request_pay({
		    pg : 'inicis',
		    pay_method : 'card',
		    merchant_uid : 'merchant_' + new Date().getTime(),
		    name : '주문명:숙소예약',
		    amount : price,
		    buyer_email : '<%=userLoggedIn.getUserEmail()%>',
		    buyer_name : '<%=userLoggedIn.getUserName()%>',
		    buyer_tel : '<%=userLoggedIn.getUserPhone()%>'
		    /* buyer_addr : '', */
		    /* buyer_postcode : '123-456', */
		    /* m_redirect_url : 'https://www.yourdomain.com/payments/complete' */
		}, function(rsp) {
		    	    
			var startDate=$("#sdate").val();
			var endDate=$("#edate").val();
			var friendId=$("#search").val();
		    
		    location.href="<%=request.getContextPath()%>/travel/reservationInsert?title=<%=title%>&roomTitle="+roomTitle+"&startDate="+startDate+"&endDate="+endDate+"&friendId="+friendId+"&price="+price+"&userId=<%=userLoggedIn.getUserId()%>&contentId=<%=contentId%>&contentTypeId=<%=contentTypeId%>";
		});  --%>
		
	}
</script>
<style>
#header>a{margin-left: 45px;}
.card-img-top{
	width: 349px;
	height: 300px;
}

.wrapper{
	position:relative;
}
#autoComplete{
	display: none;
	background: white;
	min-width: 159px;
	border: 1px solid gray;
	position: absolute;
	top: 495px;
	padding: 0;
	margin: 0;
	right: 498px;
}
#autoComplete li{
	padding: 0 10px;
	list-style: none;
	cursor: pointer;
}
#autoComplete li.sel{
	background: gray;
	color: white;
}
button {

    width:100px;

    background: orange;

    border: none;

    color:#fff;

    padding: 15px 0;

    text-align: center;

    text-decoration: none;

    display: inline-block;

    font-size: 15px;

    margin: 4px;

    cursor: pointer;

}
input[type="text"]{ 
height: auto; /* 높이 초기화 */ 
line-height: normal; /* line-height 초기화 */ 
padding: .8em .5em; /* 여백 설정 */ 
}

</style>
<body>
	
	<header class="masthead" style="height:300px;">
    	<div class="container">
      	<div class="intro-text" style="padding-top:140px; !important">
        	<div class="intro-heading text-uppercase">
       		
        	</div>
     	</div>
    	</div>
  	</header>
  	
  	<div align="center">
  	<!-- html1+="<h5>같이 숙박할 친구 id<input type='search' name='search' id='search' placeholder='친구아이디입력' onkeyup='searchList(event);' /></h5>";
								html1+="<ul id='autoComplete'></ul>"; -->
  	
  	<h2>달력</h2>
  	<form name="searchForm">
  	<input type="text" id="sdate" name="sdate">
  	<input type="text" id="edate" name="edate">
  	<input type="hidden" name="contentId" value="<%=contentId%>"/>
  	<button type="button" id="button" onclick="search();">검색</button>
  	</form>
  	</div>
  	<h5 align="center" id="h5" style="margin-top: 10px;"><input type='search' name='search' id='search' placeholder='친구아이디 입력(선택사항)' onkeyup='searchList(event);' style="display: none;"/></h5>
	<ul id='autoComplete' style="margin-left: 930px; margin-top: -50px;">
		
	</ul>
	<!-- Page Content -->
<div class="container">
	<div id="contents">
  
  

	</div>
</div>

	
</body>
</html>