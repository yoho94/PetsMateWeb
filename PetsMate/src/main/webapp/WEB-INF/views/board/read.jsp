<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<html>
<head>
<title>게시판</title>

</head>
<link rel="stylesheet" href="/resources/css/bootstrap.css">
<link rel="stylesheet" href="/resources/css/all.css">
<script src="/resources/js/jquery-3.4.1.js"></script>
<script src="/resources/js/bootstrap.js"></script>

<!-- Top Menu -->
<nav class="navbar navbar-expand-lg navbar-dark fixed-top"
	style="background-color: #fe6f61;">
	<a class="navbar-brand" href="/"> <img
		src="/resources/img/home.png" width="30" heigth="30" alt=""></a>

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

<body class="container" style="margin-top: 70px">

	<div id="root">
		<header>
			<h1>게시판</h1>
		</header>

		<hr />

		<hr />

		<section id="containerr">

			<form role="form" method="post" autocomplete="off">

				<div class="form-group">
					<label for="bno">글 번호</label> <input type="text"
						class="form-control" id="bno" name="bno" value="${read.bno}"
						readonly="readonly" />
				</div>

				<div class="form-group">
					<label for="title">글 제목</label> <input type="text"
						class="form-control" id="title" name="title" value="${read.title}"
						readonly="readonly"   />
				</div>
				<div class="form-group">
					<label for="content">글 내용</label>
					<textarea id="content" class="form-control" name="content"
						rows="10" readonly="readonly">${read.content}</textarea>
				</div>
				<div class="form-group">
					<label for="writer">작성자</label> <input type="text"
						class="form-control" id="writer" name="writer"
						value="${read.writer}" readonly="readonly" /><br /> <label>작성
						날짜</label> <span><fmt:formatDate value="${read.regDate}"
							pattern="yyyy-MM-dd" /></span>
				</div>
				<div class="form-group">
					<button id="list_btn"=>목록</button>
					<button id="modity_btn">수정</button>
					<button id="delete_btn">삭제</button>

					<script>
						// 폼을 변수에 저장
						var formObj = $("form[role='form']");

						// 수정 버튼 클릭
						$("#modity_btn").click(function() {

							formObj.attr("action", "/board/modify");
							formObj.attr("method", "get");
							formObj.submit();

						});

						// 삭제 버튼 클릭
						$("#delete_btn").click(function() {

							formObj.attr("action", "/board/delete");
							formObj.attr("method", "get");
							formObj.submit();

						});
					</script>

				</div>
				<div id="reply">
					<ol class="replyList">
						<c:forEach items="${repList}" var="repList">
							<li>
								<p>
									<span class="glyphicon glyphicon-user"></span>
									${repList.writer} (
									<fmt:formatDate value="${repList.regDate}" pattern="yyyy-MM-dd" />
									)
								</p>

								<p class="bg-info">${repList.content}</p>

								<div class="form-group">
									<button type="button" data-rno="${repList.rno}">수정</button>
									<button type="button" data-rno="${repList.rno}">삭제</button>

									<script>
										$(".replyUpdate")
												.click(
														function() {
															self.location = "/board/replyUpdate?bno=${read.bno}"
																	+ "&page=${scri.page}"
																	+ "&perPageNum=${scri.perPageNum}"
																	+ "&searchType=${scri.searchType}"
																	+ "&keyword=${scri.keyword}"
																	+ "&rno="
																	+ $(this)
																			.attr(
																					"data-rno");
														});

										$(".replyDelete")
												.click(
														function() {
															self.location = "/board/replyDelete?bno=${read.bno}"
																	+ "&page=${scri.page}"
																	+ "&perPageNum=${scri.perPageNum}"
																	+ "&searchType=${scri.searchType}"
																	+ "&keyword=${scri.keyword}"
																	+ "&rno="
																	+ $(this)
																			.attr(
																					"data-rno");
														});
									</script>
								</div>
							</li>
						</c:forEach>
					</ol>

					<section class="replyForm">
						<form role="form" method="post" autocomplete="off"
							class="form-horizontal">

							<input type="hidden" id="bno" name="bno" value="${read.bno}" readonly="readonly" /> 
							<input type="hidden" id="page" name="page" value="${scri.page}" readonly="readonly" /> 
							<input type="hidden" id="perPageNum" name="perPageNum" value="${scri.perPageNum}" readonly="readonly" /> 
							<input type="hidden" id="searchType" name="searchType" value="${scri.searchType}" readonly="readonly" /> 
							<input type="hidden" id="keyword" name="keyword" = value="${scri.keyword}" readonly="readonly" />

							<div class="form-group">
								<label for="writer">작성자</label>
								<div class="col-sm-10">
									<input type="text" id="writer" name="writer" class="form-control" />
								</div>
							</div>

							<div class="form-group">
								<label for="content">댓글내용</label>
								<div class="col-sm-10">
									<textarea class="form-control" id="content" name="content"></textarea>
								</div>
							</div>

							<div class="form-group">
									<button type="submit">작성</button>
								</div>
								<script>
									var formObj = $(".replyForm form[role='form']");

									$(".repSubmit").click(function() {
										formObj.attr("action", "replyWrite");
										formObj.submit();
									});
								</script>
							</div>
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
				<br> <br> <br>
</body>
</html>