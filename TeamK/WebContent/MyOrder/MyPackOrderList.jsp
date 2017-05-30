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
<%
			request.setCharacterEncoding("utf-8");
			int pblock = ((Integer) request.getAttribute("pblock")).intValue();
			int endpage = ((Integer) request.getAttribute("endpage")).intValue();
			int startp = ((Integer) request.getAttribute("startp")).intValue();
			int pcount = ((Integer) request.getAttribute("pcount")).intValue();
			int count = ((Integer) request.getAttribute("count")).intValue();
			String pagenum = (String) request.getAttribute("pageNum");
			int pageNum = Integer.parseInt(pagenum);
			List<ModTradeInfoBEAN> ModPList = (List<ModTradeInfoBEAN>) request.getAttribute("ModPList");
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy년 MM월 dd일");
			String status = (String)request.getAttribute("status");	
			String status2 = (String)request.getAttribute("status2");%>
<link href="./css/inc.css" rel="stylesheet" type="text/css">
<link href="./css/subpage.css" rel="stylesheet" type="text/css">
<script src="./js/jquery-3.2.0.js"></script>
<script type="text/javascript">

$(document).ready(function(){
	$('#status').val('<%=status%>').attr('selected','selected');
	if("<%=status%>"=="completed"){
		$('#status2').find('option').remove();
		$('#status2').html("<option value='none'>전체</option>"+
				"<option value='completed'>진행 완료</option>"+
				"<option value='canceled'>취소 완료</option>");
		//$('#status2 option:eq[2]').val('canceled');
		//$('#status2 option:eq[2]').text('취소된 상품');
	}
	$('#status2').val('<%=status2%>').attr('selected','selected');
	$('#title').html($('#status option:selected').text()+
			" "+$('#status2 option:selected').text()+" 목록");
})
function insertPM(num){
	window.open('./PM_Insert.mo?num='+num, '여행자 정보 입력', 
			'left=200, top=100, width=600, height=640, scrollbars=yes, status=no,'+
			'resizable=no, fullscreen=no, channelmode=no,location=no');
}
function Res_Cancel(num){
	window.open('./Res_Cancel.mo?num='+num, '패키치 취소', 
			'left=200, top=100, width=600, height=400, scrollbars=yes, status=no,'+
			'resizable=no, fullscreen=no, channelmode=no,location=no');
}
function status_change(){
	location.href="./MyPackOrderList.mo?status="+$('#status').val();
}
function status_change2(){
	location.href="./MyPackOrderList.mo?status="+$('#status').val()+
			"&status2="+$('#status2').val();
}
</script>
</head>
<body>
	<!--왼쪽 메뉴 -->
	<div>
		<jsp:include page="../inc/leftMenu.jsp"></jsp:include>
	</div>
	<!--왼쪽 메뉴 -->
	<div id="wrap">

		
		<select id="status" onchange="status_change()">
			<option value="ing">현재 주문</option>
			<option value="completed">과거 주문</option>
		</select>
		<select id="status2" onchange="status_change2()">
			<option value="none">전체</option>
			<option value="confirmyet">예약 대기</option>
			<option value="confirm">예약 완료</option>
			<option value="canceling">예약 취소중</option>
		</select>
		<h3 id = "title"></h3>
		<div id = "list_view">
			
				<%
					if (ModPList.size() != 0) {
						for (int i = 0; i < ModPList.size(); i++) {
							ModTradeInfoBEAN mtib = ModPList.get(i);
							String[] pack_count = mtib.getPack_count().split(",");
				%>
				<h5><%=mtib.getSubject()%></h5>
				<table border="1">
					<tr onclick="location.href='#'">
						<td rowspan="2"><%=mtib.getImg()%></td>
						<td><%=mtib.getTrade_num()%></td>
						<td><%=sdf.format(mtib.getDate())%></td>
						<td><%=mtib.getIntro()%></td>
						<td>성인 : <%=pack_count[0]%>, 아동 : <%=pack_count[1]%></td>
						<td><%=mtib.getCost()%>원</td>
						<%if(status2.equals("none")){ %><td><%=mtib.getStatus_text()%></td><%} %>
					</tr>
					<%if(status.equals("ing")){
						if (mtib.getStatus() < 4) {
					%>
					<tr>
						<td><input type="button" value="여행자 정보 입력"
							onclick="insertPM(<%=mtib.getNum()%>)"></td>
						<%if(mtib.getStatus()>1){ %>
						<td><input type="button" value="예약 취소"
							onclick="Res_Cancel(<%=mtib.getNum()%>)"></td>
							<%} %>
						</tr>
					<%
						}
					}
					else if(mtib.getStatus()==9){
						String [] memo = mtib.getMemo().split(",");
					%>
					<tr>
						<td>환불 방식</td>
						<td><%=memo[0] %></td>
						<td>환불 금액</td>
						<td><%=memo[1] %>원</td>
					</tr>	
				<%} %>
				</table>
				<%
					}
					} else {
				%>

				주문 내역 없음
				<%
					}
				%>
			
			<%
			if (count != 0) {

				if (endpage > pcount)
					endpage = pcount;
				if (startp > pblock) {
		%><a href="./MyPackOrderList.mo?status=<%=status %>&status2=<%=status2 %>&pageNum=<%=startp - 1%>">[이전]</a>
		<%
			}
				for (int i = startp; i <= endpage; i++) {
		%><a href="./MyPackOrderList.mo?status=<%=status %>&status2=<%=status2 %>&pageNum=<%=i%>">[<%=i%>]
		</a>
		<%
			}
				if (endpage < pcount) {
		%><a href="./MyPackOrderList.mo?status=<%=status %>&status2=<%=status2 %>&pageNum=<%=endpage + 1%>">[다음]</a>
		<%
			}
			}
		%>
 
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