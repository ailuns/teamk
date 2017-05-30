<%@page import="net.mod.db.ModTradeInfoBEAN"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>환불 및 취소 페이지</title>
<%
request.setCharacterEncoding("utf-8");
ModTradeInfoBEAN mtib = (ModTradeInfoBEAN)request.getAttribute("mtib");
String[] countp = mtib.getPack_count().split(",");
int po_num = Integer.parseInt(request.getParameter("num"));

%>
<script src = "./js/jquery-3.2.0.js"></script>
	<script type="text/javascript">
	function bankcheck(){
		if(confirm("환불 규정을 확인하지 않은데에 대한 불이익은 본사에서 책임 지지 않습니다")){
			if("<%=mtib.getTrade_type()%>"=="무통장 입금"&&<%=mtib.getCost()%>!=0){
				if($('#bank_name').val().length==0){
					alert('환불 받을실 은행을 입력해 주세요');
					$('#bank_name').select();
					return false;
				}else if($('#name').val().length==0){
					alert('예금주를 입력해 주세요');
					$('#name').select();
					return false;
				}else if($('#bank_number').val().length==0){
					alert('계좌번호를 입력해 주세요');
					$('#bank_number').select();
					return false;
				}
			}
		}else return false;
	}
	</script>
</head>
<body>
<div align="center">
<h4>상품 정보</h4>
<form action = "" method = "post" onsubmit="return bankcheck()">
<table>
	<tr>
		<td>상품명</td>
		<td></td>
	</tr>
	<tr>
		<td>상품 금액</td>
		<td></td>
	</tr>
	<tr>
		<td>결제 환불 금액</td>
		<td></td>
	</tr>
	<%if(mtib.getTrade_type().equals("무통장 입금")&&mtib.getCost()!=0){ %>
	<tr>
		<td colspan="2">환불 받으실 계좌 정보 입력</td>
	</tr>
	<tr>
		<td>은행명</td><td><input type="text" id="bank_name" name="Cancel_info"
							placeholder="EX)콩팥 머니 은행"></td>
		<td>예금주</td><td><input type="text" id="name" name="Cancel_info"
							placeholder="EX)홍길동"></td>
	</tr>
	<tr>
		<td>계좌 번호</td><td><input type="text" id="bank_number" name="Cancel_info"
							placeholder="EX)12-007-2245-777">
	</td>
	</tr>
	<%} %>
</table>
<input type ="submit" id="submit" value = "">
<input type = "button" value ="닫기" onclick ="window.close()">
 </form> 
</div>  	
</body>
</html>