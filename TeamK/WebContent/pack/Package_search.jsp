<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="net.pack.db.PackDAO" %>
    <%@ page import="net.pack.db.PackBean" %>
    <%@ page import="java.util.List" %>
    <%@ page import="net.pack.db.CategoryBean" %>
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
	
		$("#date_to").datepicker({
			dateFormat: 'yy-mm-dd',    // 날짜 포맷 형식
			minDate : 0,			   // 최소 날짜 설정      0이면 오늘부터 선택 가능
			numberOfMonths: 2,		   // 보여줄 달의 갯수
	        dayNamesMin: ['월', '화', '수', '목', '금', '토', '일'],  // 일(Day) 표기 형식
	        monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],   // 월(Month) 표기 형식
	        //showOn: "both",			// 버튼을 표시      both : input과 buttom 둘다 클릭 시 달력 표시           bottom  :  buttom 클릭 했을 때만 달력 표시
	        //buttonImage: "./img/calendar.png",   // 버튼에 사용될 이미지
	        //buttonImageOnly: true,					// 이미지만 표시한다    버튼모양 x
	        onClose: function(selectedDate){		// 닫힐 때 함수 호출
	        	$("#from").datepicker("option", "maxDate", selectedDate);   // #date_from의 최대 날짜를 #date_to에서 선택된 날짜로 설정
	       	}
		});

	});
	
	// 패키지 검색 시 지역 선택
	function input_chk()
    {
    	var val = $("#area option:selected").val(); 
    	if (val == "")
		{
    		alert("지역을 선택해주세요");
	    		return false;
		}
		return true;
    }

</script>

<style type="text/css">

img.ui-datepicker-trigger
{
	cursor : pointer;
	margin-left : 5px;
}

.clear 
{
	clear: both;
}
</style>
</head>
<body>
<%

	List list = (List)request.getAttribute("list");
	List CategoryList = (List)request.getAttribute("CategoryList");

	int count = ((Integer)request.getAttribute("count")).intValue();
	String pageNum = (String)request.getAttribute("pageNum");
	int pageCount = ((Integer)request.getAttribute("pageCount")).intValue();
	int pageBlock = ((Integer)request.getAttribute("pageBlock")).intValue();
	int startPage = ((Integer)request.getAttribute("startPage")).intValue();
	int endPage = ((Integer)request.getAttribute("endPage")).intValue();
	int currentPage = ((Integer)request.getAttribute("currentPage")).intValue();
	int pagesize = ((Integer)request.getAttribute("pagesize")).intValue();
	
	String search = (String)request.getAttribute("search");
	String startDate = (String)request.getAttribute("startDate");
	String endDate = (String)request.getAttribute("endDate");

%>

<!--왼쪽 메뉴 -->
<div>
	<jsp:include page="../inc/leftMenu.jsp"></jsp:include>
</div>
<!--왼쪽 메뉴 -->
	<div id="wrap">
		<div id="package_head">
			<div id="package_title">패키지
			</div>
			<div id="package_search">
				<p>내게 맞는 패키지 검색하기</p>
				<form action="./PackSearchAction.po" name="fr" method="get" id="scheduler" onsubmit="return input_chk()">
					<label for="date_from">출발</label>
					<input type="text" id="date_from" class="input_style" name="startDate" value="<%=startDate%>" required="yes">
					<label for="date_to">도착</label>
					<input type="text" id="date_to" class="input_style" name="endDate" value="<%=endDate%>"><br><br>
					<label for="city_search">지역</label>
	
					<select id="area" name="area">
						<option value="">선택하세요</option>
						<%
							CategoryBean cb;
						for (int i = 0; i < CategoryList.size(); i++)
						{
							cb =(CategoryBean)CategoryList.get(i);
						%>	
							<option value="<%=cb.getCar_name() %>" <%if(search.equals(cb.getCar_name())) {%> selected <%}%>><%=cb.getCar_name() %></option>
						<%
						}
						%>
					</select>
					<input type="submit" value="검색" id="search_btn" class="input_style">
				</form>
			</div>
		</div>
		
		<div id="clear"></div>
		<p>검색조건에 해당하는 상품이 총 <%=count %>개 있습니다</p>
		<hr>	

		<div id="package_list">
			<table>
			<%
				PackBean pb;
				if (count!=0)
				{
					for (int i = 0; i <list.size(); i++)
					{
						pb =(PackBean)list.get(i);
						DecimalFormat Commas = new DecimalFormat("#,###");
						String cost = (String)Commas.format(pb.getCost());
			%>
				<tr>
					<td rowspan="2" id="thumb">
						<a href="./PackContent.po?num=<%=pb.getNum() %>">
						<img class="img_size" alt="" src="./upload/<%=pb.getFile1() %>">
						</a>
					</td>
					<td id="subject">
						<%=pb.getSubject() %>
					</td>
					<td rowspan="2"  id="price">
						<span><%=cost %>원</span>
					</td>
					<td rowspan="2"  id="date">
						<span><%=pb.getDate() %></span>
					</td>
				</tr>
				<tr>
					<td id="context">
						<span><%=pb.getIntro() %></span>
					</td>
				</tr>
			<%
					}
				}
			%>
			</table>
		</div>
		<div id="pages">
				<%
					if (count != 0) {
						// 페이지 갯수 구하기
						pageCount = count / pagesize + (count % pagesize == 0 ? 0 : 1);
						pageBlock = 10;
						// 시작 페이지 구하기
						startPage = ((currentPage - 1) / pageBlock) * pageBlock + 1;
						// 끝페이지 구하기
						endPage = startPage + pageBlock - 1;
						if (endPage > pageCount) {
							endPage = pageCount;
						}
						//이전
						if (startPage > pageBlock) {
				%>
				<a href="./PackContent.po?pageNum=<%=startPage - pageBlock%>">[이전]</a>
				<%
					}

						//페이지
						for (int i = startPage; i <= endPage; i++) {
				%>
				<a href="./PackContent.po?pageNum=<%=i %>">[<%=i%>]</a>
				<%
					}

						//다음
						if (endPage < pageCount) {
				%>
				<a href="./PackContent.po?pageNum=<%=startPage + pageBlock%>">[다음]</a>
				<%
					}
				}
				%>
		</div>
	</div>
<!--오른쪽 메뉴 -->
<div>
	<jsp:include page="../inc/rightMenu.jsp"></jsp:include>
</div>
<!--오른쪽 메뉴 -->
<!--아래 메뉴-->
<div>
	<jsp:include page="../inc/footer.jsp"></jsp:include>
</div>

<!--아래 메뉴-->
</body>
</html>