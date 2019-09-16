<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	String userID = null;
	if (session.getAttribute("userID") != null) {
		userID = (String)session.getAttribute("userID");
	}
	String toID = null;
	if (request.getParameter("toID") != null) {
	toID = (String) request.getParameter("toID");
	}
%>
<html>
<head>
<title>Pets&Mate</title>
<link rel="stylesheet" href="/resources/css/bootstrap.css">
<script type = "text/javascript">
	function submitFunction() {
		var fromID= '<%=userID %>';
		var toID= '<%=toID %>';
		var chatContent = $('#chattContent').val();
		$.ajax({
			type: "POST",
			url: "./chatSubmitServlet",
			data: {
				fromID: encodeURIComponent(fromID),
				toID: encodeURIComponent(fromID),
				chatContent: encodeURIComponent(fromID),
			},
			success: function(result) {
				if(result ==1){
					autoClosingAlert('전송',2000);
			}else {
				autoClosingAlert('실패',2000);
			}
				
		}
		
		});
		$('#chatContent').val(' ');


	}
	var lastID = 0;
	function chatListFunction(type) {
		var fromID = '<%= userID %>';
		var toID = '<%= toID %>';
		$.ajax({
			type:"POST", 
			url : "./chatListServlet",
			data : {
				fromID: encodeURIComponent(fromID),
				toID: encodeURIComponent(toID),
				listType: type
			},
			success: function(data) {
				if(data == "") return;
				var parsed = JSON.parse(data);
				var result = parsed.result;
				for(var i = 0; i< result.length; i++){
					if(result[i][0].value == fromID) {
						result[i][0].value ='나';
					}
					addChat(result[i][0].value, result[i][2].value,result[i][3].value);
				}
				lastID = Number(parsed.last);
			}
		});
	}
	function addChat(chatName, chatContent, chatTime) {
		$('#chatList').append('<div class="row">' +
				'<div class="col-lg-12">' +
				'<div class="media">' +
				'<a class="pull-left" href="#">' +
				'<img class="media-object img-circle" style="width: 30px; height: 30px;" src="/resources/img/icon.JPG" alt="">' +
				'</a>' +
				'<div class="media-body">' +
				'<h4 class="media-heading">' +
				chatName +
				'<span class = "small pull-right">' +
				chatTime +
				'</span>' +
				'</h4>' +
				'<p>' +
				chatContent +
				'</p>' +
				'</div>' +
				'</div>' +
				'</div>' +
				'</div>' +
				'<hr>');
		$('#chatList').scrollTop($('#chatList')[0].scrollHeight);
	}
	function getInfiniteChat() {
		setInterval(function() {
			chatListFunction(lastID);
		},3000);
	}
</script>
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
				
					<br><br>
	<div class="row">
	
	
		<table id="example-table-3" width="100%" class="table table-bordered table-hover text-center">
			<thead>
				<tr>
					<th>선택</th>
					<th>TOKEN </th>
					<th>아이디</th>
					<th>최근메시지</th>
					
				</tr>
			</thead>
			<tbody>				
				<tr>
					<td><input type="checkbox" name="user_CheckBox" ></td>
					<td>1234</td>
					<td>user07</td>
					<td>저기요</td>
					
				
				</tr>
				<tr>
					<td><input type="checkbox" name="user_CheckBox" ></td>
					<td>2</td>
					<td>user08</td>
					<td>TEST</td>
					
					
				</tr>
			
			</tbody>
			
			
		</table>
		<div class="col-lg-12" id="ex3_Result1" ></div> 
		<div class="col-lg-12" id="ex3_Result2" ></div> 
	</div>
	
	<br><br>
				</section>
				
				
				
					</div>
					<br>
					<br>
					<div>
					<center>
					
					<button type="button" id="gochatBtn"class="btn btn-primary" onclick="window.open('chat_room')">채팅하기</button>
					
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
