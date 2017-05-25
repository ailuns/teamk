<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<%request.setCharacterEncoding("utf-8");
String id = (String)session.getAttribute("id"); %>
</head>
<body>
<div>
<h3><%=id %> Order List</h3>
<input type = "button" value="My Basket" onclick ="location.href='./MyBasketList.bns'"><br>
<input type = "button" value="My Interest" onclick ="location.href='./MyInterestList.ins'"><br>
<input type="button" value="PackOrder" onclick = "location.href='./MyPackOrderList.mo'"><br>
<input type="button" value="ThingOrder" onclick="location.href='./MyThingOrderList.mo'"><br>
<input type = "button" value = "MyOrder" onclick = "location.href='./MyOrderList.mo'"><br>


</div>
</body>
</html>