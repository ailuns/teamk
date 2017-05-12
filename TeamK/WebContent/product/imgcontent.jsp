<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ page import="net.member.db.*"%>
<%@ page import="java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="./css/default.css" rel="stylesheet" type="text/css">
<link href="./css/subpage.css" rel="stylesheet" type="text/css">
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
<script src="./js/jquery-3.2.0.js"></script>
<script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
</head>
<style>
#map_canvas {
	width: 740px;
	height: 400px;
}
</style>
	</script>


	<style type="text/css">
img.ui-datepicker-trigger {
	cursor: pointer;
	margin-left: 5px;
}

.clear {
	clear: both;
}

#wrap {
	width: 1000px;
	min-height: 1000px;
	border: 1px solid black;
	margin: 0 auto;
	padding-top: 50px;
}

#top {
	width: 900px;
}

#imgdiv img {
	width: 300px;
	height: 400px;
	border: 3px solid orange;
	float: left;
}

#contentdiv1 {
	width: 300px;
	height: 400px;
	border: 3px solid blue;
	float: left;
}

#contentdiv2 {
	width: 800px;
	min-height: 700px;
	border: 3px solid gray;
}

#map {
	width: 800px;
	height: 500px;
	border: 3px solid skyblue;
}

#review {
	width: 800px;
	height: 500px;
	border: 3px solid pink;
}

#map {
	height: 500px;
}

.controls {
	margin-top: 10px;
	border: 1px solid transparent;
	border-radius: 2px 0 0 2px;
	box-sizing: border-box;
	-moz-box-sizing: border-box;
	height: 32px;
	outline: none;
	box-shadow: 0 2px 6px rgba(0, 0, 0, 0.3);
}

#pac-input {
	background-color: #fff;
	font-family: Roboto;
	font-size: 15px;
	font-weight: 300;
	margin-left: 12px;
	padding: 0 11px 0 13px;
	text-overflow: ellipsis;
	width: 300px;
}

#pac-input:focus {
	border-color: #4d90fe;
}

.pac-container {
	font-family: Roboto;
}

#type-selector {
	color: #fff;
	background-color: #4d90fe;
	padding: 5px 11px 0px 11px;
}

#type-selector label {
	font-family: Roboto;
	font-size: 13px;
	font-weight: 300;
}

