<%@page import="net.board.db.BoardDAO"%>
<%@page import="net.board.db.BoardBean"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="../css/inc.css" rel="stylesheet" type="text/css">
<link href="../css/subpage.css" rel="stylesheet" type="text/css">
</head>
<body>
<%
System.out.println("Listsearch3 execute()");
List boardList3=(List)request.getAttribute("boardList3");
String pageNum=(String)request.getAttribute("pageNum");
int count=((Integer)request.getAttribute("count")).intValue();
int pageCount=((Integer)request.getAttribute("pageCount")).intValue();
int pageBlock=((Integer)request.getAttribute("pageBlock")).intValue();
int startPage=((Integer)request.getAttribute("startPage")).intValue();
int endPage=((Integer)request.getAttribute("endPage")).intValue();
String ss = (String)request.getAttribute("ss");

String search=request.getParameter("search");

BoardDAO bdao = new BoardDAO();
%>
<script type="text/javascript" src="./js/jquery-3.2.0.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	$('#selectSearch').val('<%=ss%>').attr('selected', 'selected');
})
</script>
	<!--왼쪽 메뉴 -->
	<div>
		<jsp:include page="../inc/leftMenu.jsp"></jsp:include>
	</div>
	<!--왼쪽 메뉴 -->
	<div id="wrap">
		<div id="board_head">
			<div id="qna_title">공지사항</div>
			<div id="qna_script">공지사항 게시판 입니다.<br>[검색된 글의 개수 :<%=count%>]</div>
		</div>
		<div id="clear"></div>
		<div id="board">
		<div id="board_list">
<table>
<tr><td>번호</td><td>제목</td><td>ID</td><td>날짜</td><td>조회수</td></tr>
    <%
    for(int i=0; i<boardList3.size(); i++){
    	//자바빈(BoardBean) 변수 =배열한칸 접근  배열변수.get()
    	BoardBean bb = (BoardBean)boardList3.get(i);
    			%>
<tr><td><%=bb.getRe_ref()%></td>
<td>
<a href="./BoardContent3.bo?num=<%=bb.getNum()%>&pageNum=<%=pageNum%>">
<%=bb.getSubject()%>[<%=bdao.getBoardReplyCount(bb.getNum())%>]</a></td>
<td><%=bb.getId()%></td><td><%=bb.getDate() %></td>
    <td><%=bb.getReadcount() %></td></tr>
    			<%
    }
    %>
</table>
<%
//페이지 출력
if(count!=0){
	//전체 페이지 수 구하기 게시판 글 50개 한화면에 보여줄 글 개수 10 => 5전체페이지
			//    게시판 글 56개 한화면에 보여줄 글개수 10 =>  5전체페이지 +1 (나머지)=>6		
	// 한 화면에 보여줄 페이지 번호 개수
	// 시작페이지 번호구하기  1~10=>1  11~20=>11  21~30=>21
	// 끝페이지 번호 구하기  
	//이전
	if(startPage>pageBlock){
		%><a href="./listSearch3.bo?pageNum=<%=startPage-pageBlock%>&search=<%=search%>">[이전]</a><%
	}
	// 1..10 11..20 21..30
	for(int i=startPage; i<=endPage; i++){
		%><a href="./listSearch3.bo?pageNum=<%=i%>&search=<%=search%>">[<%=i%>]</a><%
	}
	// 다음
	if(endPage < pageCount){
		%><a href="./listSearch3.bo?pageNum=<%=startPage+pageBlock%>&selectSearch=<%=ss%>&search=<%=search%>">[다음]</a>
		<%
		}
}
%><br>
<form action="listSearch3.bo" method="get">
<select name="selectSearch" id="selectSearch">
    <option value="subject">제목</option>
    <option value="content">내용</option>
</select>
<input type="text" name="search" class="input_box">
<input type="submit" value="검색" class="btn">
</form>
<%
String id = (String)session.getAttribute("id");
if(id!=null){%>
<input type="button" value="글쓰기" 
       onclick="location.href='./BoardWrite3.bo'">
    		<%}else{%>
    			<input type="button" value="글쓰기" 
    				   onclick="alert('로그인 해주세요')">
    		<%} %>
<input type="button" value="메인으로" 
       onclick="location.href='./main.fo0'">
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