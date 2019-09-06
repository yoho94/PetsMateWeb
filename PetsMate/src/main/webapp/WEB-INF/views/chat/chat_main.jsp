<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<title>Pets&Mate</title>
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
	
	<body class="container" style="margin-top: 70px">
		<div id="root">
			<header>
				<h1><font color=#ff6633"> 대화하기</font></h1>
			</header>
			<hr>
			현재활성화 중인 채팅창입니다.
			<hr>
			<section id="container">
				<h2>채팅 목록</h2>
				
					<table id="example-table-3" width="100%" class="table table-bordered table-hover text-center">
					<thead>
						<tr>
							
							<th>TOKEN</th>
							<th>아이디</th>
							<th>최근메시지</th>
						</tr>
						
						<!--  목록 시작 -->
					</thead>
				</table>
				</section>
				
				<center>
				<section id="chatfx">
				<form role="form" method="post" autocomplete="off">
					<div class="form-TOKEN">
						<input type="text" name='TOKENCODE' id="TOKEN"  style="width:300px;" placeholder="TONKEN 을 입력해주세요">
					
					</div>
					<br>
					<br>
					<div>
					
					<button type="button" id="gochatBtn"class="btn btn-primary">채팅하기</button>
					
					<button type="button" id="deleteBtn"class="btn btn-danger">삭제하기</button>
				</div>
				</div>
					</div>
				</form>
				
			</section>
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