#target {
	width: 345px;
}
</style>
<body>	

	<%	request.setCharacterEncoding("utf-8");
		ProductBean pb = new ProductBean();
		ProductDAO pdao = new ProductDAO();
		CategoryBean cb = new CategoryBean();
		CategoryDAO cdao = new CategoryDAO();
		CommentBean comb = new CommentBean();
		CommentDAO comdao = new CommentDAO();
		List productList2 = (List) request.getAttribute("productList2");
	 	//디비 객체 생성 BoardDAO bdao
	 	// int count = getBoardCount() 메서드호출 count(*)
	 	int num = (int) request.getAttribute("num");
	 	int count = (int) request.getAttribute("count");
	 	int commentcount = (int) request.getAttribute("commentcount");
	 	int pageSize = (int) request.getAttribute("pageSize");
	 	String pageNum = (String) request.getAttribute("pageNum");
	 	int startRow = (int) request.getAttribute("startRow");
	 	int endRow = (int) request.getAttribute("endRow");
	 	List productList = (List) request.getAttribute("productList");
	 	int pageCount = (int) request.getAttribute("pageCount");
	 	int pageBlock = (int) request.getAttribute("pageBlock");
	 	int startPage = (int) request.getAttribute("startPage");
	 	int endPage = (int) request.getAttribute("endPage");
	 	List productList3 = (List) request.getAttribute("productList3");
	 	List commentList = (List) request.getAttribute("commentList");
	%>
	<%
		//String id = (String) session.getAttribute("id");
		String id = "admin";
		//객체 생성
		//게시판의 글의 개수
	%>
	<div id="wrap">
	<!-- 헤더들어가는 곳 -->
		<!-- 헤더들어가는 곳 -->

		<!-- 본문들어가는 곳 -->
		<!-- 메인이미지 -->
		<div id="sub_img_center"></div>
		<!-- 메인이미지 -->

		<!-- 왼쪽메뉴 -->
		<nav id="sub_menu">
		<ul>
			<%
				for (int i = 0; i < productList2.size(); i++) {

					cb = (CategoryBean) productList2.get(i);
			%>
			<li><a href="./Productlist.bo?car_num=<%=cb.getCanum()%>"><%=cb.getCaname()%></a></li>
			<%
				}
			%>

		</ul>
		</nav>
		<!-- 왼쪽메뉴 -->
		<%
				for (int i = 0; i < productList.size(); i++) {

						pb = (ProductBean) productList.get(i);
			%>
	
		<h3><%=pb.getSubject()%>  <%if(id.equals("admin")){ %><input type="button" value="글삭제" onclick="location.href='./ProductDelete.bo?num=<%=num%>&pageNum=<%=pageNum%>'" style="float:right;margin:0px 50px 0px 0px;"><input type="button" value="글수정" onclick="location.href='./ProductUpdate.bo?num=<%=num%>&pageNum=<%=pageNum%>'" style="float:right;"><%} %></h3>
		
		<input type="hidden" id = "name" name = "name" value = "<%=pb.getSubject()%>" />
		<hr>
		<div id="top">
			<div id="imgdiv">
			
				<img src="./upload/<%=pb.getImg().split(",")[0]%>"> <!-- 디비에서 이미지값 불러오기 -->
			</div>
			<div id="contentdiv1">
				<form name="fr" method="post">
					<table border="1">
						<tr>
							<td width="50px">판매가</td>
							<td width="100px"><%=pb.getCost() %></td>
						</tr>
						<tr>
							<td width="50px">카테고리</td>
							<td width="100px"><%=pb.getType() %></td>
						</tr>
							<%} %>
						<tr>
							<td width="50px">color</td>
								<td><select id="color" name="color" onchange="people_Calc2(<%=num%>)">
								<option value = "">선택하세요</option>
								<%
				for (int i = 0; i < productList3.size(); i++) {

						pb = (ProductBean) productList3.get(i);
			%>
	
								<option value = "<%=pb.getColor()%>"><%=pb.getColor()%></option>
								<%} %>
							</select></td>
						</tr>
						<tr>
							<td width="50px">size</td>
							<td width="100px">
							<select id="size" name="size" onchange="people_Calc3()">
								<option  value = "">선택하세요</option>
								</select></td>
						</tr>
						<tr>
							<td width="50px">수량</td>
							<td width="100px">
							<input type="button" value="▲" onclick="up()"><input type="text" id = "stack" name = "stack" value = "1" style="width:30px;"><input type="button"  value="▼" onclick="down()" >
							</td>
						</tr>
						
						
					</table>
					<table border="1">
						<tr>
							<td width="75px">성인</td>
							<td width="75px">아동</td>
						</tr>
						<tr>
							<td><select id="adult" name="adult" onchange="people_Calc(1)">
									<%
										for (int i = 1; i < 11; i++) {
									%>
									<option value="<%=i%>"><%=i%></option>
									<%
										}
									%>
							</select></td>
							<td><select id="child" name="child" onchange="people_Calc()">
									<option value="0">0</option>
									<option value="1">1</option>
							</select></td>
						</tr>
						<tr>
							<td>합계</td>
							<td colspan="2"><p id="p">200000</p> <script
									type="text/javascript">
							
							function people_Calc2(str){			
								$(document).ready(function(){
									var val1 = $("#color option:selected").val();
									var val2 = str
									
									alert(val1);
									alert(val2);
									$("#size").find("option").remove();
									$.getJSON('./product/json3.jsp?num='+val2+'&color='+val1,function(data){
										$.each(data,function(index,qwer){
										//body태그 추가 key:value	
											$('#size').append("<option value=" + qwer.size + ">" + qwer.size + "</option");
										});
									});
								});
							}
							
							function people_Calc(num){			
								$(document).ready(function(){
									var val1 = $("#adult option:selected").val();
									var val2 = $("#child option:selected").val();
									
									if (num == 1)
									{
										$("#child").find("option").remove();
										for (i = 0; i <= val1; i++)
										{
											$('#child').append("<option value=" + i + ">" + i + "</option");
										}
									}
									
									$('#p').html(val1 * 200000 + val2 * 100000);
								});
							}
					
							
						</script></td>
						</tr>
						<tr>
							<td><input type="submit" value="찜하기" onclick="submit_fun(1)"></td>
							<td><input type="submit" value="예약하기" onclick="submit_fun(2)"></td>
						</tr>
					</table>
				</form>
			</div>
		</div>
		<div class="clear"></div>

		<div id="middle1">
		<%
				for (int i = 0; i < productList.size(); i++) {

						pb = (ProductBean) productList.get(i);
			%>
			<div id="contentdiv2"><%=pb.getContent() %></div>
			<%} %>
		</div>


		



		<div id="middle3">
			<div id="review">
				<h3>상품 문의</h3>
				<hr>
				<%/*
					// 디비 객체 생성 BoardDAO
					ReplyDAO cdao = new ReplyDAO();
					//전체글 횟수 구하기 int count = getBoardCount()
					int count = cdao.getCommentCount(pb.getNum());

					//한페이지에 보여줄 글의 갯수
					int pagesize = 10;

					//현재페이지가 몇페이지인지 가져오기
					String pageNum = request.getParameter("pageNum");

					if (pageNum == null)
						pageNum = "1";
					//시작행 구하기   1,  11,  21,  31,  41  ...... 

					int currentPage = Integer.parseInt(pageNum);
					int startRow = (currentPage - 1) * pagesize + 1;

					//끝행 구하기
					int endRow = currentPage * pagesize;

					// 메서드 호출 getBoardList(시작행, 몇개)
					List replyList;
					ReplyBean rb;*/
				%>
				게시판 전체글 갯수[<%=commentcount%>]

				

				<br>
				
		<table width ="650" border="3" align ="center" bordercolor="gray">
		<tr height="30"><td colspan="3" align = "center" bgcolor="gray">
		<font color="white">Comment</font></td></tr>
		<form action ="./ContenttWriteAction.bo">
		<input type="hidden" name = "ref_fk" value = "<%=num%>" />
		<input type="hidden" name = "pageNum" value = "<%=pageNum%>" />
		<tr><td align = "center" width ="100" bgcolor="gray">
		<font color = "white">ID</font></td>
		<td colspan="2" align = "center">Content</td></tr>
		<tr><td align = "center" bgcolor="gray">
		<font color = "white"><%=id %></font></td>
		<input type="hidden" name = "id" value = "<%=id%>" />
		<%if(id==null){ %>
		<td colspan="2"><textarea name = "content" cols="50" row="3" onclick="return check()">로그인 후 이용 할 수 있습니다.</textarea>
		<%}else{ %>
		<td colspan="2"><textarea name = "content" cols="50" row="3"></textarea>
		<%} %>
		<input type ="submit" name ="register" value="댓글쓰기">
		</form>
		 <%if(commentcount==0){%><tr><td class="left" colspan="5"><center>게시한 글이없습니다.</center></td>
  </tr> <%}else{%>
		  <%for(int i=0; i< commentList.size(); i++) {
			  comb = (CommentBean)commentList.get(i);
			%>
				<script type="text/javascript">

		$(document).ready(function() {
			str = <%=comb.getNum()%>
		$('#show'+str).hide();
		
	});
	</script>
			<% if(num  == comb.getRef_fk()){%>
			<tr><td align = "center" width = "100" bgcolor = "gray">
			<font color ="white"><%=comb.getId() %></font></td>
			<td><% 
				int wid=0;
				if(comb.getRe_lev()>0){
					wid=10*comb.getRe_lev();
					%>
					<img src="../images/center/level.gif" width="<%=wid%>" height="15px">
					<img src="../images/center/re.gif">
			<% 	}%>
			<%=comb.getContent() %><span id="hidden<%=comb.getNum() %>"> 
			<%if(comb.getId().equals(id)){ %><input type = "button" value="삭제" class="write" style="float:right;" onclick="return winopen3(<%=comb.getNum()%>)"> 
			<input type = "button" value="수정" class="write"  style="float:right;" onclick="return winopen2(<%=comb.getNum()%>)">
			<input type = "button" value="답글" class="write"  id ="a<%=comb.getNum() %>"style="float:right;" onclick="return winopen(<%=comb.getNum()%>)">
			<%}else{ %>
			<input type = "button" value="답글" class="write"  id ="a<%=comb.getNum() %>"style="float:right;" onclick=<%if(id!=null){ %>"return winopen(<%=comb.getNum()%>)"<%}else{ %>"return check()"<%} %>>
			<%} %></span> 
			<h1 id="aaaa"></h1><span id="show<%=comb.getNum()%>"><form action ="./ContenttWriteAction2.bo">
		<input type="hidden" name = "str" value="<%=comb.getNum()%>">
		<input type="hidden" name = "re_ref" value="<%=comb.getRe_ref() %>">
		<input type="hidden" name = "re_lev" value="<%=comb.getRe_lev() %>">
		<input type="hidden" name = "re_seq" value="<%=comb.getRe_seq() %>">
		<input type="hidden" name = "ref_fk" value = "<%=num%>" />
		<input type="hidden" name = "pageNum" value = "<%=pageNum%>" />
		<input type="hidden" name = "id" value = "<%=id%>" />
			<textarea name = "content" cols="50" row="3">[답글] </textarea>
			<input type = "button" value="취소" class="write" style="float:right;" onclick="return winopen4(<%=comb.getNum()%>)">
			<input type = "submit" value="등록" class="write" style="float:right;" >
			</form>
			</span>
			</td>
			<td align = "center" width = "150"><%=comb.getDate() %></td></tr>
			<%}%>
			<% }%>
			<%} %>
		</table>
		<div id="page_control">
