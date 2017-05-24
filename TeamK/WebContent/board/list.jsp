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
List boardList=(List)request.getAttribute("boardList");
String pageNum=(String)request.getAttribute("pageNum");
int count=((Integer)request.getAttribute("count")).intValue();
int pageCount=((Integer)request.getAttribute("pageCount")).intValue();
int pageBlock=((Integer)request.getAttribute("pageBlock")).intValue();
int startPage=((Integer)request.getAttribute("startPage")).intValue();
int endPage=((Integer)request.getAttribute("endPage")).intValue();

BoardDAO bdao = new BoardDAO();
%>
	<!--왼쪽 메뉴 -->
	<div>
		<jsp:include page="../inc/leftMenu.jsp"></jsp:include>
	</div>
	<!--왼쪽 메뉴 -->
	<div id="wrap">
		<div id="board_head">
			<div id="rvw_title">리뷰</div>
			<div id="rvw_script">물건이나 여행 후기를 쓰는 곳 입니다.<br>[전체글 개수 :<%=count%>]</div>
		</div>
		<div id="clear"></div>
		<div id="board">
		<div id="board_list">
<table>
<tr><th id="num">번호</th><th id="cate">분류</th><th id="title">제목</th><th id="name">작성자</th><th id="date">날짜</th><th id="readcount">조회수</th></tr>
    <%
    for(int i=0; i<boardList.size(); i++){
    	//자바빈(BoardBean) 변수 =배열한칸 접근  배열변수.get()
    	BoardBean bb = (BoardBean)boardList.get(i);
    			%>
<tr><td><%=bb.getRe_ref()%></td><td id="cate">[<%=bb.getType_select()%>]</td>
<td id="title">
<a href="./BoardContent.bo?num=<%=bb.getNum()%>&pageNum=<%=pageNum%>">
<%=bb.getSubject()%> [<%=bdao.getBoardReplyCount(bb.getNum())%>]</a><%if(bdao.getFile(bb.getNum())!=null){%><img src="./img/File_icon.gif" width="15" height="15>"><%}%></td>
<td><%=bb.getId()%></td><td><%=bb.getDate()%></td>
    <td><%=bb.getReadcount() %></td></tr>
    			<%
    }
    %>
</table>
<%
//페이지 출력
if(count!=0){

	if(startPage>pageBlock){
		%><a href="./BoardList.bo?pageNum=<%=startPage-pageBlock%>">[이전]</a><%
	}

	for(int i=startPage; i<=endPage; i++){
		%><a href="./BoardList.bo?pageNum=<%=i%>">[<%=i%>]</a><%
	}

	if(endPage < pageCount){
		%><a href="./BoardList.bo?pageNum=<%=startPage+pageBlock%>">[다음]</a>
		<%
		}
}
%><br>
<form action="listSearch.bo" method="get">
<select name="selectSearch">
    <option value="id">작성자</option>
    <option value="subject">제목</option>
    <option value="content">내용</option>
    <option value="type_select">분류</option>
</select>

<input type="text" name="search" class="input_box">
<input type="submit" value="검색" class="btn">
</form>
<%
String id = (String)session.getAttribute("id");
if(id!=null){%>
<input type="button" value="글쓰기" 
       onclick="location.href='./BoardWrite.bo'">
    		<%}else{%>
    			<input type="button" value="글쓰기" 
    				   onclick="alert('로그인 해주세요')">
    		<%} %>
<input type="button" value="메인으로" 
       onclick="location.href='./main.fo'">
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