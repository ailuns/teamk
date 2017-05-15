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
    
    if (document.fr.subject.value.length > 20) {
		alert("제목은 20자 이하로 작성해주세요");
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
