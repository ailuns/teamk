
<%@page import="net.member.action.MemberList"%>
<%@page import="net.member.db.MemberBean"%>
<%@page import="net.member.db.MemberDAO"%>
<%@page import="java.util.List"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>TeamK 여행사</title>
</head>
<body>
	<h1>WebConTest/member/list.jsp</h1>
	<%
		String id = (String) session.getAttribute("id");

		if (id != null && !id.equals("admin")) {
			response.sendRedirect("./Main.me");
		}

		List memberList = (List) request.getAttribute("memberList");
	%>
	<table border="1">
		<tr>
			<td>아이디</td>
			<td>비밀번호</td>
			<td>이름</td>
			<td>가입일자</td>
			<td>나이</td>
			<td>성별</td>
			<td>이메일</td>
		</tr>
		<%
			for (int i = 0; i < memberList.size(); i++) {
				MemberBean mb = (MemberBean) memberList.get(i);
		%>
		<tr>
			<td><%=mb.getId()%></td>
			<td><%=mb.getPass()%></td>
			<td><%=mb.getName()%></td>
			<td><%=mb.getAddress1()%></td>
			<td><%=mb.getAddress2()%></td>
			<td><%=mb.getMobile()%></td>
			<td><%=mb.getEmail()%></td>
		</tr>

		<%
			}
		%>
	</table>

</body>
</html>