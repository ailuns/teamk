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
	TransNum_Insert_Reset();


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
		<form action="./Trans_Num_Insert_Action.ao" method="post" name="fr">
		<%
		if (ModList.size() != 0) {
			for(int i = 0; i < ModList.size(); i++){
				Vector v = ModList.get(i);		
				ModTradeInfoBEAN mtib = (ModTradeInfoBEAN)v.get(0);
				List<ModTradeInfoBEAN> mtbList = (List<ModTradeInfoBEAN>)v.get(1);
				
			if(mtbList.size()!=0){%>
			<input type="hidden" name="ti_num" value="<%=mtib.getTi_num()%>">
			<h3>주문 번호 : <%=mtib.getTi_num() %></h3>
				<h5>주문한 상품 목록</h5>
				<table border = "1">
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
				<%} %>
		<h5>배송지 정보<%=mtib.getTi_num() %></h5>
		<table border="1">
			<tr>
				<td><%=mtib.getName() %></td>
				<td><%=mtib.getMobile() %></td>
				<td><%="["+mtib.getPostcode()+"] "+mtib.getAddress1()+" "+mtib.getAddress2() %></td>
			</tr>
				<%if(mtib.getMemo().length()!=0){ %>
				<tr><td colspan="3"><%=mtib.getMemo() %></td></tr>
				<%} %>
			
		</table>
		<br>
		<%	
		}%>
		<input type ="submit" value="입력 완료">
		</form>
	<%
	}else{
		 %>
		 <div>무통장 입금 내역이 없습니다!</div>
	 <%}
		if (count != 0) {

			if (endpage > pcount)
				endpage = pcount;
			if (startp > pblock) {
	%><a href="./TransNum_Insert.ao?pageNum=<%=startp - 1%>">[이전]</a>
	<%
		}
			for (int i = startp; i <= endpage; i++) {
	%><a href="./TransNum_Insert.ao?pageNum=<%=i%>">[<%=i%>]
	</a>
	<%
		}
			if (endpage < pcount) {
	%><a href="./TransNum_Insert.ao?pageNum=<%=endpage + 1%>">[다음]</a>
	<%
		}
		}
		%>
	
	<input type = "button" value = "주문 관리" onclick="location.href='./AdminOrderList.ao'">
</body>
</html>