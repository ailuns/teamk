<%@page import="javax.websocket.Session"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="net.pack.db.PackDAO" %>
    <%@ page import="net.pack.db.PackBean" %>
    <%@ page import="net.pack.db.CategoryBean" %>
    <%@ page import="java.util.List" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="../css/inc.css" rel="stylesheet" type="text/css">
<link href="../css/subpage.css" rel="stylesheet" type="text/css">
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
	        	$("#date_to").datepicker("option", "minDate", selectedDate);    // #date_to의 최소 날짜를 #date_from에서 선택된 날짜로 설정
	    		$('img.ui-datepicker-trigger').attr('align', 'absmiddle');
	        }
		});
		
		
		$("#date_to").datepicker({
			dateFormat: 'yy-mm-dd',    // 날짜 포맷 형식
			numberOfMonths: 2,		   // 보여줄 달의 갯수
	        dayNamesMin: ['월', '화', '수', '목', '금', '토', '일'],  // 일(Day) 표기 형식
	        monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],   // 월(Month) 표기 형식
	        //showOn: "both",			// 버튼을 표시      both : input과 buttom 둘다 클릭 시 달력 표시           bottom  :  buttom 클릭 했을 때만 달력 표시
	        //buttonImage: "./img/calendar.png",   // 버튼에 사용될 이미지
	        //buttonImageOnly: true,					// 이미지만 표시한다    버튼모양 x
	        onClose: function(selectedDate){		// 닫힐 때 함수 호출
	        	$("#date_from").datepicker("option", "maxDate", selectedDate);   // #date_from의 최대 날짜를 #date_to에서 선택된 날짜로 설정
	    		$('img.ui-datepicker-trigger').attr('align', 'absmiddle');
	        	}
		});
		
	    $("#txt_prodStart").datepicker();
	    $('img.ui-datepicker-trigger').attr('align', 'absmiddle');

	    // 탭 관련 소스
		$(".tab_content").hide();  // 탭 내용 전체 숨김
		$(".tab_content:first").show();  // 탭 첫번째 내용만 보이게
		
		$('ul li.tab_color').click(function() {
			$('.tab_color').css("color", "black");  //탭부분 글자색 검은색으로
			$('.tab_color').css("border-bottom", "none");
			$(".tab_content").hide();					// 탭 내용 전체 숨김
			$(this).css("color", "#F29661");			// 클릭된 탭부분 글자색 #F29661으로
			$(this).css("border-bottom", "4px solid #F29661");			
			var activeTab = $(this).attr("name");		// 클릭된 탭부분 name 속성값 가져와서 저장
			$("#" + activeTab).fadeIn();		// 해당 탭내용 부분을 보여준다  흐릿 -> 또렷하게 애니메이션 효과			
		});
		
		//Featured Packages List
	    $("#feat_ttl1").mouseenter(function() {
	      $("#feat_con0").css('width', '0');
	      $("#feat_con0 span").css('display', 'none');
	      $("#feat_con1").css('width', '75%');
	      $("#feat_con1 span").css('display', 'block');
	      $("#feat_con2").css('width', '0');
	      $("#feat_con2 span").css('display', 'none');
	      $("#feat_con3").css('width', '0');
	      $("#feat_con3 span").css('display', 'none');
	      $("#feat_con4").css('width', '0');
	      $("#feat_con4 span").css('display', 'none');
	      $("#feat_con5").css('width', '0');
	      $("#feat_con5 span").css('display', 'none');
	    });
	    $("#feat_ttl2").mouseenter(function() {
	      $("#feat_con0").css('width', '0');
	      $("#feat_con0 span").css('display', 'none');
	      $("#feat_con1").css('width', '0');
	      $("#feat_con1 span").css('display', 'none');
	      $("#feat_con2").css('width', '75%');
	      $("#feat_con2 span").css('display', 'block');
	      $("#feat_con3").css('width', '0');
	      $("#feat_con3 span").css('display', 'none');
	      $("#feat_con4").css('width', '0');
	      $("#feat_con4 span").css('display', 'none');
	      $("#feat_con5").css('width', '0');
	      $("#feat_con5 span").css('display', 'none');
	    });
	    $("#feat_ttl3").mouseenter(function() {
	      $("#feat_con0").css('width', '0');
	      $("#feat_con0 span").css('display', 'none');
	      $("#feat_con1").css('width', '0');
	      $("#feat_con1 span").css('display', 'none');
	      $("#feat_con2").css('width', '0');
	      $("#feat_con2 span").css('display', 'none');
	      $("#feat_con3").css('width', '75%');
	      $("#feat_con3 span").css('display', 'block');
	      $("#feat_con4").css('width', '0');
	      $("#feat_con4 span").css('display', 'none');
	      $("#feat_con5").css('width', '0');
	      $("#feat_con5 span").css('display', 'none');
	    });
	    $("#feat_ttl4").mouseenter(function() {
	      $("#feat_con0").css('width', '0');
	      $("#feat_con0 span").css('display', 'none');
	      $("#feat_con1").css('width', '0');
	      $("#feat_con1 span").css('display', 'none');
	      $("#feat_con2").css('width', '0');
	      $("#feat_con2 span").css('display', 'none');
	      $("#feat_con3").css('width', '0');
	      $("#feat_con3 span").css('display', 'none');
	      $("#feat_con4").css('width', '75%');
	      $("#feat_con4 span").css('display', 'block');
	      $("#feat_con5").css('width', '0');
	      $("#feat_con5 span").css('display', 'none');
	    });
	    $("#feat_ttl5").mouseenter(function() {
	      $("#feat_con0").css('width', '0');
	      $("#feat_con0 span").css('display', 'none');
	      $("#feat_con1").css('width', '0');
	      $("#feat_con1 span").css('display', 'none');
	      $("#feat_con2").css('width', '0');
	      $("#feat_con2 span").css('display', 'none');
	      $("#feat_con3").css('width', '0');
	      $("#feat_con3 span").css('display', 'none');
	      $("#feat_con4").css('width', '0');
	      $("#feat_con4 span").css('display', 'none');
	      $("#feat_con5").css('width', '75%');
	      $("#feat_con5 span").css('display', 'block');
	    });

	});
	

