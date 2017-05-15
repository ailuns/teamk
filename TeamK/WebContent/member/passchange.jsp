<%@page import="com.sun.org.apache.xerces.internal.impl.dv.util.Base64"%>
<%@page import="net.member.db.MemberBean"%>
<%@page import="net.member.db.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
// 	function passchange() {
// 		if (document.fr.pass.value != document.fr.pass2.value) {
// 			alert("기존 비밀번호와 틀립니다.");
// 			document.fr.pass2.focus();
// 			return false;
// 		}
// 		if (document.fr.changepass.value == "") {
// 			alert("변경할 비밀번호를 적어주세요.");
// 			document.fr.changepass.focus();
// 			return false;
// 		}
// 		if (document.fr.pass2.value == document.fr.changepass.value) {
// 			alert("기존 비밀번호와 똑같습니다.");
// 			document.fr.changepass.focus();
// 			return false;
// 		}
// 		if (document.fr.changepass.value != document.fr.changepass2.value) {
// 			alert("변경할 비밀번호를 똑같이 적어주세요.");
// 			document.fr.changepass2.focus();
// 			return false;
// 		}
// 		if (document.fr.changepass.value == document.fr.changepass2.value) {
// 			alert("성공!! 회원정보 수정시에는 변경된 비밀번호를 입력해주세요.");
// 			window.close();
// 		}
// 	}
</script>
</head>
<body>
	<%
		String id = request.getParameter("userid");
		MemberDAO mdao = new MemberDAO();
		MemberBean mb = mdao.getMember(id);
		String pass = mb.getPass();
				
	%>
	<form action="../MemberPasschangeAction.me" method="post" name="fr">
		<br> 
			아이디 : 		<input type="text" value="<%=id%>"><br> 
						<input type="hidden" name="pass" value="<%=pass%>"> 
			비밀번호 :		<input type="password" name="pass2"><br> 
			변경할 비밀번호 : 	<input type="password" name="changepass"><br> 
			변경할 비밀번호 확인 :	<input type="password" name="changepass2"><br> 
							<input type="submit" value="변경"><input type="button" value="취소" onclick="window.close()">
	</form>
</body>
</html>