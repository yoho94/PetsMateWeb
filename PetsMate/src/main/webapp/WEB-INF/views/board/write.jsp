<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
<title>게시판</title>
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
					<label for="title">글 제목</label><input type="text" id="title"
						name="title" />
				</p>
				<p>
					<label for="content">글 내용</label>
					<textarea id="content" name="content"></textarea>
				</p>
				<p>
					<label for="writer">작성자</label><input type="text" id="writer"
						name="writer" />
				</p>
				<p>
					<button type="submit">작성</button>
				</p>
			</form>

		</section>

		<hr />

	</div>

</body>
</html>