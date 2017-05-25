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
<script src = "./js/jquery-3.2.0.js"></script>
<script type="text/javascript">

$(document).ready(function(){
	order_hide();
})
function order_view(i){
	order_hide();
	$('#order_select'+i).hide();
	$('#order_view'+i).show();
	$('#order_selected'+i).show();
}
function order_hide(){
	$('.order_selected').hide();
	$('.order_view').hide();
	$('.order_select').show();
}
function select_check(){
	if($("input[name='tich']:checked").length==0){
		alert("선택 된 주문이 없습니다!");
		return false;	
	}
}
function Trade_Info_Delete(){
	var tich = [];
	$("input[name='tich']:checked").each(function(i){
		tich.push($(this).val());
	})
	$.ajax({
		url:'./Trade_Info_Delete.ao',
		type:'post',
		data:{
			tich:tich,
		},success:function(){
			alert("삭제 완료");
			window.location.reload(true);
        }
	});
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
		%>
		<form action="./BankPayChecked.ao" method="post" name="fr" onsubmit="return select_check()">
		<%
		if(ModList.size()==0&&count!=0)response.sendRedirect("./BankPayCheck.ao");
		if (ModList.size() != 0) {
			for(int i = 0; i < ModList.size(); i++){
				Vector v = ModList.get(i);		
				ModTradeInfoBEAN mtib = (ModTradeInfoBEAN)v.get(0);
				List<ModTradeInfoBEAN> mpbList = (List<ModTradeInfoBEAN>)v.get(1);
				List<ModTradeInfoBEAN> mtbList = (List<ModTradeInfoBEAN>)v.get(2);
				
	%>
	
		<h3>주문 번호 : <%=mtib.getTi_num() %></h3>
		<h4>결제일 : <%=sdf.format(mtib.getTrade_date())%></h4>
		<table border="1">
			<tr>
				<td><input type = "checkbox" name ="tich" 
							value = "<%=mtib.getTi_num() %>"></td>
				<td><%=mtib.getPayer() %></td>
				<td><%=mtib.getTrade_type() %></td>
				<td><%=mtib.getTotal_cost() %>원</td>
				<td><%=sdf.format(mtib.getTrade_date()) %></td>
			</tr>
		</table>
		<span id="order_select<%=i%>" class="order_select"
			onclick = "order_view(<%=i%>)">주문 품목▼</span>
		<span id="order_selected<%=i%>" class="order_selected" onclick="order_hide()">주문 품목▲</span>
		<div id="order_view<%=i%>" class="order_view">
		<%if(mpbList.size()!=0){ %>
				<h5>주문한 여행 패키지 목록</h5>
				<table border = "1">
					<%for(int j =0; j< mpbList.size();j++){
						ModTradeInfoBEAN mpb = mpbList.get(j);
						String []pack_count = mpb.getPack_count().split(",");%>
					<tr onclick="location.href='#'">
						<td><%=mpb.getTrade_num() %></td>
						<td><%=mpb.getImg() %></td>
						<td><%=mpb.getSubject() %></td>
						<td><%=mpb.getIntro() %></td>
						<td>성인 : <%=pack_count[0] %>, 아동 : <%=pack_count[1] %></td>
						<td><%=mpb.getCost() %>원</td>
						<td><%if(mpb.getPo_receive_check()==1){ %>Yes
						<%}else{%>NO<%} %></td>
					</tr>						
					<%} %>
				</table>				
			<%} 
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
		</div>
		
		<br>
	<%	
			}
			%>
		<input type="submit" value="입금 확인  완료">
		<input type="button" value="주문 삭제" onclick="Trade_Info_Delete()"> 
	<%
	}else{
		 %>
		 <div>새로운 무통장 입금 내역이 없습니다!</div>
		 <%
	}
		%>
		</form>
		<%
	if (count != 0) {
		if (endpage > pcount)endpage = pcount;
		if (startp > pblock) {
	%><a href="./BankPayCheck.ao?pageNum=<%=startp - 1%>">[이전]</a>
	<%
		}
			for (int i = startp; i <= endpage; i++) {
	%><a href="./BankPayCheck.ao?pageNum=<%=i%>">[<%=i%>]
	</a>
	<%
		}
			if (endpage < pcount) {
	%><a href="./BankPayCheck.ao?pageNum=<%=endpage + 1%>">[다음]</a>
	<%
		}
	}
	%>
	
	<input type = "button" value = "주문 관리" onclick="location.href='./AdminOrderList.ao'">
</body>
</html>