</script>

<style type="text/css">
img.ui-datepicker-trigger {
	cursor : pointer;
	margin-left : 5px;
}
#package_wrap{ 
	width : 1000px; 
	min-height : 1000px; 
	border : 1px solid black; 
	margin : 0 auto; 
	padding-top : 50px; 
} 

/* 검색  */
/* #search_div { */
/* 	width : 450px; */
/* 	height : 200px; */
/* 	padding : 10px; */
/* 	background-color: #D6F0FF; */
/* 	margin : 0 auto; */
/* } */
/* #city_search {width : 430px;} */
/* .input_style { */
/* 	height : 25px; */
/* 	margin-bottom : 10px; */
/* 	padding-left : 10px; */
/* 	border-radius : 1px; */
/* } */
/* #search_btn { */
/* 	cursor : pointer; */
/* 	width : 200px; */
/* 	height : 35px; */
/* 	margin-left : 100px; */
/* 	background-color: #B2CCFF; */
/* } */

/* 탭 패키지  */
#package_tab {
	margin : 0 auto;
	margin-top : 50px;
	width : 1150px;
	min-height : 630px;
/* 	border : 1px solid blue; */
}
ul.tabs {
	margin: 0;
	padding: 0;
	width: 1200px;
	float: left;
	list-style: none;
/* 	border: 1px solid black; */
 	margin-left : 110px; 
	margin-bottom : 10px;
}
ul.tabs li {
	width: 80px;
 	height: 80px;
	float: left;
	padding-top : 20px;
/* 	border-right: 1px solid black; */
	text-align: center;
	cursor: pointer;
	font-weight: bold;
	line-height: 31px;
}
.tab_container {
	background-color : #F6F6F6;
	float: left;
	min-width: 1000px;
	min-height: 600px;
	padding : 10px;
	margin-left : 50px;
}
.img_size {
	width : 250px;
	height : 150px;
}
#img_content {
	padding : 0px;
	margin : 20px;
	margin-left : 35px;
	border: 1px solid pink;
	background-color: white;
}

.tab_content a:LINK, .tab_content a:VISITED
{
	color : black;
	text-decoration: none;
}

/* 탭 패키지  */
/* .clear {clear: both;} */
</style>

