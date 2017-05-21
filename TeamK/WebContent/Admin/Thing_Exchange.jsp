<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

<%if(mtb.getTrans_num().length()!=0){ %>
							<td id="Trans_Num_View<%=mtb.getNum()%>" class= "Trans_Num_View">
								<%=mtb.getTrans_num() %>
								<input type="button" value="수정" onclick="Trans_Num_Fix(<%=mtb.getNum()%>)"></td>
							<td id="Trans_Num_Fix<%=mtb.getNum()%>" class= "Trans_Num_Fix">
								<input type = "text" value="<%=mtb.getTrans_num() %>"
									id="Trans_Num<%=mtb.getNum()%>">
								<input type = "Button" value="변경" 
									onclick="Trans_Num_Insert(<%=mtb.getNum()%>)">
								<input type ="Button" value="취소"
									onclick="TransNum_Insert_Reset()">
							</td>
						<%}else{%>
							<td><input type = "text" placeholder="송장번호를 입력해 주세요" 
								id="trans_num<%=mtb.getNum()%>">
							<input type="button" value="입력" onclick = "Trans_Num_Insert(<%=mtb.getNum()%>)"></td>
						<%} %>
</body>
</html>