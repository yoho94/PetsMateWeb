<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<title>Pets&Mate - 회원가입 (PET)</title>
<link rel="stylesheet" href="/resources/css/bootstrap.css">
<link rel="stylesheet" href="/resources/css/all.css">
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
</head>
<script type="text/javascript">
	var count = 1;
	function add(ff) {
		app = document.getElementById("pet_add_div");
		var str = "<div class='form-group input-group'> <div class='input-group-prepend'> <span class='input-group-text'> <i class='fa fa-dog'></i>		</span></div> <input name='petList["+count+"].id' type='hidden' value='${guest.id }'> <input name='petList["+count+"].name' class='form-control' placeholder='이름'		type='text'> <input name='petList["+count+"].weight' class='form-control'		placeholder='몸무게(kg)' type='number' min='0' max='100'> <input		name='petList["+count+"].ps' class='form-control' placeholder='특이사항(선택 입력)'		type='text'>	<button type='button' class='btn btn-outline-danger' onclick='add(this.form)'>+</button>	<button type='button' class='btn btn-outline-danger' onclick='del(this.form)'>-</button></div>";
		var addDiv = document.createElement("div");
		addDiv.id = "add_" + count;
		addDiv.innerHTML = str;		
		app.appendChild(addDiv);
		count++;
	}

	function del(ff) {
		app = document.getElementById("pet_add_div");

		if (count > 1) {
			var addDiv = document.getElementById("add_" + (--count));
			app.removeChild(addDiv);
		} else {
			form = document.getElementById("pet_form");
			form.reset();
		}
	}
</script>
<body style="padding: 100px 15px 0;">

	<!-- 	html input 태그 동적으로 추가하기 -->
	<!-- 	<hr> -->
	<!-- 	</p> -->
	<!-- 	<form name="frm1"> -->
	<!-- 		<input type="button" value="input 태그 추가" -->
	<!-- 			onclick="input_append(this.form)"> -->
	<!-- 		<div id="append"></div> -->

	<!-- 		<input type="button" value="입력 결과 출력" -->
	<!-- 			onclick="input_result(this.form)"> -->
	<!-- 	</form> -->

	<div class="container">
		<div class="card bg-light">
			<article class="card-body mx-auto" style="min-width: 650px;">
				<h4 class="card-title mt-3 text-center">회원가입 (PET)</h4>
				<hr>
				<form method="post" action="/login/signupPet/action" id="pet_form">
					<div id="pet_add_div">
						<div id=add_0>
							<div class='form-group input-group'>
								<div class='input-group-prepend'>
									<span class='input-group-text'> <i class='fa fa-dog'></i>
									</span>
								</div>
								<input name='petList[0].id' type='hidden' value='${guest.id }'>
								<input name='petList[0].name' class='form-control' placeholder='이름'
									type='text'> <input name='petList[0].weight' class='form-control'
									placeholder='몸무게(kg)' type='number' min='0' max='100'>
								<input name='petList[0].ps' class='form-control' placeholder='특이사항(선택 입력)'
									type='text'>
								<button type='button' class='btn btn-outline-danger' onclick='add(this.form)'>+</button>
								<button type='button' class='btn btn-outline-danger' onclick='del(this.form)'>-</button>
							</div>
						</div>
					</div>
					<div class="form-group">
						<button type="submit" class="btn btn-primary btn-block">
							등록</button>
					</div>
				</form>
			</article>
		</div>
		<!-- card.// -->
	</div>
	<!--container end.//-->


	<footer class="footer fixed-bottom mt-auto py-3"
		style="background-color: #f5f5f5;">
		<div class="container" style="text-align: center;">
			<span class="text-muted">고객센터 053-0000-0000</span>
		</div>
	</footer>

	<script defer src="/resources/js/all.js"></script>
	<script src="/resources/js/jquery-3.4.1.js"></script>
	<script src="/resources/js/bootstrap.js"></script>
</body>
</html>