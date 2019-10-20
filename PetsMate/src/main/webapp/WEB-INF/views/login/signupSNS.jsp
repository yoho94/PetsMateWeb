<%@page import="com.petsmate.dto.GuestVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<title>Pets&Mate - 회원가입</title>
<link rel="stylesheet" href="/resources/css/bootstrap.css">
<link rel="stylesheet" href="/resources/css/all.css">
<script type="text/javascript" src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.0.js" charset="utf-8"></script>
<nav class="navbar navbar-expand-lg navbar-dark fixed-top"
	style="background-color: #fe6f61;">
	<a class="navbar-brand" href="/"><img src="/resources/img/home.png"
		width="30" heigth="30" alt=""></a>

	<button class="navbar-toggler" type="button" data-toggle="collapse"
		data-target="#navbarNav" aria-controls="navbarNav"
		aria-expanded="false" aria-label="Toggle navigation">
		<span class="navbar-toggler-icon"></span>
	</button>

	<div class="collapse navbar-collapse" id="navbarNav">
		<ul class="navbar-nav mr-auto">
			<li class="nav-item"><a class="nav-link" href="/">홈 </a></li>
			<li class="nav-item"><a class="nav-link" href="/intro">Pets&Mate
					소개</a></li>
			<li class="nav-item"><a class="nav-link" href="/price">요금예약안내</a></li>
			<li class="nav-item"><a class="nav-link" href="/call">펫택시예약</a></li>
			<li class="nav-item"><a class="nav-link" href="/iot">IoT</a></li>
			<li class="nav-item"><a class="nav-link" href="/qna">Q&A</a></li>
			<li class="nav-item"><a class="nav-link" href="/board">게시판</a></li>
			<li class="nav-item"><a class="nav-link" href="/msg">대화하기</a></li>
		</ul>
		<ul class="navbar-nav navbar-right">
			<c:if test="${guest != null}">
				<li class="nav-item"><a class="nav-link" href="/mypage">마이페이지</a></li>
			</c:if>
			<c:if test="${guest == null}">
				<li class="nav-item"><a class="nav-link" href="/login">로그인</a></li>
			</c:if>
			<c:if test="${guest != null}">
				<li class="nav-item"><a class="nav-link" href="/logout">로그아웃</a></li>
			</c:if>
		</ul>
	</div>

</nav>
</head>
<body>
	<div class="container" style="padding: 100px 15px 0;">
		<div class="card bg-light mx-auto col-sm-7">
			<article class="card-body mx-auto" style="max-width: 450px;">
				<h4 class="card-title mt-3 text-center">회원가입</h4>
				<hr>
				<form method="post" action="/login/signup/action">
					<div class="form-group input-group">
						<div class="input-group-prepend">
							<span class="input-group-text"> <i class="fa fa-envelope"></i>
							</span>
						</div>
						<input name="id" class="form-control" placeholder="아이디" id='id'
							type="text">
					</div>
					<div class="form-group input-group">
						<div class="input-group-prepend">
							<span class="input-group-text"> <i class="fa fa-lock"></i>
							</span>
						</div>
						<input name="password1" class="form-control" placeholder="비밀번호" id='password1'
							type="password">
					</div>
					<!-- form-group// -->
					<div class="form-group input-group">
						<div class="input-group-prepend">
							<span class="input-group-text"> <i class="fa fa-lock"></i>
							</span>
						</div>
						<input name="password2" class="form-control" placeholder="비밀번호 확인" id='password2'
							type="password">
					</div>
					<!-- form-group// -->
					<div class="form-group input-group">
						<div class="input-group-prepend">
							<span class="input-group-text"> <i class="fa fa-user"></i>
							</span>
						</div>
						<input name="name" class="form-control" placeholder="이름" id='name'
							type="text">
					</div>
					<!-- form-group// -->
					<div class="form-group input-group">
						<div class="input-group-prepend">
							<span class="input-group-text"> <i class="fa fa-phone"></i>
							</span>
						</div>
						<input name="phone" class="form-control" placeholder="핸드폰 번호(-없이 입력)"
							type="text">
					</div>
					<!-- form-group// -->
					<!-- form-group// -->
					<div class="form-group">
						<button type="submit" class="btn btn-primary btn-block">
							등록</button>
					</div>
					<input name="isNaver" type="hidden" value='false' id='isNaver' />
				</form>
			</article>
		</div>
		<!-- card.// -->
	</div>
	<!--container end.//-->

	<footer class="footer fixed-bottom mt-auto py-3"
		style="background-color: #f5f5f5;">
		<div class="container" style="text-align: center;">
			<span class="text-muted">고객센터 053-0000-0000</span>
		</div>
	</footer>

	<script defer src="/resources/js/all.js"></script>
	<script src="/resources/js/jquery-3.4.1.js"></script>
	<script src="/resources/js/bootstrap.js"></script>
	
	<br>
	<br>
	<br>
</body>
<script type="text/javascript">

var naverLogin = new naver.LoginWithNaverId(
	{
		clientId: "7nlmp3_oTZszqdkLgv2u",
		callbackUrl: window.location.protocol + "//" + window.location.host + "/" + "login/naverLogin",
// 		callbackUrl: "http://localhost:8080/login/naverLogin",
		isPopup: false,
		callbackHandle: false
	}
);
/* (4) 네아로 로그인 정보를 초기화하기 위하여 init을 호출 */
naverLogin.init();

/* (5) 현재 로그인 상태를 확인 */
window.addEventListener('load', function () {
	naverLogin.getLoginStatus(function (status) {
		console.log("url = " + window.location.protocol + "//" + window.location.host + "/" + "login/naverLogin");
		console.log("status = " + status);
		if (status) {
			/* (6) 로그인 상태가 "true" 인 경우 로그인 버튼을 없애고 사용자 정보를 출력합니다. */
			setLoginStatus();
		}
	});
});

/* (6) 로그인 상태가 "true" 인 경우 로그인 버튼을 없애고 사용자 정보를 출력합니다. */
function setLoginStatus() {
	var email = naverLogin.user.getEmail();
	var name = naverLogin.user.getNickName();
	var profileImage = naverLogin.user.getProfileImage();
	var birthday = naverLogin.user.getBirthday();			var uniqId = naverLogin.user.getId();
	var age = naverLogin.user.getAge();

	$('#id').val(email);
	$('#id').attr("readonly",true);
	$('#password1').attr("readonly",true);
	$('#password2').attr("readonly",true);
	$('#isNaver').val("true");
	$('#name').val(name);
	
	console.log("email = " + email);
	
}

</script>

<% 

GuestVO loginGuest = (GuestVO) session.getAttribute("guest"); 
if(loginGuest != null) {
	response.sendRedirect("/");
}

String email = (String) session.getAttribute("email");
String name = (String) session.getAttribute("name");

%>
<script type="text/javascript">
function setFacebook() {

	$('#id').val("<%=email %>" + "@facebook.com");
	$('#id').attr("readonly", true);
	$('#password1').attr("readonly", true);
	$('#password2').attr("readonly", true);
	$('#isNaver').val("true");
	$('#name').val("<%=name %>");

}
<%
if(email != null && name != null) { %>
	setFacebook();
<%}%>

<%-- <% --%>
// 	String uri[] = request.getRequestURI().split("/");
<%-- 	if(uri[uri.length-1].equalsIgnoreCase("signup.jsp")) { %> --%>
// 		naverLogin.logout();
<%-- 	<%} --%>
<%-- %> --%>

</script>
</html>