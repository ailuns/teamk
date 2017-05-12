<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="net.member.db.*"%>
<%@ page import="java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="./css/default.css" rel="stylesheet" type="text/css">
<link href="./css/subpage.css" rel="stylesheet" type="text/css">
</head>
<script type="text/javascript">
function check() {
	reg=confirm("로그인이 필요한 서비스입니다.\n로그인창으로 이동하시겠습니까?")
	if(reg== true){
		location.href="../member/login.jsp";
	}else{
			return false;
		}
	
}
</script>
<body>
	<%
		request.setCharacterEncoding("utf-8");
		ProductBean pb = new ProductBean();
		ProductDAO pdao = new ProductDAO();
		CategoryBean cb = new CategoryBean();
		CategoryDAO cdao = new CategoryDAO();
		List productList2 = (List) request.getAttribute("productList2");
		//디비 객체 생성 BoardDAO bdao
		// int count = getBoardCount() 메서드호출 count(*)
		int count = (int) request.getAttribute("count");
		int pageSize = (int) request.getAttribute("pageSize");
		String pageNum = (String) request.getAttribute("pageNum");
		int startRow = (int) request.getAttribute("startRow");
		int endRow = (int) request.getAttribute("endRow");
		List productList = (List) request.getAttribute("productList");
		int pageCount = (int) request.getAttribute("pageCount");
		int pageBlock = (int) request.getAttribute("pageBlock");
		int startPage = (int) request.getAttribute("startPage");
		int endPage = (int) request.getAttribute("endPage");
	%>
	<%
		//String id = (String) session.getAttribute("id");
		String id = "admin";
		//객체 생성
		//게시판의 글의 개수
	%>
	<div id="wrap">
		<!-- 헤더들어가는 곳 -->
		<!-- 헤더들어가는 곳 -->

		<!-- 본문들어가는 곳 -->
		<!-- 메인이미지 -->
		<div id="sub_img_center"></div>
		<!-- 메인이미지 -->

		<!-- 왼쪽메뉴 -->
		<nav id="sub_menu">
		<ul>
			<%
				for (int i = 0; i < productList2.size(); i++) {

					cb = (CategoryBean) productList2.get(i);
			%>
			<li><a href="./Productlist.bo?car_num=<%=cb.getCanum()%>"><%=cb.getCaname()%></a></li>
			<%
				}
			%>

		</ul>
		</nav>
		<!-- 왼쪽메뉴 -->

		<!-- 게시판 -->
		<article> <%
 	
 %>
		<h1>Gallery</h1>
		<table id="notice">
			<%
				if (count == 0) {
			%><tr>
				<td class="left" colspan="5"><center>게시한 글이없습니다.</center></td>
			</tr>
			<%
				} else {
			%>
			<%
				for (int i = 0; i < productList.size(); i++) {

						pb = (ProductBean) productList.get(i);
			%>

			<td class="center"><a
				href="./ProductContent.bo?num=<%=pb.getNum()%>&pageNum=<%=pageNum%>&car_num=<%=pb.getCar_num()%>">
					<img src="./upload/<%=pb.getImg().split(",")[0]%>" id="gl"
					style="width: 150px;"><br> <%=pb.getSubject()%><br>
			</a> <%=pb.getCost()%>원</td>

			<%
				if (i == 2 || i == 5) {
			%>
			<tr>

			</tr>
			<%
				}
			%>

			<%
				}
			%>
			<%
				}
			%>
		</table>

		<div id="table_search">
			<%
				if (id == "admin") {
			%>
			<input type="button" value="글쓰기" class="write"
				onclick=<%if (id != null) {%> "location.href='./ProductWrite.bo'
				"<%} else {%>"return check()"<%}%>>
			<%
				}
			%>
			<form action="noticeSearch.jsp" method="get">
				<input type="submit" value="search" class="btn"> <input
					type="text" name="search" class="input_box">

			</form>
		</div>
		<div class="clear"></div>
		<div id="page_control">
			<%
				if (count != 0) {
					//전체 페이지수 구하기 게시판 글 50개 한화면에 보여줄 줄개수 10 = > 5전체페이지
					if (endPage > pageCount) {
						endPage = pageCount;
					}
					//이전
					if (startPage > pageBlock) {
			%><a href="./BoardList.bo?pageNum=<%=startPage - pageBlock%>">[이전]</a>
			<%
				}
					//1..10
					for (int i = startPage; i <= endPage; i++) {
			%><a href="./BoardList.bo?pageNum=<%=i%>">[<%=i%>]
			</a>
			<%
				}
					// 다음
					if (endPage < pageCount) {
			%><a href="./BoardList.bo?pageNum=<%=startPage + pageBlock%>">[다음]</a>
			<%
				}
				}
			%>
		</div>
		</article>
		<!-- 게시판 -->
		<!-- 본문들어가는 곳 -->
		<div class="clear"></div>
		<!-- 푸터들어가는 곳 -->
		<!-- 푸터들어가는 곳 -->
	</div>
</body>
</html>