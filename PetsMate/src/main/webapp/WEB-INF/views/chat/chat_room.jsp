<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">



<title>Pets&Mate</title>
<link rel="stylesheet" href="/resources/css/bootstrap.css">
<link rel="stylesheet" type="text/css" href="/resources/css/style.css">

</head>
<style>
.bd-placeholder-img {
	font-size: 1.125rem;
	text-anchor: middle;
	-webkit-user-select: none;
	-moz-user-select: none;
	-ms-user-select: none;
	user-select: none;
}

@media ( min-width : 768px) {
	.bd-placeholder-img-lg {
		font-size: 3.5rem;
	}
}
</style>
<!-- Custom styles for this template -->
<link href="/resources/css/carousel.css" rel="stylesheet">
<body>
	<header>
		<nav class="navbar navbar-expand-lg navbar-dark fixed-top"
			style="background-color: #fe6f61;">
			<a class="navbar-brand" href="/"><img
				src="/resources/img/home.png" width="30" heigth="30" alt=""></a>

			<button class="navbar-toggler" type="button" data-toggle="collapse"
				data-target="#navbarNav" aria-controls="navbarNav"
				aria-expanded="false" aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>

			<div class="collapse navbar-collapse" id="navbarNav">
				<ul class="navbar-nav mr-auto">

					<li class="nav-item"><a class="nav-link" href="/">홈

					

					</a></li>
					<li class="nav-item"><a class="nav-link" href="/intro">Pets&Mate
							소개</a></li>
					<li class="nav-item"><a class="nav-link" href="/price">요금예약안내</a></li>
					<li class="nav-item"><a class="nav-link" href="/call">펫택시예약</a></li>
					<li class="nav-item"><a class="nav-link" href="/iot">IoT</a></li>
					<li class="nav-item"><a class="nav-link" href="/qna">Q&A</a></li>
					<li class="nav-item"><a class="nav-link" href="/board/list">게시판</a></li>
					<li class="nav-item active"><a class="nav-link" href="/chat/chat_main">대화하기</a></li>
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
	</header>
	
	<!-- 채팅방 -->
	<div class="chatbox">
		<div class="chatlogs">
			<div class="chat friend">
				<div class="user-photo"><img src="/resources/img/icon.JPG"></div>
				<p class="chat-message">what's up brother</p>
			</div>
			<div class="chat self">
				<div class="user-photo"><img src="/resources/img/icon.JPG"></div>
				<p class="chat-message">what's up </p>
			</div>
		
		</div>
		<div class="chat-form">
			<textarea></textarea>
			<button>Send</button>
		
		</div>
	
	
	</div>
	
	

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
	<script type="text/javascript">
	$(document).ready(function() {
		chatListFunction('ten');
		getInfiniteChat();
	});
	</script>
</body>
</html>
