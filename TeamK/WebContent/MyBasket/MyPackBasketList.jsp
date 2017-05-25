<%@page import="java.text.SimpleDateFormat"%>
<%@page import="net.bns.db.PBasketBEAN"%>
<%@page import="java.util.List"%>
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
function people_Calc(cost,num){
	var val1 = $("#adult"+num+" option:selected").val();
		var val2 = $("#child"+num+" option:selected").val();
		var val3 =(val1 * cost) + (val2 * (cost/2));
	$('#pcost'+num).html(val3);
}
function Basket_update(num){
	$.ajax({
		type:"post",
		url:"./PackBasketUpdate.bns",
		data:{
			adult_count:$("#adult"+num+" option:selected").val(),
			child_count:$("#child"+num+" option:selected").val(),
			pcost:$("#pcost"+num).html(),
			num:$("#pch"+num).val(),
			success:function(){
				alert("sucess");
			}
		}
	});
}
function basket_delete(){
	
	if(confirm("정말 삭제하시겠습니까?")){
		if(check()==0){
			alert("선택된 항목이 없습니다!");
			return false;
		}else{
			document.fr.action = "./MyBasketDelete.bns";
			document.fr.method="post";
			document.fr.submit();
		}
	}else return false;
}
function basket_submit(){
	if(check()==0){
		alert("선택된 항목이 없습니다!");
		return false;
	}else{
		document.fr.action = "./MyOrderAddAction.mo";
		document.fr.method="post";
		document.fr.submit();
	}
}
function check(){
	var pchcount = 0;
	for(i = 0; i<document.fr.pch.length;i++){
		if(document.fr.pch[i].checked==true)pchcount++;
	}
	return pchcount;

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
List<PBasketBEAN> MyPackBasket=(List<PBasketBEAN>)request.getAttribute("MyPackBasket");
SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
%>

<h1>
패키지 리스트</h1>
<h4>subject Count : <%=count %></h4>
<form name ="fr" method ="post">
<table border="1">

<tr>
<th></th><th>이미지</th><th>제목</th><th>성인</th><th>유아</th><th>가격</th><th>등록일</th><th>비고</th></tr>
<%
				for (int i = 0; i < MyPackBasket.size(); i++) {
						PBasketBEAN pbb = MyPackBasket.get(i);
						String [] countp = pbb.getCountp();
			%>
			<tr>
				<td><input type ="checkbox" id="pch<%=i %>" name = "pch" value = "<%=pbb.getPb_num()%>">
				<td><img src ="./<%=pbb.getImg() %>"></td>
				<td><%=pbb.getSubject()%><br>
				<%=pbb.getIntro() %></td>
				<td><select id = "adult<%=i%>" name="adult<%=i%>" onchange="people_Calc(<%=pbb.getOri_cost()%>,<%=i%>)">
				<%for(int j =1 ; j<9; j++){ %>
				<option value="<%=j%>" 
				<%if(j==Integer.parseInt(countp[0])){%>selected <%} %>><%=j %></option>
				<%} %>
				</select>
				</td>
				<td><select id = "child<%=i%>" name="child<%=i%>" onchange="people_Calc(<%=pbb.getOri_cost()%>,<%=i%>)">
				<%for(int j =0 ; j<9; j++){ %>
				<option value="<%=j%>" 
				<%if(j==Integer.parseInt(countp[1])){%>selected <%} %>><%=j %></option>
				<%} %>
				</select></td>
				<td id="pcost<%=i %>"><%=pbb.getCost()%></td>
				<td><%=sdf.format(pbb.getDate()) %>
				<td>
				<input type = "button" value="변경"  onclick="Basket_update(<%=i %>)" >
				</td>
				</tr>
				<%} %>
</table>
<input type="button" value="구입" onclick="return basket_submit()">
<input type="button" value="삭제"	onclick="return basket_delete()">

</form>
	<%
	if(count!=0){
				
		if(endpage > pcount)endpage = pcount;
		if(startp>pblock){
			 %><a href = "./MyPackBasketList.bns?pageNum=<%=startp-1%>">[이전]</a><%
		}
		for(int i = startp;i<=endpage;i++){
			%><a href="./MyPackBasketList.bns?pageNum=<%=i %>">[<%=i %>]</a><%
		}
		if(endpage<pcount){
			%><a href = "./MyPackBasketList.bns?pageNum=<%=endpage+1%>">[다음]</a><%
		}
	}	//if(count%pagesize!=0)pcount+=1;
	%><br><input type = "button" value = "내주문" onclick="location.href='./MyOrderList.mo'">
		</div>
	<jsp:include page="../inc/footer.jsp"></jsp:include>
	<!--오른쪽 메뉴 -->
	<div>
		<jsp:include page="../inc/rightMenu.jsp"></jsp:include>
	</div>
	<!--오른쪽 메뉴 -->
</body>
</html>