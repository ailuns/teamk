<%@page import="net.board.db.BoardBean"%>
<%@page import="java.util.List"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="net.board.db.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link href="./css/inc.css" rel="stylesheet" type="text/css">
<link href="./css/subpage.css" rel="stylesheet" type="text/css">
<header>
	<img alt="로고" src="./img/log3.png" onclick="location.href='./index.fo'">
	<nav id="left_menu">
		<ul id="menu_list">
			<li id="home"><a href="./main.fo">메인</a></li>
			<li id="pack"><a href="./PackList.po">패키지</a></li>
			<li id="shop"><a href="./Productlist.bo">상품</a></li>
			<li id="rvw"><a href="./BoardList.bo">리뷰</a></li>
			<li id="qna"><a href="./BoardList2.bo">Q&amp;A</a></li>
			<li id="notice"><a href="./BoardList3.bo">공지사항</a></li>
		</ul>
		<div class="clear"></div>
		<!-- All icons by Adrien Coquet from the Noun Project -->
	</nav>
	<div class="clear"></div>
</header>