</head>
<body>
<!-- 왼쪽 메뉴 -->
<jsp:include page="../inc/leftMenu.jsp"></jsp:include>
<!-- 왼쪽 메뉴 -->
<%
	//
	// 세션으로 로그인한 아이디 값 받아오기
	String user_id = (String) session.getAttribute("id");
	

	// 각 탭에 들어갈 내용 받아옴
	List List1 = (List)request.getAttribute("list1");
	List List2 = (List)request.getAttribute("list2");
	List List3 = (List)request.getAttribute("list3");
	List List4 = (List)request.getAttribute("list4");
	List List5 = (List)request.getAttribute("list5");
	List List6 = (List)request.getAttribute("list6");
	List List7 = (List)request.getAttribute("list7");
	List List8 = (List)request.getAttribute("list8");
	List List9 = (List)request.getAttribute("list9");
	List List10 = (List)request.getAttribute("list10");
	List List11 = (List)request.getAttribute("list11");
	int areaCount1 = ((Integer)request.getAttribute("areaCount1")).intValue();
	int areaCount2 = ((Integer)request.getAttribute("areaCount2")).intValue();
	int areaCount3 = ((Integer)request.getAttribute("areaCount3")).intValue();
	int areaCount4 = ((Integer)request.getAttribute("areaCount4")).intValue();
	int areaCount5 = ((Integer)request.getAttribute("areaCount5")).intValue();
	int areaCount6 = ((Integer)request.getAttribute("areaCount6")).intValue();
	int areaCount7 = ((Integer)request.getAttribute("areaCount7")).intValue();
	int areaCount8 = ((Integer)request.getAttribute("areaCount8")).intValue();
	int areaCount9 = ((Integer)request.getAttribute("areaCount9")).intValue();
	int areaCount10 = ((Integer)request.getAttribute("areaCount10")).intValue();
	int areaCount11 = ((Integer)request.getAttribute("areaCount11")).intValue();
	
	List ListArr[] = {List1, List2, List3, List4, List5, List6, List7, List8, List9, List10, List11};
	int areaCount[] = {areaCount1, areaCount2,areaCount3,areaCount4,areaCount5,areaCount6,areaCount7,areaCount8,areaCount9,areaCount10,areaCount11};
	
	
	List CategoryList = (List)request.getAttribute("CategoryList");
	
	int count = ((Integer)request.getAttribute("count")).intValue();
	String pageNum = (String)request.getAttribute("pageNum");
	int pageCount = ((Integer)request.getAttribute("pageCount")).intValue();
	int pageBlock = ((Integer)request.getAttribute("pageBlock")).intValue();
	int startPage = ((Integer)request.getAttribute("startPage")).intValue();
	int endPage = ((Integer)request.getAttribute("endPage")).intValue();

	
%>

