<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 목록</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script type="text/javascript">
	
	$(document).ready(function(){		
		getBoardList();
	});

	function getQBoardList(){
		
		$.ajax({			
			type:"GET",
		    url:"/qboard/getQBoardList",
	        dataType:"JSON",
	        success : function(obj) {
				getBoardListCallback(obj);				
	        },	       
	        error : function(xhr, status, error) {}
	     });
	}
	
	function getBoardListCallback(obj){
		
		var list = obj;
		var listLen = obj.length;
		
		console.log(list);
		console.log(listLen);
		
		var str = "";
		
		if(listLen >  0){
			
			for(var a=0; a<listLen; a++){
				
				var qboardSeq		= list[a].qboard_seq; 
				var qboardReRef 		= list[a].qboard_re_ref; 
				var qboardReLev 		= list[a].qboard_re_lev; 
				var qboardReSeq 		= list[a].qboard_re_seq; 
				var qboardWriter 	= list[a].qboard_writer; 
				var qboardSubject 	= list[a].qboard_subject; 
				var qboardContent 	= list[a].qboard_content; 
				var qboardHits 		= list[a].qboard_hits;
				var qdelYn 			= list[a].qdel_yn; 
				var qinsUserId 		= list[a].qins_user_id;
				var qinsDate 		= list[a].qins_date; 
				var qupdUserId 		= list[a].qupd_user_id;
				var qupdDate 		= list[a].qupd_date;
				
				str += "<tr>";
				str += "<td>"+ qboardSeq +"</td>";
				str += "<td>"+ qboardSubject +"</td>";
				str += "<td>"+ qboardHits +"</td>";
				str += "<td>"+ qboardWriter +"</td>";				
				str += "</tr>";
				
			} 
			
		} else {
			
			str += "<tr colspan='4'>";
			str += "<td>등록된 글이 존재하지 않습니다.</td>";
			str += "<tr>";
		}
		
		$("#tbody").html(str);
	}
	
</script>
</head>
<body>
<table border=1 width=350>
	<thead>
		<tr>
			<td>글번호</td>
			<td>제목</td>
			<td>조회수</td>
			<td>작성자</td>
		</tr>
	</thead>
	<tbody id="tbody">
	
	</tbody>
	
</table>
</body>
</html>