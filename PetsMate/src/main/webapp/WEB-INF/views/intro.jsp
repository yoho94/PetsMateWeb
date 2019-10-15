<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<title>Pets&Mate</title>
<link rel="stylesheet" href="/resources/css/bootstrap.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/css/bootstrap.min.css">
<link rel="stylesheet" href="test.css">

</head>
<style>
@import url(//fonts.googleapis.com/earlyaccess/notosanskannada.css); 

h1{
font-family:'Nanum Gothic';
}

h3{
font-family:'Nanum Gothic';
}

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


      body{
      background-image:url(/resources/img/back.jpg); no-repeat center center fixed; 
  	-webkit-background-size: cover;
  	-moz-background-size: cover;
 	 -o-background-size: cover;
 	 background-size: cover;
      }

      

      @media (min-width: 768px) {
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
				src="/resources/img/home.png" width="30" height="30" alt=""></a>

			<button class="navbar-toggler" type="button" data-toggle="collapse"
				data-target="#navbarNav" aria-controls="navbarNav"
				aria-expanded="false" aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>

			<div class="collapse navbar-collapse" id="navbarNav">
				<ul class="navbar-nav mr-auto">

					<li class="nav-item"><a class="nav-link" href="/">홈

					</a></li>
					<li class="nav-item active"><a class="nav-link" href="/intro">Pets&Mate 소개</a></li>
					<li class="nav-item"><a class="nav-link" href="/priceinfo">요금예약안내</a></li>
					<li class="nav-item"><a class="nav-link" href="/call">펫택시예약</a></li>
					<li class="nav-item"><a class="nav-link" href="/iot">IoT</a></li>
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
	
<main role="main" class="flex-shrink-0">
  <div class="container" style="margin:auto">
    <h1 class="mt-5" style="color:#993800; font-weight:600">Pets&Mate</h1>
    <h3 class="h3" style="color:#000000; font-weight:500" >반려동물 외출 케어 시스템 서비스 업체입니다.</h3>
  	 <h3 class="h3" style="color:#000000; font-weight:500">반려동물 전문 이동 차량을 이용하여 </h3>
  	 <h3 class="h3"style="color:#000000; font-weight:500">고객님의 원하는 곳 부터 원하는 목적지까지</h3>
  	 <h3 class="h3"style="color:#000000; font-weight:500">편안하고 안전하게 이동해 드립니다.</h3>
  	 </br></br>
  </div> 
  
  <div class="container">
  <h1 class="mt-5" style="color:#993800; font-weight:600">제공 서비스</h1>
    <h3 class="h3"style="color:#000000;">1. 고객님의 소중한 반려동물을 목적지까지 친절하고 안전하게 이동해 드립니다.</h3>
  	 <h3 class="h3"style="color:#000000;">2. 반려동물 단독 이동시 IoT기반의 반려동물 목걸이를 통하여 실시간 위치와 심박수 정보를 제공해 드립니다.</h3>
  	 <h3 class="h3"style="color:#000000;">3. 반려동물을 위해 차량 내부를 항시 소독 및 청소하며 펫 카시트가 구비되어있습니다.</h3>
  	  <h3 class="h3"style="color:#000000;">4. 물, 배변패드, 비닐 등 차량 내 항시 구비되어있습니다.</h3> 
  	
  </div> 
  
  
</main>

	
	
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
