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
//int po_num = Integer.parseInt(request.getParameter("num"));

%>
<script src = "./js/jquery-3.2.0.js"></script>
	<script type="text/javascript">
	$(document).ready(function(){
		$('.payback').hide();
		$('input[name=type]').change(function(){
			payback_cost();
			if($(this).val()=="Cancel"){
				$('.payback').show();
				$('textarea[name=memo]').attr('placeholder','환불 사유를 간략히 써주세요');
				$('#submit').val('반품 신청');
			}else{
				$('.payback').hide();
				$('textarea[name=memo]').attr('placeholder','교환을 원하시는 색상과 사이즈를 입력해 주세요');
				$('#submit').val('환불 신청');
			}
		});
	});
	function payback_cost(){
		var cost = <%=mtib.getCost()%>*$('select[name=tcount] option:selected').val();
		$('#payback_co').val(cost);
		$('#payback_cost').html(cost+"원");
	}
	function bankcheck(){
		
		if($('textarea[name=memo]').val().length==0){
			var radioval=$('input:radio[name=type]:checked').val();
			if(radioval=="Exchange"){
				alert("반품 요청사항을 입력해 주세요");
				return false;
			}else{
				alert("환불 사유를 입력해 주세요");
				return false;
			}
		}
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
		}else return false;
	}
	
	
	</script>
</head>
<body>
<div align="center">
<h4>상품 정보</h4>
<form action = "" method = "post" onsubmit="return bankcheck()">
<input type="radio" checked="checked" value="Exchange" name="type">교환
<input type="radio" value="Cancel" name="type">환불
<br>
<table>
	<tr>
		<td>상품명</td>
		<td><%=mtib.getSubject() %></td>
	</tr>
	<tr>
		<td>사이즈</td>
		<td><%=mtib.getSize() %></td>
	</tr>
	<tr>
		<td>색상</td>
		<td><%=mtib.getColor() %></td>
	</tr>
	<tr>
		<td>수량</td>
		<td>
			<select name="tcount" onchange="payback_cost()">
				<%for(int i =1; i<=mtib.getThing_count();i++){ %>
				<option value="<%=i%>"><%=i %>개</option>
				<%} %>
			</select>
		</td>
	</tr>
	<tr style="display: ;" class="payback">
		<td>총 상품 금액</td>
		<td><%=mtib.getTotal_cost() %>원</td>
	</tr>
	<tr style="display: ;" class="payback">
		<td>환불 금액</td>
		<td id="payback_cost"></td>
	</tr>
	<tr style="display: ;" class="payback">
		<td>환불 방식</td>
		<td><%=mtib.getTrade_type() %></td>
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
	<tr>
		<td colspan="2">
		<textarea rows="6" cols="45" placeholder="교환을 원하시는 색상과 사이즈를 입력해 주세요"
			name = "memo"></textarea>
		</td>
	</tr>
</table>
<input type="hidden" name="payback_co" value="">
<input type ="button" onclick="bankcheck()"id="submit" value = "교환 신청">
<input type = "button" value ="닫기" onclick ="window.close()">
 </form> 
</div>  	
</body>
</html>