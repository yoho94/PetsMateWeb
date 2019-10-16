<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div id="wrap">
	<div id="container">
		<div class="inner">	
			<h2>게시글 상세</h2>
			<form id="qboardForm" name="qboardForm">		
				<table width="100%" class="table01">
				    <colgroup>
				        <col width="15%">
				        <col width="35%">
				        <col width="15%">
				        <col width="*">
				    </colgroup>
				    <tbody id="tbody">
				       
				    </tbody>
				</table>		
				<input type="hidden" id="qboard_seq"		name="qboard_seq"	value="${qboardSeq}"/> <!-- 게시글 번호 -->
				<input type="hidden" id="search_type"	name="search_type" 	value="S"/> <!-- 조회 타입 - 상세(S)/수정(U) -->
			</form>
			<div class="btn_right mt15">
				<button type="button" class="btn black mr5" onclick="javascript:goQBoardList();">목록으로</button>
				<button type="button" class="btn black mr5" onclick="javascript:goQBoardUpdate();">수정하기</button>
				<button type="button" class="btn black" onclick="javascript:deleteQBoard();">삭제하기</button>
				<button type="button" class="btn black mr5" onclick="javascript:goQBoardReply();">답글쓰기</button>
			</div>
		</div>
	</div>
</div>
</body>
</html>