<%
	if(commentcount!=0){
		if(endPage > pageCount){
			endPage = pageCount;
		}
		//Prev
		if(startPage>pageBlock){
			%><a href="imgcontent2.jsp?pageNum=<%=startPage-pageBlock%>&num=<%=num%>">[이전]</a> <% 
		}
		//1..10
		for(int i=startPage; i<=endPage; i++){
			%><a href="imgcontent2.jsp?pageNum=<%=i%>&num=<%=num%>">[<%=i%>]</a><% 
		}
		// 다음
		if(endPage < pageCount){
			%><a href="imgcontent2.jsp?pageNum=<%=startPage+pageBlock%>&num=<%=num%>">[다음]</a><% 
		}
	}
	
	
	%>
</div>
			</div>
		</div>
	</div>

	<script type="text/javascript">
	
	function up(){
		
		var str = $("#stack").val();
		if(str >= 999){
			alert("더이상클릭할수업습니다.")
		}else{
		str++;
		document.fr.stack.value = str;
		}
	}
	function down(){
		var str = $("#stack").val();
		if(str <= 1){
			alert("더이상클릭할수업습니다.")
		}else{
		str--;
		document.fr.stack.value = str;
		}
	}
	
	function winopen(str){
		$('#hidden'+str).hide();
		$('#show'+str).show('slow', function() {
		});
}

function winopen2(str){
	location.href="../company/updatecontentFrom.jsp?num=<%=num%>&pageNum=<%=pageNum%>&str="+str;
}

function winopen3(str){
	reg=confirm("정말로 이 글을 삭제하시겠습니까?")
	if(reg== true){
		location.href="../company/deletecontentPro.jsp?num=<%=num%>&pageNum=<%=pageNum%>&str="+str;
	}else{
			return false;
		}
}



function winopen4(str){
	$('#show'+str).hide();
	$('#hidden'+str).show('slow', function() {
	});
}
	

	</script>
</body>
</html>