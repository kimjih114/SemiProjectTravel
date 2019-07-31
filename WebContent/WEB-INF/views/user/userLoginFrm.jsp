<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header-menu.jsp" %>

<%
	//User userLoggedIn = (User)session.getAttribute("memberLoggedIn"); 
		
	//System.out.println("memberLoggedIn@index.jsp="+memberLoggedIn);



%>



<style>
/*전체컨테이너 */
div#container {
	background: background-color:#F0F0F0;
	width: 960px;
	margin: 0 auto;
}

.login-container {
	position: absolute;
	padding-left: 268px;
	top: 10px;
	margin-top: 540px;
}

form#loginFrm {
	margin-top: 150px;
	text-align: center;
}

td#saveIdFrm {
	padding-right: 0px;
	padding-left: 241px;
}
</style>
<!-- Header -->
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
 <header class="masthead">
	<div class="container">
		<div class="intro-text">
			<div class="intro-heading text-uppercase"
				style='padding-bottom: 30px;'>지금 다양한 국내 여행지를 검색하세요.</div>
			<form class="IndexsearchFrm" method="get">
				<input type="text" id="IndexsearchFrm" placeholder="#서촌 #맛집"
					size='50px;' /> <input type="button" value="검색" /> <br> <span
					class="intro-lead-in">7월의 추천검색어 : <a href='#'
					style='color: orangered'>#해운대</a> <a href='#'
					style='color: orangered'>#강릉</a> <a href='#'
					style='color: orangered'>#정선</a></span>
			</form>
			<!-- <a class="btn btn-primary btn-xl text-uppercase js-scroll-trigger" href="#services"> -->
		</div>
	</div>
</header> 

<div id="container">

	<!-- 로그인메뉴 -->
	<div class="login-container">

		<form action="<%=request.getContextPath()%>" id="loginFrm"
			method="post" onsubmit="return validate();">
			<table>
				<tr>

					<td><label for="userId">아이디</label> <input type="text"
						name="userId" id="userId" placeholder="아이디" tabindex="1" /></td>
					<td><input type="submit" value="로그인" tabindex="3" /></td>

				</tr>


				<tr>
					<td><label for="password">비밀번호</label> <input type="password"
						name="password" id="password" placeholder="비밀번호" tabindex="2" /></td>
					<td><a id="kakao-login-btn"></a>
					</td>
				</tr>
				<tr>
					<td colspan="2" id='saveIdFrm'><input type="checkbox"
						name="saveId" id="saveId" /> <label for="saveId">아이디저장</label> <input
						type="button" value="회원가입" onclick="goEnroll();" /></td>
				</tr>
			</table>
		</form>

		<table id="logged-in">
			<tr>
				<td>님, 안녕하세요.</td>
			</tr>
			<tr>
				<td><input type="button" value="내정보 보기" /> <input
					type="button" value="로그아웃" /></td>
			</tr>
		</table>


		<div id="kakao-container"></div>
		<!-- 카카오 컨테이너끝 -->
	</div>

	<!-- 컨테이너끝 -->
	<script type='text/javascript'>
		//<![CDATA[
		// 사용할 앱의 JavaScript 키를 설정해 주세요.
		Kakao.init('d7fe85f339fe9ccf1ac953ce2da69adf'); //카카오 로그인 키   //javascript'
		// 카카오 로그인 버튼을 생성합니다.
		Kakao.Auth
				.createLoginButton({
					container : '#kakao-login-btn',
					success : function(authObj) {
						Kakao.API
								.request({

									url : '/v1/user/me',
									success : function(res) {

										//alert(JSON.stringify(res)); //<---- kakao.api.request 에서 불러온 결과값 json형태로 출력
										//alert(JSON.stringify(authObj)); //<----Kakao.Auth.createLoginButton에서 불러온 결과값 json형태로 출력

										console.log(res.id);//<---- 콘솔 로그에 id 정보 출력(id는 res안에 있기 때문에  res.id 로 불러온다)
										console.log(res.kaccount_email);//<---- 콘솔 로그에 email 정보 출력 
										console
												.log(res.properties['thumbnail_image']); //크기 작게  110*110  
										console.log(res.properties['nickname']);//<---- 콘솔 로그에 닉네임 출력(properties에 있는 nickname 접근 
										// res.properties.nickname으로도 접근 가능 )
										//console.log(res.created);
										//console.log(res.status);
										console.log(authObj.access_token);//<---- 콘솔 로그에 토큰값 출력

										document
												.write("<img src="+res.properties['thumbnail_image']+">");

										document.write(res.properties.nickname
												+ "님 환영합니다.");
										
										document.write("<button onclick='kakaologout'>"+로그아웃+"</button>")
	
										
										function kakaologout(){
											Kakao.Auth.getAccessToken();
										}
										
									}
								})

					},
					fail : function(err) {
						alert(JSON.stringify(err));
					}
				});

		//]]>
	</script>
</div>

<div></div>


</body>
</html>