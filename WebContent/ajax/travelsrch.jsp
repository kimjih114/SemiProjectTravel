<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

 <script type="text/javascript">

	$(".card-img-top").hover(function(){
		$(".caption").css("display", "block");
	}, function(){
		$(".caption").css("display", "block");
	})

 
 	var sido1;
 	var gugun1;
 
 	$("#search").on("click", function(){
 		sido1 = $("#sido1").val();
 		gugun1 = $("#gugun1").val();
 	});
 	
  $('document').ready(function() {
	   var area0 = ["시/도 선택","서울특별시","인천광역시","대전광역시","대구광역시","광주광역시","부산광역시","울산광역시","세종특별자치시","경기도","강원도","충청북도","충청남도","경상북도","경상남도","전라북도","전라남도","제주도"];
	   var area1 = ["강남구","강동구","강북구","강서구","관악구","광진구","구로구","금천구","노원구","도봉구","동대문구","동작구","마포구","서대문구","서초구","성동구","성북구","송파구","양천구","영등포구","용산구","은평구","종로구","중구","중랑구"];
	   var area2 = ["강화군","계양구","미추홀구","남동구","동구","부평구","서구","연수구","옹진군","중구"];
	   var area3 = ["대덕구","동구","서구","유성구","중구"];
	   var area4 = ["남구","달서구","달성군","동구","북구","서구","수성구","중구"];
	   var area5 = ["광산구","남구","동구","북구","서구"];
	   var area6 = ["강서구","금정구","기장군","남구","동구","동래구","부산진구","북구","사상구","사하구","서구","수영구","연제구","영도구","중구","해운대구"];
	   var area7 = ["중구","남구","동구","북구","울주군"];
	   var area8 = ["세종특별자치시"];
	   var area9 = ["가평군","고양시","과천시","광명시","광주시","구리시","군포시","김포시","남양주시","동두천시","부천시","성남시","수원시","시흥시","안산시","안성시","안양시","양주시","양평군","여주시","연천군","오산시","용인시","의왕시","의정부시","이천시","파주시","평택시","포천시","하남시","화성시"];
	   var area10 = ["강릉시","고성군","동해시","삼척시","속초시","양구군","양양군","영월군","원주시","인제군","정선군","철원군","춘천시","태백시","평창군","홍천군","화천군","횡성군"];
	   var area11 = ["괴산군","단양군","보은군","영동군","옥천군","음성군","제천시","진천군","청원군","청주시","충주시","증평군"];
	   var area12 = ["공주시","금산군","논산시","당진시","보령시","부여군","서산시","서천군","아산시","예산군","천안시","청양군","태안군","홍성군","계룡시"];
	   var area13 = ["경산시","경주시","고령군","구미시","군위군","김천시","문경시","봉화군","상주시","성주군","안동시","영덕군","영양군","영주시","영천시","예천군","울릉군","울진군","의성군","청도군","청송군","칠곡군","포항시"];
	   var area14 = ["거제시","거창군","고성군","김해시","남해군","마산시","밀양시","사천시","산청군","양산시","의령군","진주시","진해시","창녕군","창원시","통영시","하동군","함안군","함양군","합천군"];
	   var area15 = ["고창군","군산시","김제시","남원시","무주군","부안군","순창군","완주군","익산시","임실군","장수군","전주시","정읍시","진안군"];
	   var area16 = ["강진군","고흥군","곡성군","광양시","구례군","나주시","담양군","목포시","무안군","보성군","순천시","신안군","여수시","영광군","영암군","완도군","장성군","장흥군","진도군","함평군","해남군","화순군"];
	   var area17 = ["남제주군","북제주군","서귀포시","제주시"];


 $("select[name^=sido]").each(function() {
	  $selsido = $(this);
	  $.each(eval(area0), function(idx) {
	   	$selsido.append("<option value='"+idx+"'>"+this+"</option>");
	  });
	  $selsido.next().append("<option value=''>구/군 선택</option>");
 });


 $("select[name^=sido]").change(function() {
  var area = "area"+$("option",$(this)).index($("option:selected",$(this)));
  var $gugun = $(this).next(); // 선택영역 군구 객체
  $("option",$gugun).remove(); // 구군 초기화

  if(area == "area0")
   $gugun.append("<option value=''>구/군 선택</option>");
  else {
   $.each(eval(area), function(idx) {
    $gugun.append("<option value='"+(idx+1)+"'>"+this+"</option>");
   });
  }
 });


});
   var hiddenCount=0;

   function conMore(){
   	for(var i=0;i<=hiddenCount;i++){
   		$("#hiddenContents"+i).removeAttr("style");
   		$("#contentsMore").html("");
   	}
   	
   }

   function searchList(e){
   	
   	console.log(e.key);
   	console.log($("#search").val().trim());
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
   		
   		$.ajax({
   			url: "http://api.visitkorea.or.kr/openapi/service/rest/KorService/areaBasedList?ServiceKey=jFP9G99tDC%2BCNqVlP6%2BQ8z8JdQdPDnxnLWoa4KGZY5KExkD6cfWlqm92uXoCPscjDDIyEOmCZ1MKbflo3ooJRg%3D%3D&contentTypeId=&areaCode="+sido1+"&sigunguCode="+gugun1+"&cat1=&cat2=&cat3=&listYN=Y&MobileOS=ETC&MobileApp=TourAPI3.0_Guide&arrange=A&numOfRows=300&pageNo=1",
   			type: "get",
   			dataType: "xml",
   			success:function(data){			
   				var $root=$(data).find(":root");				
   				var $items=$root.find("item");
   				var html = "";
   				
   				if($(".h-100").length>=3){
						alert("여행지는 3개까지 등록 가능합니다.");
						return;
					}
   				
   				$items.each(function(i,m){
   					if($(m).find("title").text()==$(e.target).text()){
						
						html+="<div class='card h-100'>";
								html+="<a href='#' class='goInfo'><img class='card-img-top' src='"+$(m).find("firstimage").text()+"'></a>";
									html+="<div class='caption'>"
										html+="<a href='#'>"+$(m).find("title").text()+"</a>";
									html+="</h4>";
									html+="<p class='card-text'>"+$(m).find("addr1").text()+"</p>";
  									html+="</div>"
								html+="</div>";
								
				}	

			});
			$("#contents").append(html);
   				
   			},
   			error:function(jqxhr,textStatus,errorThrown){
   				
   			}
   		});
   		
   	}
   	else{
   		var search = $("#search").val().trim();
   		
   		if(search.length == 0){
   			return;
   		}else{
   			$.ajax({
   				url: "http://api.visitkorea.or.kr/openapi/service/rest/KorService/areaBasedList?ServiceKey=jFP9G99tDC%2BCNqVlP6%2BQ8z8JdQdPDnxnLWoa4KGZY5KExkD6cfWlqm92uXoCPscjDDIyEOmCZ1MKbflo3ooJRg%3D%3D&contentTypeId=&areaCode="+sido1+"&sigunguCode="+gugun1+"&cat1=&cat2=&cat3=&listYN=Y&MobileOS=ETC&MobileApp=TourAPI3.0_Guide&arrange=A&numOfRows=300&pageNo=1",
   				type: "get",
   				dataType: "xml",
   				success:function(data){
   					
   					var $root=$(data).find(":root");				
   					var $items=$root.find("item");
   					var html = "";
   					$items.each(function(i,m){
   						
   						if($(m).find("title").text().indexOf(search)==-1){						
   								$("#autoComplete").hide();							
   						}else{							
   								html += "<li>"+$(m).find("title").text()+"</li>";
   														
   							$("#autoComplete").html(html)
   											  .fadeIn(200);
   						}
   						
   					});
   					
   					$("#autoComplete li").click(e=>{						
   						$("#search").val($(e.target).text());
   						//#autoComplete 감춤
   						$("#autoComplete").hide().children().remove();
   						
   						$.ajax({
   							url: "http://api.visitkorea.or.kr/openapi/service/rest/KorService/areaBasedList?ServiceKey=jFP9G99tDC%2BCNqVlP6%2BQ8z8JdQdPDnxnLWoa4KGZY5KExkD6cfWlqm92uXoCPscjDDIyEOmCZ1MKbflo3ooJRg%3D%3D&contentTypeId=&areaCode="+sido1+"&sigunguCode="+gugun1+"&cat1=&cat2=&cat3=&listYN=Y&MobileOS=ETC&MobileApp=TourAPI3.0_Guide&arrange=A&numOfRows=300&pageNo=1",
   							type: "get",
   							dataType: "xml",
   							success:function(data){			
   								var $root=$(data).find(":root");				
   								var $items=$root.find("item");
   								var html = "";
   								
   								if($(".h-100").length>=3){
   									alert("여행지는 3개까지 등록 가능합니다.");
   									return;
   								}
   								$items.each(function(i,m){
   									if($(m).find("title").text()==$(e.target).text()){
    										html+="<div class='card h-100'>";
   												html+="<a href='#' class='goInfo'><img class='card-img-top' src='"+$(m).find("firstimage").text()+"'></a>";
	   												html+="<div class='caption'>"
	   													html+="<a href='#'>"+$(m).find("title").text()+"</a>";
														html+="</h4>";
														html+="<p class='card-text'>"+$(m).find("addr1").text()+"</p>";
	   				   									html+="</div>"
   													html+="</div>";
   											
   									}	
   					
   								});
   								$("#contents").append(html);
   								$("#contentsMore").html("");
   							},
   							error:function(jqxhr,textStatus,errorThrown){
   								
   							}
   						});
   						
   						
   						
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
   
   
</script>

	<div align="left">
		<label for="" style="font-weight: 700;">여행지</label>
		<select name="sido1" id="sido1"></select>
		<select name="gugun1" id="gugun1"></select>
		<input type="search" name="search" id="search" placeholder="검색어입력" onkeyup="searchList(event);" size="24" style="font-size: 0.8em;" /> 
		<ul id="autoComplete" style="z-index:99;">
					
		</ul>
	</div>

		<div class="row" id="contents" style="margin: 0 auto;">
			<!-- ajax 내용 들어가는곳 -->									
		</div>

<style>
#header>a{margin-left: 45px;}


.wrapper{
	position:relative;
}
#autoComplete{
	display: none;
	background: white;
	min-width: 159px;
	border: 1px solid gray;
	position: absolute;
	top: 110px;
	right: 50px;
	padding: 0;
	margin: 0;
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

#search{
	margin-bottom: 5px;
}

#contents .card-img-top, .goInfo{
width: 165px; height:  165px;
position: relative;
}
.card-img-top{
	border: 1px black solid;
	width: 165px;
	height: 165px;
}

.h-100{
width: 165px;
}

div.caption{
	display:block;
	width: 165px; height: 165px;
	position: absolute;
    top:0px;
    padding: 0px;
    opacity: 0; 
    background: rgb(0, 0, 0, 0.5);
    cursor: pointer;   
}

.h-100:hover .caption{
	opacity: 1;
}
p.card-text{
	color: white;
}
.row{
	display: table;
}
.row div{
    display: table-cell;
    vertical-align: middle;
}


</style>


