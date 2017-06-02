<%@page import="javax.websocket.Session"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="net.pack.db.PackDAO" %>
    <%@ page import="net.pack.db.PackBean" %>
    <%@ page import="net.pack.db.CategoryBean" %>
    <%@ page import="java.text.DecimalFormat" %>
    <%@ page import="java.util.List" %>
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
		
		$('ul li.tab_color').click(function() {
			$('.tab_color').css("color", "black");  //탭부분 글자색 검은색으로
			$('.tab_color').css("border-bottom", "none");
			$(".tab_content").hide();					// 탭 내용 전체 숨김
			$(this).css("color", "#F29661");			// 클릭된 탭부분 글자색 #F29661으로
			$(this).css("border-bottom", "4px solid #F29661");			
			var activeTab = $(this).attr("name");		// 클릭된 탭부분 name 속성값 가져와서 저장
			$("#" + activeTab).fadeIn();		// 해당 탭내용 부분을 보여준다  흐릿 -> 또렷하게 애니메이션 효과			
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
	
	
	function more_packlist(num)
	{
		var area = $('[name=tab'+ num +']').attr("value");
// 		alert(ss);
		location.href="./PackSearchAction.po?area=" + area;
	}
	
	
	
</script>
</head>
<body>
<!-- 왼쪽 메뉴 -->
<jsp:include page="../inc/leftMenu.jsp"></jsp:include>
<!-- 왼쪽 메뉴 -->
<%
	//
	// 세션으로 로그인한 아이디 값 받아오기
	String user_id = (String) session.getAttribute("id");
	List ListArr[] = new List[11];
	int areaCount[] = new int[11];
	
	// 각 탭에 들어갈 패키지 리스트 받아오기
	for (int i = 0; i < ListArr.length; i++)
	{
		ListArr[i] = (List)request.getAttribute("list"+i);
	}
	
	// 지역별 패키지 갯수 받아오기
	for (int i = 0; i < ListArr.length; i++)
	{
		areaCount[i] = ((Integer)request.getAttribute("areaCount"+i)).intValue();
	}

	List CategoryList = (List)request.getAttribute("CategoryList");
	
	int count = ((Integer)request.getAttribute("count")).intValue();
	String repageNum = (String)request.getAttribute("repageNum");
	int pageCount = ((Integer)request.getAttribute("pageCount")).intValue();
	int pageBlock = ((Integer)request.getAttribute("pageBlock")).intValue();
	int startPage = ((Integer)request.getAttribute("startPage")).intValue();
	int endPage = ((Integer)request.getAttribute("endPage")).intValue();
	int currentPage = ((Integer)request.getAttribute("currentPage")).intValue();
	int pagesize = ((Integer)request.getAttribute("pagesize")).intValue();

%>

<div id="wrap">
	<div id="article_head">
		<div id="article_title"><img src="./img/travel2.png" width="30px" style="margin-right: 8px; vertical-align: bottom;">패키지</div>
	<div class="empty"></div>
	</div>
	<!--여행지 검색창 -->
	<div id="package_feat">
		<jsp:include page="../inc/packSlide.jsp"></jsp:include>
		<div id="package_search">
			<p>내게 맞는 패키지 검색하기</p>
			<form action="./PackSearchAction.po" name="fr" method="get" id="scheduler" onsubmit="return input_chk();">
				<label for="date_from">출발</label><input type="text" id="date_from" class="input_style" name="startDate"><br><br>
				<label for="city_search">지역</label>
				<select id="area" name="area">
					<option value="">선택하세요</option>
					<%
						CategoryBean cb;
						for (int i = 0; i < CategoryList.size(); i++)
						{
							cb =(CategoryBean)CategoryList.get(i);
					%>	
						<option value="<%=cb.getCar_name() %>"><%=cb.getCar_name() %></option>
					<%
						}
					%>
				</select>
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
		<%
			if (user_id != null)
			{
				if (user_id.equals("admin"))
				{
		 	%> 
				<input type="button" value="글쓰기" id="admin_write" onclick="location.href='./PackWrite.po'">
		 	<%
				}
			}
		%>
		<!-- 탭 내용 -->
		<div class="tab_container"> 	
		<%
			for(int i = 0; i < ListArr.length; i++)
			{
				if(areaCount[i] == 0)
				{
				%>
					<div id="tab<%=i+1 %>" class="tab_content">
						<img alt="" src="./img/nones.png" style="margin:0 auto; margin-top:220px;">
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
// 						System.out.println(pb.getSubject());
						DecimalFormat Commas = new DecimalFormat("#,###");
						String cost = (String)Commas.format(pb.getCost());
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
					<%
					if(areaCount[i] > 9)
					{
					%>
					<tr>
						<td colspan="3" style="text-align: right;"><span id="more_pack<%=i %>" class="more_pack" onclick="more_packlist(<%=i+1 %>);">More</span></td>
					</tr>
					<%
					}
					%>
					</table>
					</div>
					<%
				}				
			}
			%>
		</div>
	</div>
</div>
<!--오른쪽 메뉴 -->
	<jsp:include page="../inc/rightMenu.jsp"></jsp:include>
<!--오른쪽 메뉴 -->
<!-- 푸터 메뉴 -->
	<jsp:include page="../inc/footer.jsp"></jsp:include>
<!-- 푸터 메뉴 -->
</body>
</html>