<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link href="./css/inc.css" rel="stylesheet" type="text/css">
<link href="./css/subpage.css" rel="stylesheet" type="text/css">
<div id="submenu">
	<ul>
		<%
		String id = (String)session.getAttribute("id");
		System.out.print(id);
		if(id==null || id==""){
		%>
		<li><a href="./MemberLogin.me">로그인</a></li>
		<li><a href="./MemberJoin.me">회원가입</a></li>
		<%}else if(id!=null || id!=""){%>
		<li><a href="./MemberLogout.me">로그아웃</a></li>
		<li><a href="./MemberInfo.me">회원정보</a></li>
		<li><a href="./MyOrderList.mo">내 주문 현황</a></li>
		<%if(id.equals("admin")){%>
			<li><a href="./AdminOrderList.ao">고객 주문 관리</a></li>
		<%}
		}
		 %>
<!-- 		<li><a href="#">언어설정</a></li> -->
	</ul>
	<embed height="250px" width="150px" src="http://www.gagalive.kr/livechat1.swf?chatroom=~~~new_TeamK"></embed>
</div>