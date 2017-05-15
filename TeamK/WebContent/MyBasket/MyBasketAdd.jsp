<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="./MyBasketAddAction.bns" method = "post"name="fr">
<select name = "select">
<option value = "1">1번</option>
<option value = "2">2번</option>
<option value = "3">3번</option>
<option value = "4">4번</option>
<option value = "5">5번</option>
<option value = "6">6번</option>
<option value = "7">7번</option>
</select>
<input type = "hidden" name = "type" value = "P">
<input type= "submit">
</form>
</body>
</html>