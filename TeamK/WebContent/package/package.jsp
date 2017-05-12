<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="../css/inc.css" rel="stylesheet" type="text/css">
<link href="../css/subpage.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet" href="/resources/demos/style.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script>
  jQuery(document).ready(function($){
    //Package Search
    var dateFormat = "mm/dd/yy",
    from = $( "#from" ).datepicker({
      defaultDate: "+1w",
      changeMonth: true,
      numberOfMonths: 2
    })
      .on( "change", function() {
        to.datepicker( "option", "minDate", getDate( this ) );
      }),
    to = $( "#to" ).datepicker({
      defaultDate: "+1w",
      changeMonth: true,
      numberOfMonths: 2
    })
    .on( "change", function() {
      from.datepicker( "option", "maxDate", getDate( this ) );
    });

    function getDate( element ) {
      var date;
      try {
        date = $.datepicker.parseDate( dateFormat, element.value );
      } catch( error ) {
        date = null;
      }
    return date;
    }
    //Featured Packages List
    $("#feat_ttl1")
    .mouseenter(function() {
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
    $("#feat_ttl2")
    .mouseenter(function() {
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
    $("#feat_ttl3")
    .mouseenter(function() {
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
    $("#feat_ttl4")
    .mouseenter(function() {
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
    $("#feat_ttl5")
    .mouseenter(function() {
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
</head>
<body>
	<!--왼쪽 메뉴 -->
	<div>
		<jsp:include page="../inc/leftMenu.jsp"></jsp:include>
	</div>
	<!--왼쪽 메뉴 -->
	<div id="wrap">
		<div id="package_head">
			<div id="package_title">패키지</div>
			<div id="package_search">
				<p>내게 맞는 패키지 검색하기</p>
				<form action="#" method="post" name="fr" id="scheduler">
					<label for="from">출발</label>
					<input type="text" id="from" name="from">
					<label for="to">도착</label>
					<input type="text" id="to" name="to"><br><br>
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
		<div id="package_list">
			<table>
				<tr><td rowspan="2" id="thumb"><img alt="#" src="../img/20101021182610.jpg"></td><td id="subject">Lorem ipsum dolor sit amet.</td><td rowspan="2"  id="price"><span>￦123,456~</span></td></tr>
				<tr><td id="context">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc sit amet ante purus. Donec nunc ipsum, blandit et congue sit amet.</td></tr>
				<tr><td rowspan="2" id="thumb"><img alt="#" src="../img/491021_374477_1553.jpg"></td><td id="subject">Lorem ipsum dolor sit amet.</td><td rowspan="2"  id="price"><span>￦123,456~</span></td></tr>
				<tr><td id="context">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc sit amet ante purus. Donec nunc ipsum, blandit et congue sit amet.</td></tr>
				<tr><td rowspan="2" id="thumb"><img alt="#" src="../img/군항제3.jpg"></td><td id="subject">Lorem ipsum dolor sit amet.</td><td rowspan="2"  id="price"><span>￦123,456~</span></td></tr>
				<tr><td id="context">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc sit amet ante purus. Donec nunc ipsum, blandit et congue sit amet.</td></tr>
				<tr><td rowspan="2" id="thumb"><img alt="#" src="../img/i.jpg"></td><td id="subject">Lorem ipsum dolor sit amet.</td><td rowspan="2"  id="price"><span>￦123,456~</span></td></tr>
				<tr><td id="context">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc sit amet ante purus. Donec nunc ipsum, blandit et congue sit amet.</td></tr>
				<tr><td rowspan="2" id="thumb"><img alt="#" src="../img/Jeju-bg.jpg"></td><td id="subject">Lorem ipsum dolor sit amet.</td><td rowspan="2"  id="price"><span>￦123,456~</span></td></tr>
				<tr><td id="context">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc sit amet ante purus. Donec nunc ipsum, blandit et congue sit amet.</td></tr>
				<tr><td rowspan="2" id="thumb"><img alt="#" src="../img/20101021182610.jpg"></td><td id="subject">Lorem ipsum dolor sit amet.</td><td rowspan="2"  id="price"><span>￦123,456~</span></td></tr>
				<tr><td id="context">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc sit amet ante purus. Donec nunc ipsum, blandit et congue sit amet.</td></tr>
				<tr><td rowspan="2" id="thumb"><img alt="#" src="../img/491021_374477_1553.jpg"></td><td id="subject">Lorem ipsum dolor sit amet.</td><td rowspan="2"  id="price"><span>￦123,456~</span></td></tr>
				<tr><td id="context">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc sit amet ante purus. Donec nunc ipsum, blandit et congue sit amet.</td></tr>
				<tr><td rowspan="2" id="thumb"><img alt="#" src="../img/군항제3.jpg"></td><td id="subject">Lorem ipsum dolor sit amet.</td><td rowspan="2"  id="price"><span>￦123,456~</span></td></tr>
				<tr><td id="context">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc sit amet ante purus. Donec nunc ipsum, blandit et congue sit amet.</td></tr>
				<tr><td rowspan="2" id="thumb"><img alt="#" src="../img/i.jpg"></td><td id="subject">Lorem ipsum dolor sit amet.</td><td rowspan="2"  id="price"><span>￦123,456~</span></td></tr>
				<tr><td id="context">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc sit amet ante purus. Donec nunc ipsum, blandit et congue sit amet.</td></tr>
				<tr><td rowspan="2" id="thumb"><img alt="#" src="../img/Jeju-bg.jpg"></td><td id="subject">Lorem ipsum dolor sit amet.</td><td rowspan="2"  id="price"><span>￦123,456~</span></td></tr>
				<tr><td id="context">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc sit amet ante purus. Donec nunc ipsum, blandit et congue sit amet.</td></tr>
			</table>
		</div>
		<div id="pages">
			<a href="#">이전</a>
			<a href="#">1</a>
			<a href="#">2</a>
			<a href="#">3</a>
			<a href="#">4</a>
			<a href="#">5</a>
			<a href="#">6</a>
			<a href="#">7</a>
			<a href="#">8</a>
			<a href="#">9</a>
			<a href="#">10</a>
			<a href="#">다음</a>
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