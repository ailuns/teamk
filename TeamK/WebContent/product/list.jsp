<%@page import="javax.websocket.Session"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	<%@ page import="net.member.db.*"%>
<%@ page import="java.util.*"%>
    <%@ page import="java.text.DecimalFormat" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="./css/inc.css" rel="stylesheet" type="text/css">
<link href="./css/subpage.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
<script src="./js/jquery-3.2.0.js"></script>
<script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
<script>
	jQuery(document).ready(function($){
		
		// 달력 관련 소스
		$("#date_from").datepicker({
			dateFormat: 'yy-mm-dd',    // 날짜 포맷 형식
			minDate : 0,			   // 최소 날짜 설정      0이면 오늘부터 선택 가능
			numberOfMonths: 2,		   // 보여줄 달의 갯수
	        dayNamesMin: ['월', '화', '수', '목', '금', '토', '일'],  // 일(Day) 표기 형식
	        monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],   // 월(Month) 표기 형식
	        //showOn: "both",		// 버튼을 표시      both : input과 buttom 둘다 클릭 시 달력 표시           bottom  :  buttom 클릭 했을 때만 달력 표시
	        //buttonImage: "./img/calendar.png",   // 버튼에 사용될 이미지
	        //buttonImageOnly: true,					// 이미지만 표시한다    버튼모양 x
	        onClose: function(selectedDate){		// 닫힐 때 함수 호출
	        	if (selectedDate == "")  // 시작날 선택 안했을때
	       		{
	        		$("#to").datepicker("option", "minDate", 0);   		// #date_to의 최소 날짜를 오늘 날짜로 설정
	       		}
	        	else					// 시작날 선택 했을때
	        	{
	        		$("#to").datepicker("option", "minDate", selectedDate);    // #date_to의 최소 날짜를 #date_from에서 선택된 날짜로 설정
	        	}
	        }
		});

	    // 탭 관련 소스
		$(".tab_content").hide();  // 탭 내용 전체 숨김
		$(".tab_content:first").show();  // 탭 첫번째 내용만 보이게
		
// 		$('ul li.tab_color' ).click(function() {
// 			$('.tab_color').css("color", "black");  //탭부분 글자색 검은색으로
// 			$('.tab_color').css("border-bottom", "none");
// 			$(".tab_content").hide();					// 탭 내용 전체 숨김
// 			$(this).css("color", "#F29661");			// 클릭된 탭부분 글자색 #F29661으로
// 			$(this).css("border-bottom", "4px solid #F29661");			
// 			var activeTab = $(this).attr("name");		// 클릭된 탭부분 name 속성값 가져와서 저장
// 			$("#" + activeTab).fadeIn();		// 해당 탭내용 부분을 보여준다  흐릿 -> 또렷하게 애니메이션 효과			
// 		});
	});
	function btnclick(str){
	
			$('.tab_color').css("color", "black");  //탭부분 글자색 검은색으로
			$('.tab_color').css("border-bottom", "none");
			$(".tab_content").hide();					// 탭 내용 전체 숨김
			$('.tab_color'+str).css("color", "#F29661");
			$('.tab_color'+str).css("border-bottom", "4px solid #F29661");		
			var activeTab = $(this).attr("name");		// 클릭된 탭부분 name 속성값 가져와서 저장
			$("#" + activeTab).fadeIn();		// 해당 탭내용 부분을 보여준다  흐릿 -> 또렷하게 애니메이션
		
	}
	
	
	// 패키지 검색 시 지역 선택
	function input_chk()
    {
    	var val = $("#serch_data").val(); 
    	if (val == "")
		{
    		alert("검색어를 넣어주세요");
	    		return false;
		}
		return true;
    }
	//슬라이드
	var slideIndex = 1;
	showDivs(slideIndex);
	function plusDivs(n) {
	  showDivs(slideIndex += n);
	}
	function currentDiv(n) {
	  showDivs(slideIndex = n);
	}
	function showDivs(n) {
	  var i;
	  var x = document.getElementsByClassName("slider");
	  if (n > x.length) {slideIndex = 1}    
	  if (n < 1) {slideIndex = x.length}
	  for (i = 0; i < x.length; i++) {
	     x[i].style.display = "none";  
	  }
	  x[slideIndex-1].style.display = "block";  
	}
	
	
</script>
</head>
<body>
<!-- 왼쪽 메뉴 -->
<jsp:include page="../inc/leftMenu.jsp"></jsp:include>
<!-- 왼쪽 메뉴 -->
<%	request.setCharacterEncoding("utf-8");
		ProductBean pb = new ProductBean();
		ProductDAO pdao = new ProductDAO();
		CategoryBean cb = new CategoryBean();
		CategoryDAO cdao = new CategoryDAO();
		List productList2 = (List) request.getAttribute("productList2");
	 	//디비 객체 생성 BoardDAO bdao
	 	// int count = getBoardCount() 메서드호출 count(*)
	 	int car_num = (int) request.getAttribute("car_num");
	 	int count = (int) request.getAttribute("count");
	 	int pageSize = (int) request.getAttribute("pageSize");
	 	String pageNum = (String) request.getAttribute("pageNum");
	 	int startRow = (int) request.getAttribute("startRow");
	 	int endRow = (int) request.getAttribute("endRow");
	 	List productList = (List) request.getAttribute("productList");
	 	int pageCount = (int) request.getAttribute("pageCount");
	 	int pageBlock = (int) request.getAttribute("pageBlock");
	 	int startPage = (int) request.getAttribute("startPage");
	 	int endPage = (int) request.getAttribute("endPage");
	 	String user_id = (String) session.getAttribute("id");
	%>

