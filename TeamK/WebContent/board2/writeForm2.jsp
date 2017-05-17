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
function check() {
	if(document.fr.subject.value==""){
		alert("제목을 입력해주세요");
		document.fr.subject.focus();
		return false;
	}
	if(document.fr.content.value==""){
		alert("내용을 입력해주세요");
		document.fr.content.focus();
		return false;
	}
	if(document.fr.email.value==""){
		alert("이메일을 입력해주세요");
		document.fr.email.focus();
		return false;
	}
}
</script>
<link href="./css/inc.css" rel="stylesheet" type="text/css">
<link href="./css/subpage.css" rel="stylesheet" type="text/css">
<%String id = (String)session.getAttribute("id");%>
<%
MemberDAO mdao = new MemberDAO();
MemberBean mb = mdao.getMember(id);
%>
</head>
<body>
	<!--왼쪽 메뉴 -->
	<div>
		<jsp:include page="../inc/leftMenu.jsp"></jsp:include>
	</div>
	<!--왼쪽 메뉴 -->
	<div id="wrap">
		<div id="login_head">
			<div id="login_title">Q&A 게시판</div>
			<div id="login_script">궁금한것은 질문해주세요.</div>
		</div>
<div id="clear"></div>
<div id="board">
<div id="board_write">
<form action="./BoardWriteAction2.bo" method="post" name="fr" enctype="multipart/form-data" onsubmit="return check()">
<input type="hidden" value="2" name="type">
ID:<input type="text" name="id" value="<%=id%>" readonly><br>
첨부파일1:<input type="file" name="file1"><br>
첨부파일2:<input type="file" name="file2"><br>
첨부파일3:<input type="file" name="file3"><br>
첨부파일4:<input type="file" name="file4"><br>
첨부파일5:<input type="file" name="file5"><br>
답변받을이메일주소:<input type="text" name="email" value="<%=mb.getEmail()%>"><br>
제목:<input type="text" name="subject" maxlength="20"><br>
내용:<textarea rows="10" cols="20" name="content"></textarea><br>
<input type="submit" value="글쓰기">
</form>
</div>
</div>
<input type="button" value="글목록" 
       onclick="location.href='./BoardList2.bo?pageNum=1'">
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