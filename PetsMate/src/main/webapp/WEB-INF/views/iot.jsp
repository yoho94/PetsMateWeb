<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<title>Pets&Mate IoT</title>
<link rel="stylesheet" href="/resources/css/bootstrap.css">
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
					<li class="nav-item "><a class="nav-link" href="/">홈
					</a></li>
					<li class="nav-item"><a class="nav-link" href="/intro">Pets&Mate
							소개</a></li>
					<li class="nav-item"><a class="nav-link" href="/price">요금예약안내</a></li>
					<li class="nav-item"><a class="nav-link" href="/call">펫택시예약</a></li>
					<li class="nav-item active"><a class="nav-link" href="/iot">IoT</a></li>
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
	
	
		<div style="width:500px; height:350px;  float:left; margin:50px; margin-left:100px;
	border:solid #7fff00 3px">
	<img src="/resources/img/maptest.jpg" width="494" height="344" alt="임시적인 지도 이미지" >
		<h2  style="color:#7fff00">개목걸이 위치 정보 뛰워야됨</h2>
	</div>
	
	
		<div style="width:500px; height:50px;  float:bottom; margin:50px; margin-left:100px;
		margin-top:800x; border:solid #7fff00 3px">
			<h6>반려동물 현위치: 대구광역시 수성구 범어동 222-22</h2>
	</div>
	
		<div style="width:350px; height:100px;  float:right; margin:50px;margin-right:200px; "> 
		<img src="/resources/img/Heart.jpg" alt="심장 그림" >
		<h1 style="color:red">71 bpm </h1>
		
			<h5>도착지에서 698m 떨어져 있습니다.</h5>
		<h5>도착지 : 대구 북구 복현로 35</h5>
		
		<div style="width:175px; height:30px;  float:right; margin-bottom:500px; margin:50px;margin-right:200px;border:solid red 3px"> 
		<h5>010-0000-0000</h5>
		</div>
		
		<div style="width:175px; height:30px;  float:right; margin-bottom:500px; margin:50px;margin-right:200px;border:solid red 3px"> 
		<h5>기사님께 메세지:</h5>
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
</body>
</html>
