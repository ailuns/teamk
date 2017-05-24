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
	function replyupdate(){
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
		<div id="board_head">
			<div id="qna_title">Q&A 게시판</div>
			<div id="qna_script">궁금한것은 질문해주세요.</div>
		</div>
		<div id="clear"></div>
		<div id="board">
		<div id="board_content">
<table>
<tr><td id="num"><%=bb.getRe_ref()%></td><td id="date"><%=bb.getDate()%></td><td id="readcount">조회수: <%=bb.getReadcount()%></td></tr>
<tr><td colspan="2" id="subject"> 
<%=bb.getSubject()%></td><td id="id"><%=bb.getId()%></td></tr>
<%if(id!=null){if(id.equals("admin")){%><tr><td id="num">메일주소 : <%=bb.getEmail()%></td></tr><%}}%>
<tr><td colspan="3" id="content"><br><br><%=bb.getContent()%><br><br></td></tr>
<%if(bb.getFile1()!=null){%>
<tr><td>첨부파일1</td><td colspan="3"><%if(bb.getFile1()!=null){%><a href="./upload/<%=bb.getFile1()%>"><%=bb.getFile1()%></a><%}%></td></tr>
<%}%>
<%if(bb.getFile2()!=null){%>
<tr><td>첨부파일2</td><td colspan="3"><%if(bb.getFile2()!=null){%><a href="./upload/<%=bb.getFile2()%>"><%=bb.getFile2()%></a><%}%></td></tr>
<%}%>
<%if(bb.getFile3()!=null){%>
<tr><td>첨부파일3</td><td colspan="3"><%if(bb.getFile3()!=null){%><a href="./upload/<%=bb.getFile3()%>"><%=bb.getFile3()%></a><%}%></td></tr>
<%}%>
<%if(bb.getFile4()!=null){%>
<tr><td>첨부파일4</td><td colspan="3"><%if(bb.getFile4()!=null){%><a href="./upload/<%=bb.getFile4()%>"><%=bb.getFile4()%></a><%}%></td></tr>
<%}%>
<%if(bb.getFile5()!=null){%>
<tr><td>첨부파일5</td><td colspan="3"><%if(bb.getFile5()!=null){%><a href="./upload/<%=bb.getFile5()%>"><%=bb.getFile5()%></a><%}%></td></tr>
<%}%>
</table>
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



<!-- ///////////////////댓글///////////////// -->
<%
//List boardReplyList=(List)request.getAttribute("boardReplyList");
List lrb = null;

//List<BoardReplyBean> lrb = (List)request.getAttribute("lrb");
int rcount = (int)request.getAttribute("rcount");
if(rcount!=0){lrb=(List)request.getAttribute("lrb");}//
%>
<div id="replyUpdate">
<p>댓글(<%=rcount%>개)</p>
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
<input type="button" value="×" onclick="replydelete(<%=rb.getNum()%>)">
</form>
<%}}%></td>
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
	<input type="hidden" id="wEmail" value="<%=bb.getEmail()%>">
	<input type="hidden" id="rNum" name="group_del" value="<%=bb.getNum()%>">
	<input type="hidden" id="pageNum" value="<%=pageNum%>">
	<input type="hidden" id="rId" name="id" value="<%=id%>" readonly>
	<div id="textarea">
		<textarea rows="3" cols="59" id="rContent" name="content"></textarea>
		<input type="hidden" id="wContent" value="<%=bb.getContent()%>">
</div>
<input type="button" value="댓글달기" onclick="replyupdate()">	
<%}else{%>
<textarea rows="3" cols="59" name="content" placeholder="Q&A게시판 답변은 관리자만 작성가능합니다." readonly></textarea>	
<%}}else{%>
<textarea rows="3" cols="59" name="content" placeholder="Q&A게시판 답변은 관리자만 작성가능합니다." readonly></textarea>
<%}%>
</form>
<!-- ///////////////////댓글///////////////// -->
		</div>
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