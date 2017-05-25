<%@page import="java.text.SimpleDateFormat"%>
<%@page import="net.mod.db.ModTradeInfoBEAN"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>패키지 예약 취소 요청 페이지</title>
<link href="./css/inc.css" rel="stylesheet" type="text/css">
<link href="./css/subpage.css" rel="stylesheet" type="text/css">
<script src = "./js/jquery-3.2.0.js"></script>
	<script type="text/javascript">
	var check = 0;
	$(window).ready(function(){
		alert("취소 및 환불 규정을 꼭 확인하시길 바랍니다");
	})
	function cancel_rule_view(){
		check++;
		if(check ==1){
			$('#cancel_rule_view').html("환불 규정▲");
			$('#Cancel_Rule').show();
		}else{
			$('#cancel_rule_view').html("환불 규정▼");
			$('#Cancel_Rule').hide();
			check = 0;
		}
	}
	
</script>
</head>
<%
request.setCharacterEncoding("utf-8");
ModTradeInfoBEAN mtib = (ModTradeInfoBEAN)request.getAttribute("mtib");
String[] countp = mtib.getPack_count().split(",");
SimpleDateFormat sdf = new SimpleDateFormat("yyyy년 MM월 dd일");
%>
<body>
<div align="center">
<h4>패키지 정보</h4>
<table>
	<tr>
		<td>예약번호 </td>
		<td><%=mtib.getTrade_num() %></td>
	</tr>
	<tr>
		<td>상품명</td>
		<td><%=mtib.getSubject() %></td>
	</tr>
	<tr>
		<td>출발 날짜</td>
		<td><%=sdf.format(mtib.getTrade_date()) %></td>
	</tr>
	<tr>
		<td>예약 인원</td>
		<td>성인 : <%=countp[0] %>, 아동 : <%=countp[1] %></td>
	</tr>
	<tr>
		<td>결제 환불 금액</td>
		<td><%=mtib.getCost() %>원</td>
	</tr>
	<%if(mtib.getTrade_type().equals("무통장 입금")){ %>
	<tr>
		<td colspan="2">환불 받으실 계좌 정보 입력</td>
	</tr>
	<tr>
		<td>은행명</td><td><input type="text" name="Cancel_info"></td>
		<td>예금주</td><td><input type="text" name="Cancel_info"></td>
	</tr>
	<tr>
		<td>계좌 번호</td><td><input type="text" name="Cancel_info"></td>
	</tr>
	<%} %>
</table>

<span onclick = "cancel_rule_view()"
	id = "cancel_rule_view">환불 규정▼</span>
 <div id="Cancel_Rule" style="display: none" align="center">
<ul style="text-align: left;">
  <li>비수기 일반규정</li>
	<ul style="text-align: left;"> 
  		<li>출발 7일전 취소시 총 여행경비 10%공제 후 환불</li>
 		<li>출발 5일전 취소시 총 여행경비 20%공제 후 환불</li>
  		<li>출발 3일전 취소시 총 여행경비 30%공제후 환불</li>
  		<li>출발 1일전 취소시 총 여행경비 50%공제 후 환불</li>
  		<li>당일 취소시 여행경비 환불 불가</li>
	</ul>
</ul>
<input type ="button" value = "예약 취소" onclick="">
 </div> 
</div>  	
</body>
</html>