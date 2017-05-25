<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<%
request.setCharacterEncoding("utf-8");
int check = Integer.parseInt(request.getParameter("check"));
%>
	<script src = "./js/jquery-3.2.0.js"></script>
	<script type="text/javascript">
	$(window).ready(function(){
		if(<%=check%> ==1)
			if(confirm("여행상품은 대표자 연락처를 반드시 입력해야합니다!\n지금 바로 입력페이지로 이동하시겠습니까?")){
				location.href="./MyPackOrderList.mo";
		}
	})
		
	
	</script>
<body>
결제가 정상적으로 완료 되었습니다.<br>
이용해주셔서 감사합니다<br>
<input type = "button" value = "내주문" onclick="location.href='./MyOrderList.mo'">
<input type="button" value="Pack Order List" onclick="location.href='./MyPackOrderList.mo'">
<input type="button" value="Thing Order List" onclick="location.href='./MyThingOrderList.mo'">
</body>
</html>