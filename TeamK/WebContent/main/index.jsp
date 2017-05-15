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
		<!--지도 들어갈 부분 -->
		<div id="map">
			<object type="image/svg+xml" data="./img/Map_of_South_Korea-blank.svg">Your browser does not support SVGs</object>
			<center>원하는 지역을 선택해주세요.</center>
		</div>
		<!--지도 들어갈 부분 -->
		
		<!--검색하는 부분 -->
		<div id="search">
			<form action="#" method="get" name="fr" id="search">
				<input type="text" name="keyword">
				<input type="submit" value="검색">
			</form>
		</div>
		<!--검색하는 부분 -->
		
		<!--클릭 시 메인 이동-->
<!-- 		<div id="main_go"><a href="#">들어가기</a></div> -->
		<!--클릭 시 메인 이동-->
		
		<!--로그인 & 회원가입-->
<!-- 		<div id="login_join"> -->
<!-- 			<a href="#" id="login">　로그인</a><a href="#" id="join">회원가입</a> -->
<!-- 		</div> -->
		<!--로그인 & 회원가입-->
		<div id="main_menu_box">
		<input type="button" value="　로그인" onclick="location.href='./MemberLogin.me'" class="login">
		<input type="button" value="들어가기" onclick="location.href='./main.bo'" class="enter">
		<input type="button" value="회원가입" onclick="location.href='./MemberJoin.me'" class="join">
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