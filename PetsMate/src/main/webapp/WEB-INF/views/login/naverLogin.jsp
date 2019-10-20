<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>NaverLoginSDK</title>
</head>
	<script defer src="/resources/js/all.js"></script>
	<script src="/resources/js/jquery-3.4.1.js"></script>
	<script src="/resources/js/bootstrap.js"></script>
<script type="text/javascript" src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.0.js" charset="utf-8"></script>
<script type="text/javascript">

var naverLogin = new naver.LoginWithNaverId(
	{
		clientId: "7nlmp3_oTZszqdkLgv2u",
		callbackUrl: window.location.protocol + "//" + window.location.host + "/" + "login/naverLogin",
// 		callbackUrl: "http://localhost:8080/login/naverLogin",
		isPopup: false, /* 팝업을 통한 연동처리 여부 */
		callbackHandle: true
	}
);

/* 설정정보를 초기화하고 연동을 준비 */
naverLogin.init();

window.addEventListener('load', function () {
	naverLogin.getLoginStatus(function (status) {
		if (status) {
			/* 필수적으로 받아야하는 프로필 정보가 있다면 callback처리 시점에 체크 */
			var email = naverLogin.user.getEmail();
			var name = naverLogin.user.getNickName();
			var profileImage = naverLogin.user.getProfileImage();
			var birthday = naverLogin.user.getBirthday();			var uniqId = naverLogin.user.getId();
			var age = naverLogin.user.getAge();
			
			if( email == undefined || email == null) {
				alert("이메일은 필수정보입니다. 정보제공을 동의해주세요.");
				/* 사용자 정보 재동의를 위하여 다시 네아로 동의페이지로 이동함 */
				naverLogin.reprompt();
				return;
			}
			if( uniqId == undefined || uniqId == null) {
				alert("이름은 필수정보입니다. 정보제공을 동의해주세요.");
				/* 사용자 정보 재동의를 위하여 다시 네아로 동의페이지로 이동함 */
				naverLogin.reprompt();
				return;
			}
			
			$('#email').val(email);
			$('#form').submit();
			
			
// 			var url = "http://" + window.location.hostname + ((location.port==""||location.port==undefined)?"":":" + location.port) + "/login/signup"
// 			window.location.replace(url);
			
		} else {
			console.log("callback 처리에 실패하였습니다.");
		}
	});
});
</script>

<body>
<form method="post" action="/login/naverLogin/action" id='form'>
	<input type='hidden' name='email' id='email'>
</form>
</body>
</html>