<%@page import="net.board.db.BoardBean"%>
<%@page import="java.util.List"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="net.board.db.BoardDAO"%>
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
		<img alt="로고" src="./img/log3.png" width="200px" height="200px" onclick="location.href='./index.fo'"><br><br>
		<h3><a href="./BoardList3.bo">공지사항</a></h3>
	
				<%
BoardDAO bdao=new BoardDAO();

int count=bdao.getBoardCount();
SimpleDateFormat sdf=new SimpleDateFormat("yyyy.MM.dd");
if(count!=0){
	List<BoardBean> boardList= bdao.getBoardList3(1, 10);
	for(int i=0;i<boardList.size();i++){
		BoardBean bb=boardList.get(i);
		%>
<p><a href="./BoardContent3.bo?num=<%=bb.getNum()%>&pageNum=1"><%=bb.getSubject()%><span><%=sdf.format(bb.getDate())%></span></a></p>	
		<%
	}
}
%>
	</div>
	<div id="left_menu">
		<ul id="menu_list">
			<a href="./main.fo"><li id="home">메인</li></a>
			<a href="./PackList.po"><li id="pack">패키지</li></a>
			<a href="./Productlist.bo"><li id="shop">상품</li></a>
			<a href="./BoardList.bo"><li id="rvw">리뷰게시판</li></a>
			<a href="./BoardList2.bo"><li id="qna">Q&amp;A</li></a>
		</ul>
		<!-- All icons by Adrien Coquet from the Noun Project -->
	</div>