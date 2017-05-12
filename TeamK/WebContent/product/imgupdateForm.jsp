<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="net.member.db.*"%>
<%@ page import="java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="./css/default.css" rel="stylesheet" type="text/css">
<link href="./css/subpage.css" rel="stylesheet" type="text/css">
<title>Insert title here</title>
<script type="text/javascript" src="./se1/js/HuskyEZCreator.js" charset="utf-8"></script>
<script src="./js/jquery-3.2.0.js"></script>
</head>
	<%
		request.setCharacterEncoding("utf-8");
		List productList = (List) request.getAttribute("productList");
		List productList2 = (List) request.getAttribute("productList2");
		ProductBean pb2= (ProductBean)request.getAttribute("pb");
		//디비 객체 생성 BoardDAO bdao
		// int count = getBoardCount() 메서드호출 count(*)
		ProductBean pb = new ProductBean();
		ProductDAO pdao = new ProductDAO();
		CategoryBean cb = new CategoryBean();
		CategoryDAO cdao = new CategoryDAO();
	%>
	<div id="wrap">
		<!-- 헤더들어가는 곳 -->
		<!-- 헤더들어가는 곳 -->

		<!-- 본문들어가는 곳 -->
		<!-- 본문메인이미지 -->
		<div id="sub_img_center"></div>
		<!-- 본문메인이미지 -->
		<!-- 왼쪽메뉴 -->
		<nav id="sub_menu">
		<ul>
			<%
				for (int i = 0; i < productList2.size(); i++) {

					cb = (CategoryBean) productList2.get(i);
			%>
			<li><a href="./Productlist.bo?canum=<%=cb.getCanum()%>"><%=cb.getCaname()%></a></li>
			<%
				}
			%>

		</ul>
		</nav>
		<!-- 왼쪽메뉴 -->
		<!-- 본문내용 -->
		<!-- 게시판 -->
		<article>
		<h1>Notice</h1>
		<form action="./ProductWriteAction.bo" method="POST" name="fr" id=join
			onsubmit="return check()" enctype="multipart/form-data">
			<fieldset>
				<legend>상품 추가</legend>
				 <label>상품명</label>
				<td><input type="type" name="name" value="<%=pb2.getName()%>">&nbsp;&nbsp;&nbsp;</td>
				
				<span id = "select1"><br><br>
				<label>글제목</label> <input type="type" name="subject"> </span><br>
				<br> <label>카테고리</label>
				<td><select name="car_num">
						<option value="">선택하세요</option>
						<%
							for (int i = 0; i < productList2.size(); i++) {

								cb = (CategoryBean) productList2.get(i);
						%>
						<option value="<%=cb.getCanum()%>"><%=cb.getCaname()%></option>
						<%
							}
						%>
				</select></td>
				<br>
				<br> <label>나라</label> <input type="type" name="country"
					value="한국" readonly><br><br> <label>지역</label>
				<td><select name="area">
						<option value="">선택하세요</option>
						<option value="서울">서울</option>
						<option value="경기도">경기도</option>
				</select></td>
				<br><br>
				<span id="select6"><label>가격</label> <input type="type" name="cost"><br></span>
				 <label>색깔</label> <input type="type" name="color"><br>
				<label>사이즈</label> <input type="type" name="size"><br>
				<label>재고</label> <input type="type" name="stock"><br>
				<span id = "select5"><label>인트로</label> <input type="type" name="intro"><br></span>
				<span id = "select2"><label>이미지첨부</label> <input type="file" name="file1">&nbsp;&nbsp;&nbsp;
				<input type="button" value="이미지추가" onclick="winopen()"></span><br>
				
				<span id="aa"><label>이미지첨부</label> <input type="file" name="file2">&nbsp;&nbsp;&nbsp;
				<input type="button" value="이미지추가" class="submit" onclick="return winopen2()"><br></span>
				<span id="aa2"><label>이미지첨부</label> <input type="file" name="file3">&nbsp;&nbsp;&nbsp;
				<input type="button" value="이미지추가" class="submit" onclick="return winopen3()"><br></span>
				<span id="aa3"><label>이미지첨부</label> <input type="file" name="file4">&nbsp;&nbsp;&nbsp;
				<input type="button" value="이미지추가" class="submit" onclick="return winopen4()"><br></span>
				<span id="aa4"><label>이미지첨부</label> <input type="file" name="file5"><br></span>
				<span id ="select3"><label>내용</label>
				<table>
				<td style="width:900px; height:412px;">
				<textarea name="content" id="ir1" rows="10" cols="100" style="width:900px; height:412px; display:none;"></textarea>
				</td></table>
				</span>
				<br>
			</fieldset>
			<div class="clear"></div>
			<div id="buttons">
				<input type="submit" id ="save" value="회원가입" class="submit"> <input
					type="reset" value="다시작성" class="cancel" onclick="return winopen5()">
			</div>
		</form>
		<div class="clear"></div>
		</article>
		<!-- 본문내용 -->
		<!-- 본문들어가는 곳 -->

		<div class="clear"></div>
		<!-- 푸터들어가는 곳 -->
		<!-- 푸터들어가는 곳 -->
	</div>

