<%@page import="user.model.vo.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%
	User userLoggedIn = (User)session.getAttribute("userLoggedIn");
	System.out.println("userLoggedIn@userLogin.jsp=" + userLoggedIn);
%>

<style>
#rightNav {
    text-align: center;
    top: 10px;
    left: 769px;
    display: -webkit-box;
    display: -ms-flexbox;
    /*display: fixed;*/
    -webkit-box-direction: normal;
    -ms-flex-direction: column;
    flex-direction: column;
    width: 230px;
    /*height: 100vh;*/
	border: 1px solid;
 	position: absolute;
    
}

#tab-container {
	width:540px;
	margin:0 auto;
	text-align:center;
	position: absolute;
	left:220px;
	transition: 0.5s;
	top:50px;
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
	padding: 6px 5px;
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
	background: white;
	color: black;
	border: 1px solid;
	border-top: 0px;
	border-collapse: collapse;
	
}

#post{
	position: absolute;
	top:10px;
	left: 705px;
	border: 1px solid;
	padding: 0px 10px;
}

#post{
	cursor: pointer;
}
#postFrm{
	width:540px;
	margin:0 auto;
	text-align:center;
	position: absolute;
	left:220px;
	top: 40px;
	display:none;
	border : 1px solid;
	border-collapse: collapse;
	padding: 10px;
	z-index: 99;
	background: white;
}

#postFrm tr{
	/* border : 1px solid;
	border-collapse: collapse; */
}

#postFrm td{
	padding: 10px;
	width: 520px;
	text-align:left;
	/* border:1px solid;
	border-collpase: collapse; */
}
#postFrm td.review-img{
	padding-top: 0px;
	width: 50px;
	height: 50px;
}


.imgs_wrap{
	display:none;
	text-align: center;
    vertical-align: middle;
    table-layout: fixed;
    width:100%;
}

.imgs_wrap img{
	width: 95px;
	height: 95px;
	margin: 0 2px;
}

.imgs{
	display: table-cell;
	max-width: 100px;
	font-size:0.8em;
}

</style>
    <!-- post폼 -->
<div id="post">post</div>
	<form action="" name="snsUpload"
					id="snsUpload"
					method="post"
					enctype="multipart/form-data">
	<table id="postFrm">
		<tr>
			<td style="font-weight: 700;">소중한 여행후기를 공유해주세요!</td>
		</tr>
		<tr>
			<td style="padding-bottom: 0px;">
				<div class="travelsrch"></div>
			</td>
		</tr>
		<tr>
			<td>
				<label for="reviewContent" style="font-weight: 700;">어떤 여행을 하셨나요?</label>
				<textarea name="reviewContent" id="reviewContent" cols="59" rows="5" required></textarea>
				<div id="contentIdList">
				</div>
			</td>
		</tr>
		<tr>
			<td style="margin-bottom:3px;">
					<label for="" style="font-weight: 700;">첨부이미지</label>
					<span style="font-size:0.5em; color:gray;">최대 5개까지 등록 가능합니다.</span><br>
					<input name="fileupload" id="fileupload" type="file" accept="image/*" style="margin-bottom:10px;" multiple />
					<div style="display:table;">
						<div class="imgs_wrap"></div>
					</div>	
			</td>
		</tr>
		<tr>
			<td>
					<input type="radio" name="boardtype" id="public" value="P" checked />
					<label for="public">전체공개</label> &nbsp;
					<input type="radio" name="boardtype" id="followOnly" value="F" />
					<label for="followOnly">팔로워공개</label> &nbsp;
					<input type="radio" name="boardtype" id="locked" value="L" />
					<label for="locked">비공개</label>
				<br>
				<input type="submit" id="btnSubmit" value="포스트 등록" style="float:right; margin-top : 10px;">
			</td>
		</tr>
	</table>
</form>

