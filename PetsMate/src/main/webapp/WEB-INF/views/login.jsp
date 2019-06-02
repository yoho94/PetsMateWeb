<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<title>Home</title>
<link rel="stylesheet" href="/resources/css/bootstrap.css">
<nav class="navbar navbar-expand-lg navbar-dark fixed-top"
	style="background-color: #fe6f61;">
	<a class="navbar-brand" href="/"><img src="resources/img/home.png"
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
				<li class="nav-item active"><a class="nav-link" href="/login">로그인</a></li>
			</c:if>
			<c:if test="${guest != null}">
				<li class="nav-item"><a class="nav-link" href="/logout">로그아웃</a></li>
			</c:if>
		</ul>
	</div>

</nav>

<style type="text/css">
	.login-form {
		width: 340px;
    	margin: 50px auto;
	}
    .login-form form {
    	margin-bottom: 15px;
        /*background: #f7f7f7;*/
        /*box-shadow: 0px 2px 2px rgba(0, 0, 0, 0.3);*/
        padding: 30px;
    }
    .login-form h2 {
        margin: 0 0 15px;
    }
    .form-control, .btn {
        min-height: 38px;
        border-radius: 2px;
    }
    .btn {        
        font-size: 15px;
        font-weight: bold;
    }
    .btn-danger, .btn-danger:active, .btn-danger:visited {
    background-color: #fe6f61 !important;
}
	.btn-danger:hover {
		background-color: #dc3545 !important;
	}
	
</style>
</head>
<body>

	<div class="login-form">
    <form action="/login/login" method="post">
        <h2 class="text-center">로그인</h2>       
        <div class="form-group">
            <input type="text" class="form-control" placeholder="아이디" required="required" id="id" name="id">
        </div>
        <div class="form-group">
            <input type="password" class="form-control" placeholder="비밀번호" required="required" id="password" name="password">
        </div>
        <div class="form-group">
            <button type="submit" class="btn btn-danger btn-block" >로그인</button>
        </div>
        <div class="clearfix">
            <label class="mr-auto checkbox-inline"><input type="checkbox" id="remember"> 아이디 저장</label>
            <a href="#" class="float-right">회원가입</a>
        </div>
        <div>
        <a href="#" class="float-left"> 아이디 찾기</a> 
        <a href="#" class="float-right">비밀번호 찾기 </a>
        </div>
    </form>
    
</div>

	<script src="/resources/js/jquery-3.4.1.js"></script>
	<script src="/resources/js/bootstrap.js"></script>
</body>
</html>
