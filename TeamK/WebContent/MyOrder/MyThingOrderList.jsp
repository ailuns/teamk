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
function receive_info_select(i){
	receive_info_hide();
	$('#receive_info_select'+i).hide();
	$('#receive_info_selected'+i).show();
	$('#receive_info'+i).show();
}
function receive_info_hide(){
	$(".receive_info_selected").hide();
	$(".receive_info").hide();
	$(".receive_info_select").show();
}	

function receive_change(i,ti_num){
	window.open('./Receive_Change.mo?num='+i+"&ti_num="+ti_num, '배송지 선택', 'left=200, top=100, width=480, height=640');
}
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
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		List<Vector> ModList = (List<Vector>) request.getAttribute("ModList");
		if (ModList != null) {
			for(int i = 0; i < ModList.size(); i++){
				Vector v = ModList.get(i);		
				ModTradeInfoBEAN mtib = (ModTradeInfoBEAN)v.get(0);
				List<ModTradeInfoBEAN> mtbList = (List<ModTradeInfoBEAN>)v.get(1);
				
	%>
	<div>
		<form>
			<h3>주문 번호 : <%=mtib.getTi_num() %></h3>
			<h4> 상태 : <%=mtib.getStatus_text() %></h4>
			<% 
			if(mtbList.size()!=0){%>
				<h5>주문한 상품 목록</h5>
				<table border = "1">
					<%for(int j =0; j< mtbList.size();j++){
						ModTradeInfoBEAN mtb = mtbList.get(j);%>
					<tr onclick="location.href='#'">
						<td><%=mtb.getTrade_num() %></td>
						<td><%=mtb.getImg() %></td>
						<td><%=mtb.getSubject() %></td>
						<td><%=mtb.getIntro() %></td>
						<td><%=mtb.getColor() %></td>
						<td><%=mtb.getSize() %></td>
						<td><%=mtb.getThing_count()%>개</td>
						<td><%=mtb.getCost() %>원</td>
					</tr>
					<%} %>
				</table>
				<%} %>
				<h5>결제 정보</h5>
				<table border ="1">
					<tr>
						<td><%=mtib.getTrade_type() %></td>
						<td><%=mtib.getPayer() %></td>
						<td><%=mtib.getStatus_text()%></td>
						<td><%=sdf.format(mtib.getTrade_date()) %></td>
						<td><%=mtib.getTotal_cost() %>원</td>
					</tr>
				</table>
				<h5><span class="receive_info_select" 
						id="receive_info_select<%=i %>" onclick ="receive_info_select(<%=i%>)">배송지 정보▼</span>
					<span class="receive_info_selected" 
						id="receive_info_selected<%=i %>"onclick ="receive_info_hide()" >배송지 정보▲</span></h5>
				<table class = "receive_info"
					id = "receive_info<%=i%>" border ="1">
					<tr>
						<td id="receive_name<%=i%>"><%=mtib.getName() %></td>
						<td id="receive_mobile<%=i%>"><%=mtib.getMobile() %></td>
						<td id="receive_addr<%=i%>">[<%=mtib.getPostcode() %>]
							<%=mtib.getAddress1() %> <%=mtib.getAddress2() %></td>
						<td id="receive_status<%=i%>"><%=mtib.getStatus_text()%></td>
						<%if(mtib.getStatus()<3){ %>
						<td id="receive_change<%=i %>">
							<input type= "button" value="배송지 변경" onclick = "receive_change(<%=i%>,<%=mtib.getTi_num()%>)"></td>
						<%} %>
						<%if(mtib.getMemo().length()!=0){ %><td id="receive_memo<%=i%>"><%=mtib.getMemo() %></td>
						<%} %>
					</tr>
				</table>
			</form>
		</div>
		
	<%		}	
		} else {
	%>
	주문 내역 없음
	<%
		}
	%>
	<%
		if (pageNum != 1) {
	%>
	<a href="./MyThingOrderList.mo?pageNum=<%=pageNum - 1%>">[이전 페이지]</a>
	<%
		;
		}
		if (count != 0) {

			if (endpage > pcount)
				endpage = pcount;
			if (startp > pblock) {
	%><a href="./MyThingOrderList.mo?pageNum=<%=startp - 1%>">[이전]</a>
	<%
		}
			for (int i = startp; i <= endpage; i++) {
	%><a href="./MyThingOrderList.mo?pageNum=<%=i%>">[<%=i%>]
	</a>
	<%
		}
			if (endpage < pcount) {
	%><a href="./MyThingOrderList.mo?pageNum=<%=endpage + 1%>">[다음]</a>
	<%
		}
		}
		if (pcount != pageNum) {
	%>
	<a href="./MyThingOrderList.mo?pageNum=<%=pageNum + 1%>">[다음 페이지]</a>
	<br>
	<%
		;
		}
	%>
	<input type="button" value="Main"
		onclick="location.href = './Main.bns'">
</body>
</html>