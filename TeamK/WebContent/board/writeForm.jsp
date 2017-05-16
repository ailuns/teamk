<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="./css/inc.css" rel="stylesheet" type="text/css">
<link href="./css/subpage.css" rel="stylesheet" type="text/css">
<%String id = (String)session.getAttribute("id");%>
<!-- Smart Editor -->
<script type="text/javascript" src="./js/HuskyEZCreator.js" charset="utf-8">
</script>
<script type="text/javascript" src="<%=request.getContextPath()%>./photo_uploader/plugin/hp_SE2M_AttachQuickPhoto.js" charset="utf-8">
</script>
<!-- Smart Editor -->
</head>
<body>
	<!--왼쪽 메뉴 -->
	<div>
		<jsp:include page="../inc/leftMenu.jsp"></jsp:include>
	</div>
	<!--왼쪽 메뉴 -->
	<div id="wrap">
		<div id="board_head">
			<div id="rvw_title">로그인</div>
			<div id="rvw_script">로그인이 필요합니다.</div>
		</div>
		<div id="clear"></div>
		<div id="board">
		<div id="board_write">
<form action="./BoardWriteAction.bo" method="post" name="fr" enctype="multipart/form-data">
<input type="hidden" value="1" name="type">
ID:<input type="text" name="id" value="<%=id%>" readonly><br>
첨부파일1:<input type="file" name="file1"><br>
첨부파일2:<input type="file" name="file2"><br>
첨부파일3:<input type="file" name="file3"><br>
첨부파일4:<input type="file" name="file4"><br>
첨부파일5:<input type="file" name="file5"><br>
제목:<input type="text" name="subject" maxlength="20"><br>
내용:<textarea id="ir1" rows="30" cols="90" name="content"></textarea><br>
<input type="submit" id="save" value="글쓰기">
<input type="button" value="글목록" 
       onclick="location.href='./BoardList.bo?pageNum=1'">
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

$("#save").click(function(){

    var content = oEditors.getById["ir1"].getIR(); // Edit에 쓴 내용을 content 변수에 저장    값 : <br>
    
    if (document.fr.subject.value == "") {
		alert("제목을 입력하세요");
		document.fr.subject.focus();
		return false;
	}
    


    if (content == "<br>")  // 빈공간 값 <br>
    {
       alert("글을 써주세요");  // 메시지 띄움
       return false;
    }
    
    else // 글내용 있을 시
    {
       oEditors.getById["ir1"].exec("UPDATE_CONTENTS_FIELD", []); // Edit에 쓴 내용을 textarea에 붙여넣어준다
        $("#fr").submit();  // form을 submit 시킨다
    }
 });
</script>
</html>