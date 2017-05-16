
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
<!-- 	<div> -->
<%-- 		<jsp:include page="../inc/leftMenu.jsp"></jsp:include> --%>
<!-- 	</div> -->
	<!--왼쪽 메뉴 -->
	<div id="wrap">
		<div id="rvw_head">
			<div id="rvw_title">리뷰</div>
			<div id="rvw_script">물건이나 여행 후기를 쓰는 곳 입니다.</div>
		</div>
		<div id="clear"></div>
		<div id="login_form">
<form action="./BoardUpdateAction.bo?pageNum=<%=pageNum%>" method="post" name="fr" enctype="multipart/form-data">
<input type="hidden" value="1" name="type">
<input type="hidden" name="num" value="<%=bb.getNum()%>">
ID:<input type="text" name="id" value="<%=id%>" readonly><br>
첨부파일1:<input type="file" name="file1"><%if(bb.getFile1()!=null){%>기존파일1:<input type="hidden" name="file11" value="<%=bb.getFile1()%>"><img src="./upload/<%=bb.getFile1()%>" width="50" ><%=bb.getFile1()%><%}%><br>
첨부파일2:<input type="file" name="file2"><%if(bb.getFile2()!=null){%>기존파일2:<input type="hidden" name="file12" value="<%=bb.getFile2()%>"><img src="./upload/<%=bb.getFile2()%>" width="50" ><%=bb.getFile2()%><%}%><br>
첨부파일3:<input type="file" name="file3"><%if(bb.getFile3()!=null){%>기존파일3:<input type="hidden" name="file13" value="<%=bb.getFile3()%>"><img src="./upload/<%=bb.getFile3()%>" width="50" ><%=bb.getFile3()%><%}%><br>
첨부파일4:<input type="file" name="file4"><%if(bb.getFile4()!=null){%>기존파일4:<input type="hidden" name="file14" value="<%=bb.getFile4()%>"><img src="./upload/<%=bb.getFile4()%>" width="50" ><%=bb.getFile4()%><%}%><br>
첨부파일5:<input type="file" name="file5"><%if(bb.getFile5()!=null){%>기존파일5:<input type="hidden" name="file15" value="<%=bb.getFile5()%>"><img src="./upload/<%=bb.getFile5()%>" width="50" ><%=bb.getFile5()%><%}%><br>
제목:<input type="text" name="subject" value="<%=bb.getSubject()%>"><br>
내용:<textarea id="ir1" rows="30" cols="90" name="content"><%=bb.getContent() %></textarea><br>
<input type="submit" value="글수정" onclick="submitContents(this);">
</form>
		</div>
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
	alert(sHTML);
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