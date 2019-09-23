<%@page import="com.petsmate.dto.PetVO"%>
<%@page import="com.petsmate.dto.DriverVO"%>
<%@page import="java.util.List"%>
<%@page import="com.petsmate.dto.CallVO"%>
<%@page import="com.petsmate.dto.CallList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	List<PetVO> petList = (List<PetVO>) session.getAttribute("petList");
%>
<html>
<head>
<title>Pets&Mate - 마이페이지</title>
<link rel="stylesheet" href="/resources/css/bootstrap.css">
<link rel="stylesheet" href="/resources/css/all.css">
<link rel="stylesheet" type="text/css"
	href="https://cdn.datatables.net/1.10.19/css/jquery.dataTables.css">
<script src="/resources/js/jquery-3.4.1.js"></script>
<script src="/resources/js/bootstrap.js"></script>
<script type="text/javascript" charset="utf8"
	src="https://cdn.datatables.net/1.10.19/js/jquery.dataTables.js"></script>
<script type="text/javascript">
// 	$(document)
// 			.ready(
// 					function() {
// 						$('#callTable')
// 								.DataTable(
// 										{
// 											"language" : {
// 												"url" : "//cdn.datatables.net/plug-ins/1.10.19/i18n/Korean.json"
// 											}
// 										});
// 					});

	var count = 1;
	function add(ff) {
		app = document.getElementById("pet_add_div");
		var str = "<div class='form-group input-group'> <div class='input-group-prepend'> <span class='input-group-text'> <i class='fa fa-dog'></i>		</span></div><input name='petList["+count+"].pet_code' type='hidden' id='code"+ count +"'> <input id='id"+ count +"' name='petList["+count+"].id' type='hidden' value='${guest.id }'> <input name='petList["+count+"].name' id='name"+ count +"' class='form-control' placeholder='이름'		type='text'> <input name='petList["
				+ count
				+ "].weight' class='form-control'		placeholder='몸무게(kg)' type='number' min='0' max='100' id='weight"+ count +"'> <input		name='petList["
				+ count
				+ "].ps' class='form-control' placeholder='특이사항(선택 입력)'		type='text' id='ps"+ count +"'>	<button type='button' class='btn btn-outline-danger' onclick='add(this.form)'>+</button>	<button type='button' class='btn btn-outline-danger' onclick='del(this.form)'>-</button></div>";
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
			<li class="nav-item"><a class="nav-link" href="/priceinfo">요금예약안내</a></li>
			<li class="nav-item"><a class="nav-link" href="/call">펫택시예약</a></li>
			<li class="nav-item"><a class="nav-link" href="/iot">IoT</a></li>
			<li class="nav-item"><a class="nav-link" href="/qna">Q&A</a></li>
			<li class="nav-item"><a class="nav-link" href="/board">게시판</a></li>
			<li class="nav-item"><a class="nav-link" href="/chat/chat_main">대화하기</a></li>
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

<style>
.red_dot {
	height: 25px;
	width: 25px;
	background-color: #FF0000;
	border-radius: 50%;
	display: inline-block;
}

.green_dot {
	height: 25px;
	width: 25px;
	background-color: #00FF00;
	border-radius: 50%;
	display: inline-block;
}

.yellow_dot {
	height: 25px;
	width: 25px;
	background-color: #FFFF00;
	border-radius: 50%;
	display: inline-block;
}

.blue_dot {
	height: 25px;
	width: 25px;
	background-color: #0000FF;
	border-radius: 50%;
	display: inline-block;
}
</style>

</head>
<body style="padding: 100px 15px 0;">

<%-- 	${guest.id}님 환영합니다. --%>
	<br>
	
	<div class="container">
		<div class="card bg-light mx-auto">
			<article class="card-body mx-auto" style="min-width: 650px;">
				<h4 class="card-title mt-3 text-center">마이페이지 PET 수정</h4>
				<hr>
				<form method="post" action="/mypage/action" id="pet_form">
					<div id="pet_add_div">
						<div id=add_0>
							<div class='form-group input-group'>
								<div class='input-group-prepend'>
									<span class='input-group-text'> <i class='fa fa-dog'></i>
									</span>
								</div>
								<input name='petList[0].pet_code' type='hidden' id='code0'> <input
									name='petList[0].id' type='hidden' value='${guest.id }' id='id0'>
								<input name='petList[0].name' class='form-control'
									placeholder='이름' type='text' id='name0'> <input
									name='petList[0].weight' class='form-control'
									placeholder='몸무게(kg)' type='number' min='0' max='100' id='weight0'>
								<input name='petList[0].ps' class='form-control'
									placeholder='특이사항(선택 입력)' type='text' id='ps0'>
								<button type='button' class='btn btn-outline-danger'
									onclick='add(this.form)'>+</button>
								<button type='button' class='btn btn-outline-danger'
									onclick='del(this.form)'>-</button>
							</div>
						</div>
					</div>
					<div class="form-group">
						<button type="submit" class="btn btn-primary btn-block">
							수정 완료</button>
					</div>
				</form>
			</article>
		</div>
		<!-- card.// -->
	</div>
	<!--container end.//-->

	<%
		if(petList.size() >= 1) {
			out.println("<script type='text/javascript'>");
			
			out.println("$('#code0').val('" + petList.get(0).getPet_code() + "');");
			out.println("$('#name0').val('" + petList.get(0).getName() + "');");
			out.println("$('#weight0').val('" + petList.get(0).getWeight() + "');");
			out.println("$('#ps0').val('" + petList.get(0).getPs() + "');");
			
			out.println("</script>");
		}
	
		for (int i = 1; i < petList.size(); i++) {
			out.println("<script type='text/javascript'>");
			
			out.println("add()");
			
			out.println("$('#code"+i+"').val('" + petList.get(i).getPet_code() + "');");
			out.println("$('#name"+i+"').val('" + petList.get(i).getName() + "');");
			out.println("$('#weight"+i+"').val('" + petList.get(i).getWeight() + "');");
			out.println("$('#ps"+i+"').val('" + petList.get(i).getPs() + "');");
			
			out.println("</script>");
		}
	%>

	<hr>
	<div class="container">
		<div class="card bg-light mx-auto">
			<article class="card-body mx-auto" style="min-width: 650px;">
				<table class="table table-striped table-bordered" id='callTable'>
					<%
						List<CallVO> callList = (List<CallVO>) session.getAttribute("callList");
						CallVO callTable;

						List<DriverVO> driverList = (List<DriverVO>) session.getAttribute("driverList");
						DriverVO driverTable;

						String title, str1, str2, str3, str4, str5, str0;
						String icon;
						String name = "", phone = "";

						String iconRed = "<span class='red_dot'></span>";
						String iconGreen = "<span class='green_dot'></span>";
						String iconBlue = "<span class='blue_dot'></span>";
						String iconYellow = "<span class='yellow_dot'></span>";

						out.print("<thead>");
						out.print("<tr>");
						
						out.print("<th scope='col'>");
						out.print("코드");
						out.print("</th>");

						out.print("<th scope='col'>");
						out.print("상태");
						out.print("</th>");
						out.print("<th scope='col'>");
						out.print("예약시간");
						out.print("</th>");
						out.print("<th scope='col'>");
						out.print("출발시간");
						out.print("</th>");
						out.print("<th scope='col'>");
						out.print("기사님");
						out.print("</th>");
						out.print("<th scope='col'>");
						out.print("출발지");
						out.print("</th>");
						out.print("<th scope='col'>");
						out.print("도착지");
						out.print("</th>");

						out.print("</tr>");
						out.print("</thead>");

						out.print("<tbody>");
						for (int i = 0; i < callList.size(); i++) {
							callTable = callList.get(i);

							str1 = "";
							str2 = "";
							str3 = "";
							str4 = "";
							str5 = "";

							switch (callTable.getCode()) {
							case 0:
								if (callTable.isIs_call())
									title = " 콜 대기";
								else
									title = " 예약 대기";
								icon = iconYellow;
								str0 = "0";
								break;
							case 1:
								title = " 수락";
								icon = iconGreen;
								str0 = "1";
								break;
							case 2:
								title = " 거절";
								icon = iconRed;
								str0 = "2";
								break;
							case 10:
							case 12:
								title = " 운행 중";
								icon = iconGreen;
								str0 = "10";
								break;
							case 11:
								title = " 미 탑승";
								icon = iconRed;
								str0 = "11";
								break;
							case 13:
								title = " 도착";
								icon = iconBlue;
								str0 = "13";
								break;
							default:
								title = " 에러";
								icon = iconRed;
								str0 = "200";
								break;
							}

							icon += title;
							str1 += callTable.myPageGenTime();
							str2 += callTable.myPageStartTime();

							if (callTable.getDriver_id() == null || callTable.getDriver_id().isEmpty()) {
							}

							else {
								for (int j = 0; j < driverList.size(); j++) {
									if (callTable.getDriver_id().equalsIgnoreCase(driverList.get(j).getId())) {
										name = driverList.get(j).getName();
										phone = driverList.get(j).getPhone();
										phone = phone.substring(0, 3) + "-" + phone.substring(3, 7) + "-"
												+ phone.substring(7, phone.length());

									}
								}
							}

							str3 += name + " / " + phone;
							if (name.isEmpty() && phone.isEmpty())
								str3 = "없음";

							str4 += callTable.getPlace_name_start();
							str5 += callTable.getPlace_name();

							out.print("<tr>");
							
							out.print("<td>");
							out.print(str0);
							out.print("</td>");

							out.print("<td>");
							out.print(icon);
							out.print("</td>");

							out.print("<td>");
							out.print(str1);
							out.print("</td>");

							out.print("<td>");
							out.print(str2);
							out.print("</td>");

							out.print("<td>");
							out.print(str3);
							out.print("</td>");

							out.print("<td>");
							out.print(str4);
							out.print("</td>");

							out.print("<td>");
							out.print(str5);
							out.print("</td>");

							out.print("</tr>");
						}
						out.print("</tbody>");
					%>
				</table>
			</article>
		</div>
	</div>

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
<script type="text/javascript">
var table = $('#callTable').DataTable({
	"columnDefs":  [
	    { "width": "0%", "targets": 0 },
	    { "width": "13%", "targets": 1 },
	    { "width": "20%", "targets": 2 },
	    { "width": "20%", "targets": 3 },
	    { "width": "10%", "targets": 4 }
	   ],
	"language" : {
				"url" : "//cdn.datatables.net/plug-ins/1.10.19/i18n/Korean.json"
			}});

table
// 	.column(0).visible(true)
	.order([0, 'desc'], [3, 'asc'])
	.column(0).visible(false)
	.draw();
</script>
</html>
