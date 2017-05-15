<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script src="./js/jquery-3.2.0.js"></script>
<script type="text/javascript">
	jQuery(document).ready(function($){
		var OnOff = 1;
		$('#left_click').click(function(){
			if(OnOff == 1)  // 1일 때 나와서 메뉴 보인다
			{
				$('#left_menu').css('width', '200px');
				$('#logo_menu').css('margin-left', '0px');
				$('#left_click').css('margin-left', '200px');
				$('#menu_list').css('display', 'block');
				OnOff = 0;
			}
			else if(OnOff == 0) // 0일때 들어가서 메뉴 안보인다
			{
				$('#left_menu').css('width', '0px');
				$('#logo_menu').css('margin-left', '0px');
				$('#left_click').css('margin-left', '200px');
				$('#menu_list').css('display', 'none');
				OnOff = 1;
			}			
		});
	});
</script>
<link href="./css/inc.css" rel="stylesheet" type="text/css">
<link href="./css/subpage.css" rel="stylesheet" type="text/css">
	<div id="left_click">
		<span>M<br>E<br>N<br>U</span>
	</div>
	<div id="logo_menu">	
		<img alt="로고" src="./img/log3.png" width="200px" height="200px" onclick="location.href='./index.bo'"><br><br>
		<h3>공지사항</h3>
		<p><a href="#">Lorem ipsum dolor sit amet, consectetur adipiscing elit.
		Nunc sit amet ante purus. <span>/ 04-25-17</span></a></p>
		<p><a href="#">Lorem ipsum dolor sit amet, consectetur adipiscing elit.
		Nunc sit amet ante purus. <span>/ 04-25-17</span></a></p>
		<p><a href="#">Lorem ipsum dolor sit amet, consectetur adipiscing elit.
		Nunc sit amet ante purus. <span>/ 04-25-17</span></a></p>
		<p><a href="#">Lorem ipsum dolor sit amet, consectetur adipiscing elit.
		Nunc sit amet ante purus. <span>/ 04-25-17</span></a></p>
		<p><a href="#">Lorem ipsum dolor sit amet, consectetur adipiscing elit.
		Nunc sit amet ante purus. <span>/ 04-25-17</span></a></p>
	</div>
	<div id="left_menu">
		<ul id="menu_list">
			<li><a href="./main.bo">메인</a></li>
			<li><a href="./PackList.po">패키지</a></li>
			<li><a href="#">상품</a></li>
			<li><a href="./BoardList.bo">리뷰게시판</a></li>
			<li><a href="./BoardList2.bo">Q&amp;A</a></li>
		</ul>
	</div>