<!-- 게시글 -->
  
		  <div id="tab-container">
			<ul class="tab">
				<li class="current" data-tab="tab1"><a>타임라인</a></li>
				<li data-tab="tab2"><a>추천</a></li>
				<li data-tab="tab3"><a>스크랩</a></li>
			</ul>
		
			<div id="tab1" class="tabcontent current">
				<div class="timeline-sns">
					<table class="timeline-board-sns">
						<tr>
							<td class="timeline-boardcontent-sns"><img src="<%=request.getContextPath() %>/img/profile.jpg" class="header-profile-circle"  width="30" height="30" />
							    <span style="font-weight:600">@닉네임 </span><span style="font-size:0.8em; color:gray;">2019/08/11</span>
							  	<span style="float:right;">메뉴</span>
						</tr>
						<tr>
							<td class="timeline-boardcontent-sns" id="boardcontent_img">
								<div id="carouselExampleControls" class="carousel slide" data-ride="carousel">
								  <div class="carousel-inner">
								    <div class="carousel-item active">
								      <img src="<%=request.getContextPath() %>/img/이동욱.jpg" class="d-block w-100" alt="...">
								    </div>
								    <div class="carousel-item">
								      <img src="<%=request.getContextPath() %>/img/profile.jpg" class="d-block w-100" alt="...">
								    </div>
								    <div class="carousel-item">
								      <img src="<%=request.getContextPath() %>/img/이동욱.jpg" class="d-block w-100" alt="...">
								    </div>
								    <div class="carousel-item">
								      <img src="<%=request.getContextPath() %>/img/profile.jpg" class="d-block w-100" alt="...">
								    </div>
								    <div class="carousel-item">
								      <img src="<%=request.getContextPath() %>/img/이동욱.jpg" class="d-block w-100" alt="...">
								    </div>
								  </div>
								  <a class="carousel-control-prev" href="#carouselExampleControls" role="button" data-slide="prev">
								    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
								    <span class="sr-only">Previous</span>
								  </a>
								  <a class="carousel-control-next" href="#carouselExampleControls" role="button" data-slide="next">
								    <span class="carousel-control-next-icon" aria-hidden="true"></span>
								    <span class="sr-only">Next</span>
								  </a>
								</div>
							</td>
						</tr>
						<tr>
							<td>
								<table style="border: 1px solid;">
									<tr>
										<td style="width: 175.67px; height: 175.67px; border:1px solid;">관련여행지 1</td>
										<td style="width: 175.67px; height: 175.67px; border:1px solid;">관련여행지 2</td>
										<td style="width: 175.67px; height: 175.67px; border:1px solid;">관련여행지 3</td>
									</tr>
								</table>
							</td>
						</tr>
						<tr>
							<td class="timeline-boardcontent-sns">Lorem ipsum dolor sit amet, consectetur adipisicing elit. A tempore labore atque tenetur dolore recusandae nemo sunt commodi aliquid aut voluptatum hic nostrum velit aperiam consectetur temporibus eius harum cumque?</td>
						</tr>
						<tr>
							<td class="timeline-boardcontent-sns"><span style="float:right;">좋아요(12)&nbsp;&nbsp;스크랩(2)</span></td>
						</tr>
						<tr>
							<td class="timeline-boardcontent-sns">댓글(3)</td>
						</tr>
						<tr>
							<td class="timeline-boardcontent-sns"><span class="nick_sns">@abcde</span>&nbsp;Lorem ipsum dolor sit amet, consectetur adipisicing elit. Doloribus necessitatibus sequi dignissimos obcaecati non harum laudantium sed delectus at alias ducimus porro odio aut dolores vel totam aperiam ex eaque. <span style="float:right;">&nbsp;&nbsp;좋아요&nbsp;&nbsp;팔로잉&nbsp;&nbsp;블랙리스트</span></td>		
						</tr>
						<tr>
							<td class="timeline-boardcontent-sns"><span class="nick_sns">@qwerty</span>&nbsp;Lorem ipsum dolor sit amet, consectetur adipisicing elit. Eum enim reprehenderit delectus itaque distinctio maxime optio nobis impedit magnam repellendus incidunt quaerat ex architecto nemo quod dolore officia amet accusantium.</td>
						</tr>
						<tr>
							<td class="timeline-boardcontent-sns"><span class="nick_sns">@seulgi</span>&nbsp;Lorem ipsum dolor sit amet, consectetur adipisicing elit. Vitae magni minus a quos non veritatis ut omnis praesentium hic repellat suscipit libero voluptatem iste totam impedit id necessitatibus et tenetur.</td>
						</tr>
					</table>
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
		
		<table id="rightNav">
			<tr>
				<td><input type="search" id="searchSNS" placeholder="검색" onfocus='popupSearchFrm' /></td>
			</tr>
			<tr>
				<td>
					<span>추천팔로워</span>
				</td>
			</tr>
			<tr>
				<td>
					<span>추천리뷰</span>
				</td>
			</tr>
			
	    </table>
		
		
<script>
document.addEventListener('keydown', function(event) {
    if (event.keyCode === 13) {
        event.preventDefault();
    }
}, true);

