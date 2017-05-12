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
	<!--왼쪽 메뉴 -->
	<div>
		<jsp:include page="../inc/leftMenu.jsp"></jsp:include>
	</div>
	<!--왼쪽 메뉴 -->
	<div id="wrap">
		<div id="member_head">
			<div id="member_title">ID 찾기</div>
			<div id="member_script">입력하신 정보로 회원님의 ID를 찾습니다.</div>
		</div>
		<div id="clear"></div>
		<div id="member">
			<div id="findid_form">
				<form action="./MemberFindIdAction.me" method="post">
					<label for="id">이름</label><input type="text" name="name" id="id"><br>
					<label for="email">이메일</label><input type="text" name="email" id="email"><br>
					<input type="submit" value="확인">
					<input type="button" value="돌아가기" onclick="history.back()">
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