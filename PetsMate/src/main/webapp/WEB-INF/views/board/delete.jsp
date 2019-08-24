<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
<head>
<title>게시판</title>

<!-- 제이쿼리 -->
<script src='https://code.jquery.com/jquery-3.3.1.min.js'></script>

</head>
<link rel="stylesheet" href="/resources/css/bootstrap.css">
<link rel="stylesheet" href="/resources/css/all.css">
<script src="/resources/js/jquery-3.4.1.js"></script>
<script src="/resources/js/bootstrap.js"></script>

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
			<li class="nav-item active"><a class="nav-link" href="/board">게시판</a></li>
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

<body>

	<div id="root">
		<header>
			<h1>삭제</h1>
		</header>

		<hr />

		<hr />

		<section id="container">

			<form role="form" method="post" autocomplete="off">

				<p>
					<label for="bno">글 번호</label> <input type="text" id="bno"
						name="bno" value="${delete}" readonly="readonly" />
				</p>

				<p>정말로 삭제하시겠습니까?</p>

				<p>

					<button type="submit">예, 삭제합니다.</button>
					<br />
					<button id="cancel_btn">아니오, 삭제하지 않습니다.</button>


					<script>
						// 폼을 변수에 저장
						var formObj = $("form[role='form']");

						// 취소 버튼 클릭
						$("#cancel_btn").click(
								function() {
									formObj.attr("action", "/board/read?bno="
											+ $("#bno").val());
									formObj.attr("method", "get");
									formObj.submit();

								});
					</script>

				</p>

			</form>

		</section>

		<hr />
	</div>


	<footer class="footer fixed-bottom mt-auto py-3"
		style="background-color: #f5f5f5;">
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