<div id="wrap">
	<!--여행지 검색창 -->
	<div id="package_head">
		<div id="package_title">패키지
		</div>
		<div id="package_search">
			<p>내게 맞는 패키지 검색하기</p>
			<form action="./PackSearchAction.po" name="fr" method="get" id="scheduler" onsubmit="return input_chk()">
				<label for="date_from">출발</label><input type="text" id="date_from" class="input_style" name="startDate" required="yes">
				<label for="date_to">도착</label><input type="text" id="date_to" class="input_style" name="endDate" required="yes"><br><br>
				<label for="city_search">지역</label><input type="text" id="city_search" name="city" class="input_style" required="yes" placeholder="도시를 입력해주세요">
				<input type="submit" value="검색" id="search_btn" class="input_style">
			</form>
		</div>
	</div>
	<div id="clear"></div>
	<!--여행지 검색창 -->
	<div id="package_feat">
			<div id="feat_con5"><a href="#"><span id="pktt">Lorem ipsum</span><br><span id="pksc">Lorem ipsum dolor sit amet, consectetur adipiscing elit.</span><br><span id="pkpr">￦123,456~</span></a></div>
			<div id="feat_ttl5">타<br>이<br>틀<br>5</div>
			<div id="feat_con4"><a href="#"><span id="pktt">Lorem ipsum</span><br><span id="pksc">Lorem ipsum dolor sit amet, consectetur adipiscing elit.</span><br><span id="pkpr">￦123,456~</span></a></div>
			<div id="feat_ttl4">타<br>이<br>틀<br>4</div>
			<div id="feat_con3"><a href="#"><span id="pktt">Lorem ipsum</span><br><span id="pksc">Lorem ipsum dolor sit amet, consectetur adipiscing elit.</span><br><span id="pkpr">￦123,456~</span></a></div>
			<div id="feat_ttl3">타<br>이<br>틀<br>3</div>
			<div id="feat_con2"><a href="#"><span id="pktt">Lorem ipsum</span><br><span id="pksc">Lorem ipsum dolor sit amet, consectetur adipiscing elit.</span><br><span id="pkpr">￦123,456~</span></a></div>
			<div id="feat_ttl2">타<br>이<br>틀<br>2</div>
			<div id="feat_con1"><a href="#"><span id="pktt">Lorem ipsum</span><br><span id="pksc">Lorem ipsum dolor sit amet, consectetur adipiscing elit.</span><br><span id="pkpr">￦123,456~</span></a></div>
			<div id="feat_ttl1">타<br>이<br>틀<br>1</div>
			<div id="feat_con0"><span>추천 상품<br>소개</span></div>
		</div>
		<div id="clear"></div>
	<div id="package_tab">
		<form action="./Package.po" method="get" id="pf">
		<!-- 탭 부분 -->
		<ul class="tabs">
		
		<%
			CategoryBean cb;
			cb =(CategoryBean)CategoryList.get(0);
		%>
						
			<li name="tab1" class="tab_color" style="color: #F29661; background-color: white; border-bottom:4px solid #F29661;" value="<%=cb.getCar_name() %>"><%=cb.getCar_name() %></li>
		<%
			for (int i = 1; i < CategoryList.size(); i++)
			{
				cb =(CategoryBean)CategoryList.get(i);
		%>	
			<li name="tab<%=i+1 %>" class="tab_color" style="background-color: white;" value="<%=cb.getCar_name() %>"><%=cb.getCar_name() %></li>
		<%
			}
		%>
		</ul>
		<!-- 탭 부분 -->
		</form>
		<div class="clear"></div>

		<!-- 탭 내용 -->
		<div class="tab_container"> 	
		<%
			for(int i = 0; i < ListArr.length; i++)
			{
				if(areaCount[i] == 0)
				{
				%>
				
					<div id="tab<%=i+1 %>" class="tab_content">
<!-- 						<table> -->
<!-- 							<tr> -->
<!-- 								<td> -->
									<img alt="" src="./img/nones.png" style="margin:0 auto; margin-top:220px;">
<!-- 								</td> -->
<!-- 							</tr> -->
<!-- 						</table> -->
					</div>
				<%
				}
				
				else if(areaCount[i] != 0)
				{
		%>
					<div id="tab<%=i+1 %>" class="tab_content">
					<table>
		<%
					PackBean pb;
					for (int j = 0; j < ListArr[i].size(); j++)
					{
						pb =(PackBean)ListArr[i].get(j);
						System.out.println(pb.getSubject());
		%>				
						<td>
							<div>
							<a href="./PackContent.po?num=<%=pb.getNum() %>">
								<div id="img_content">
									<table>
										<tr>
											<td><img class="img_size" alt="" src="./upload/<%=pb.getFile1() %>"></td>
										</tr>
										<tr>
											<td><b><%=pb.getSubject() %></b></td>
										</tr>
										<tr>
											<td><p><%=pb.getIntro() %></p></td>
										</tr>
										<tr>
											<td><b><%=pb.getCost() %></b></td>
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
	<%
		if (user_id != null)
		{
			if (user_id.equals("admin"))
			{
	 	%> 
			<input type="button" value="글쓰기" onclick="location.href='./PackWrite.po'">
	 	<%
			}
		}
	%>
</div>
	<!--오른쪽 메뉴 -->
	<div>
		<jsp:include page="../inc/rightMenu.jsp"></jsp:include>
	</div>
	<!--오른쪽 메뉴 -->
	<!--푸터 메뉴 -->
	<div>
		<jsp:include page="../inc/footer.jsp"></jsp:include>
	</div>
	<!--푸터 메뉴 -->
	
</body>
</html>