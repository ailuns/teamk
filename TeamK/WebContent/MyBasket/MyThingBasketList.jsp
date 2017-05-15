<%@page import="java.text.SimpleDateFormat"%>
<%@page import="net.bns.db.TBasketBEAN"%>
<%@page import="net.bns.db.PBasketBEAN"%>
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
function thing_cal(cost, num) {
	var num = num;
	var val1 = $("#tcount"+num+" option:selected").val();
	$('#tcost'+num).html(cost*val1);
}
function Basket_Update(num){
	$.ajax({
		type:"post",
		url:"./ThingBasketUpdate.bns",
		data:{
			tcount:$("#tcount"+num+" option:selected").val(),
			tcost:$("#tcost"+num).html(),
			num:$('#tch'+num).val(),
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
	var tchcount = 0;
	for(i = 0; i<document.fr.tch.length;i++){
		if(document.fr.tch[i].checked==true)tchcount++;
	}
	return tchcount;

}
</script>
</head>
<body>
<%
request.setCharacterEncoding("utf-8");
int pblock = ((Integer)request.getAttribute("pblock")).intValue();

int endpage = ((Integer)request.getAttribute("endpage")).intValue();
int startp = ((Integer)request.getAttribute("startp")).intValue();
int pcount = ((Integer)request.getAttribute("pcount")).intValue();
int count = ((Integer)request.getAttribute("count")).intValue();
String pagenum = (String)request.getAttribute("pageNum");
int pageNum = Integer.parseInt(pagenum);
SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
List<TBasketBEAN> ThingBasket=(List<TBasketBEAN>)request.getAttribute("MyThingBasket");

%>

<h1>
패키지 리스트</h1>
<h4>subject Count : <%=count %></h4>
<form method ="post" name ="fr">
	<table border="1">
			<tr>
			<th></th>
				<th>이미지</th>
				<th>상품명</th>
				<th>색상</th>
				<th>사이즈</th>
				<th>수량</th>
				<th>가격</th>
				<th>등록일</th>
			</tr>
			<%
				for (int i = 0; i <ThingBasket.size(); i++) {
						TBasketBEAN tbb = ThingBasket.get(i);
						
			%>
			<tr>
			<td><input type = "checkbox" name="tch" value="<%=tbb.getNum()%>" id = "tch<%=i%>"></td>
				<td><img src ="./upload/<%=tbb.getImg() %>"></td>
				<td><%=tbb.getSubject() %><br>
				<%=tbb.getIntro() %></td>
				
				<td><%=tbb.getColor() %></td>
				<td><%=tbb.getSize() %></td>
				<td><select id = "tcount<%=i%>" name="tcount<%=i%>" onchange="thing_cal(<%=tbb.getOri_cost()%>,<%=i%>)">
				<%for(int j =1 ; j<tbb.getMaxcount()+1; j++){ %>
				<option value="<%=j%>" 
				<%if(j==tbb.getCount()){%>selected <%} %>><%=j %></option>
				<%} %>
				</select><br>
				<input type = "button" value="수량 변경"  onclick="Basket_Update(<%=i %>)" >
				</td>
				
				<td id="tcost<%=i%>"><%=tbb.getCost() %></td>
				<td><%=sdf.format(tbb.getDate()) %></td>
				</tr>

			<%
				}
			%>
		</table>
		
		<input type="button" value="구입" onclick="return basket_submit()">
		<input type="button" value="삭제"	onclick="return basket_delete()">
			</form>
	<%if(pageNum!=1){%>
	<a href = "./MyThingBasketList.bns?pageNum=<%=pageNum-1%>">[이전 페이지]</a><%;}
	if(count!=0){
				
		if(endpage > pcount)endpage = pcount;
		if(startp>pblock){
			 %><a href = "./MyThingBasketList.bns?pageNum=<%=startp-1%>">[이전]</a><%
		}
		for(int i = startp;i<=endpage;i++){
			%><a href="./MyThingBasketList.bns?pageNum=<%=i %>">[<%=i %>]</a><%
		}
		if(endpage<pcount){
			%><a href = "./MyThingBasketList.bns?pageNum=<%=endpage+1%>">[다음]</a><%
		}
	}	//if(count%pagesize!=0)pcount+=1;
	
		
		if(pcount!=pageNum){%>
		<a href = "./MyThingBasketList.bns?pageNum=<%=pageNum+1%>">[다음 페이지]</a><%; }%>
</body>
</html>