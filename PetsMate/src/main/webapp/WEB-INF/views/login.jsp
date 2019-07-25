<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<title>Pets&Mate - 로그인</title>
<link rel="stylesheet" href="/resources/css/bootstrap.css">
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
				<li class="nav-item active"><a class="nav-link" href="/login">로그인</a></li>
			</c:if>
			<c:if test="${guest != null}">
				<li class="nav-item"><a class="nav-link" href="/logout">로그아웃</a></li>
			</c:if>
		</ul>
	</div>

</nav>

<style type="text/css">
	.login-form {
		width: 340px;
    	margin: 50px auto;
    	padding: 60px 15px 0;
	}
    .login-form form {
    	margin-bottom: 15px;
        /*background: #f7f7f7;*/
        /*box-shadow: 0px 2px 2px rgba(0, 0, 0, 0.3);*/
        padding: 30px;
    }
    .login-form h2 {
        margin: 0 0 15px;
    }
    .form-control, .btn {
        min-height: 38px;
        border-radius: 2px;
    }
    .btn {        
        font-size: 15px;
        font-weight: bold;
    }
    .btn-danger, .btn-danger:active, .btn-danger:visited {
    background-color: #fe6f61 !important;
}
	.btn-danger:hover {
		background-color: #dc3545 !important;
	}
	
</style>
</head>
<body>

	<div class="login-form">
    <form action="/login/login" method="post">
        <h2 class="text-center">로그인</h2>       
        <div class="form-group">
            <input type="text" class="form-control" placeholder="아이디" required="required" id="id" name="id">
        </div>
        <div class="form-group">
            <input type="password" class="form-control" placeholder="비밀번호" required="required" id="password" name="password">
        </div>
        <div class="form-group">
            <button type="submit" class="btn btn-danger btn-block" >로그인</button>
            <br>
            <div id="naverIdLogin" class="text-center"></div>
        </div>
        <div class="clearfix">
            <label class="mr-auto checkbox-inline"><input type="checkbox" id="remember"> 아이디 저장</label>
            <a href="/login/signup" class="float-right">회원가입</a>
        </div>
        <div>
        <a href="/login/findID" class="float-left"> 아이디 찾기</a> 
        <a href="/login/findPW" class="float-right">비밀번호 찾기 </a>
        </div>
        
            
    </form>
    

    
</div>

<script type="text/javascript">
	var naverLogin = new naver.LoginWithNaverId(
		{
			clientId: "7nlmp3_oTZszqdkLgv2u",
			callbackUrl: "http://localhost:8080/login/naverLogin",
			isPopup: false, /* 팝업을 통한 연동처리 여부 */
			loginButton: {color: "green", type: 3, height: 53}, /* 로그인 버튼의 타입을 지정 */
			callbackHandle: false
		}
	);
	
	/* 설정정보를 초기화하고 연동을 준비 */
	naverLogin.init();

	naverLogin.getLoginStatus(function (status) {
		if (status) {
			var email = naverLogin.user.getEmail();
			var name = naverLogin.user.getNickName();
			var profileImage = naverLogin.user.getProfileImage();
			var birthday = naverLogin.user.getBirthday();			var uniqId = naverLogin.user.getId();
			var age = naverLogin.user.getAge();
		} else {
			console.log("AccessToken이 올바르지 않습니다.");
		}
	});
</script>

	<footer class="footer fixed-bottom mt-auto py-3" style="background-color: #f5f5f5;">
		<div class="container" style="text-align: center;">
			<span class="text-muted">고객센터 053-0000-0000</span>
		</div>
	</footer>

	<script src="/resources/js/jquery-3.4.1.js"></script>
	<script src="/resources/js/bootstrap.js"></script>	
	<br>
	<br>
	<br>
</body>
</html>
