<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="net.mod.db.ModTradeInfoBEAN"%>
<%@page import="java.util.List"%>
<%@page import="java.util.HashMap"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>교환 처리 페이지</title>
<%request.setCharacterEncoding("utf-8");
ModTradeInfoBEAN mtib = (ModTradeInfoBEAN)request.getAttribute("mtib");
List<String> Color_List = (List<String>)request.getAttribute("Color_List");
DecimalFormat Commas = new DecimalFormat("#,###");
String mtib_cost = (String)Commas.format(mtib.getCost() );
int tnum = Integer.parseInt(request.getParameter("num"));
SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
String [] reason = mtib.getO_memo().split("ㅨ");
String []memo=reason[0].split(",");
%>
<script src = "./js/jquery-3.2.0.js"></script>
<script type="text/javascript">
function color_check(){
	if(count_check()!=0){
		var color = $('#color option:selected').val();
		if(color == "none"){
			alert("색상을 먼저 선택해 주세요");
			return false;
		}
	}else{
		alert("교환 요구 수량을 초과하였습니다 \n 교환 요구 수량을 확인하세요");
		return false;
	}
}
function count_check(){
	var max_count = parseInt($('#max_count').val()); 
	for(var i =0; i <$('#select').find('.count').length;i++){
		max_count -= $('#select .count').eq(i).val();
	}
	return max_count;
}
function size_call(ori_num){			
	$("#size").find("option").remove();
	$('#size').append("<option  value = 'none' >사이즈-재고</option>");
	$.ajax({
		type:"POST",
		url:"./size.jc",
		data:{
			color:$('#color option:selected').val(),
			ori_num:<%=mtib.getOri_num()%>
		},
		datatype:"JSON",
		success:function(data){
			$.each(data,function(i,size){
				$('#size').append("<option  value = '"+size.num+
						"' >"+size.size+"-"+size.stock+"개</option>");			
			});
		}
	});
}
function info_call(){
	var num = $('#size option:selected').val();
	$.ajax({
		type:"POST",
		url:"./thing_info.jc",
		data:{
			num:num
		},
		datatype:"JSON",
		success:function(data){
			var check = 1;
			for(var i = 0; i<$('#select').find('tr').length;i++){
				if($('#select tr').eq(i).attr('id')=="info"+num)check=0;
			}
				if(check == 1){
					//기존에 있던 count의 옵션 값들 중에 마지막 옵션 삭제
					for(var i = 0; i<$('.count').length;i++){
						if($(".count").eq(i).find('option').length>1&&
								$(".count").eq(i).find('option:selected').val()<
								$(".count").eq(i).find('option:last').val())
							$(".count").eq(i).find('option:last').remove();
					}
					//사이즈 선택시 새로운 tr 추가
					$('#select').append("<tr id='info"+num+"'><td>물품 번호 : "+num+
						"</td><td>색상 : "+data.color+"</td><td>사이즈 : "+data.size+"</td><td>"+
						"<select id ='count"+num+"'name='count' class='count'"+
						"onchange='count_change("+num+")'></select>"+
						"<input type='hidden' id='stock"+num+"'"+
							"name='stock' value='"+data.stock+"'>"+
						 "<input type='hidden' id='cost"+num+"'"+
							"name='cost' value='"+data.cost+"'>"+
							  "<input type='hidden' name='tnum' value='"+num+"'>"+
							  "<input type='hidden' name='color' value='"+data.color+"'>"+
							  "<input type='hidden' name='size' value='"+data.size+"'>"+
							  "<input type='hidden' id='result"+num+"' name='result' value=''></td>"+
						"<td class='tcost' id='tcost"+num+"'></td>"+
						"<td><img src='./img/delete.png' onclick='trdel("+num+")'></td></tr>");
					var j = count_check();
					for(var i =1; i<=j;i++){
						$('#count'+num).append("<option value = '"+i+"'>"+i+"</option>");
					}
					var str = "차액 ";
					var cost_cal = $('#ori_cost').val()-$('#cost'+num).val();
					if(cost_cal>0)str+="+";
					var result = cost_cal*$("#count"+num+" option:selected").val();
					$('#result'+num).val(result);
					$('#tcost'+num).html(str+numberWithCommas(result)+"원");
				}else{
				alert("이미 리스트에 있는 상품 입니다");
			}
		}		
	});
}
function count_change(num){
	
	var ch = count_check();
	if(ch==0){
		for(var i = 0; i<$('.count').length;i++){
			var j = $(".count").eq(i).find('option:last').val();
			for(j;j>$(".count").eq(i).find('option:selected').val();j--){
				alert(j);
				alert($(".count").eq(i).find('option:selected').val());
				$(".count").eq(i).find('option:last').remove();
			}
		}
	}
}
function trdel(tnum){
	$('#info'+tnum).remove();
}
function numberWithCommas(x) {
    return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
}
function totalP(){
	var sum = 0;
	for(var i = 0; i<$('#stocktable').find('.tcost').length; i++){
		
		var ints = $('#stocktable .tcost').eq(i).text().replace(",","");
		ints = ints.replace("원","");
		sum += parseInt(ints);
	}
	$('input:hidden[name=totalcost]').val(sum);
	$('#p').html(numberWithCommas(sum)+"원");
}
</script>
<link href="./css/inc.css" rel="stylesheet" type="text/css">
<link href="./css/subpage.css" rel="stylesheet" type="text/css">
</head>
<body>
<div id = "wrap">
<form>
<table border = "1">
	<tr>
		<th>상품 번호
			<input type = "hidden" name = "o_num" value="<%=tnum%>"></th>
		<td><%=mtib.getOri_num() %></td>
		<td><%=mtib.getSubject() %></td>
		<td>색상 : <%=mtib.getColor() %></td>
		<td>사이즈 : <%=mtib.getSize() %></td>
		<td><%=mtib.getThing_count()%>개</td>
		<td><%=mtib_cost%>원<input type="hidden" id = "ori_cost" value="<%=mtib.getTotal_cost()%>"></td>
	</tr>
	<tr>
		<th>교환 요구 사항</th>
		<td colspan="4"><%=reason[1].replace("\r\n", "<br>") %></td>
		<th>교환 요구 수량</th>
		<td><%=memo[1] %>개<input type="hidden" id ="max_count" value = "<%=memo[1] %>"></td>
	</tr>
	<tr>
		<th>거래 정보</th>
		<th>주문자ID</th>
		<td><%=mtib.getId() %></td>
		<th>결제자</th>
		<td><%=mtib.getPayer() %></td>
		<th>결제 방법</th>
		<td colspan="3"><%=mtib.getTrade_type() %></td>
	</tr>
	<tr>
		<th>받으시는 분</th>
		<td><%=mtib.getName() %></td>
		<th>연락처</th>
		<td><%=mtib.getMobile() %></td>
		<th>교환 요구 날짜</th>
		<td colspan="6"><%=sdf.format(mtib.getTrade_date()) %></td>
	</tr>
	<tr>
		<th>주소</th>
		<td colspan="9"><%="["+mtib.getPostcode()+"] "+mtib.getAddress1()+" "+mtib.getAddress2() %></td>
	</tr>
		<%if(mtib.getMemo().length()!=0){ %>
		<tr>
			<th>배송시 요청 사항</th>
			<td colspan="8"><%=mtib.getMemo().replace("\r\n", "<br>") %></td>
		</tr>
		<%} %>
</table>

<table id="select">
	<tr>
		<th>교환할 상품</th>
		<td><select id="color" onchange="size_call(<%=mtib.getOri_num()%>)">
			<option value = "none">색상</option>
			<%for(int i =0; i<Color_List.size();i++){ %>
				<option value="<%=Color_List.get(i) %>"><%=Color_List.get(i) %></option>
			<%} %>
		</select></td>
		<td><select id="size" onclick="return color_check()" onchange="info_call()">
		<option value = "none">사이즈-재고</option>
		</select></td>
	</tr>
</table>
<table>
	<tr>
		<th>코멘트 입력</th>
		<td colspan ="6"><textarea rows="3" cols="60"
			placeholder="고객에게의 메세지를 입력해 주세요"
			id = "memo<%=mtib.getNum() %>" style="resize:none;"></textarea>
		</td>
	</tr>
</table>
</form>
</div>
</body>
</html>