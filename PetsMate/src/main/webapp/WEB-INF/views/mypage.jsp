<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<title>Pets&Mate - 로그인</title>
<link rel="stylesheet" href="/resources/css/bootstrap.css">
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
				<li class="nav-item active"><a class="nav-link" href="/mypage">마이페이지</a></li>
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
<body style="padding: 100px 15px 0;">

	${guest.id}님 환영합니다.
	<br>

	<hr>

	PET 테이블
	<table class="table">
		<thead>
			<tr>
				<th scope="col">PetCode</th>
				<th scope="col">Name</th>
				<th scope="col">Weight</th>
				<th scope="col">Ps</th>
			</tr>
		</thead>
		<tbody>
		<c:forEach var="pet" items="${petList}">
		<tr>
		<th scope="row">${pet.pet_code }</th>
		<td>${pet.name }</td>
		<td>${pet.weight }</td>
		<td>${pet.ps }</td>
		</tr>		
		</c:forEach>
		
		</tbody>
	</table>
	
	<hr>
	CALL 테이블
		<table class="table">
		<thead>
			<tr>
				<th scope="col">serial_number</th>
				<th scope="col">guest_id</th>
				<th scope="col">driver_id</th>
				<th scope="col">is_call</th>
				<th scope="col">code</th>
				<th scope="col">start_lat</th>
				<th scope="col">start_long</th>
				<th scope="col">dest_lat</th>
				<th scope="col">dest_long</th>
				<th scope="col">start_time</th>
				<th scope="col">dest_time</th>
				<th scope="col">guest_count</th>
				<th scope="col">gen_time</th>
				<th scope="col">is_shuttle</th>
				<th scope="col">shuttle_code</th>
				<th scope="col">ps</th>
				<th scope="col">place_name</th>
				<th scope="col">place_addr</th>
				<th scope="col">place_name_start</th>
				<th scope="col">place_addr_start</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="call" items="${callList}">
				<tr>
					<th scope="row">${call.serial_number }</th>
					<td>${call.guest_id }</td>
					<td>${call.driver_id }</td>
					<td>${call.is_call }</td>
					<td>${call.code }</td>
					<td>${call.start_latitude }</td>
					<td>${call.start_longitude }</td>
					<td>${call.destination_latitude }</td>
					<td>${call.destination_longitude }</td>
					<td>${call.start_time }</td>
					<td>${call.destination_time }</td>
					<td>${call.guest_count }</td>
					<td>${call.generate_time }</td>
					<td>${call.is_shuttle }</td>
					<td>${call.shuttle_code }</td>
					<td>${call.ps }</td>
					<td>${call.place_name }</td>
					<td>${call.place_addr }</td>
					<td>${call.place_name_start }</td>
					<td>${call.place_addr_start }</td>
				</tr>
			</c:forEach>

		</tbody>
	</table>
	
	

	<footer class="footer fixed-bottom mt-auto py-3"
		style="background-color: #f5f5f5;">
		<div class="container" style="text-align: center;">
			<span class="text-muted">고객센터 053-0000-0000</span>
		</div>
	</footer>

	<script src="/resources/js/jquery-3.4.1.js"></script>
	<script src="/resources/js/bootstrap.js"></script>
</body>
</html>