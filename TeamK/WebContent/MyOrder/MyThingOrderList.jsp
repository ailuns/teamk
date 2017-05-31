<%@page import="java.text.DecimalFormat"%>
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
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		List<Vector> ModList = (List<Vector>) request.getAttribute("ModList");
		String status = (String)request.getAttribute("status");	
%>
<link href="./css/inc.css" rel="stylesheet" type="text/css">
<link href="./css/subpage.css" rel="stylesheet" type="text/css">
<script src = "./js/jquery-3.2.0.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	$('#status').val('<%=status%>').attr('selected','selected');
})
function complet(num, ti_num){
	if(confirm('구매를 완료하시겠습니까?')){
		$.ajax({
	        type:"post",
	        url:"./TO_Status_Update.mo",
	        data:{
	           num:num,
	           status:10,
	           ti_num:ti_num
	        },
	        success:function(){
	            window.location.reload(true);
	        }
	     });
	}
}
function receive_change(i,ti_num){
	window.open('./Receive_Change.mo?num='+i+"&ti_num="+ti_num, '배송지 선택', 'left=200, top=100, width=480, height=640');
}
function status_change(){
	location.href="./MyThingOrderList.mo?status="+$('#status').val();
}
function thing_exchange(num, ti_num){
	window.open("./TO_Cancel_or_Exchange.mo?num="+num+"&ti_num="+ti_num,''
			,'left=200, top=100, width=600, height=640');
}
function Trade_Update_Info(o_num) {
	window.open("./TO_Cancel_or_Exchange.mo?num="+o_num,''
			,'left=200, top=100, width=600, height=640');
}
</script>
<style type="text/css">
.update_info:HOVER {
 cursor: pointer;
 color: red;
}
</style>
</head>
<body>
	<!--왼쪽 메뉴 -->
	<div>
		<jsp:include page="../inc/leftMenu.jsp"></jsp:include>
	</div>
	<!--왼쪽 메뉴 -->
	<div id="wrap">
	<select id ="status" onchange="status_change()">
		<option value="ing">구매 중인 상품</option>
		<option value="completed">지난 주문 상품</option>
	</select>
	<%
			if (ModList.size() !=0) {
				for(int i = 0; i < ModList.size(); i++){
					Vector v = ModList.get(i);		
					ModTradeInfoBEAN mtib = (ModTradeInfoBEAN)v.get(0);
					List<ModTradeInfoBEAN> mtbList = (List<ModTradeInfoBEAN>)v.get(1); %>
	<div>
		<h4 align="left">주문 번호 : <%=mtib.getTi_num() %></h4>
		<table border = "1">
			<%for(int j =0; j< mtbList.size();j++){
				ModTradeInfoBEAN mtb = mtbList.get(j);
				DecimalFormat Commas = new DecimalFormat("#,###");
				String cost = (String)Commas.format(mtb.getCost());
				
				%>
				<tr>
					<td><%=mtb.getImg() %></td>
					<td><%=mtb.getSubject() %><br>
						<%=mtb.getIntro() %></td>
					<td><%=mtb.getColor() %>, <%=mtb.getSize() %></td>
					<td><%=mtb.getThing_count()%>개</td>
					<td><%=cost%>원</td>
					<td><%
					//교환 상품 배송중일때 배송정보 조회 가능하게 링크
						if(mtb.getStatus()==3){
							if(mtb.getMemo().length()!=0){%>
								<span class="update_info" onclick="Trade_Update_Info()" >교환 배송 중</span>
						<%}else out.print(mtb.getStatus_text());
						}else if(mtb.getStatus()==9){//환불 조건 찾기
							String [] memoar = mtb.getMemo().split(":");
							String[]paybackinfo = memoar[0].split(",");
									//일부만 환불 되었을 경우
							if((mtb.getThing_count()-Integer.parseInt(paybackinfo[2]))!=0){%>
								구매 완료<br>
								<span style="font-size:12px;" class="update_info" 
									onclick="Trade_Update_Info(<%=mtb.getNum() %>)" >
									일부 환불 처리</span>
							<%}else out.print(mtb.getStatus_text());
						}else if(mtb.getStatus()==5||mtb.getStatus()==6){
							
							%><span class="update_info" 
									onclick="Trade_Update_Info(<%=mtb.getNum() %>)" >
									<%=mtb.getStatus_text() %></span>
					<%}else out.print(mtb.getStatus_text());
					if(mtb.getStatus()==3){ %></td>
					<td>송장번호<br><%=mtb.getTrans_num() %><%} %></td>
					<%if(mtb.getStatus()==4){ %>
					<td>
						<input type="button" value="구매 완료" 
							onclick="complet(<%=mtb.getNum()%>,<%=mtib.getTi_num()%>)"><br>
						<input type="button" value="교환 및 환불" onclick="thing_exchange(<%=mtb.getNum()%>,<%=mtib.getTi_num()%>)">
					</td>
					<%} %>
				</tr>
				<%} 
			DecimalFormat Commas = new DecimalFormat("#,###");
			String Total_cost = (String)Commas.format(mtib.getTotal_cost());
				%>
				<tr>
					<td>주문 정보 </td>
					<td id="receive_name<%=i%>"><%=mtib.getName() %></td>
					<td id="receive_mobile<%=i%>"><%=mtib.getMobile() %></td>
					<td><%=sdf.format(mtib.getTrade_date()) %></td>
				</tr>
				<tr>
					<td>배송지</td>
					<td id="receive_addr<%=i%>" colspan="6">[<%=mtib.getPostcode() %>]
						<%=mtib.getAddress1() %> <%=mtib.getAddress2() %></td>
					<%if(mtib.getStatus()<3){ %>
					<td id="receive_change<%=i %>">
						<input type= "button" value="배송지 변경" onclick = "receive_change(<%=i%>,<%=mtib.getTi_num()%>)"></td>
					<%} %>
				</tr>
				<%if(mtib.getMemo().length()!=0){ %>
					<tr>
						<td>배송 요청사항</td>
						<td id="receive_memo<%=i%>" colspan="6"><%=mtib.getMemo().replace("\r\n", "<br>") %></td>
					</tr>
				<%} %>
			</table>
		</div>
		
	<%		}	
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
	%> 
		</div>
	<jsp:include page="../inc/footer.jsp"></jsp:include>
	<!--오른쪽 메뉴 -->
	<div>
		<jsp:include page="../inc/rightMenu.jsp"></jsp:include>
	</div>
	<!--오른쪽 메뉴 -->
</body>
</html>