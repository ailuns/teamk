<%@page import="net.mod.db.ModTradeInfoBEAN"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%
request.setCharacterEncoding("utf-8");
ModTradeInfoBEAN mtib = (ModTradeInfoBEAN)request.getAttribute("mtib");
String [] reason = mtib.getMemo().split("ㅨ");
String []memo=reason[0].split(",");
%>
<title><%=memo[0] %> 정보</title>
</head>
<body>
<div>
<h3 align="center"><%=memo[0] %> 정보</h3>
	<table align="center">
		<tr>
			<td>상품명</td>
			<td colspan ="3"><%=mtib.getSubject() %></td>
		</tr>
		<tr>
			<td>색상</td>
			<td><%=mtib.getColor() %></td>
			<td>사이즈</td>
			<td><%=mtib.getSize() %></td>
			<td>
		</tr>
<%	if(memo[0].equals("교환")){%>
		<tr>
			<td>수량</td>
			<td><%=memo[1] %>개</td>
		</tr>
		<tr>
			<td colspan="4">교환 요청 사항</td>
		</tr>
		<tr>
			<td colspan="4"><%=reason[1].replace("\r\n", "<br>")%></td>
		</tr>
		
<%		if(mtib.getStatus()==3){%>
		<tr>
			<td colspan="4">판매자 코멘트 </td>
		</tr>
		<tr>
			<td colspan="4"><%=reason[2].replace("\r\n", "<br>")%></td>
		</tr>
	<%}
	}else{%>
		<tr>
			<td>수량</td>
			<td><%=memo[2] %></td>
		</tr>
		<tr>
			<td>환불 금액</td>
			<td><%=memo[3] %></td>
		</tr>
		<tr>
			<td>환불 방법</td>
			<td colspan="3"><%=memo[1] %></td>
		</tr>
		<%if(memo[1].equals("무통장 입금")){ %>
		<tr>
			<td>은행명</td>
			<td><%=memo[4] %></td>
			<td>예금주</td>
			<td><%=memo[5] %></td>
		</tr>
		<tr>
			<td>계좌</td>
			<td colspan="3"><%=memo[6] %></td>
		</tr>
		<%} %>
		<tr>
			<td>환불 사유</td>
		</tr>
		<tr>
			<td colspan="3"><%=reason[1].replace("\r\n", "<br>") %></td>
		</tr>
	<%
	}%>
	</table>

	<center><input type="button" value="닫기" onclick="window.close()"></center>
</div>
</body>
</html>