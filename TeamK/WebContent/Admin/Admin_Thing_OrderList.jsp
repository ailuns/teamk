<%@page import="net.mod.db.ModTradeInfoBEAN"%>
<%@page import="java.util.Vector"%>
<%@page import="java.util.List"%>
<%@page import="java.text.SimpleDateFormat"%>
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
		//String status = (String)request.getAttribute("status");
		//String status2 = (String)request.getAttribute("status2");
		int pageNum = Integer.parseInt(pagenum);
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		List<Vector> Thing_Order_List = (List<Vector>) request.getAttribute("Thing_Order_List");
		%>
<link href="./css/inc.css" rel="stylesheet" type="text/css">
<link href="./css/subpage.css" rel="stylesheet" type="text/css">
<script src = "./js/jquery-3.2.0.js"></script>
<script type="text/javascript">

$(document).ready(function(){
	<%-- if("<%=status%>"=="completed"){ --%>
		//$('select[name="status2"]').hide();
	/* } */
});
function Trans_Num_Insert(num){
	if($('#trans_num'+num).val().length==0){
		alert("송장 번호를 입력해 주세요");
		return false;
	}
	$('#Trans_Num_Insert_View'+num).hide();
	$('#Trans_No'+num).html($('#trans_num'+num).val());
	$('#Trans_Num_Fix'+num).show();
}
function TransNum_Insert_Reset(){
	$('.Trans_Num_Fix').hide();
	$('.Trans_Num_Insert_View').show();
}
function Trans_Num_Fix(num){
	$('#Trans_Num_Insert_View'+num).show();
	$('#Trans_Num_Fix'+num).hide();
	$('#trans_num'+num).select();
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
	<div id="article_head">
			<div id="article_title">Administrator Goods Order List</div>
			<div class="empty"></div>
			<div id="article_script"></div>
		</div>
		<div id="clear"></div>
		<article>
		<select name="status" onchange="status_change()">
			<option value="ing">현재 주문 리스트</option>
			<option value="completed">과거 주문 리스트</option>
		</select>
		<select name="status2" onchange="status2_change()">
			<option value="none">전체</option>
			<option value="bank">입금 확인 중</option>
			<option value="ready">배송 준비 중</option>
			<option value="sending">배송 중</option>
			<option value="arrived">배송 완료</option>
			<option value="exchange">교환 요청</option>
			<option value="cancel">환불 요청</option>
		</select>

		<form action="./Trans_Num_Insert_Action.ao" method="post" name="fr">
		<%
		if (Thing_Order_List.size() != 0) {
			for(int i = 0; i < Thing_Order_List.size(); i++){
				Vector v = Thing_Order_List.get(i);		
				ModTradeInfoBEAN mtib = (ModTradeInfoBEAN)v.get(0);
				List<ModTradeInfoBEAN> mtbList = (List<ModTradeInfoBEAN>)v.get(1);
				
			if(mtbList.size()!=0){%>
			<input type="hidden" name="ti_num" value="<%=mtib.getTi_num()%>">
			<h3>주문 번호 : <%=mtib.getTi_num() %></h3>
				<table border = "1">
				<tr>
					<td>받으시는 분</td>
					<td><%=mtib.getName() %></td>
					<td>연락처</td>
					<td><%=mtib.getMobile() %></td>
				</tr>
				<tr>
					<td>주소</td>
					<td colspan="7"><%="["+mtib.getPostcode()+"] "+mtib.getAddress1()+" "+mtib.getAddress2() %></td>
				</tr>
					<%if(mtib.getMemo().length()!=0){ %>
						<tr>
							<td>배송시 요청 사항</td>
							<td colspan="8"><%=mtib.getMemo().replace("\r\n", "<br>") %></td>
						</tr>
					<%} %>
					<%for(int j =0; j< mtbList.size();j++){
						ModTradeInfoBEAN mtb = mtbList.get(j);%>
					<tr>
					
						<td><%=mtb.getTrade_num() %>
							<input type = "hidden" name = "to_num" value="<%=mtb.getNum()%>"></td>
						<td><%=mtb.getImg() %></td>
						<td><%=mtb.getSubject() %></td>
						<td><%=mtb.getIntro() %></td>
						<td><%=mtb.getColor() %></td>
						<td><%=mtb.getSize() %></td>
						<td><%=mtb.getThing_count()%>개</td>
						<td><%=mtb.getCost() %>원</td>
						<td id="Trans_Num_Insert_View<%=mtb.getNum()%>" class= "Trans_Num_Insert_View">
							<input type = "text" placeholder="송장번호를 입력해 주세요" 
								name = "Trans_Num" id="trans_num<%=mtb.getNum()%>">
							<input type="button" value="입력" 
								onclick = "return Trans_Num_Insert(<%=mtb.getNum()%>)"></td>
						<td id="Trans_Num_Fix<%=mtb.getNum()%>" class= "Trans_Num_Fix">
							<span id="Trans_No<%=mtb.getNum()%>"></span>
							<input type = "Button" value="수정" 
								onclick="Trans_Num_Fix(<%=mtb.getNum()%>)">
							</td>
						</tr>
					<%} %>
				</table>
				<%} 
			}%>
		<input type ="button" value="입력 완료">
		
	<%
	}else{
		 %>
		 <div>주문 내역이 없습니다!</div>
	 <%}%>
	 </form>
	 <%
		if (count != 0) {
			if (endpage > pcount)endpage = pcount;
			if (startp > pblock){
	%><a href="./Admin_Thing_OrderList.ao?pageNum=<%=startp - 1%>">[이전]</a>
	<%
		}
			for (int i = startp; i <= endpage; i++) {
	%><a href="./Admin_Thing_OrderList.ao?pageNum=<%=i%>">[<%=i%>]
	</a>
	<%
		}
			if (endpage < pcount) {
	%><a href="./Admin_Thing_OrderList.ao?pageNum=<%=endpage + 1%>">[다음]</a>
	<%
		}
		}
		%>
	
	<br><input type = "button" value = "주문 관리" onclick="location.href='./AdminOrderList.ao'">
		</article>
		</div>
	<jsp:include page="../inc/footer.jsp"></jsp:include>
	<!--오른쪽 메뉴 -->
	<div>
		<jsp:include page="../inc/rightMenu.jsp"></jsp:include>
	</div>
	<!--오른쪽 메뉴 -->
</body>
</html>