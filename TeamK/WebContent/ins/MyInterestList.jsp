<%@page import="net.ins.db.interestBEAN"%>
<%@page import="java.util.List"%>
<%@ page import="java.text.DecimalFormat" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="./css/inc.css" rel="stylesheet" type="text/css">
<link href="./css/subpage.css" rel="stylesheet" type="text/css">
<%
request.setCharacterEncoding("utf-8");
int []count = (int[])request.getAttribute("count");
List<interestBEAN> InterestPack = (List<interestBEAN>) request.getAttribute("InterestPack");
List<interestBEAN> InterestThing = (List<interestBEAN>) request.getAttribute("InterestThing"); %>
</head>
<body>
	<!--왼쪽 메뉴 -->
	<div>
		<jsp:include page="../inc/leftMenu.jsp"></jsp:include>
	</div>
	<!--왼쪽 메뉴 -->
	<div id="wrap">
<div id="article_head">
<div id="article_title">
	찜 리스트
</div>
</div>
<article>
		<h3>패키지 찜 리스트</h3>
		<div id="board">
		<div id="board_list">
		<%
			if (InterestPack.size() == 0) {
		%>
		찜해둔 패키지가 없습니다!
		<%
			} else {
		%>
		<table>
			<tr>
				<th id="num">상품명</th>
				<th id="num">가격</th>
				<th id="num"></th>
				
				
			</tr>
			<%
				for (int i = 0; i < InterestPack.size(); i++) {
					interestBEAN inb = InterestPack.get(i);
					DecimalFormat Commas = new DecimalFormat("#,###");
					String cost = (String)Commas.format(inb.getCost());
			%>
			<tr>
				<td><%=inb.getSubject()%><br>
				<%=inb.getIntro() %></td>
				<td><%=cost%></td>
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
	</div>
	<div>
		<h3>상품 찜 리스트</h3>
		<div id="board">
		<div id="board_list">
		<%
			if (InterestThing.size() == 0) {
		%>
		찜해둔 상품이 없습니다!
		<%
			} else {
		%>
		<table>
			<tr>
				<th id="num">상품명</th>
				<th id="num">가격</th>
				
				
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
		</div>
		</div>
		<br>
	
		
		</div>
		</article>
		</div>
	<jsp:include page="../inc/footer.jsp"></jsp:include>
	<!--오른쪽 메뉴 -->
	<div>
		<jsp:include page="../inc/rightMenu.jsp"></jsp:include>
	</div>
	<!--오른쪽 메뉴 -->
</body>
</html>