$(()=>{
	location.href="#"
})

var filesTempArr = [];

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

 	contentids = [];
	
	if($("#postFrm").css('display')=='block'){
		$("#postFrm").css('display', 'none');
		$("#tab-container").css("opacity", "1");
		return;
	}
	
	
	$("#postFrm").css('display', 'block');
	$("#tab-container").css("opacity", "0.5");
	$.ajax({
		url: "<%=request.getContextPath() %>/ajax/travelsrch.jsp", 
		type: "get",
		dataType: "html",
		success: function(data){
			$(".travelsrch").html(data);
		},
		error: function(jqxhr, textStatus, errorThrown){
			console.log("ajax처리실패!");
			console.log(jqxhr, textStatus, errorThrown);
		}
	});
	
})

var sel_files=[];

$(document).ready(function(){
	if($(".imgs").length==0){
		$(".imgs_wrap").css("display", "none");
	}
	$("#fileupload").on("change", handleImgsFilesSelect);
});

function handleImgsFilesSelect(e){

	
	if($(".imgs").length>0){
		$(".imgs").each(function(){
			$(this).remove();
		})
	};
		$(".imgs_wrap").css("display", "block");
	
	var files = e.target.files;
	var filesArr = Array.prototype.slice.call(files);
	var filesArrLen = filesArr.length;
	var filesTempArrLen = filesTempArr.length;
	
	if(filesArrLen>5){	
		$("#fileupload").val("");
		alert("첨부파일은 5개까지만 가능합니다.");
		return;
	}

	for(var i=0; i<filesArrLen; i++){
		filesTempArr.push(filesArr[i]);
	}
	
	filesArr.forEach(function(f){
		if(!f.type.match("image.*")){
			$("#fileupload").val("");
			alert(f.name+"은(는) 이미지가 아닙니다.");
			return;
		}
	
		sel_files.push(f);
		
		var reader = new FileReader();
		reader.onload = function(e){
			var html = "<div class='imgs'><img src=\""+e.target.result+"\" />";
			html += "<div><span>"+f.name+"</span><br>";
			html += "<span>("+(f.size)/1000+"kb)</span><div></div>";
			$(".imgs_wrap").append(html);
			
		}
		reader.readAsDataURL(f);
	});
}

$("#btnSubmit").click(function(event){
	 var formData = new FormData();
	
	event.preventDefault();
	
	var grades = [];
	
	if($(".contentid").length>0){
		$(".contentid").each(function(i, elem){
			var grade = $(this).parent().parent().parent().children('.starRev').children('.starR.on').length;
		   	grades.push(grade);
		});
	}
	 	
	console.log(contentids);
	console.log(grades);
	console.log(contenttypes);
	
	
	
	 formData.append("boardWriter",'<%=userLoggedIn.getUserId() %>');
	 formData.append("boardContent", $("#reviewContent").val());
	 formData.append("boardType", $('input[name="boardtype"]:checked').val());
	 formData.append("contentId1",contentids[0]);
	 formData.append("contentId2",contentids[1]);
	 formData.append("contentId3",contentids[2]);
	 formData.append("contentType1", contenttypes[0]);
	 formData.append("contentType2", contenttypes[1]);
	 formData.append("contentType3", contenttypes[2]);
	 formData.append("grade1",grades[0]);
	 formData.append("grade2",grades[1]);
	 formData.append("grade3",grades[2]);
	 	
		
	// 파일 데이터
	 for(var i=0, filesTempArrLen = filesTempArr.length; i<filesTempArrLen; i++) {
	    formData.append("file"+(i+1), filesTempArr[i]);
	    formData.append("filename"+(i+1), filesTempArr[i].name);
	 }

	  
	$.ajax({
	     type : "POST",
	     url : "<%=request.getContextPath()%>/gson/sns/insertBoard.do",
	     data : formData,
	     enctype:"multipart/form-data",
	     processData: false,
	     contentType: false,
	     success : function(data) {
	         alert("게시글 등록 성공 :D!");
	         
	     },
	     error : function(err) {
	         alert(err.status);
	     },
	     complete: function(){
	     	contentids = [];
			grades=[];
			filesTempArr=[];
			contenttypes=[];
			$("#postFrm").css('display', 'none');
			$("#tab-container").css("opacity", "1");
			$("#fileupload").val("");
			$("#reviewContent").val('');
			$(".imgs").remove();
			
	     }
	 });




	 	
	})


	
	
 	
 	






</script>