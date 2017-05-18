<%@page import="net.member.db.MemberBean"%>
<%@page import="net.member.db.MemberDAO"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="./css/inc.css" rel="stylesheet" type="text/css">
<link href="./css/subpage.css" rel="stylesheet" type="text/css">
</head>
<body>
	<%
		String id = (String) session.getAttribute("id");
		if (id == null) {
			response.sendRedirect("./MemberLogin.me");
		}
	%>
	<!--왼쪽 메뉴 -->
	<div>
		<jsp:include page="../inc/leftMenu.jsp"></jsp:include>
	</div>
	<!--왼쪽 메뉴 -->
	<div id="wrap">
		<div id="member_head">
			<div id="member_title">로그인</div>
			<div id="member_script">로그인이 필요합니다.</div>
		</div>
		<div id="clear"></div>
		<div id="member">
			<div id="m_delete_form">
			<form action="./MemberDeleteAction.me" method="post" name="fr">
				<label for="id">아이디</label>
				<input type="text" name="id" id="id" value="<%=id%>"><br>
				<label for="pass">비밀번호</label>
				<input type="password" name="pass" id="pass"><br> 
				<input type="submit" value="회원탈퇴">
			</form>
			</div>
		</div>
	</div>
	<jsp:include page="../inc/footer.jsp"></jsp:include>
	<!--오른쪽 메뉴 -->
	<div>
		<jsp:include page="../inc/rightMenu.jsp"></jsp:include>
	</div>
	<!--오른쪽 메뉴 -->
</body>
</html>