<div id="wrap">
	<div id="article_head">
		<div id="article_title"><img src="./img/shop2.png" width="26px" style="margin:0 8px 3px 0;  vertical-align: bottom;">상품</div>
			<div class="empty"></div>
			<div id="clear"></div>
	</div>
	<!--여행지 검색창 -->
	<div id="package_feat">
		<jsp:include page ="../inc/packSlide.jsp"></jsp:include>
			<div id="package_search">
			<p>상품 검색하기</p>
			<form action="./ProductSearchAction.bo" name="fr" method="get" id="scheduler" onsubmit="return input_chk();">
				<label for="date_from">검색명</label><input type="text" id="serch_data" class="input_style" name="serch_data" required="yes"><br><br>
<!-- 				<label for="date_to">~</label><input type="text" id="date_to" class="input_style" name="endDate"><br><br> -->
			
				
				<input type="submit" value="검색" id="search_btn" class="input_style">
			</form>
		</div>
	</div>
	<div id="clear"></div>
	<!--여행지 검색창 -->
	<div id="clear"></div>
	<div id="package_tab">
		<form action="./Package.po" method="get" id="pf">
		<!-- 탭 부분 -->
		<ul class="tabs">
		<%
			cb =(CategoryBean)productList2.get(0);
			if(car_num == 1){
		%>
			<a href="./Productlist.bo?car_num=<%=cb.getCar_num()%>"><li name="tab1" class="tab_color" style="color: #F29661; background-color: white; border-bottom:4px solid #F29661;" value="<%=cb.getCar_name()%>"><%=cb.getCar_name()%></li></a> 
	
		<%}else{%>
		<a href="./Productlist.bo?car_num=<%=cb.getCar_num()%>"><li name="tab1" class="tab_color" style="color: black; background-color: white;" value="<%=cb.getCar_name()%>"><%=cb.getCar_name()%></li></a> 
		<%}
			
			for (int i = 1; i < productList2.size(); i++)
			{
				cb =(CategoryBean)productList2.get(i);
			if(car_num == cb.getCar_num()){
		%>	
			<a href="./Productlist.bo?car_num=<%=cb.getCar_num()%>"><li name="tab<%=i+1 %>" class="tab_color<%=cb.getCar_num() %>" style="color: #F29661; background-color: white; border-bottom:4px solid #F29661;" value="<%=cb.getCar_name()%>" onclick="btnclick(<%=cb.getCar_num() %>)"><%=cb.getCar_name()%></li></a> 
			
		<%}else{%>
			<a href="./Productlist.bo?car_num=<%=cb.getCar_num()%>"><li name="tab<%=i+1 %>" class="tab_color<%=cb.getCar_num() %>" style="color: black; background-color: white;" value="<%=cb.getCar_name()%>" onclick="btnclick(<%=cb.getCar_num() %>)"><%=cb.getCar_name()%></li></a> 
		<%} 
			}
		%>
		</ul>
		<!-- 탭 부분 -->
		</form>
		<div class="clear"></div>
	<%
		if (user_id != null)
		{
			if (user_id.equals("admin"))
			{
	 	%> 
			<input type="button" value="글쓰기" onclick="location.href='./ProductWrite.bo'">
	 	<%
			}
		}
	%>
		<!-- 탭 내용 -->
		<div class="tab_container"> 	
		<%
		for(int i = 0; i < productList2.size(); i++)
		{
				if(count == 0)
				{
				%>
					<div id="tab<%=i+1 %>" class="tab_content">
						<img alt="" src="./img/nones.png" style="margin:0 auto; margin-top:220px;">
					</div>
				<%
				}
				
				else if(count != 0)
				{
				%>
					<div id="tab<%=i+1 %>" class="tab_content">
					<table>
				<%
				for(int j = 0; j < productList.size(); j++)
				{
					pb = (ProductBean) productList.get(j);
						System.out.println(pb.getSubject());
						DecimalFormat Commas = new DecimalFormat("#,###");
						String cost = (String)Commas.format(pb.getCost());
				%>				
						<td>
							<div>
							<a href="./ProductContent.bo?num=<%=pb.getNum()%>&pageNum=<%=pageNum%>&car_num=<%=pb.getCar_num()%>">
								<div id="img_content">
									<table>
										<tr>
											<td><img class="img_size" alt="" src="./upload/<%=pb.getImg() %>"></td>
										</tr>
										<tr>
											<td><b><%=pb.getSubject() %></b></td>
										</tr>
										<tr>
											<td><p><%=pb.getArea()%></p></td>
										</tr>
										<tr>
											<td><b><%=cost %>원</b></td>
										</tr>
									</table>
								</div>
								</a>
							</div>
						</td>
					<%
						if (j == 2 || j == 5)
						{
						%>
							<tr>
							</tr>
						<%
						}
					}
					%>
					</table>
					</div>
					<%
				} 
		}
		%>
		</div>
		<!-- 탭 내용 -->
	</div>
	
</div>
<!--오른쪽 메뉴 -->
 <jsp:include page="../inc/rightMenu.jsp"></jsp:include>
<!--오른쪽 메뉴 -->
<jsp:include page="../inc/footer.jsp"></jsp:include>
</body>
</html>