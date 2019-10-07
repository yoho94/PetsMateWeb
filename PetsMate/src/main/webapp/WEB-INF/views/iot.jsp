<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<title>Pets&Mate IoT</title>
<link rel="stylesheet" href="/resources/css/bootstrap.css">
<script src="/resources/js/jquery-3.4.1.js"></script>
<script src="/resources/js/bootstrap.js"></script>
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=86a6cbfcf0c93a4011071ac4cbc70d45"></script>
<link rel="stylesheet" href="/resources/css/all.css">
<script src='/resources/moment/moment.js'></script>
<script src='/resources/moment/ko.js'></script>
<script type="text/javascript"
	src="https://cdnjs.cloudflare.com/ajax/libs/tempusdominus-bootstrap-4/5.0.0-alpha14/js/tempusdominus-bootstrap-4.min.js"></script>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/tempusdominus-bootstrap-4/5.0.0-alpha14/css/tempusdominus-bootstrap-4.min.css" />

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
					<li class="nav-item "><a class="nav-link" href="/">홈 </a></li>
					<li class="nav-item"><a class="nav-link" href="/intro">Pets&Mate
							소개</a></li>
					<li class="nav-item"><a class="nav-link" href="/priceinfo">요금예약안내</a></li>
					<li class="nav-item"><a class="nav-link" href="/call">펫택시예약</a></li>
					<li class="nav-item active"><a class="nav-link" href="/iot">IoT</a></li>
					<li class="nav-item"><a class="nav-link" href="/qna">Q&A</a></li>
					<li class="nav-item"><a class="nav-link" href="/board/list">게시판</a></li>
					<li class="nav-item"><a class="nav-link"
						href="/chat/chat_main">대화하기</a></li>
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

	<div id="map" style="width: 100%; height: 350px; margin: 70px auto;"></div>
	<div class="d-flex justify-content-center">
		<div class='col-md-5'>
			<div class="form-group">
				<div class="input-group date" id="datetimepicker7"
					data-target-input="nearest">
					<input type="text" class="form-control datetimepicker-input"
						data-target="#datetimepicker7" placeholder="여기부터" />
					<div class="input-group-append" data-target="#datetimepicker7"
						data-toggle="datetimepicker">
						<div class="input-group-text">
							<i class="far fa-calendar-alt"></i>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class='col-md-5'>
			<div class="form-group">
				<div class="input-group date" id="datetimepicker8"
					data-target-input="nearest">
					<input type="text" class="form-control datetimepicker-input"
						data-target="#datetimepicker8" placeholder="여기까지" />
					<div class="input-group-append" data-target="#datetimepicker8"
						data-toggle="datetimepicker">
						<div class="input-group-text">
							<i class="far fa-calendar-alt"></i>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="d-flex justify-content-center">
		<div class='form-group'>
			<button type="button" class="btn btn-outline-primary"
				onclick='dateButton();'>확인</button>
		</div>
	</div>

	<hr>

	<div class="d-flex justify-content-center">
	<img src="/resources/img/Heart.jpg" alt="심장 그림" >
	</div>
	<div class="d-flex justify-content-center">
	<h1 class='text-center' style="color:red" id='bpm'>71 bpm</h1>
	</div>

	<!-- 	<div class="form-group input-group"> -->
	<!-- 		<div class="input-group-prepend" data-target="#datetimepicker1" -->
	<!-- 			data-toggle="datetimepicker"> -->
	<!-- 			<div class="input-group-text"> -->
	<!-- 				<i class="fa fa-clock"></i> -->
	<!-- 			</div> -->
	<!-- 		</div> -->
	<!-- 		<div class="date" data-target-input="#datetimepicker1"> -->
	<!-- 			<input type="text" class="form-control datetimepicker-input" -->
	<!-- 				id="datetimepicker1" placeholder="예약 날짜, 시간 선택" -->
	<!-- 				data-target="#datetimepicker1" name='start_time' readonly /> -->
	<!-- 		</div> -->
	<!-- 		<div class="input-group-append" data-target="#datetimepicker1" -->
	<!-- 			data-toggle="datetimepicker"> -->
	<!-- 			<button class="btn btn-outline-secondary" type="button"> -->
	<!-- 				<i class="fa fa-search"></i> -->
	<!-- 			</button> -->
	<!-- 		</div> -->
	<!-- 	</div> -->
	<!-- 	<div class="form-group input-group"> -->
	<!-- 		<div class="input-group-prepend" data-target="#datetimepicker2" -->
	<!-- 			data-toggle="datetimepicker"> -->
	<!-- 			<div class="input-group-text"> -->
	<!-- 				<i class="fa fa-clock"></i> -->
	<!-- 			</div> -->
	<!-- 		</div> -->
	<!-- 		<div class="date" data-target-input="#datetimepicker2"> -->
	<!-- 			<input type="text" class="form-control datetimepicker-input" -->
	<!-- 				id="datetimepicker2" placeholder="예약 날짜, 시간 선택" -->
	<!-- 				data-target="#datetimepicker2" name='des_time' readonly /> -->
	<!-- 		</div> -->
	<!-- 		<div class="input-group-append" data-target="#datetimepicker2" -->
	<!-- 			data-toggle="datetimepicker"> -->
	<!-- 			<button class="btn btn-outline-secondary" type="button"> -->
	<!-- 				<i class="fa fa-search"></i> -->
	<!-- 			</button> -->
	<!-- 		</div> -->
	<!-- 	</div> -->
	<!-- 지도 설정 -->
	<script>
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
		mapOption = {
			center : new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
			level : 3
		// 지도의 확대 레벨
		};

		var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

