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
function TransNum_Insert_Reset(){
	$('.Trans_Num_Fix').hide();
	$('.Trans_Num_View').show();
}
function Trans_Num_Fix(num){
	TransNum_Insert_Reset();
	
	$('#Trans_Num_View'+num).hide();
	$('#Trans_Num_Fix'+num).show();
	$('#Trans_Num'+num).select();
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
		<form action="./BankPayChecked.ao" method="post" name="fr">
		<%
		if (ModList.size() != 0) {
			for(int i = 0; i < ModList.size(); i++){
				Vector v = ModList.get(i);		
				ModTradeInfoBEAN mtib = (ModTradeInfoBEAN)v.get(0);
				List<ModTradeInfoBEAN> mtbList = (List<ModTradeInfoBEAN>)v.get(1);
				
			if(mtbList.size()!=0){%>
			<h3>주문 번호 : <%=mtib.getTi_num() %></h3>
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
						<%if(mtb.getTrans_num().length()!=0){ %>
							<td id="Trans_Num_View<%=mtb.getNum()%>" class= "Trans_Num_View">
								<%=mtb.getTrans_num() %>
								<input type="button" value="수정" onclick="Trans_Num_Fix(<%=mtb.getNum()%>)"></td>
							<td id="Trans_Num_Fix<%=mtb.getNum()%>" class= "Trans_Num_Fix">
								<input type = "text" value="<%=mtb.getTrans_num() %>"
									id="Trans_Num<%=mtb.getNum()%>">
								<input type = "Button" value="변경" 
									onclick="Trans_Num_Insert(<%=mtb.getNum()%>)">
								<input type ="Button" value="취소"
									onclick="TransNum_Insert_Reset()">
							</td>
						<%}else{%>
							<td><input type = "text" placeholder="송장번호를 입력해 주세요" 
								id="trans_num<%=mtb.getNum()%>">
							<input type="button" value="입력" onclick = "Trans_Num_Insert(<%=mtb.getNum()%>)"></td>
						<%} %>
					</tr>
					<%} %>
				</table>
				<%} %>
		<h5>배송지 정보</h5>
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
			}
			%>
		<input type="button" value="발송" onclick="BankPayCheck()"> 
	<%
	}else{
		 %>
		 <div>무통장 입금 내역이 없습니다!</div>
		 <%
	}
		%>
		</form>
		<%
		if (pageNum != 1) {
	%>
	<a href="./BankPayCheck.ao?pageNum=<%=pageNum - 1%>">[이전 페이지]</a>
	<%
		;
		}
		if (count != 0) {

			if (endpage > pcount)
				endpage = pcount;
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
		if (pcount != pageNum&&count!=0) {
	%>
	<a href="./BankPayCheck.ao?pageNum=<%=pageNum + 1%>">[다음 페이지]</a>
	<br>
	<%
		;
		}
	%>
	
	<input type="button" value="Main"
		onclick="location.href = './Main.bns'">
</body>
</html>