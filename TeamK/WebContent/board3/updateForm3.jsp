
<%@page import="net.board.db.BoardBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="./css/inc.css" rel="stylesheet" type="text/css">
<link href="./css/subpage.css" rel="stylesheet" type="text/css">
<!-- Smart Editor -->
<script type="text/javascript" src="./js/HuskyEZCreator.js" charset="utf-8"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>./photo_uploader/plugin/hp_SE2M_AttachQuickPhoto.js" charset="utf-8"></script>
<!-- Smart Editor -->
</head>
<body>
<%
BoardBean bb =(BoardBean)request.getAttribute("bb");
String pageNum = (String)request.getAttribute("pageNum");
String id = (String)session.getAttribute("id");
%>
	<!--왼쪽 메뉴 -->
	<div>
		<jsp:include page="../inc/leftMenu.jsp"></jsp:include>
	</div>
	<!--왼쪽 메뉴 -->
	<div id="wrap">
		<div id="article_head">
			<div id="article_title">공지사항</div>
			<div id="article_script">공지사항 게시판 입니다.</div>
		</div>
		<div id="clear"></div>
		<article>
		<div id="board_write">
<form action="./BoardUpdateAction3.bo?pageNum=<%=pageNum%>" method="post" name="fr" enctype="multipart/form-data">
<input type="hidden" name="num" value="<%=bb.getNum()%>">
<input type="hidden" name="id" value="<%=id%>">
<label for="subject">제목</label><input type="text" name="subject" id="subject" value="<%=bb.getSubject()%>"><br><br>
<textarea id="ir1" rows="30" cols="80" name="content"><%=bb.getContent() %></textarea><br><br>
<%if(bb.getFile1()!=null){%><label for="file11">기존파일1</label><input type="hidden" name="file11" id="file11" value="<%=bb.getFile1()%>"><img src="./upload/<%=bb.getFile1()%>" width="50" ><%=bb.getFile1()%><%}%><br>
<%if(bb.getFile2()!=null){%><label for="file12">기존파일2</label><input type="hidden" name="file12" id="file12" value="<%=bb.getFile2()%>"><img src="./upload/<%=bb.getFile2()%>" width="50" ><%=bb.getFile2()%><%}%><br>
<%if(bb.getFile3()!=null){%><label for="file13">기존파일3</label><input type="hidden" name="file13" id="file13" value="<%=bb.getFile3()%>"><img src="./upload/<%=bb.getFile3()%>" width="50" ><%=bb.getFile3()%><%}%><br>
<%if(bb.getFile4()!=null){%><label for="file14">기존파일4</label><input type="hidden" name="file14" id="file14" value="<%=bb.getFile4()%>"><img src="./upload/<%=bb.getFile4()%>" width="50" ><%=bb.getFile4()%><%}%><br>
<%if(bb.getFile5()!=null){%><label for="file15">기존파일5</label><input type="hidden" name="file15" id="file15" value="<%=bb.getFile5()%>"><img src="./upload/<%=bb.getFile5()%>" width="50" ><%=bb.getFile5()%><%}%><br>
<label for="file1">첨부파일1</label><input type="file" name="file1" id="file1">
<label for="file2">첨부파일2</label><input type="file" name="file2" id="file2">
<label for="file3">첨부파일3</label><input type="file" name="file3" id="file3">
<label for="file4">첨부파일4</label><input type="file" name="file4" id="file4">
<label for="file5">첨부파일5</label><input type="file" name="file5" id="file5">
<div class="clear"></div><br>
<input type="submit" value="글수정" onclick="submitContents(this);">
<input type="button" value="취소" OnClick="javascript:history.back(-1)">
</form>
</div>
	</article>
	</div>
	<jsp:include page="../inc/footer.jsp"></jsp:include>
	<!--오른쪽 메뉴 -->
	<div>
		<jsp:include page="../inc/rightMenu.jsp"></jsp:include>
	</div>
	<!--오른쪽 메뉴 -->
</body>
<script type="text/javascript">
var oEditors = [];
nhn.husky.EZCreator.createInIFrame({
	oAppRef: oEditors,
	elPlaceHolder: "ir1",
	sSkinURI: "./SmartEditor2Skin.html",	
	htParams : {
		bUseToolbar : true,				// 툴바 사용 여부 (true:사용/ false:사용하지 않음)
		bUseVerticalResizer : true,		// 입력창 크기 조절바 사용 여부 (true:사용/ false:사용하지 않음)
		bUseModeChanger : true,			// 모드 탭(Editor | HTML | TEXT) 사용 여부 (true:사용/ false:사용하지 않음)
		fOnBeforeUnload : function(){
		}
	}, 
	fCreator: "createSEditor2"
});


function pasteHTML(fname) {
	var sHTML = '<img src="<%=request.getContextPath()%>/upload/'+ fname +'">';
	//alert(sHTML);
    oEditors.getById["ir1"].exec("PASTE_HTML", [sHTML]);
}

function showHTML() {
	var sHTML = oEditors.getById["ir1"].getIR();
	alert(sHTML);
}

function submitContents(elClickedObj) {
	oEditors.getById["ir1"].exec("UPDATE_CONTENTS_FIELD", []);	// 에디터의 내용이 textarea에 적용됩니다.
	
	// 에디터의 내용에 대한 값 검증은 이곳에서 document.getElementById("ir1").value를 이용해서 처리하면 됩니다.
	
	try {
		elClickedObj.form.submit();
	} catch(e) {}
}
</script>
</html>