// 		// 마커를 표시할 위치입니다 
// 		var position = new kakao.maps.LatLng(33.450701, 126.570667);

// 		// 마커를 생성합니다
// 		var marker = new kakao.maps.Marker({
// 			position : position,
// 			clickable : true
// 		// 마커를 클릭했을 때 지도의 클릭 이벤트가 발생하지 않도록 설정합니다
// 		});

// 		// 아래 코드는 위의 마커를 생성하는 코드에서 clickable: true 와 같이
// 		// 마커를 클릭했을 때 지도의 클릭 이벤트가 발생하지 않도록 설정합니다
// 		// marker.setClickable(true);

// 		// 마커를 지도에 표시합니다.
// 		marker.setMap(map);

// 		// 마커를 클릭했을 때 마커 위에 표시할 인포윈도우를 생성합니다
// 		var iwContent = '<div style="padding:5px;">Hello World!</div>', // 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
// 		iwRemoveable = true; // removeable 속성을 ture 로 설정하면 인포윈도우를 닫을 수 있는 x버튼이 표시됩니다

// 		// 인포윈도우를 생성합니다
// 		var infowindow = new kakao.maps.InfoWindow({
// 			content : iwContent,
// 			removable : iwRemoveable
// 		});

// 		// 마커에 클릭이벤트를 등록합니다
// 		kakao.maps.event.addListener(marker, 'click', function() {
// 			// 마커 위에 인포윈도우를 표시합니다
// 			infowindow.open(map, marker);
// 		});
		
		// 일반 지도와 스카이뷰로 지도 타입을 전환할 수 있는 지도타입 컨트롤을 생성합니다
		var mapTypeControl = new kakao.maps.MapTypeControl();

		// 지도에 컨트롤을 추가해야 지도위에 표시됩니다
		// kakao.maps.ControlPosition은 컨트롤이 표시될 위치를 정의하는데 TOPRIGHT는 오른쪽 위를 의미합니다
		map.addControl(mapTypeControl, kakao.maps.ControlPosition.TOPRIGHT);

		// 지도 확대 축소를 제어할 수 있는  줌 컨트롤을 생성합니다
		var zoomControl = new kakao.maps.ZoomControl();
		map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);
		
		// 인포윈도우를 표시하는 클로저를 만드는 함수입니다 
		function makeOverListener(map, marker, infowindow) {
		    return function() {
		        infowindow.open(map, marker);
		    };
		}

		// 인포윈도우를 닫는 클로저를 만드는 함수입니다 
		function makeOutListener(infowindow) {
		    return function() {
		        infowindow.close();
		    };
		}
		
		// 지도에 표시된 마커 객체를 가지고 있을 배열입니다
		var markers = [];
		var times = [];
		var bpms = [];
