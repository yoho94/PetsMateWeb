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
			<li class="nav-item"><a class="nav-link" href="/chat/chat_main">대화하기</a></li>
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
				<button type="submit" class="btn btn-danger btn-block">로그인</button>
				
					<div class='text-center' style="margin-top:5px; margin-bottom:5px">
						<fb:login-button scope="public_profile,email" size="large"
							onlogin="checkLoginState();">페이스북 아이디로 로그인
							</fb:login-button>
					</div>
					<div class='text-center'>

						<div id="naverIdLogin"></div>
					</div>
				
			</div>
			<div class="clearfix">
				<label class="mr-auto checkbox-inline"><input
					type="checkbox" id="remember"> 아이디 저장</label> <a
					href="/login/signup" class="float-right">회원가입</a>
			</div>
			<div>
        <a href="/login/findID" class="float-left"> 아이디 찾기</a> 
        <a href="/login/findPW" class="float-right">비밀번호 찾기 </a>
        </div>
        
            
    </form>
    

    
</div>

<div id="status">
</div>

<script type="text/javascript">
	var naverLogin = new naver.LoginWithNaverId(
		{
			clientId: "7nlmp3_oTZszqdkLgv2u",
			callbackUrl: window.location.protocol + "//" + window.location.host + "/" + "login/naverLogin",
// 			callbackUrl: "http://localhost:8080/login/naverLogin",
			isPopup: false, /* 팝업을 통한 연동처리 여부 */
			loginButton: {color: "green", type: 3, height: 41}, /* 로그인 버튼의 타입을 지정 */
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
	
	  // This is called with the results from from FB.getLoginStatus().
	  function statusChangeCallback(response) {
	    console.log('statusChangeCallback');
	    console.log(response);
	    // The response object is returned with a status field that lets the
	    // app know the current login status of the person.
	    // Full docs on the response object can be found in the documentation
	    // for FB.getLoginStatus().
	    if (response.status === 'connected') {
	      // Logged into your app and Facebook.
// 	      testAPI();
	    } else {
	      // The person is not logged into your app or we are unable to tell.
// 	      document.getElementById('status').innerHTML = 'Please log ' +
// 	        'into this app.';
	    }
	  }

	  // This function is called when someone finishes with the Login
	  // Button.  See the onlogin handler attached to it in the sample
	  // code below.
	  function checkLoginState() {
	    FB.getLoginStatus(function(response) {
// 	      statusChangeCallback(response);
			var url = "https://" + window.location.hostname + ":8443" + "/login/facebookLogin"

	    	window.location.href = url;
	    });
	  }

	  window.fbAsyncInit = function() {
	    FB.init({
	      appId      : '1627571870706719',
	      cookie     : true,  // enable cookies to allow the server to access 
	                          // the session
	      xfbml      : true,  // parse social plugins on this page
	      version    : 'v3.3' // The Graph API version to use for the call
	    });

	    // Now that we've initialized the JavaScript SDK, we call 
	    // FB.getLoginStatus().  This function gets the state of the
	    // person visiting this page and can return one of three states to
	    // the callback you provide.  They can be:
	    //
	    // 1. Logged into your app ('connected')
	    // 2. Logged into Facebook, but not your app ('not_authorized')
	    // 3. Not logged into Facebook and can't tell if they are logged into
	    //    your app or not.
	    //
	    // These three cases are handled in the callback function.

	    FB.getLoginStatus(function(response) {
	      statusChangeCallback(response);
	    });

	  };

	  // Load the SDK asynchronously
	  (function(d, s, id) {
	    var js, fjs = d.getElementsByTagName(s)[0];
	    if (d.getElementById(id)) return;
	    js = d.createElement(s); js.id = id;
	    js.src = "https://connect.facebook.net/en_US/sdk.js";
	    fjs.parentNode.insertBefore(js, fjs);
	  }(document, 'script', 'facebook-jssdk'));

	  // Here we run a very simple test of the Graph API after login is
	  // successful.  See statusChangeCallback() for when this call is made.
	  function testAPI() {
	    console.log('Welcome!  Fetching your information.... ');
	    FB.api('/me', function(response) {
	      console.log('Successful login for: ' + response.toString());
	      
// 	      document.getElementById('status').innerHTML =
// 	        'Thanks for logging in, ' + response.name + '!<br>' +
// 	        'Thanks for logging in, ' + response.id + '!';
	    });
	  }
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