<script type="text/javascript">


	function check() {
		
		if (document.fr.name.value == "select") {

			if (document.fr.name2.value == "") {
				alert("상품명을 넣어주세요.")
				document.fr.name2.focus();
				return false;
			}
			if (document.fr.name.value == "") {
				alert("상품명을 골라주세요.")
				document.fr.name.focus();
				return false;
			}
			if (document.fr.canum.value == "") {
				alert("카테고리를 골라주세요.")
				document.fr.canum.focus();
				return false;
			}
			if (document.fr.country.value == "") {
				alert("나라를 골라주세요.")
				document.fr.country.focus();
				return false;
			}
			if (document.fr.area.value == "") {
				alert("지역을 골라주세요.")
				document.fr.area.focus();
				return false;
			}
			if (document.fr.cost.value == "") {
				alert("가격을 넣어주세요.")
				document.fr.cost.focus();
				return false;
			}
			if (document.fr.color.value == "") {
				alert("색상을 넣어주세요.")
				document.fr.color.focus();
				return false;
			}
			if (document.fr.size.value == "") {
				alert("사이즈을 넣어주세요.")
				document.fr.size.focus();
				return false;
			}
			
			if (document.fr.stock.value == "") {
				alert("재고를 넣어주세요.")
				document.fr.stock.focus();
				return false;
			}
			if (document.fr.subject.value == "") {
				alert("글제목을 넣어주세요.")
				document.fr.subject.focus();
				return false;
			}
			if (document.fr.intro.value == "") {
				alert("상품소개를 넣어주세요.")
				document.fr.intro.focus();
				return false;
			}
			if (document.fr.content.value == "") {
				alert("내용을 넣어주세요.")
				document.fr.content.focus();
				return false;
			}
			if (document.fr.file1.value == "") {
				alert("이미지를 넣어주세요.")
				document.fr.file1.focus();
				return false;
			}else if (document.fr.file2.value == "") {
				alert("이미지를 넣어주세요.")
				document.fr.file2.focus();
				return false;
			}
			
			
			var imgname = document.fr.file1.value.length;
			var imgname2 = document.fr.file2.value.length;
			/** 
			 * lastIndexOf('.') 
			 * 뒤에서부터 '.'의 위치를 찾기위한 함수
			 * 검색 문자의 위치를 반환한다.
			 * 파일 이름에 '.'이 포함되는 경우가 있기 때문에 lastIndexOf() 사용
			 */
			var lastDot = document.fr.file1.value.lastIndexOf('.');
			var lastDot2 = document.fr.file2.value.lastIndexOf('.');
			// 확장자 명만 추출한 후 소문자로 변경
			var fileExt = document.fr.file1.value.substring(lastDot, imgname)
					.toLowerCase();
			var fileExt2 = document.fr.file2.value.substring(lastDot, imgname)
			.toLowerCase();
			if (fileExt != ".png" && fileExt != ".jpg") {
				alert("이미지파일이 아닙니다.\n이미지파일을 넣어주세요");
				return false;
			} else if(fileExt2 != ".png" && fileExt2 != ".jpg"){
				alert("이미지파일이 아닙니다.\n이미지파일을 넣어주세요");
				return false;
			}
			else {
				return true;
			}
		}else{
			if (document.fr.name.value == "") {
				alert("상품명을 골라주세요.")
				document.fr.name.focus();
				return false;
			}
			if (document.fr.canum.value == "") {
				alert("카테고리를 골라주세요.")
				document.fr.canum.focus();
				return false;
			}
			if (document.fr.country.value == "") {
				alert("나라를 골라주세요.")
				document.fr.country.focus();
				return false;
			}
			if (document.fr.area.value == "") {
				alert("지역을 골라주세요.")
				document.fr.area.focus();
				return false;
			}
			if (document.fr.color.value == "") {
				alert("색상을 넣어주세요.")
				document.fr.color.focus();
				return false;
			}
			if (document.fr.size.value == "") {
				alert("사이즈을 넣어주세요.")
				document.fr.size.focus();
				return false;
			}
			
			if (document.fr.stock.value == "") {
				alert("재고를 넣어주세요.")
				document.fr.stock.focus();
				return false;
			}
		}
		
	}
	
	
</script>
</body>
</html>