<%@page import="net.member.db.MemberBean"%>
<%@page import="net.board.db.BoardDAO"%>
<%@page import="net.board.db.BoardReplyBean"%>
<%@page import="java.util.List"%>
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
<script type="text/javascript" src="./js/jquery-3.2.0.js"></script>
<script type="text/javascript">

/////////////////////AJAX 리플 달기, 삭제/////////////////////////
	function replyupdate(){
	if(document.fr1.content.value!=""){
		 $.ajax({
	         url:'./BoardReplyAction2.bo',
	         type:'post',
	         data:{
	            rContent:$('#rContent').val(),
	            rNum:$('#rNum').val(),
		        rId:$('#rId').val(),
		        pageNum:$('#pageNum').val(),
		        wEmail:$('#wEmail').val(),
		        wContent:$('#wContent').val()
	         },success:function(data){
	        	 $('#replyUpdate').html(data);
	         }
	      });
	}else if(document.fr1.content.value==""){
		alert("댓글을 입력해주세요");
	}
	}
	function replydelete(rbNum) {
		
		$.ajax({
			url:'./BoardReplyDel.bo',
	        type:'post',
	        data:{
	        	num:rbNum,
	        	rNum:$('#rNum').val(),
	        },success:function(data){
	        	 $('#replyUpdate').html(data);
	         }
		});
	}
/////////////////////AJAX 리플 달기, 삭제/////////////////////////
	
</script>
</head>
<body>
<%
BoardBean bb =(BoardBean)request.getAttribute("bb");
BoardDAO bdao = new BoardDAO();
String pageNum = (String)request.getAttribute("pageNum");
String id = (String)session.getAttribute("id");
int num = Integer.parseInt(request.getParameter("num"));
%>
	<!--왼쪽 메뉴 -->
	<div>
		<jsp:include page="../inc/leftMenu.jsp"></jsp:include>
	</div>
	<!--왼쪽 메뉴 -->
	<div id="wrap">
		<div id="article_head">
			<div id="article_title"><img src="./img/qna2.png" width="35px" style="margin-right: 8px; vertical-align: bottom;">Q&A 게시판</div>
			<div class="empty"></div>
			<div id="article_script">궁금한것은 질문해주세요.</div>
		</div>
		<div id="clear"></div>
		<article>
		<div id="board_content">
<table id="content">
 <tr>
  <td id="num"><%=bb.getRe_ref()%></td>
  <td id="date"><%=bb.getDate()%></td>
  <td id="readcount">조회수: <%=bb.getReadcount()%></td>
 </tr>
 <tr>
  <td colspan="2" id="subject"><%=bb.getSubject()%></td>
  <td id="id"><%=bb.getId()%></td>
 </tr>
 <%if(id!=null){if(id.equals("admin")){%>
 <tr>
  <td id="num">메일주소 : <%=bb.getEmail()%></td>
 </tr><%}}%>
 <tr>
  <td colspan="3" id="content_td"><br><br><div id="min"><%=bb.getContent()%></div><br></td>
 </tr>

