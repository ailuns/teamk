<%@page import="java.util.ArrayList"%>
<%@page import="net.mod.db.ModTradeInfoBEAN"%>
<%@page import="com.sun.org.apache.xpath.internal.operations.Mod"%>
<%@page import="java.util.Vector"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src = "./js/jquery-3.2.0.js"></script>
<script type="text/javascript">

$(document).ready(function(){
	receive_info_hide();
})

</script>
</head>
<body>

	<%	
		request.setCharacterEncoding("utf-8");
		int pblock = ((Integer) request.getAttribute("pblock")).intValue();
		int endpage = ((Integer) request.getAttribute("endpage")).intValue();
		int startp = ((Integer) request.getAttribute("startp")).intValue();
		int pcount = ((Integer) request.getAttribute("pcount")).intValue();
		int count = ((Integer) request.getAttribute("count")).intValue();
		String pagenum = (String) request.getAttribute("pageNum");
		int pageNum = Integer.parseInt(pagenum);
		List<ModTradeInfoBEAN> ModPList = (List<ModTradeInfoBEAN>)request.getAttribute("ModPList");
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy년 MM월 dd일");
				
	%>
	<div>
		<form>
			<%if(ModPList.size()!=0){
				for(int i =0; i< ModPList.size();i++){
					ModTradeInfoBEAN mpb = ModPList.get(i);
					String []pack_count = mpb.getPack_count().split(",");%>
				<h5><%=mpb.getSubject() %></h5>
				<table border = "1">
					<tr onclick="location.href='#'">
						<td rowspan = "2"><%=mpb.getImg() %></td>
						<td><%=mpb.getTrade_num() %></td>
						<td><%=sdf.format(mpb.getDate()) %></td>
						<td><%=mpb.getIntro() %></td>
						<td>성인 : <%=pack_count[0] %>, 아동 : <%=pack_count[1] %></td>
						<td><%=mpb.getCost() %>원</td>
					</tr>
					<tr>
						<td><input type = "button" value = "여행자 정보 입력" onclick="insertPM"></td>
						<td><input type = "button" value = "예약 취소"></td>
					</tr>						
				</table>
				<%}
				}else {%>
					
		주문 내역 없음
		<%
			}
		%>
			</form>				
		
	</div>
	<%
		if (pageNum != 1) {
	%>
	<a href="./MyPackOrderList.mo?pageNum=<%=pageNum - 1%>">[이전 페이지]</a>
	<%
		;
		}
		if (count != 0) {

			if (endpage > pcount)
				endpage = pcount;
			if (startp > pblock) {
	%><a href="./MyPackOrderList.mo?pageNum=<%=startp - 1%>">[이전]</a>
	<%
		}
			for (int i = startp; i <= endpage; i++) {
	%><a href="./MyPackOrderList.mo?pageNum=<%=i%>">[<%=i%>]
	</a>
	<%
		}
			if (endpage < pcount) {
	%><a href="./MyPackOrderList.mo?pageNum=<%=endpage + 1%>">[다음]</a>
	<%
		}
		}
		if (pcount != pageNum) {
	%>
	<a href="./MyPackOrderList.mo?pageNum=<%=pageNum + 1%>">[다음 페이지]</a>
	<br>
	<%
		;
		}
	%>
	<input type="button" value="Main"
		onclick="location.href = './Main.bns'">
</body>
</html>