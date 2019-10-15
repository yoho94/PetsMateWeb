<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<title>Pets&Mate</title>
<link rel="stylesheet" href="/resources/css/bootstrap.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/css/bootstrap.min.css">
<link rel="stylesheet" href="test.css">

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
					<li class="nav-item active"><a class="nav-link" href="/priceinfo">요금예약안내</a></li>
					<li class="nav-item"><a class="nav-link" href="/call">펫택시예약</a></li>
					<li class="nav-item"><a class="nav-link" href="/iot">IoT</a></li>
					<li class="nav-item"><a class="nav-link" href="/qna">Q&A</a></li>
					<li class="nav-item"><a class="nav-link" href="/board/list">게시판</a></li>
					<li class="nav-item"><a class="nav-link" href="/chat/chat_main">대화하기</a></li>
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
	<main role="main" class="flex-shrink-0">
  <div class="container">
   <img class="mb-4" src="/resources/img/TITLE.jpg" alt="" width="500" height="150">
    <h1 class="mt-5" style="color:#993800; font-weight:600">기본 요금</h1>
    <h3 class="h3">6,000원 + 1km당 1,000원</h3>
  </div>
    <div class="container">
    <h1 class="mt-5" style="color:#993800; font-weight:600">왕복 운행시</h1>
    <p class="h3">네이버 지도를 기준으로 예약시점 실시간교통정보에 따른 목적지를 경유하는 경로로 계산</p>
    <p class="h3">기본요금 6,000원 + 1km당 1,000원 + 목적지 도착 후 대기</p>
    <p class="h3">대기시간은 1시간 무료, 1시간 이후부터 10분당 2,000원</p>
    <p class="h3">유료 주차장 이용 시 주차요금 추가</p>
  </div>
   <div class="container">
    <h1 class="mt-5" style="color:#993800; font-weight:600">그외 추가요금</h1>
    <p class="h3">반려동물 1마리 초과시 마리당 요금 5,000원 추가</p>
  </div>
</main>
<img class="mb-4" src="/resources/img/taxi.png" width="500" height="300" style="margin-left:1200px">



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