//  		var iots = [];
	</script>
	<!-- iot 테이블 받아오기. -->
	<c:forEach var='iots' items='${iots}' varStatus='status'>
		<script>
			// 마커를 표시할 위치입니다 
			var position = new kakao.maps.LatLng(${iots.LATITUDE}, ${iots.LONGITUDE});
			
			var imageSrc = '/resources/img/pet_icon2.png',
				imageSize = new kakao.maps.Size(35, 35),
				imageOption = {offset: new kakao.maps.Point(27, 35)};
			
			<c:if test="${status.last}">
				var imageSrc = '/resources/img/pet_icon3.png',
				imageSize = new kakao.maps.Size(35, 35),
				imageOption = {offset: new kakao.maps.Point(27, 35)};
			</c:if>
			
			
			var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imageOption);

			// 마커를 생성합니다
			var marker = new kakao.maps.Marker({
				position : position,
				clickable : true,
				image : markerImage
			// 마커를 클릭했을 때 지도의 클릭 이벤트가 발생하지 않도록 설정합니다
			});

			// 아래 코드는 위의 마커를 생성하는 코드에서 clickable: true 와 같이
			// 마커를 클릭했을 때 지도의 클릭 이벤트가 발생하지 않도록 설정합니다
			// marker.setClickable(true);

			// 마커를 지도에 표시합니다.
			marker.setMap(map);

			// 마커를 클릭했을 때 마커 위에 표시할 인포윈도우를 생성합니다
			var iwContent = '<div style="padding:5px;">${iots.date}<br>${iots.time}</div>'; // 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
			var iwRemoveable = false; // removeable 속성을 ture 로 설정하면 인포윈도우를 닫을 수 있는 x버튼이 표시됩니다

			// 인포윈도우를 생성합니다
			var infowindow = new kakao.maps.InfoWindow({
				content : iwContent,
				removable : iwRemoveable
			});

// 			// 마커에 클릭이벤트를 등록합니다
// 			kakao.maps.event.addListener(marker, 'click', function() {
// 				// 마커 위에 인포윈도우를 표시합니다
// 				infowindow.open(map, marker);
// 			});
			
		    kakao.maps.event.addListener(marker, 'mouseover', makeOverListener(map, marker, infowindow));
		    kakao.maps.event.addListener(marker, 'mouseout', makeOutListener(infowindow));
		    map.setCenter(position);
		    markers.push(marker);
		    times.push(${iots.genTime});
		    bpms.push(${iots.HEART_RATE});
// 		    iots.push(${iots});
		</script>
	</c:forEach>

	<!-- 시간 설정 -->
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
        },
        locale: 'ko'    
	});
	
	
