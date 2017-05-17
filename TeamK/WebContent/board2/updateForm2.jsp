
<%@page import="net.member.db.MemberBean"%>
<%@page import="net.member.db.MemberDAO"%>
<%@page import="net.board.db.BoardBean"%>
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
	if(document.fr.subject.value.length>20){
		alert("제목은 20자 이내로 입력해주세요");
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
</head>
<body>
<%
BoardBean bb =(BoardBean)request.getAttribute("bb");
String pageNum = (String)request.getAttribute("pageNum");
String id = (String)session.getAttribute("id");
%>
<%
MemberDAO mdao = new MemberDAO();
MemberBean mb = mdao.getMember(id);
%>
	<!--왼쪽 메뉴 -->
	<div>
		<jsp:include page="../inc/leftMenu.jsp"></jsp:include>
	</div>
	<!--왼쪽 메뉴 -->
	<div id="wrap">
		<div id="board_head">
			<div id="qna_title">Q&A 게시판</div>
			<div id="qna_script">궁금한것은 질문해주세요.</div>
		</div>
		<div id="clear"></div>
		<div id="board">
		<div id="board_write">
<form action="./BoardUpdateAction2.bo?pageNum=<%=pageNum%>" method="post" name="fr" enctype="multipart/form-data">
<input type="hidden" value="2" name="type">
<input type="hidden" name="num" value="<%=bb.getNum()%>">
<input type="hidden" name="id" value="<%=id%>"><br>
<label for="email">답변 받으실<br>이메일 주소</label><input type="text" name="email" id="email" value="<%=mb.getEmail()%>"><br><br>
<label for="subject">제목</label><input type="text" name="subject" id="subject" value="<%=bb.getSubject()%>"><br><br>
<textarea id="ir1" rows="30" cols="80" name="content"><%=bb.getContent() %></textarea><br><br>
<label for="file1">첨부파일1</label><input type="file" name="file1" id="file1"><%if(bb.getFile1()!=null){%><br><label for="file11">기존파일1</label><input type="hidden" name="file11" id="file11" value="<%=bb.getFile1()%>"><img src="./upload/<%=bb.getFile1()%>" width="50" ><%=bb.getFile1()%><%}%><br>
<label for="file2">첨부파일2</label><input type="file" name="file2" id="file2"><%if(bb.getFile2()!=null){%><br><label for="file12">기존파일2</label><input type="hidden" name="file12" id="file12" value="<%=bb.getFile2()%>"><img src="./upload/<%=bb.getFile2()%>" width="50" ><%=bb.getFile2()%><%}%><br>
<label for="file3">첨부파일3</label><input type="file" name="file3" id="file3"><%if(bb.getFile3()!=null){%><br><label for="file13">기존파일3</label><input type="hidden" name="file13" id="file13" value="<%=bb.getFile3()%>"><img src="./upload/<%=bb.getFile3()%>" width="50" ><%=bb.getFile3()%><%}%><br>
<label for="file4">첨부파일4</label><input type="file" name="file4" id="file4"><%if(bb.getFile4()!=null){%><br><label for="file14">기존파일4</label><input type="hidden" name="file14" id="file14" value="<%=bb.getFile4()%>"><img src="./upload/<%=bb.getFile4()%>" width="50" ><%=bb.getFile4()%><%}%><br>
<label for="file5">첨부파일5</label><input type="file" name="file5" id="file5"><%if(bb.getFile5()!=null){%><br><label for="file15">기존파일5</label><input type="hidden" name="file15" id="file15" value="<%=bb.getFile5()%>"><img src="./upload/<%=bb.getFile5()%>" width="50" ><%=bb.getFile5()%><%}%><br>
<div class="clear"></div><br>
<input type="submit" value="글수정">
</form>
</div>
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
