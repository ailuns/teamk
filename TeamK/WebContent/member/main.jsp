<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>TeamK 여행사</title>
</head>
<body>
	<h1>WebConTest/member/main.jsp</h1>
	<%
		String id = (String) session.getAttribute("id");
		if (id == null) {
			response.sendRedirect("./MemberLogin.me");
		}
	%>
	<%=id%>님이 로그인 하셨습니다.
	<br>
	<br>
	<br>
	<br>

	<input type="button" value="로그아웃"
		onclick="location.href='./MemberLogout.me'">
	<br>
	<br>
	<a href="./MemberInfo.me">회원정보조회</a>
	<br>
	<a href="./MemberUpdate.me">회원정보수정</a>
	<br>
	<a href="./MemberDelete.me">회원정보삭제</a>
	<br>
	<%
		if (id != null) {
			if (id.equals("admin")) {
	%><a href="./MemberList.me">회원목록</a>
	<br>
	<%
		}
		}
	%>



</body>
</html>