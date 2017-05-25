<%@page import="net.ins.db.interestBEAN"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		request.setCharacterEncoding("utf-8");
		int pblock = ((Integer) request.getAttribute("pblock")).intValue();
		String type = (String) request.getAttribute("type");
		int endpage = ((Integer) request.getAttribute("endpage")).intValue();
		int startp = ((Integer) request.getAttribute("startp")).intValue();
		int pcount = ((Integer) request.getAttribute("pcount")).intValue();
		int count = ((Integer) request.getAttribute("count")).intValue();
		String pagenum = (String) request.getAttribute("pageNum");
		int pageNum = Integer.parseInt(pagenum);
		String ty = (String) request.getAttribute("ty");
		List<interestBEAN> MyInterest = (List<interestBEAN>) request.getAttribute("MyInterest");
	%>

	<h1>
		<%=type%></h1>
	<h4>
		subject Count :
		<%=count%></h4>
	<table border="1">
		<tr>
			<th>Name</th>
			<th>Cost</th>
		</tr>
		<%
			for (int i = 0; i < MyInterest.size(); i++) {
				interestBEAN inb = MyInterest.get(i);
		%>
		<tr>
			<td><%=inb.getSubject()%><br> <%=inb.getIntro()%></td>
			<td><%=inb.getCost()%></td>
			<td><input type="button" value="찜 취소"
				onclick="location.href='./MyInterestDel.ins?n=<%=inb.getInter_num()%>'"></td>
		</tr>
		<%
			}
		%>
	</table>
	<input type="button" value="관심 리스트" onclick="location.href='./MyInterestList.ins'"><br>
	<%
		if (count != 0) {

			if (endpage > pcount)
				endpage = pcount;
			if (startp > pblock) {
	%><a href="./MyInterest.ins?pageNum=<%=startp - 1%>&TY=<%=ty%>">[이전]</a>
	<%
		}
			for (int i = startp; i <= endpage; i++) {
	%><a href="./MyInterest.ins?pageNum=<%=i%>&TY=<%=ty%>">[<%=i%>]
	</a>
	<%
		}
			if (endpage < pcount) {
	%><a href="./MyInterest.ins?pageNum=<%=endpage + 1%>&TY=<%=ty%>">[다음]</a>
	<%
		}
		} 
	%><br><input type = "button" value = "내주문" onclick="location.href='./MyOrderList.mo'">
</body>
</html>