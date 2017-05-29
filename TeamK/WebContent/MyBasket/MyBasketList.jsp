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
	function thing_cal(cost, num) {
		var val1 = $("#tcount"+num+" option:selected").val();
		$('#ttcount'+num).val(val1)
		$('#tcost'+num).html(cost*val1);
		$('#ttcost'+num).val(cost*val1);
	}
	function TBasket_Update(num){
		$.ajax({
			type:"post",
			url:"./ThingBasketUpdate.bns",
			data:{
				tcount:$("#tcount"+num+" option:selected").val(),
				tcost:$("#tcost"+num).html(),
				num:$("#tch"+num).val(),
				success:function(){
					alert("sucess");
				}
			}
		});
	}
	function PBasket_Update(num){
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
			document.fr.action = "./MyOrderPay.mo";
			document.fr.method="post";
			document.fr.submit();
		}
	}
	function check(){
		var pchcount = 0,tchcount = 0;
		for(i = 0; i<document.fr.tch.length;i++){
			if(document.fr.tch[i].checked==true)tchcount++;
		}
		for(i = 0; i<document.fr.pch.length;i++){
			if(document.fr.pch[i].checked==true)pchcount++;
		}
		return pchcount+tchcount;
	
	}
	
</script>
<%
	request.setCharacterEncoding("utf-8");
	
	int packcount = (int)request.getAttribute("packcount");
	int thingcount = (int)request.getAttribute("thingcount");
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	//List<PBasketBEAN> OrderThing = (List<PBasketBEAN>) request.getAttribute("OrderThing");
	 
%>
</head>
<body>
	<!--왼쪽 메뉴 -->
	<div>
		<jsp:include page="../inc/leftMenu.jsp"></jsp:include>
	</div>
	<!--왼쪽 메뉴 -->
	<div id="wrap">
<div id="board_head">
<div id="rvw_title">
	장바구니
</div>
</div>
	<form name="fr">
	<div>
		<h3>패키지</h3>
		<div id="board">
		<div id="board_list">
		<%
			if (packcount == 0) {
		%>
		구매한 패키지가 없습니다!
		<%
			} else {
				
				List<PBasketBEAN> PackBasket = (List<PBasketBEAN>) request.getAttribute("PackBasket");
				
				
		%>
		<table>
			<tr>
				<th id="num"></th>
				<th id="num">이미지</th>
				<th id="num">상품명</th>
				<th id="num">성인</th>
				<th id="num">유아</th>
				<th id="num">가격</th>
				<th id="num">등록일</th>
				<th id="num">비고</th>
			</tr>
			<%
				for (int i = 0; i < PackBasket.size(); i++) {
						PBasketBEAN pbb = PackBasket.get(i);
						String [] countp = pbb.getCountp();
			%>
			<tr>
				<td><input type="checkbox" id="pch<%=i %>" name="pch"value="<%=pbb.getPb_num()%>"></td>
				<td id="cate"><img src ="./upload/<%=pbb.getImg()%>" height="70"></td>
				<td id="title"><%=pbb.getSubject()%><br>
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
				<td><%=sdf.format(pbb.getDate()) %></td>
				<td>
				<input type = "button" value="변경"  onclick="PBasket_Update(<%=i %>)" >
				</td>
				</tr>

			<%
				}
			%>
		</table>
		<%if(packcount>5); %><a href = "./MyPackBasketList.bns?pageNum=1">more+</a><%; %>
		<%
			}
		%>
	</div>
	</div>
	</div>
	<div>
	<h3>상품</h3>
	<div id="board">
	<div id="board_list">
			<%
			if (thingcount == 0) {
		%>
		구매한 패키지가 없습니다!
		<%
			} else {
				List<TBasketBEAN> ThingBasket = (List<TBasketBEAN>) request.getAttribute("ThingBasket");
		%>
		
		<table>
			<tr>
				<th id="num"></th>
				<th id="num">이미지</th>
				<th id="num">상품명</th>
				<th id="num">색상</th>
				<th id="num">사이즈</th>
				<th id="num">수량</th>
				<th id="num">가격</th>
				<th id="num">등록일</th>
				<th id="num">비고</th>
			</tr>
			<%
				for (int i = 0; i <ThingBasket.size(); i++) {
						TBasketBEAN tbb = ThingBasket.get(i);
						
			%>
			<tr>
				<td><input type="checkbox" id="tch<%=i %>"name="tch" value="<%=tbb.getNum()%>"></td>
				<td><img src ="./upload/<%=tbb.getImg()%>"  height="70"></td>
				<td><%=tbb.getSubject() %><br>
				<%=tbb.getIntro() %></td>
				
				<td><%=tbb.getColor() %></td>
				<td><%=tbb.getSize() %></td>
				<td><select id = "tcount<%=i%>" name="tcount<%=i%>" onchange="thing_cal(<%=tbb.getOri_cost()%>,<%=i%>)">
				<%for(int j =1 ; j<tbb.getMaxcount()+1; j++){ %>
				<option value="<%=j%>" 
				<%if(j==tbb.getCount()){%>selected <%} %>><%=j %></option>
				<%} %>
				</select>
				</td>
				<td id="tcost<%=i%>"><%=tbb.getCost() %></td>
				<td><%=sdf.format(tbb.getDate()) %></td>
				<td>
				
				<input type = "button" value="변경"  onclick="TBasket_Update(<%= i %>)" >
				</td>
				</tr>

			<%
				}
			%>
		</table>
		
		<%if(thingcount>5); %><a href = "./MyThingBasketList.bns?pageNum=1">more+</a><%; %>
		<%
			}
		%>
		
	</div>
	</div>
	</div>
	<input type="button" value="구입" onclick = "return basket_submit()">
	<input type="button" value ="삭제" onclick = "return basket_delete()">
	<br><input type = "button" value = "내주문" onclick="location.href='./MyOrderList.mo'">
	</form>
		</div>
	<jsp:include page="../inc/footer.jsp"></jsp:include>
	<!--오른쪽 메뉴 -->
	<div>
		<jsp:include page="../inc/rightMenu.jsp"></jsp:include>
	</div>
	<!--오른쪽 메뉴 -->

</body>
</html>