<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="net.pack.db.PackBean"%>
<%@ page import="java.util.List" %>
<%@ page import="java.text.DecimalFormat" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>패키지 상품 날짜 추가</title>
<link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
<script src="./js/jquery-3.2.0.js"></script>
<script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
</head>
<style>
#datecontent 
{
	width: 390px;
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
	width : 150px;
}
#datecontent #date_cost
{
	width : 150px;
}

#datecontent #date_stock
{
	width : 70px;
}
</style>
<script type="text/javascript">

	jQuery(document).ready(function($){
		// 달력 관련 소스
		$("#add_date").datepicker({
			dateFormat: 'yy-mm-dd',    // 날짜 포맷 형식
			minDate : 0,			   // 최소 날짜 설정      0이면 오늘부터 선택 가능
			numberOfMonths: 1,		   // 보여줄 달의 갯수
	        dayNamesMin: ['월', '화', '수', '목', '금', '토', '일'],  // 일(Day) 표기 형식
	        monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],   // 월(Month) 표기 형식
	        //showOn: "both",		// 버튼을 표시      both : input과 buttom 둘다 클릭 시 달력 표시           bottom  :  buttom 클릭 했을 때만 달력 표시
	        //buttonImage: "./img/calendar.png",   // 버튼에 사용될 이미지
	        //buttonImageOnly: true,					// 이미지만 표시한다    버튼모양 x
		});
	});

	// 날짜 추가
	function dateAdd()
	{
		$.ajax({
			type:"post",
			url:"./PackDateAddAction.po",   // java로 보냄
			data:{
				subject:$("#subject").val(),
				intro:$("#intro").val(),
				type:$("#type").val(),
				area:$("#area").val(),
				city:$("#city").val(),
				sarea:$("#sarea").val(),
				cost:$("#add_cost").val(),
				stock:$("#add_stock").val(),
				date:$("#add_date").val(),
				file1:$("#file1").val(),
				file2:$("#file2").val(),
				file3:$("#file3").val(),
				file4:$("#file4").val(),
				file5:$("#file5").val(),
				
				success:function(){
					window.location.reload(true);  // 페이지 새로고침
				}
			}
		});
	}

	// 창닫기
	function cls()
	{
		opener.parent.location.reload();
		window.close();
	}

	
</script>
<body>
<center>
<br><br>
<%
	request.setCharacterEncoding("UTF-8");

	List date_list;
	date_list = (List)request.getAttribute("date_list");
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
			PackBean pb;
			for (int i = 0; i < date_list.size(); i++)
			{
				pb =(PackBean)date_list.get(i);
				DecimalFormat Commas = new DecimalFormat("#,###");
				String cost = (String)Commas.format(pb.getCost());
		%>	
			<tr>
				<input id="subject" style="display:none;" value="<%=pb.getSubject() %>"></input>
				<input id="intro" style="display:none;" value="<%=pb.getIntro() %>"></input>
				<input id="type" style="display:none;" value="<%=pb.getType() %>"></input>
				<input id="area" style="display:none;" value="<%=pb.getArea() %>"></input>
				<input id="city" style="display:none;" value="<%=pb.getCity() %>"></input>
				<input id="sarea" style="display:none;" value="<%=pb.getSarea() %>"></input>
				<input id="file1" style="display:none;" value="<%=pb.getFile1() %>"></input>
				<input id="file2" style="display:none;" value="<%=pb.getFile2() %>"></input>
				<input id="file3" style="display:none;" value="<%=pb.getFile3() %>"></input>
				<input id="file4" style="display:none;" value="<%=pb.getFile4() %>"></input>
				<input id="file5" style="display:none;" value="<%=pb.getFile5() %>"></input>
				<td class="date_td_size"><%=pb.getDate() %></td>
				<td class="date_td_size"><%=cost %></td>
				<td class="date_td_size"><%=pb.getStock() %></td>
			</tr>
		<%
			}
		%>
		
	</table>
</div>
<label>추가할 날짜</label><input type="text" id="add_date"><br>
<label>금액</label><input type="text" id="add_cost"><br>
<label>수량</label><input type="text" id="add_stock"><br>
<input type="button" value="추가" onclick="dateAdd()">
<input type="button" value="닫기" onclick="cls()">
</form>
<br><br>
 
</center>
</body>
</html>