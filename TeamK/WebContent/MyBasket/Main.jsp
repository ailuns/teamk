<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="./css/inc.css" rel="stylesheet" type="text/css">
<link href="./css/subpage.css" rel="stylesheet" type="text/css">
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
session.setAttribute("id", "admin");
String id = (String)session.getAttribute("id");
%>
.Main.jsp<br>

<%=id %> is Connected<br>
<div>
<h3>Client</h3>
<input type = "button" value="My Basket" onclick ="location.href='./MyBasketList.bns'"><br>
<input type = "button" value="My Interest" onclick ="location.href='./MyInterestList.ins'"><br>
<input type ="button" value = "Basket" onclick = "location.href='./MyBasketAdd.bns'"><br>
<input type="button" value="PackOrder" onclick = "location.href='./MyPackOrderList.mo'"><br>
<input type="button" value="ThingOrder" onclick="location.href='./MyThingOrderList.mo'"><br>
<input type = "button" value = "MyOrder" onclick = "location.href='./MyOrderList.mo'"><br>


</div>
<div>
<h3>Admin</h3>
<input type="button"value = "adminmenu" onclick="location.href='./BankPayCheck.ao'"><br>
<input type="button"value = "adminControl" onclick="location.href='./TransNum_Insert.ao'"><br>
<input type="button" value ="pack_res" onclick ="location.href = './Pack_res.ao'"><br>
<input type="button" value="res_cancel" onclick="location.href='./Pack_Res_Cancel.ao'"><br>
<input type="button" value="Thing_Exchange" onclick="location.href='./Thing_Exchange.ao'"><br>
<input type="button" value="Thing_Cancel" onclick="location.href='./Thing_Cancel.ao'">

</div>
	</div>
	<jsp:include page="../inc/footer.jsp"></jsp:include>
	<!--오른쪽 메뉴 -->
	<div>
		<jsp:include page="../inc/rightMenu.jsp"></jsp:include>
	</div>
	<!--오른쪽 메뉴 -->
</body>
</html>