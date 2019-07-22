<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<title>Pets&Mate</title>
<link rel="stylesheet" href="/resources/css/bootstrap.css">
<link rel="stylesheet" href="/resources/css/all.css">
<script src="/resources/js/jquery-3.4.1.js"></script>
<script src="/resources/js/bootstrap.js"></script>
<script src='/resources/moment/moment-with-locales.js'></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/tempusdominus-bootstrap-4/5.0.0-alpha14/js/tempusdominus-bootstrap-4.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/tempusdominus-bootstrap-4/5.0.0-alpha14/css/tempusdominus-bootstrap-4.min.css" />

<!-- <script type="text/javascript" -->
<!-- 	src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=krakspsq17&callback=initMap"></script> -->
<script type="text/javascript">
	// 	var map = null;

	// 	function initMap() {
	// 		map = new naver.maps.Map('map', {
	// 			center : new naver.maps.LatLng(37.3595704, 127.105399),
	// 			zoom : 10
	// 		});
	// 	}
	// 	"<div class='form-group input-group' id='petDiv'> <div class='input-group-prepend'>	<span class='input-group-text'> <i class='fa fa-dog'></i></span></div><input name='pet_code' class='form-control' type='checkbox' value='"+code+"'>"+name+"</div>"

	var cnt = 0;
	var count = 0;
	function petAdd(code, name) {
		if (cnt % 2 == 0) {
			count++;
			addDiv();
		}
		div2 = document.getElementById("petDiv_" + count);
		// 		str2 = "<input name='pet_code' class='form-control' type='checkbox' value='"+code+"'>"+name;
		str2 = "<div class='col'> <div class='form-check form-check-inline'> <input class='form-check-input' type='checkbox' name='pet_code' id='pet_code"+cnt+"' value='"+code+"'> <label class='form-check-label' for='pet_code"+cnt+"'>"
				+ name + "</label> </div> </div>";
		div2.innerHTML += str2;
		cnt++;
	}

	function addDiv() {
		div = document.getElementById("petDiv");
		str = "<div class='form-group input-group' id='petDiv_"+count+"'> <div class='input-group-prepend'>	<span class='input-group-text'> <i class='fa fa-dog'></i></span></div></div>";
		div.innerHTML += str;
	}

	function enterStart() {
		if (window.event.keyCode == 13) {
			searchStartPopup();
			return false;
		} else {
			return;
		}
	}

	function enterDes() {
		if (window.event.keyCode == 13) {
			searchDesPopup();
			return false;
		} else {
			return;
		}
	}

	function searchStartPopup() {
		var value = document.getElementById("place_name_start").value;
		var url = "/call/map?value=" + value + "&isStart=true";
		var name = "지도 검색";
		var option = "width = 650, height = 450, top = 100, left = 200, location = no";
		window.open(url, name, option);

		// mapWin.document.getElementById("keyword").value = document.getElementById("place_name_start").value;
	}

	function searchDesPopup() {
		var value = document.getElementById("place_name").value;
		var url = "/call/map?value=" + value + "&isStart=false";
		var name = "지도 검색";
		var option = "width = 650, height = 450, top = 100, left = 200, location = no";
		window.open(url, name, option);

	}