//     $(function () {
//         $('#datetimepicker1').datetimepicker({
//         	locale: 'ko',
// //         	minDate: moment().millisecond(0).second(0),
//         	ignoreReadonly: true
// //         	format: "YYYY-MM-DD HH:MM"
// //             minDate: moment().millisecond(0).second(0).minute(0).hour(0)
//         });
//     });
	var startDate = new Date(0);
	var desDate = new Date();

    $(function () {
//         $('#datetimepicker2').datetimepicker({
//         	locale: 'ko',
// //         	minDate: moment().millisecond(0).second(0),
//         	ignoreReadonly: true
// //         	format: "YYYY-MM-DD HH:MM"
// //             minDate: moment().millisecond(0).second(0).minute(0).hour(0)
//         });
		$('#datetimepicker7').datetimepicker();
        $('#datetimepicker8').datetimepicker({
            useCurrent: false
        });        
        $("#datetimepicker7").on("change.datetimepicker", function (e) {
            $('#datetimepicker8').datetimepicker('minDate', e.date);
            startDate.setTime(e.date);
        });
        $("#datetimepicker8").on("change.datetimepicker", function (e) {
            $('#datetimepicker7').datetimepicker('maxDate', e.date);
            desDate.setTime(e.date);
        });
    });
    
    function setMarkers(map) {
        for (var i = 0; i < markers.length; i++) {
            markers[i].setMap(map);
        }            
    }
    
    function setIots(start, des) {
    	for (var i=0; i<iots.length; i++) {
    		var date = iots[i].getgetGENERATE_TIME();
    	}
    }
    
    function dateButton() {
//     	alert(startDate.getTime());
        for (var i = 0; i < markers.length; i++) {
        	if(startDate.getTime() <= times[i] && desDate.getTime() >= times[i]) {
        		markers[i].setMap(map);
        	}else {
        		markers[i].setMap(null);
        	}
        }
        
        getBpm();
    }
    
    function getBpm() {
    	var cnt = 0;
    	var bpm = 0;
    	var bpmHtml = document.getElementById("bpm");
    	for (var i=0; i<bpms.length; i++) {
        	if(startDate.getTime() <= times[i] && desDate.getTime() >= times[i]) {
        		bpm += bpms[i];
        		cnt++;
        	}		
    	}
    	
    	bpm /= cnt;
    	if(isNaN(bpm))
    		bpmHtml.innerHTML = "IoT 정보가 없습니다.";
    	else
    		bpmHtml.innerHTML = bpm.toFixed(2) + " bpm";
    }
    getBpm();
	</script>

	<!-- 		<div style="width:500px; height:350px;  float:left; margin:50px; margin-left:100px; -->
	<!-- 	border:solid #7fff00 3px"> -->
	<!-- 	<img src="/resources/img/maptest.jpg" width="494" height="344" alt="임시적인 지도 이미지" > -->
	<!-- 		<h2  style="color:#7fff00">개목걸이 위치 정보 뛰워야됨</h2> -->
	<!-- 	</div> -->


	<!-- 		<div style="width:500px; height:50px;  float:bottom; margin:50px; margin-left:100px; -->
	<!-- 		margin-top:800x; border:solid #7fff00 3px"> -->
	<!-- 			<h6>반려동물 현위치: 대구광역시 수성구 범어동 222-22</h2> -->
	<!-- 	</div> -->

	<!-- 		<div style="width:350px; height:100px;  float:right; margin:50px;margin-right:200px; ">  -->
	<!-- 		<img src="/resources/img/Heart.jpg" alt="심장 그림" > -->
	<!-- 		<h1 style="color:red">71 bpm </h1> -->

	<!-- 			<h5>도착지에서 698m 떨어져 있습니다.</h5> -->
	<!-- 		<h5>도착지 : 대구 북구 복현로 35</h5> -->

	<!-- 		<div style="width:175px; height:30px;  float:right; margin-bottom:500px; margin:50px;margin-right:200px;border:solid red 3px">  -->
	<!-- 		<h5>010-0000-0000</h5> -->
	<!-- 		</div> -->

	<!-- 		<div style="width:175px; height:30px;  float:right; margin-bottom:500px; margin:50px;margin-right:200px;border:solid red 3px">  -->
	<!-- 		<h5>기사님께 메세지:</h5> -->
	<!-- 		</div> -->

	<!-- 	</div> -->











	<footer class="footer fixed-bottom mt-auto py-3"
		style="background-color: #f5f5f5;">
		<div class="container" style="text-align: center;">
			<span class="text-muted">고객센터 053-0000-0000</span>
		</div>
	</footer>



	<br>
	<br>
	<br>
</body>
</html>
