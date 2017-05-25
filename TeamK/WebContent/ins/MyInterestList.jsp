<%@page import="net.ins.db.interestBEAN"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<%
request.setCharacterEncoding("utf-8");
int []count = (int[])request.getAttribute("count");
List<interestBEAN> InterestPack = (List<interestBEAN>) request.getAttribute("InterestPack");
List<interestBEAN> InterestThing = (List<interestBEAN>) request.getAttribute("InterestThing"); %>
</head>
<body>
<div>
		<h3>패키지 찜 리스트</h3>
		<%
			if (InterestPack.size() == 0) {
		%>
		찜해둔 패키지가 없습니다!
		<%
			} else {
		%>
		<table border="1">
			<tr>
				<th>상품명</th>
				<th>가격</th>
				
				
			</tr>
			<%
				for (int i = 0; i < InterestPack.size(); i++) {
					interestBEAN inb = InterestPack.get(i);
			%>
			<tr>
				<td><%=inb.getSubject()%><br>
				<%=inb.getIntro() %></td>
				<td><%=inb.getCost()%></td>
				<td>
				<input type="button" value="찜 취소" onclick = "location.href='./MyInterestDel.ins?n=<%=inb.getInter_num()%>'"></td>
				</tr>
				

			<%
				}
			%>
		</table>
		<%if(count[0]>5); %><a href = "./MyInterest.ins?TY=P&pageNum=1">more+</a><%; %>
		<%
			}
		%>
	</div>
	<div>
		<h3>상품 찜 리스트</h3>
		<%
			if (InterestThing.size() == 0) {
		%>
		찜해둔 상품이 없습니다!
		<%
			} else {
		%>
		<table border="1">
			<tr>
				<th>상품명</th>
				<th>가격</th>
				
				
			</tr>
			<%
				for (int i = 0; i < InterestThing.size(); i++) {
						interestBEAN inb = InterestThing.get(i);
			%>
			<tr>
				<td><%=inb.getSubject()%></td>
				<td><%=inb.getCost()%><br>
				<%=inb.getIntro() %></td>
				<td>
				<input type="button" value="찜 취소" onclick = "location.href='./MyInterestDel.ins?n=<%=inb.getInter_num()%>'"></td>
			</tr>
			<%
				}
			%>
		</table>
		<%if(count[1]>5); %><a href = "./MyInterest.ins?TY=T&pageNum=1">more+</a><%; %>
		<%
			}
		%>
		<br><input type = "button" value = "내주문" onclick="location.href='./MyOrderList.mo'">
	</div>
</body>
</html>