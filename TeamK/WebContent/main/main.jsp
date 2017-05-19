<%@page import="net.board.db.BoardBean"%>
<%@page import="java.util.List"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="net.board.db.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="./css/inc.css" rel="stylesheet" type="text/css">
<link href="./css/subpage.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet" href="/resources/demos/style.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script>
  jQuery(document).ready(function($){
	//Calendar
	$('#calendar').datepicker({
      inline: true,
      firstDay: 0,
      showOtherMonths: true,
      dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],
      monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월']
    });
    //Scheduler
//     var dateFormat = "mm/dd/yy",
//     from = $( "#from" ).datepicker({
//       defaultDate: "+1w",
//       changeMonth: true,
//       numberOfMonths: 2
//     })
//       .on( "change", function() {
//         to.datepicker( "option", "minDate", getDate( this ) );
//       }),
//     to = $( "#to" ).datepicker({
//       defaultDate: "+1w",
//       changeMonth: true,
//       numberOfMonths: 2
//     })
//     .on( "change", function() {
//       from.datepicker( "option", "maxDate", getDate( this ) );
//     });

//     function getDate( element ) {
//       var date;
//       try {
//         date = $.datepicker.parseDate( dateFormat, element.value );
//       } catch( error ) {
//         date = null;
//       }
//     return date;
//     }

	//Scheduler
	$("#from").datepicker({
		dateFormat: 'yy-mm-dd',    // 날짜 포맷 형식
		minDate : 0,			   // 최소 날짜 설정      0이면 오늘부터 선택 가능
		numberOfMonths: 2,		   // 보여줄 달의 갯수
        dayNamesMin: ['월', '화', '수', '목', '금', '토', '일'],  // 일(Day) 표기 형식
        monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],   // 월(Month) 표기 형식
        //showOn: "both",		// 버튼을 표시      both : input과 buttom 둘다 클릭 시 달력 표시           bottom  :  buttom 클릭 했을 때만 달력 표시
        //buttonImage: "./img/calendar.png",   // 버튼에 사용될 이미지
        //buttonImageOnly: true,					// 이미지만 표시한다    버튼모양 x
        onClose: function(selectedDate){		// 닫힐 때 함수 호출
        	$("#to").datepicker("option", "minDate", selectedDate);    // #date_to의 최소 날짜를 #date_from에서 선택된 날짜로 설정
        }
	});
	
	$("#to").datepicker({
		dateFormat: 'yy-mm-dd',    // 날짜 포맷 형식
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

    //Package
    $("#pack1")
    .mouseenter(function() {
      $(this).css('width', '50%');
      $("#pack2").css('width', '25%');
      $("#pack3").css('width', '25%');
    })
    .mouseleave(function() {
      $(this).css('width', '33.3%');
      $("#pack2").css('width', '33.3%');
      $("#pack3").css('width', '33.3%');
    });
    $("#pack2")
    .mouseenter(function() {
      $(this).css('width', '50%');
      $("#pack1").css('width', '25%');
      $("#pack3").css('width', '25%');
    })
    .mouseleave(function() {
      $(this).css('width', '33.3%');
      $("#pack1").css('width', '33.3%');
      $("#pack3").css('width', '33.3%');
    });
    $("#pack3")
    .mouseenter(function() {
      $(this).css('width', '50%');
      $("#pack1").css('width', '25%');
      $("#pack2").css('width', '25%');
    })
    .mouseleave(function() {
      $(this).css('width', '33.3%');
      $("#pack1").css('width', '33.3%');
      $("#pack2").css('width', '33.3%');
    });
    //
  });
</script>
</head>
<body>
	<!--왼쪽 메뉴 -->
	<div>
		<jsp:include page="../inc/leftMenu.jsp"></jsp:include>
	</div>
	<!--왼쪽 메뉴 -->
	<div id="wrap">
		<div id="datepicker">
			<div id="calendar"></div>
			<div id="scheduler">
				<p>내게 맞는 패키지 검색하기</p>
				<form action="#" method="post" name="fr" id="scheduler">
					<label for="from">출발</label>
					<input type="text" id="from" name="from"><br>
					<label for="to">도착</label>
					<input type="text" id="to" name="to"><br>
					<label for="area">지역</label>
					<select id="area" name="area">
						<option value="null">선택하세요</option>
						<option value="null">서울특별시</option>
						<option value="null">부산광역시</option>
						<option value="null">경기도</option>
						<option value="null">강원도</option>
						<option value="null">충청북도</option>
						<option value="null">충청남도</option>
						<option value="null">전라북도</option>
						<option value="null">전라남도</option>
						<option value="null">경상북도</option>
						<option value="null">경상남도</option>
						<option value="null">제주도</option>
					</select>
					<input type="submit" value="검색">
				</form>
			</div>
		</div>
		<div id="clear"></div>
		<div id="package_show">
		<a href="#" id="pack1"><span id="pktt">Lorem ipsum</span><br><span id="pksc">Lorem ipsum dolor sit amet, consectetur adipiscing elit.</span><br><span id="pkpr">￦123,456~</span></a>
		<a href="#" id="pack2"><span id="pktt">Lorem ipsum</span><br><span id="pksc">Lorem ipsum dolor sit amet, consectetur adipiscing elit.</span><br><span id="pkpr">￦123,456~</span></a>
		<a href="#" id="pack3"><span id="pktt">Lorem ipsum</span><br><span id="pksc">Lorem ipsum dolor sit amet, consectetur adipiscing elit.</span><br><span id="pkpr">￦123,456~</span></a>
		</div>
		<div id="clear"></div>
		<div id="goods_show">
		상품 소개
		</div>
		<div id="review_show">
		<div id="gds_rv">
		<h1>리뷰</h1>
			<table>
				<%
BoardDAO bdao=new BoardDAO();

int count=bdao.getBoardCount();
SimpleDateFormat sdf=new SimpleDateFormat("yyyy.MM.dd");
if(count!=0){
	List<BoardBean> boardList=bdao.getBoardList(1, 5);
	for(int i=0;i<boardList.size();i++){
		BoardBean bb=boardList.get(i);
		%>
<tr><td id="num"><%=bb.getRe_ref()%></td><td class="contxt">
<a href="./BoardContent.bo?num=<%=bb.getNum()%>&pageNum=1"><%=bb.getSubject()%>[<%=bdao.getBoardReplyCount(bb.getNum())%>]</a></td>
    <td id="date"><%=sdf.format(bb.getDate())%></td></tr>		
		<%
	}
}
%>
			</table>
			</div>
			<div id="trv_rv">
			<h1>Q&amp;A</h1>
			<table>
				<%
if(count!=0){
	List<BoardBean> boardList2=bdao.getBoardList2(1, 5);
	for(int i=0;i<boardList2.size();i++){
		BoardBean bb=boardList2.get(i);
		%>
<tr><td id="num"><%=bb.getRe_ref()%></td><td class="contxt">
<a href="./BoardContent2.bo?num=<%=bb.getNum()%>&pageNum=1"><%=bb.getSubject()%>[<%=bdao.getBoardReplyCount(bb.getNum())%>]</a></td>
    <td id="date"><%=sdf.format(bb.getDate())%></td></tr>		
		<%
	}
}
%>
			</table>
			</div>
		</div>
		<div id="clear"></div>
	</div>
	<jsp:include page="../inc/footer.jsp"></jsp:include>
	<!--오른쪽 메뉴 -->
	<div>
		<jsp:include page="../inc/rightMenu.jsp"></jsp:include>
	</div>
	<!--오른쪽 메뉴 -->
</body>
</html>