<%--첨부파일이 있을때만 첨부파일 표시--%>
<%if(bb.getFile1()!=null){%>
<tr><td>첨부파일1</td><td colspan="3"><%if(bb.getFile1()!=null){%><a href="./file_down.jsp?file_name=<%=bb.getFile1()%>"><%=bb.getFile1()%></a><%}%></td></tr>
<%}%>
<%if(bb.getFile2()!=null){%>
<tr><td>첨부파일2</td><td colspan="3"><%if(bb.getFile2()!=null){%><a href="./file_down.jsp?file_name=<%=bb.getFile2()%>"><%=bb.getFile2()%></a><%}%></td></tr>
<%}%>
<%if(bb.getFile3()!=null){%>
<tr><td>첨부파일3</td><td colspan="3"><%if(bb.getFile3()!=null){%><a href="./file_down.jsp?file_name=<%=bb.getFile3()%>"><%=bb.getFile3()%></a><%}%></td></tr>
<%}%>
<%if(bb.getFile4()!=null){%>
<tr><td>첨부파일4</td><td colspan="3"><%if(bb.getFile4()!=null){%><a href="./file_down.jsp?file_name=<%=bb.getFile4()%>"><%=bb.getFile4()%></a><%}%></td></tr>
<%}%>
<%if(bb.getFile5()!=null){%>
<tr><td>첨부파일5</td><td colspan="3"><%if(bb.getFile5()!=null){%><a href="./file_down.jsp?file_name=<%=bb.getFile5()%>"><%=bb.getFile5()%></a><%}%></td></tr>
<%}%>
</table><br>
<%
if(id!=null){
if(id.equals(bb.getId())){ %>
<input type="button" value="글수정" 
       onclick="location.href= './BoardUpdate2.bo?num=<%=bb.getNum()%>&pageNum=<%=pageNum%>'">     
<%}if(id.equals(bb.getId())||id.equals("admin")){ %>
<input type="button" value="글삭제" 
       onclick="location.href= './BoardDelete2.bo?num=<%=bb.getNum()%>&pageNum=<%=pageNum%>'">
<%}}%>
<input type="button" value="글목록" 
       onclick="location.href='./BoardList2.bo?pageNum=<%=pageNum%>'">


<br><br>
<!-- ///////////////////댓글///////////////// -->
<!-- 댓글부분 댓글 하나 달면 그때부터 board2/reply2.jsp 페이지로 대체됨, 새로고침시 초기화-->
<%
List lrb = null;

int rcount = (int)request.getAttribute("rcount");
if(rcount!=0){lrb=(List)request.getAttribute("lrb");}

%>
<div id="replyUpdate">
<p>답변(<%=rcount%>개)</p>
<table id="reply">
    <%if(rcount!=0){
    for(int i=0; i<lrb.size(); i++){
    	//자바빈(BoardBean) 변수 =배열한칸 접근  배열변수.get()
    	BoardReplyBean rb = (BoardReplyBean)lrb.get(i);%>
<tr>
 <td id="name"><%=rb.getId()%></td>
 <td id="content"><%=rb.getContent()%></td>
 <td id="delete"><%
if(id!=null){
	if(id.equals(rb.getId())||id.equals("admin")){ 
%>
<form method="post" name="replydel">
<%--리플삭제버튼 replydelete로 AJAX 실행 --%>
<input type="button" value="×" onclick="replydelete(<%=rb.getNum()%>)">
</form>
<%}}%>
 </td>
 <td id="date"><%=rb.getDate()%></td>
</tr>
    <%
    }}
    %>
</table>
<%
if(id!=null){
if(id.equals("admin")){%>
<form method="post" name="fr1" id="reply">
<span><%=id%></span>
<%--id값으로 AJAX로 값 넘기기 --%>
	<input type="hidden" id="wEmail" value="<%=bb.getEmail()%>"> <%--작성자에게 답변 메일보내기위해 작성자의 Email값 넘기기 --%>
	<input type="hidden" id="rNum" name="group_del" value="<%=bb.getNum()%>">
	<input type="hidden" id="pageNum" value="<%=pageNum%>">
	<input type="hidden" id="rId" name="id" value="<%=id%>" readonly>
	<div id="textarea">
		<textarea rows="3" cols="59" id="rContent" name="content"></textarea> <%-- 리플내용 넘기기 --%>
		<input type="hidden" id="wContent" value="<%=bb.getContent()%>"> <%-- 작성자가 쓴 게시물 내용 wContent 넘기기 --%>
</div>
<%--댓글달기버튼 replyupdate로 AJAX 실행 --%>
<input type="button" value="댓글달기" onclick="replyupdate()">	
<%}} %>
</form>
<!-- ///////////////////댓글///////////////// -->
		</div>
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
</html>