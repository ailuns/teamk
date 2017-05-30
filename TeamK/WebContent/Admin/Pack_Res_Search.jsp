<%@page import="net.mod.db.ModTradeInfoBEAN"%>
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
int pblock = ((Integer)request.getAttribute("pblock")).intValue();
int endpage = ((Integer)request.getAttribute("endpage")).intValue();
int startp = ((Integer)request.getAttribute("startp")).intValue();
int pcount = ((Integer)request.getAttribute("pcount")).intValue();
int count = ((Integer)request.getAttribute("count")).intValue();
String pagenum = (String)request.getAttribute("pageNum");
String status = request.getParameter("status");
String status2 = request.getParameter("status2");
String search = request.getParameter("search");
String search_type=request.getParameter("search_type");
int pageNum = Integer.parseInt(pagenum);
List<ModTradeInfoBEAN> Pack_Res_List=(List<ModTradeInfoBEAN>)request.getAttribute("Pack_Res_List");
SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
%>
<link href="./css/inc.css" rel="stylesheet" type="text/css">
<link href="./css/subpage.css" rel="stylesheet" type="text/css">
<script src = "./js/jquery-3.2.0.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	if("<%=status%>"=="completed"){
		$('#status2').find('option').remove();
		$('#status2').html("<option value='none'>전체</option>"+
				"<option value='completed'>진행 완료</option>"+
				"<option value='canceled'>취소 완료</option>");
	}
	select_reset();
	$('#title').html($('#status2 option:selected').text()+" 주문");
	$('#result').html($('#search_type option:selected').text()
			+': "<%=search %>" 검색 결과  <%=count %>건 ');
})
function select_reset(){
	$('#status').val('<%=status%>').attr('selected','selected');
	$('#status2').val('<%=status2%>').attr('selected','selected');
	$('#search_type').val('<%=search_type%>').attr('selected','selected');
	$('#search').val('<%=search%>');
}
function select_check(){
	if($("input[name='pnum']:checked").length==0){
		alert("선택 된 주문이 없습니다!");
		return false;	
	}
}
function res_cancel(num){
	window.open('./Res_Cancel.ao?num='+num, '패키치 취소', 
			'left=200, top=100, width=600, height=800');
}
function status_change(){
	if(search_check()==null){
		location.href="./Pack_Res_Search.ao?status="+$('#status').val()+"&status2=none"+
		"&search_type="+$('#search_type').val()+"&search="+$('#search').val();
		}
}
function status_change2(){
	if(search_check()==null){
		location.href="./Pack_Res_Search.ao?status="+$('#status').val()+
		"&status2="+$('#status2').val()+"&search_type="+$('#search_type').val()+
		"&search="+$('#search').val();
	}
}
function search(){
	if(search_check()==null){	
		location.href="./Pack_Res_Search.ao?status="+$('#status').val()+
		"&status2="+$('#status2').val()+"&search_type="+$('#search_type').val()+
		"&search="+$('#search').val();
	}
}
function search_check(){
	if($('#search').val().length==0){
		if(confirm('검색 조건을 없애겠습니까?')){
			location.href = "./Pack_res.ao?status="+$('#status').val()+
			"&status2="+$('#status2').val();
			return true;
		}else{
			select_reset();
			return false;	
		}
	}return null;
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
		<select id="status" onchange="return status_change()">
			<option value="ing">진행중인 주문</option>
			<option value="completed">지난 주문 확인</option>
		</select>
		<select id="status2" onchange="return status_change2()">
			<option value="none">전체</option>
			<option value="bank">입금 확인 대기 중</option>
			<option value="waiting">예약 대기 중</option>
			<option value="confirm">예약 완료</option>
			<option value="cancel_call">취소 요청</option>
		</select>
	<div align="right">	
		<select id="search_type" name="search_type">
			<option value="id">아이디</option>
			<option value="payer">결제자</option>
			<option value="trade_num">주문번호</option>
		</select>
		<input type="text" id="search" name="search">
		<input type="button" value="검색" onclick="return search()">
		</div>
	<h3 id = "title"></h3>
	<h4 id ="result"></h4>
	<div>
		<form method="post" action ="./Pack_Res_Action.ao?stat=<%=status2%>"name="fr" onsubmit="return select_check()">
			<%if(Pack_Res_List.size()!=0){
				for(int i =0; i< Pack_Res_List.size();i++){
					ModTradeInfoBEAN mtib = Pack_Res_List.get(i);
					String []pack_count = mtib.getPack_count().split(",");
					String []trade_type = mtib.getTrade_type().split(",");
					String []memo = mtib.getMemo().split(",");%>
				<h5><%=mtib.getSubject() %></h5>
				<table border = "1">
					<tr>
						<%
						if(!(status2.equals("none"))){
							if(mtib.getStatus()==1||
								mtib.getStatus()==2||
								mtib.getStatus()==4){ %>
						<td rowspan="4"><input type="checkbox" value="<%=mtib.getNum() %>" name="pnum"></td>
						<%	}
						}%>
						<td><%=mtib.getImg() %></td>
						<td><%=mtib.getTrade_num() %></td>
						<td><%=mtib.getIntro() %></td>
						<td>성인 : <%=pack_count[0] %>, 아동 : <%=pack_count[1] %></td>
						<td><%=sdf.format(mtib.getDate()) %></td>
						<%if(status2.equals("none")){ %>
						<td><%=mtib.getStatus_text() %></td>
						<%} %>
					</tr>
					<%if(mtib.getPo_receive_check()==1&&status2.equals("waiting")) {%>
					<tr>
						<td>정보지 요청</td>
						<td><%=mtib.getName() %></td>
						<td><%=mtib.getMobile() %></td>
						<td colspan="4">[<%=mtib.getPostcode() %>] <%=mtib.getAddress1() %> <%=mtib.getAddress2() %></td>
					</tr>
					<%} %>
					<tr>
						<td><%=mtib.getId() %></td>
						<td><%=mtib.getPayer() %></td>
						<td><%=trade_type[0] %></td>
						<% if(mtib.getStatus()==4||mtib.getStatus()==9){%>
						<td>환불 금액</td>
						<td><%=memo[1] %>원</td>
						<%}else if(mtib.getStatus()<4){%>
							<td><input type = "button" value="예약 취소" onclick ="res_cancel(<%=mtib.getNum()%>)"></td>
						<%}%>
					</tr>
					<%
					if(mtib.getStatus()==4||mtib.getStatus()==9){
						if(memo.length >2&&mtib.getStatus()==4){ %>
					<tr>
						<td>은행명</td>
						<td><%=memo[2] %></td>
						<td>예금주</td>
						<td><%=memo[3] %></td>
					</tr>
					<tr>
						<td>계좌번호</td>
						<td colspan="3"><%=memo[4] %></td>
					</tr>
					<%}
					} %>
				</table>
				
				<%}
				if(status.equals("ing")){
					if(status2.equals("bank")||
							status2.equals("waiting")||
							status2.equals("cancel_call")){
							String btn = "";
							switch(status2){
								case "bank":btn ="입금 확인";break;
								case "waiting":btn ="예약 완료";break;
								case "cancel_call":btn ="예약 취소";break;
							}%>
					<input type="submit" value="<%=btn%>">
				<%						
					}
				}
				%>
				
				
				<%
				}else {%>
					
		주문 내역 없음
		<%
			}
		%>
						
		
	

</form>
</div>
	<%
	String se = "&search_type="+search_type+"&search="+search;
	if(count!=0){
				
		if(endpage > pcount)endpage = pcount;
		if(startp>pblock){
			 %><a href = "./Pack_Res_Search.ao?status=<%=status %>&status2=<%=status2 %>&pageNum=<%=startp-1%><%=se%>">[이전]</a><%
		}
		for(int i = startp;i<=endpage;i++){
			%><a href="./Pack_Res_Search.ao?status=<%=status %>&status2=<%=status2 %>&pageNum=<%=i %><%=se%>">[<%=i %>]</a><%
		}
		if(endpage<pcount){
			%><a href = "./Pack_Res_Search.ao?status=<%=status %>&status2=<%=status2 %>&pageNum=<%=endpage+1%><%=se%>">[다음]</a><%
		}
	}	
	%>
		<br>
		<input type = "button" value = "주문 관리" onclick="location.href='./AdminOrderList.ao'">
			</div>
	<jsp:include page="../inc/footer.jsp"></jsp:include>
	<!--오른쪽 메뉴 -->
	<div>
		<jsp:include page="../inc/rightMenu.jsp"></jsp:include>
	</div>
	<!--오른쪽 메뉴 -->
</body>
</html>