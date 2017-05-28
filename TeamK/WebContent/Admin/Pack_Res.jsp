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
<link href="./css/inc.css" rel="stylesheet" type="text/css">
<link href="./css/subpage.css" rel="stylesheet" type="text/css">
<script src = "./js/jquery-3.2.0.js"></script>
<script type="text/javascript">
function select_check(){
	if($("input[name='pnum']:checked").length==0){
		alert("선택 된 주문이 없습니다!");
		return false;	
	}
}
function Res_Cancel(num){
	window.open('./Res_Cancel.mo?num='+num, '패키치 취소', 
			'left=200, top=100, width=600, height=400, scrollbars=yes, status=no,'+
			'resizable=no, fullscreen=no, channelmode=no,location=no');
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
<%
request.setCharacterEncoding("utf-8");
int pblock = ((Integer)request.getAttribute("pblock")).intValue();

int endpage = ((Integer)request.getAttribute("endpage")).intValue();
int startp = ((Integer)request.getAttribute("startp")).intValue();
int pcount = ((Integer)request.getAttribute("pcount")).intValue();
int count = ((Integer)request.getAttribute("count")).intValue();
String pagenum = (String)request.getAttribute("pageNum");
int pageNum = Integer.parseInt(pagenum);
List<ModTradeInfoBEAN> Pack_Res_List=(List<ModTradeInfoBEAN>)request.getAttribute("Pack_Res_List");
SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
%>

	<div>
		<form action="./Pack_Res_Action.ao" method="post" name="fr" onsubmit="return select_check()">
			<%if(Pack_Res_List.size()!=0){
				for(int i =0; i< Pack_Res_List.size();i++){
					ModTradeInfoBEAN mtib = Pack_Res_List.get(i);
					String []pack_count = mtib.getPack_count().split(",");%>
				<h5><%=mtib.getSubject() %></h5>
				<table border = "1">
					<tr>
						<td><input type="checkbox" value="<%=mtib.getNum() %>" name="pnum"></td>
						<td><%=mtib.getImg() %></td>
						<td><%=mtib.getTrade_num() %></td>
						<td><%=mtib.getIntro() %></td>
						<td>성인 : <%=pack_count[0] %>, 아동 : <%=pack_count[1] %></td>
						<td><%=sdf.format(mtib.getDate()) %></td>
						<%-- <td><input type="button" value="예약 취소" onclick="Res_Cancel(<%=mtib.getNum()%>)"></td> --%>
					</tr>
					<%if(mtib.getPo_receive_check()==1) {%>
					<tr>
						<td>정보지 요청</td>
						<td><%=mtib.getName() %></td>
						<td><%=mtib.getMobile() %></td>
						<td colspan="4">[<%=mtib.getPostcode() %>] <%=mtib.getAddress1() %> <%=mtib.getAddress2() %></td>
					</tr>
					<%} %>
				</table>
				
				<%}
				%>
				<input type="submit" value="예약 완료">
				
				<%
				}else {%>
					
		주문 내역 없음
		<%
			}
		%>
						
		
	

</form>
</div>
	<%
	if(count!=0){
				
		if(endpage > pcount)endpage = pcount;
		if(startp>pblock){
			 %><a href = "./Pack_Res.ao?pageNum=<%=startp-1%>">[이전]</a><%
		}
		for(int i = startp;i<=endpage;i++){
			%><a href="./Pack_Res.ao?pageNum=<%=i %>">[<%=i %>]</a><%
		}
		if(endpage<pcount){
			%><a href = "./Pack_Res.ao?pageNum=<%=endpage+1%>">[다음]</a><%
		}
	}	//if(count%pagesize!=0)pcount+=1;
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