</script>
</head>
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
					<li class="nav-item"><a class="nav-link" href="/">홈 </a></li>
					<li class="nav-item"><a class="nav-link" href="/intro">Pets&Mate
							소개</a></li>
					<li class="nav-item"><a class="nav-link" href="/price">요금예약안내</a></li>
					<li class="nav-item active"><a class="nav-link" href="/call">펫택시예약</a></li>
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
	</header>

	<div class="container" style="padding: 100px 15px 0;">
		<div class="card bg-light mx-auto col-sm-7">
			<article class="card-body mx-auto" style="max-width: 450px;">
				<h4 class="card-title mt-3 text-center">즉시호출 / 예약</h4>
				<hr>
				<form method="post" action="/call/action">
					<input type="hidden" name="start_latitude" id="start_latitude">
					<input type="hidden" name="start_longitude" id="start_longitude">
					<input type="hidden" name="destination_latitude"
						id="destination_latitude"> <input type="hidden"
						name="destination_longitude" id="destination_longitude"> <input
						type="hidden" name="place_addr" id="place_addr"> <input
						type="hidden" name="place_addr_start" id="place_addr_start">
					<div class="form-group input-group">
						<div class="input-group-prepend">
							<span class="input-group-text"> <i
								class="fa fa-map-marker-alt"></i>
							</span>
						</div>
						<input name="place_name_start" class="form-control"
							id="place_name_start" onkeydown="return enterStart();"
							placeholder="출발지 검색" type="text">
						<div class="input-group-append">
							<button class="btn btn-outline-secondary" type="button"
								onclick="searchStartPopup()">
								<i class="fa fa-search"></i>
							</button>
						</div>
					</div>
					<div class="form-group input-group">
						<div class="input-group-prepend">
							<span class="input-group-text"> <i
								class="fa fa-map-marker-alt"></i>
							</span>
						</div>
						<input name="place_name" class="form-control" id="place_name"
							onkeydown="return enterDes();" placeholder="도착지 검색" type="text">
						<div class="input-group-append">
							<button class="btn btn-outline-secondary" type="button"
								onclick="searchDesPopup()">
								<i class="fa fa-search"></i>
							</button>
						</div>
					</div>

					<div class="form-group input-group">
						<div class="input-group-prepend">
							<span class="input-group-text"><i class="fa fa-calendar-minus"></i></span>
						</div>

						<div class="col">
							<div class="form-check form-check-inline">
								<input class="form-check-input" type="radio" name="is_call"
									id="is_shuttle1" value="false" checked="checked"> <label
									class="form-check-label" for="is_shuttle1"> 콜 </label>
							</div>
						</div>

						<div class="col">
							<div class="form-check form-check-inline">
								<input class="form-check-input" type="radio" name="is_call"
									id="is_shuttle2" value="false"> <label
									class="form-check-label" for="is_shuttle2">예약</label>
							</div>
						</div>
					</div>

					<div class="form-group input-group">
						<div class="input-group-prepend">
							<span class="input-group-text"><i class="fa fa-sync-alt"></i></span>
						</div>

						<div class="col">
							<div class="form-check form-check-inline">
								<input class="form-check-input" type="radio" name="is_shuttle"
									id="is_shuttle1" value="false" checked="checked"> <label
									class="form-check-label" for="is_shuttle1">편도</label>
							</div>
						</div>

						<div class="col">
							<div class="form-check form-check-inline">
								<input class="form-check-input" type="radio" name="is_shuttle"
									id="is_shuttle2" value="false"> <label
									class="form-check-label" for="is_shuttle2">왕복</label>
							</div>
						</div>

						<!-- 						<input name="is_shuttle" class="form-control" type="radio" value="false" checked="checked">편도 -->
						<!-- 						<input name="is_shuttle" class="form-control" type="radio" value="true">왕복 -->
					</div>

					<div class="form-group input-group">
						<div class="input-group-prepend" data-target="#datetimepicker1"
							data-toggle="datetimepicker">
							<div class="input-group-text">
								<i class="fa fa-clock"></i>
							</div>
						</div>
						<div class="date" data-target-input="#datetimepicker1">
							<input type="text" class="form-control datetimepicker-input" id="datetimepicker1"
								data-target="#datetimepicker1" name='shuttle_time' data-format="yyyy-MM-dd hh:mm"/>
						</div>
						<div class="input-group-append" data-target="#datetimepicker1"
							data-toggle="datetimepicker">
							<button class="btn btn-outline-secondary" type="button">
								<i class="fa fa-search"></i>
							</button>
						</div>
					</div>

					<!-- 					<div class='form-group'> -->
<!-- 						<div class='input-group date'> -->
<!-- 							<div class="input-group-prepend"> -->
<!-- 								<span class="input-group-text"><i class="fa fa-clock"></i></span> -->
<!-- 							</div> -->
<!-- 							<input class='form-control form_datetime' type='text' readonly data-link-field="shuttleTime" placeholder="왕복 날짜 선택"/> -->
<!-- 						</div> -->
<!-- 						<input type='hidden' id='shuttleTime'/> -->

<!-- 					</div> -->

					<div id='petDiv'></div>

					<div class="form-group input-group">
						<div class="input-group-prepend">
							<span class="input-group-text"><i class="fa fa-user-plus"></i></span>
						</div>
						<select class="custom-select" name="guest_count" id="guest_count">
							<option value=1 selected>보호자 탑승 인원</option>
							<option value=0>0명</option>
							<option value=1>1명</option>
							<option value=2>2명</option>
							<option value=3>3명</option>
							<option value=4>4명</option>
						</select>
					</div>

					<div class="form-group input-group">
						<div class="input-group-prepend">
							<span class="input-group-text"><i class="fa fa-clipboard"></i></span>
						</div>
						<textarea class="form-control" placeholder="특이사항 / 요청사항" name="ps"
							id="ps"></textarea>
					</div>


					<div class="form-group text-center">
						<button type="submit" class="btn btn-primary">호출</button>
						<button type="submit" class="btn btn-danger">예약</button>
					</div>
				</form>
			</article>
		</div>
		<!-- card.// -->
	</div>
	<footer class="footer fixed-bottom mt-auto py-3"
		style="background-color: #f5f5f5;">
		<div class="container" style="text-align: center;">
			<span class="text-muted">고객센터 053-0000-0000</span>
		</div>
	</footer>


	<script type="text/javascript">
		<c:forEach items="${petList}" var="pet">
		petAdd("${pet.pet_code}", "${pet.name}");
		</c:forEach>
	</script>
	<script type="text/javascript">

	$.fn.datetimepicker.Constructor.Default = $.extend({}, $.fn.datetimepicker.Constructor.Default, {
	
        icons: {
            time: 'fa fa-clock',
            date: 'fa fa-calendar',
            up: 'fa fa-arrow-up',
            down: 'fa fa-arrow-down',
            previous: 'fa fa-chevron-left',
            next: 'fa fa-chevron-right',
            today: 'fa fa-calendar-check-o',
            clear: 'fa fa-trash',
            close: 'fa fa-times'
        } });
	
    $(function () {
        $('#datetimepicker1').datetimepicker({
            minDate: moment().millisecond(0).second(0).minute(0).hour(0)
        });
    });
	</script>
	<br>
	<br>
	<br>
</body>
</html>
