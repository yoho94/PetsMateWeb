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
<body>

	<div id="root">
		<header>
			<h1>게시판</h1>
		</header>

		<hr />

		<hr />

		<section id="container">

			<form role="form" method="post" autocomplete="off">

				<p>
					<label for="bno">글 번호</label> <input type="text" id="bno"
						name="bno" value="${modify.bno}" readonly="readonly" />
				</p>


				<p>
					<label for="title">글 제목</label> <input type="text" id="title"
						name="title" value="${modify.title}" />
				</p>
				<p>
					<label for="content">글 내용</label>
					<textarea id="content" name="content">${modify.content}</textarea>
				</p>
				<p>
					<label for="writer">작성자</label> <input type="text" id="writer"
						name="writer" value="${modify.writer}" readonly="readonly" /><br />
					<label>작성 날짜</label> <span><fmt:formatDate
							value="${modify.regDate}" pattern="yyyy-MM-dd" /></span>
				</p>
				<p>
					<button type="submit">수정</button>
					<button id="cancel_btn">취소</button>

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

</body>
</html>