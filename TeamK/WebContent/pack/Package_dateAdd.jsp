<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="net.pack.db.PackBean"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<!-- <link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css"> -->
<!-- <script src="../js/jquery-3.2.0.js"></script> -->
<!-- <script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script> -->
</head>
<style>
#datecontent 
{
	width: 400px;
	height: 350px;
	border: 3px solid gray;
	overflow: auto;
	text-align: center;
}

#datecontent table
{
	border : 1px solid black;
	
}

#datecontent tr:FIRST-CHILD
{
	background-color: gray;
	height : 30px;
}

#datecontent .date_td_size
{
	height : 50px;
	border : 1px solid black;
}

#datecontent #date_date
{
	width : 145px;
}
#datecontent #date_cost
{
	width : 145px;
}

#datecontent #date_stock
{
	width : 70px;
}
</style>
<script type="text/javascript">

// 	function cls()
// 	{
// 		opener.document.all.id.value = document.all.id.value;
// 		window.close();
// 	}
	
	function close()
	{
		window.close();
	}
	
	
// 	function idchk(id)
// 	{
// 		location.href="idchk.jsp?id=" + id;
// 	}
	
// 	jQuery(document).ready(function($){
		
// 		// 달력 관련 소스
// 		$("#date").datepicker({
// 			dateFormat: 'yy-mm-dd',    // 날짜 포맷 형식
// 			minDate : 0,			   // 최소 날짜 설정      0이면 오늘부터 선택 가능
// 			numberOfMonths: 2,		   // 보여줄 달의 갯수
// 	        dayNamesMin: ['월', '화', '수', '목', '금', '토', '일'],  // 일(Day) 표기 형식
// 	        monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],   // 월(Month) 표기 형식
// 	        //showOn: "both",		// 버튼을 표시      both : input과 buttom 둘다 클릭 시 달력 표시           bottom  :  buttom 클릭 했을 때만 달력 표시
// 	        //buttonImage: "./img/calendar.png",   // 버튼에 사용될 이미지
// 	        //buttonImageOnly: true,					// 이미지만 표시한다    버튼모양 x
// 		});
// 	});
	
</script>
<body>
<center>
<br><br>
<%
	request.setCharacterEncoding("UTF-8");
// 	PackBean pb = new PackBean();
// 	pb = (PackBean)request.getAttribute("PB");
%>


<form name="fr" method="POST">
<%-- <input type="text" name="id" value="<%=id %>"> --%>
<!-- <input type="button" value="중복확인" onclick="idchk(document.fr.id.value)"><br><br> -->
<label>상품명</label><p>솰라솰라</p>
<div id="datecontent">
	<table>
		<tr>
			<td id="date_date">출발일자</td>
			<td id="date_cost">상품가격</td>
			<td id="date_stock">갯수</td>
		</tr>
		<%
		for(int i = 0; i < 10; i++)
		{
		%>
		<tr>
			<td style="display:none;">글번호</td>
			<td class="date_td_size">2017-05-05</td>
			<td class="date_td_size">50,000</td>
			<td class="date_td_size">50</td>
		</tr>
		<%
		}
		%>
	</table>
</div>
<label>추가할 날짜</label><input type="text" id="date"><br>
<label>금액</label><input type="text"><br>
<label>수량</label><input type="text"><br>
<input type="button" value="추가" onclick="date_add()">
<input type="button" value="닫기" onclick="close()">
</form>
<br><br>
 
</center>
</body>
</html>