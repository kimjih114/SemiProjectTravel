<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header-menu.jsp" %>

<%
	


%>

<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
	integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
	crossorigin="anonymous"></script>

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
	margin-top: 630px;
	margin-bottom: 200px;
}
button.login-btn{
width: 254px;

}
body, input, button {
  font-family: 'Source Sans Pro', sans-serif;
}
​
@mixin normalize-input {
  display: block;
  width: auto;
  height: auto;
  border: none;
  outline: none;
  box-shadow: none;
  background: none;
  border-radius: 0px;
}
​
.login {
  padding: 15px;
  width: 400px;
  min-height: 400px;
  margin: 2% auto 0 auto;
​
  .heading {
    text-align: center;
    margin-top: 1%;
​
    h2 {
      font-size: 3em;
      font-weight: 300;
      color: rgba(255, 255, 255, 0.7);
      display: inline-block;
      padding-bottom: 5px;
      text-shadow: 1px 1px 3px $shadow-color;
    }
  }
​
  form {
    .input-group {
      border-bottom: 1px solid rgba(255, 255, 255, 0.1);
      border-top: 1px solid rgba(255, 255, 255, 0.1);
​
      &:last-of-type {
        border-top: none;
      }
​
    }
​
    input.form-control {
      @include normalize-input;
​
      padding: 10px;
      font-size: 1.6em;
      width: 100%;
      background: transparent;
      color: $input-color;
​
      &:focus {
        border: none;
      }
    }
​
    button {
      margin-top: 20px;
      background: $button-background-color;
      border: none;
      font-size: 1.6em;
      font-weight: 300;
      padding: 5px 0;
      width: 100%;
      border-radius: 3px;
      color: lighten($button-background-color, 40%);
      border-bottom: 4px solid darken($button-background-color, 10%);
​
      &:hover {
        background: tint($button-background-color, 4%);
        -webkit-animation: hop 1s;
        animation: hop 1s;
      }
    }
  }
}
​
.float {
  display: inline-block;
  -webkit-transition-duration: 0.3s;
  transition-duration: 0.3s;
  -webkit-transition-property: transform;
  transition-property: transform;
  -webkit-transform: translateZ(0);
  transform: translateZ(0);
  box-shadow: 0 0 1px rgba(0, 0, 0, 0);
}
​
.float:hover, .float:focus, .float:active {
  -webkit-transform: translateY(-3px);
  transform: translateY(-3px);
}
​
/* Large Devices, Wide Screens */
​
@media only screen and (max-width : 1500px) {
}
​
@media only screen and (max-width : 1200px) {
  .login {
    width: 600px;
    font-size: 2em;
  }
}
​
@media only screen and (max-width : 1100px) {
  .login {
    margin-top: 2%;
    width: 600px;
    font-size: 1.7em;
  }
}
​
/* Medium Devices, Desktops */
@media only screen and (max-width : 992px) {
  .login {
    margin-top: 1%;
    width: 550px;
    font-size: 1.7em;
    min-height: 0;
  }
}
​
/* Small Devices, Tablets */
@media only screen and (max-width : 768px) {
  .login {
    margin-top: 0;
    width: 500px;
    font-size: 1.3em;
    min-height: 0;
  }
}
​
/* Extra Small Devices, Phones */ 
@media only screen and (max-width : 480px) {
  .login {
​
    h2 {
      margin-top: 0;
    }
​
    margin-top: 0;
    width: 400px;
    font-size: 1em;
    min-height: 0;
  }
}
​
/* Custom, iPhone Retina */ 
@media only screen and (max-width : 320px) {
  .login {
    margin-top: 0;
    width: 200px;
    font-size: 0.7em;
    min-height: 0;
  }
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



	<!-- 로그인메뉴 -->
<div class="login-container">

	<div class="login">
  <div class="heading">
   
    <form action="<%=request.getContextPath()%>/user/loginEnd" id="loginEndFrm" method="post" onsubmit="return validate();">

      <div class="input-group input-group-lg">
        <input type="text" id="userId" class="form-control" placeholder="Username or email">
          </div>
        <div class="input-group input-group-lg">
          <span class="input-group-addon"><i class="fa fa-lock"></i></span>
          <input type="password" id="userPassword" class="form-control" placeholder="Password">
        </div>
		<br />
        <button type="submit" class="login-btn">Login</button> &nbsp;&nbsp;
       	<br />
       	<a id="kakao-login-btn"></a>
       </form>
 		</div>
 </div>
<%
	if(userLoggedIn !=null){
%>
		<table id="logged-in">
			<tr>
				<td>님, 안녕하세요.</td>
			</tr>
			<tr>
				<td><input type="button" value="내정보 보기" /> <input
					type="button" value="로그아웃" /></td>
			</tr>
		</table>

<%
}
%>
		<div id="kakao-container"></div>
		<!-- 카카오 컨테이너끝 -->
		
	<!-- 컨테이너끝 -->
	<script type='text/javascript'>
		//<![CDATA[
		// 사용할 앱의 JavaScript 키를 설정해 주세요.
		Kakao.init('d7fe85f339fe9ccf1ac953ce2da69adf'); //카카오 로그인 키   //javascript'
		//로그인버튼
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
								console.log(res.properties['thumbnail_image']); //크기 작게  110*110  
								console.log(res.properties['nickname']);//<---- 콘솔 로그에 닉네임 출력(properties에 있는 nickname 접근 
								// res.properties.nickname으로도 접근 가능 )
								//console.log(res.created);
								//console.log(res.status);
								console.log(authObj.access_token);//<---- 콘솔 로그에 토큰값 출력

								document.write("<img src="+res.properties['thumbnail_image']+">");

								document.write(res.properties.nickname+ "님 환영합니다.");
								
								document.write("<input type='button' onclick='logoutWithKakao();'  value='로그아웃' />");

								
								
							}
						})

			},
			fail : function(err) {
				alert(JSON.stringify(err));
			}
		});
		
		
		<%-- Kakao.Auth.logout(
		function(authObj) {
		if(authObj==true){}else{}
		 location.href="<%=request.getContextPath()%>";
		 }
		); --%>
		
		
		
		
	
		function logoutWithKakao(){
		
		<%--  Kakao.Auth.logout(
		function(authObj) {
		if(authObj==true){}else{}
		 location.href="<%=request.getContextPath()%>";
		 } --%>
		
			Kakao.Auth.logout();
			alert("카카오 로그아웃 완료");
			 //setCookie("kakao_login","",-1);
	
		
			window.location.href="<%=request.getContextPath()%>";
		}
		

//]]>
</script>

</div>

</body>
</html>