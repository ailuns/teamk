<%@page import="com.sun.xml.internal.ws.api.config.management.Reconfigurable"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ page import="net.member.db.*"%>
	<%@ page import="net.pack.db.PackDAO"%>
<%@ page import="net.pack.db.PackBean"%>
<%@ page import="java.util.List"%>
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
<!-- <script src="https://code.jquery.com/jquery-1.12.4.js"></script> -->
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
</head>
<%	request.setCharacterEncoding("utf-8");
	ProductBean pb = new ProductBean();
	ProductDAO pdao = new ProductDAO();
	CategoryBean cb = new CategoryBean();
	CategoryDAO cdao = new CategoryDAO();
	CommentBean comb = new CommentBean();
	CommentDAO comdao = new CommentDAO();
	List productList2 = (List) request.getAttribute("productList2");
	List RecommendPack = (List)request.getAttribute("RecommendPack");

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
	 	
		int pageSize2 = (int) request.getAttribute("pageSize2");
	 	String pageNum2 = (String) request.getAttribute("pageNum2");
	 	int startRow2 = (int) request.getAttribute("startRow2");
	 	int endRow2 = (int) request.getAttribute("endRow2");
		int pageCount2 = (int) request.getAttribute("pageCount2");
	 	int pageBlock2 = (int) request.getAttribute("pageBlock2");
	 	int startPage2 = (int) request.getAttribute("startPage2");
	 	int endPage2 = (int) request.getAttribute("endPage2");
		String user_id = (String) session.getAttribute("id");
	

if (user_id == null)
	user_id = "";
%>
<body>
<script>

	jQuery(document).ready(function($){
		$("#remote_content").draggable();
		var val = $("#avg_cost").html();
		 var commasum = val.replace(/(\d)(?=(?:\d{3})+(?!\d))/g, '$1,');
		$('#p').html(commasum);
		// 작은 이미지 클릭 시 큰 이미지부분이 클릭한 이미지로 교체
		$('.bxslider img').click(function(){
			
			// 모든 이미지의 테두리값을 없앤다
			$('.bxslider img').css("border", "");  
			
			// 클릭된 이미지에 회색 테두리를 만든다
			// 선택된 효과
			$(this).css({
				"border" : "5px solid #A6A6A6",
				"box-sizing" : "border-box"
			});
			
			// 클릭된 이미지의 src 주소값을 가져온다
			var imgurl = $(this).attr("src");
			// 큰 이미지 부분에 클릭된 작은이미지 src 적용
			$('#main').attr("src", imgurl);
		});
		
		
		$('#close').click(function(){
			$('#banner').hide();
			$('#banner_sub').hide();
		});
	
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
	

	jQuery(document).ready(function($){
		var packnum = $("#ori_num_chk").val();
// 		alert(packnum);
		$.ajax({   // 날짜를 클릭할때 마다 찜목록과 비교
			type:"post",
			url:"./MyInterestCheck.ins",
			data:{
				num:packnum,
				type:"T"
			},
			success:function(data)
			{
				if (data == 1)  // 찜목록에 해당 날짜 패키지가 있을 시
				{
					$("#jjim_o").hide();  // 찜추가   버튼  숨기기
					$("#jjim_x").show();  // 찜삭제   버튼 보이기
				}
				else   // 찜목록에 해당 날짜 패키지가 없을 시
				{
					$("#jjim_o").show();  // 찜추가 버튼 보이기
					$("#jjim_x").hide();  // 찜삭제 버튼 숨기기
				}
			}
		});
	});
	
	
	
	// 찜하기, 예약하기 버튼 클릭 시 각각 버튼 마다 이동할 페이지
	function submit_fun(i, user_id)
	{
		if(user_id != "")
		{
			// i = 1  찜추가   i = 2 찜취소    i = 3  예약하기
			if (i == 1) // 로그인 되어 있을 경우 찜추가
			{
			
				$.ajax({
					type:"post",
					url:"./MyInterestAdd.ins",   // java로 보냄
					data:{
						type:"T",
// 						num:$("input[type=radio][name=chk]:checked").val()	
						num:$("#ori_num_chk").val()
					},
					success:function(){
						$("#jjim_o").hide();
						$("#jjim_x").show();
						alert("찜목록에 추가되었습니다");
//							window.location.reload(true);  // 페이지 새로고침
					}
				});
			}
			
			else if(i == 2)   // 로그인에 되어 있을 경우 찜취소
			{
				$.ajax({
					type:"post",
					url:"./MyInterestDel.ins",   // java로 보냄
					data:{
						type:"T",
// 						num:$("input[type=radio][name=chk]:checked").val()	
						num:$("#ori_num_chk").val()
					},
					success:function(){
						$("#jjim_o").show();
						$("#jjim_x").hide();
						alert("찜목록에서 삭제되었습니다");
//							window.location.reload(true);  // 페이지 새로고침
					}
				});
			}
			
			else if (i == 3)  // 로그인 되어 있을 경우  장바구니
			{
				
				var val1 = $("#color option:selected").val(); 
				var val2 = $("#size option:selected").val();
				if(val1 == ""){
					alert("color를 선택해주세요.")
				}else if(val2 ==""){
					alert("size를 선택해주세요.")
				}else{
				var cost_temp = $("#p").html(); // 총금액 받아오기
				str = String(cost_temp);		// 총금액 천원단위로 , 찍혀있는걸
			    cost = str.replace(/[^\d]+/g, '');   // 풉니다
			    alert($("#size option:selected").val());				
			    $("#cost").val(cost);
			    $("#ori_num").val($("#size option:selected").val());
			    alert($("#cost").val())
			    document.input_fr.action = "./MyBasketAddAction.bns";	// 장바구니 페이지로 이동
			    document.input_fr.method = "post";
			    document.input_fr.submit();
				}
			}
			
			else if (i == 4)  // 로그인 되어 있을 경우  예약하기
			{
				var val1 = $("#color option:selected").val(); 
				var val2 = $("#size option:selected").val();
				if(val1 == ""){
					alert("color를 선택해주세요.")
				}else if(val2 ==""){
					alert("size를 선택해주세요.")
				}else{
				var cost_temp = $("#p").html(); // 총금액 받아오기
				str = String(cost_temp);		// 총금액 천원단위로 , 찍혀있는걸
			    cost = str.replace(/[^\d]+/g, '');  // 풉니다
				
			    // 폼태그로 보내기때문에 hidden 숨겨둔 곳에 각각 값을 넣는다
			    $("#cost").val(cost);
			    $("#ori_num").val($("#size option:selected").val());

			    document.input_fr.action = "./MyOrderPay.mo";  // 예약하기 페이지로 이동
			    document.input_fr.method = "post";
			    document.input_fr.submit();
				}
			}
		}
		
		
		
		
		else if(user_id == "")	// 로그인 안되어 있을 경우
		{
			loginChk();
		}
	}
	
	
	// 주변 명소, 주변 맛집 클릭 시  검색할 값을 구글맵으로 보낸다
	// 현재 페이지의 City, Sarea 값을 가져온다
	

	// 댓글 쓰기
	function ReplyWrite(num)
	{
		if($(".secretChk").is(":checked"))  // 비밀글 체크 o
		{
			$.ajax({
				type:"post",
				url:"./ContenttWriteAction.bo",   // java로 보냄
				data:{
					id:$("#id").val(),
					content:$("#content").val(),
					num:num,
					secretChk:$(".secretChk").val()	// 비밀글 아닐 시 값 1
					},
					success:function()
					{
						window.location.reload(true);  // 페이지 새로고침
					}
				});
		}
		else							 // 비밀글 체크 x
		{
			$.ajax({
				type:"post",
				url:"./ContenttWriteAction.bo",
				data:{
					id:$("#id").val(),
					content:$("#content").val(),
					num:num,
					secretChk:"0"     // 비밀글 아닐 시 값 0
				},
				success:function(){
					window.location.reload(true);   // 페이지 새로고침
				}
			});
		}
	}

	// 대댓글 작성 시 
	function Re_Reply_Write(num)
	{
		if($(".re_secretChk").is(":checked"))  // 비밀글 체크 o
		{
			$.ajax({
				type:"post",
				url:"./ContenttWriteAction2.bo",
				data:{
					id:$("#reid").val(),
					content:$("#recontent"+num).val(),
					num:$("#num").val(),
					repageNum:$("#repageNum").val(),
					replynum:$("#replynum").val(),
					re_ref:$("#re_ref"+num).val(),
					re_lev:$("#re_lev").val(),
					re_seq:$("#re_seq").val(),
					secretChk:$(".re_secretChk").val(),
					success:function(){
						window.location.reload(true);
					}
				}				
			});
		}
		else		  // 비밀글 체크 x
		{
			$.ajax({
				type:"post",
				url:"./ContenttWriteAction2.bo",
				data:{
					num:$("#num").val(),
					id:$("#reid").val(),
					content:$("#recontent"+num).val(),
					repageNum:$("#repageNum").val(),
					replynum:$("#replynum").val(),
					re_ref:$("#re_ref"+num).val(),
					re_lev:$("#re_lev").val(),
					re_seq:$("#re_seq").val(),
					secretChk:"0",
					success:function(){
						window.location.reload(true);
					}
				}
				
			});
		}
	}

	// 댓글 삭제
	function ReplyDel(renum, id)
	{
		
		$.ajax({
			type:"post",
			url:"./ContentDeleteAction.bo",
			data:{
				num:renum,
				id:id,				
				success:function(){
					window.location.reload(true);
				}
			}
		});
	}

	// 댓글 수정
	function reUpdateAction(num)
	{
		if($(".up_secretChk"+num).is(":checked"))
		{
			$.ajax({
				type:"post",
				url:"./ContentUpdateAction.bo",
				data:{
					content:$("#contentup"+num).val(),
					num:num,
					secretChk:$(".up_secretChk"+num).val(),
					success:function(){
						window.location.reload(true);
					}
				}				
			});
		}
		
		else
		{
			$.ajax({
				type:"post",
				url:"./ContentUpdateAction.bo",
				data:{
					num:num,
					content:$("#contentup"+num).val(),
					secretChk:"0",
					success:function(){
						window.location.reload(true);
					}				
				}
			});
		}
	}

	//구글맵 v3
	function initAutocomplete() {

		var geocoder = new google.maps.Geocoder();

		var addr = value;  // 버튼 클릭 시 넘겨받을 장소
		var lat = "";   // 위도값
		var lng = "";   // 경도값
		var prev_infowindow = false; // 이전 infowindow값 저장할 변수
		
		geocoder.geocode({
			'address' : addr
		},

		function(results, status) {

			if (results != "") {

				var location = results[0].geometry.location;	// 검색하는 장소의 위치값을 가져온다

				lat = location.lat();   // 검색하는 장소의 위도값
				lng = location.lng();   // 검색하는 장소의 경도값

				var latlng = new google.maps.LatLng(lat, lng);  // 위도, 경도 설정
				var myOptions = {
					zoom : 14,									// 구글맵 줌 거리 설정
					center : latlng,							// 구글맵 좌표 설정
					mapTypeControl : true,
					mapTypeId : google.maps.MapTypeId.ROADMAP
				};
				var map = new google.maps.Map(document.getElementById("map_canvas"), myOptions);  // 구글맵 생성
				
				var infoWindow = new google.maps.InfoWindow({
					map : map
				});
		    	

			    
				// 검색창과 UI요소와 연결
				var input = document.getElementById('pac-input');
				var searchBox = new google.maps.places.SearchBox(input);
				map.controls[google.maps.ControlPosition.TOP_LEFT].push(input);

				// Bias the SearchBox results towards current map's viewport.
				map.addListener('bounds_changed', function() {
					searchBox.setBounds(map.getBounds());
				});

				var markers = [];
				// 검색할때 이벤트 처리 
				searchBox.addListener('places_changed', function() {
					var places = searchBox.getPlaces();

					if (places.length == 0) {
						return;
					}

					// 오래된 마커를 지웁니다
					markers.forEach(function(marker) {
						marker.setMap(null);
					});
					markers = [];

					
					
					// 그 장소에 대한 더 자세한 내용
					// 각 장소의 아이콘과 이름, 위치를 가져온다
					var bounds = new google.maps.LatLngBounds();
					places.forEach(function(place) {
						if (!place.geometry) {
							console.log("Returned place contains no geometry");
							return;
						}
						
						// 해당 장소의 사진을 가져온다
						var photos = place.photos;
						  if (!photos) {
						    return;
					 	}
						
						// 해당 장소에 마커를 만든다
						var marker = new google.maps.Marker({
						  map: map,
						  position: place.geometry.location,
						  title: place.name
						  
						});
		            	markers.push(marker);

		            	
		            	// 말풍선에 넣을 이미지 및 문구 설정
		            	var imgurl = photos[0].getUrl({'maxWidth': 150, 'maxHeight': 150});
		            	var contentString = "<table border='1'><tr><td rowspan='2'><img style='width:100px; height:100px' src=" + imgurl + "></td><td><p style='text-align: center;'>" + place.name + "</p></td></tr>"
		            	 + "<tr><td><p style='text-align: center;'>" + place.formatted_address + "</p></td></tr></table>";
						
						var infowindow1 = new google.maps.InfoWindow({ content: contentString});
						 
						
						// 마커를 클릭했을 때 이벤트 처리 
						google.maps.event.addListener(marker, 'click', function() {
							if (prev_infowindow)  // 값이 있을 시 실행
								{
									prev_infowindow.close();  // 이전 정보창을 닫는다
								}
							prev_infowindow = infowindow1;  // prev_infowindow에 현재 inforwindow1 값을 저장
							infowindow1.open(map, this);	// 클릭된 마커의 정보창을 연다
				        });
						
						 
// 						// 마커 위에 마우스가 올라갔을때 이벤트 처리 
// 						google.maps.event.addListener(marker, 'mouseover', function() {
// 				            infowindow1.open(map, this);
// 				        });
							
// 						// 마커 위에 마우스가 내려갔을때 이벤트 처리
// 						google.maps.event.addListener(marker, 'mouseout', function() {
// 				            infowindow1.close(map, this);
// 				        });

						if (place.geometry.viewport) {
							// Only geocodes have viewport.
							bounds.union(place.geometry.viewport);
						} else {
							bounds.extend(place.geometry.location);
						}
					});
					map.fitBounds(bounds);
				});
			} else
				$("#map_canvas").html("위도와 경도를 찾을 수 없습니다.");	
		});
	}

	// 대댓글 작성 시 해당 댓글 밑에 입력창 보여주기/숨기기
	function rewrite(renum){
		$('#con' + renum).toggle();
	}
	
	// 대댓글 작성 시 해당 댓글 밑에 입력창 보여주기/숨기기
	function reupdate(renum){
		$('#conup' + renum).toggle();
		$("#relist" + renum).toggle();
	}

	// 비로그인 때 상품문의글 쓰려고 하면 실행
	function loginChk()
	{
		if (confirm("로그인이 필요한 서비스입니다\n로그인 화면으로 이동하시겠습니까?") == true){    //확인
		    location.href="./MemberLogin.me";
		}
		else //취소
		    return;
	}

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
	function Rcom_move(select)
	{
		var select_num = $("#num" + select).html();
		location.href="./PackContent.po?num=" + select_num;
	}
	
	// 리모컨 닫기 이벤트
	function remote_close()
	{
		$('#remote_control').hide();
	}
	
	// 리모컨으로 태그 화면 이동
	function fnMove(seq){
        var offset = $(seq).offset();
        $('html, body').animate({scrollTop : offset.top}, 400);
    }
	
	// 리모컨 마우스 Drag&Drop 이벤트
	jQuery(document).ready(function($){
	
	});
	
	// 날짜 추가 버튼 클릭 이벤트
	function winOpen(name,num) {
		win = window.open("./ProductAdd.bo?num=" + num + "&name=" +name, "ProductAdd.jsp",
				"width=800, height=700, left=100, top=100");
	}
	
	
	// 날짜 선택시 이벤트
	function select_date(select_num)
	{
		var packnum = $("#select_rbtn" + select_num).val();
// 		alert(packnum);
		$(".select_color").css("background-color","");
		$("#select_rbtn" + select_num).prop("checked", "true");
		$("#select_date" + select_num).css("background-color", "#D5D5D5");
		
		$.ajax({
			type:"post",
			url:"./MyInterestCheck.ins",
			data:{
				num:packnum,
				type:"T"
			},
			success:function(data)
			{
// 				alert(data);
				if (data == 1)
				{
					$("#jjim_o").hide();
					$("#jjim_x").show();
				}
				else
				{
					$("#jjim_o").show();
					$("#jjim_x").hide();
				}
			}
		});
	}



</script>

<!-- 구글맵에 필요한 스크립트 -->
<script
	src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAABj1RgLJEG6AlmrrpOAyD9Jq_ciRKdt0&libraries=places&callback=initAutocomplete"
	async defer>
</script>
<!-- 구글맵에 필요한 스크립트 -->

<style type="text/css">

.clear {
	clear: both;
}

#wrap_pack { 
	width: 980px; 
	min-height: 1000px;
	border: 5px solid red;
 	margin: 50px auto;
	padding-top: 50px;
	background-color: #eee;
} 


/* 이미지 정보 부분 */
#top {
	width: 960px;
}


#imgdiv ul
{
	list-style: none;
}

#imgdiv{
	width: 470px;
	height: 400px;
	border: 3px solid orange;
	float: left;
}

#imgdiv img {
	width: 470px;
	height: 300px;
	float: left;
}

#imgdiv ul li img{
	width: 80px;
	height: 80px;
	margin-top : 10px;
	margin-left : 5px;
}

/* 이미지에 마우스를 올렸을 때 이벤트 */
#imgdiv ul li img:HOVER{
	box-sizing : border-box;
	border : 5px solid #A6A6A6;
}
/* 이미지에 마우스를 올렸을 때 이벤트 */

/* 이미지 정보 부분 */


/* 인원, 가격 정보 부분 */
#contentdiv1 {
	width: 400px;
	height: 400px;
	border: 3px solid blue;
	float: left;
	margin-left : 50px;
}

/* 인원, 가격 정보 부분 */

	
/* 날짜정보 내용 */

#datecontent {
	width: 960px;
	height: 350px;
	border: 3px solid gray;
	overflow: auto;
}

#datecontent table
{
	border-collapse: collapse;
}	


#datecontent tr:FIRST-CHILD
{
	background-color: gray;
	height : 30px;
}

#datecontent tr:HOVER
{
	background-color: #D5D5D5;
}

#datecontent .date_td_size
{
	height : 50px;
	border-bottom : 1px solid black;
}

#datecontent #date_date
{
	width : 225px;
}

#datecontent #date_subject
{
	width : 525px;
}

#datecontent #date_cost
{
	width : 170px;
}

#datecontent #date_stock
{
	width : 70px;
}

/* 날짜정보 내용 */
	

/* 여행정보 내용 */

#contentdiv2 {
	width: 960px;
	min-height: 700px;
	border: 3px solid gray;
}

/* 여행정보 내용 */

/* 구글맵 */


#map_canvas {
	width: 800px;
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


/* 구글맵 */


/* 상품 문의 */
#QnA {
	width: 800px;
	min-height: 300px;
	border: 3px solid pink;
}

#replyTable
{
	background-color: white;
	
}

/* tr:nth-child(odd)  */
/* { */
/* 	background-color: #BFBFBF; */
/* } */

#replyContent
{	
	width: 700px;
	height : 50px;
}

#recontent, #contentup, #content
{
	width : 600px;
	height : 70px;
}

#replyWrite
{
	background-color: white;
}

/* 상품 문의 */








</style>

	<div id="remote_control">
		<table id="remote_content">
			<tr>
				<td><span onclick="remote_close()">close</span></td>
			</tr>
			<tr>
				<td><span onclick="fnMove('body')">Top</span></td>
			</tr>
			<tr>
				<td><span onclick="fnMove('#contentdiv2')">상품정보</span></td>
			</tr>
		
			<tr>
				<td style="border-bottom: none;"><span onclick="fnMove('#QnA')">상품문의</span></td>
			</tr>
		</table>
	</div>
	<%
	if (RecommendPack.size() > 0)
	{
	%>
	<div id="banner">
		<table id="banner_content">
			<tr>
				<tr>
				<%
					if (RecommendPack.size() == 1)
					{
				%>
						<td>
							<div id="banner_sub">추천패키지</div>
							<div id="close">close</div>
						</td>
						
				<%
					}
					else if (RecommendPack.size() == 2)
					{
				%>
						<td><div id="banner_sub">추천패키지</div></td>
						<td><div id="close">close</div></td>
				<%
					}
					else if (RecommendPack.size() == 3)
					{
				%>
						<td><div id="banner_sub">추천패키지</div></td>
						<td></td>
						<td><div id="close">close</div></td>
				<%
					}
				%>
				</tr>
				<%
				PackBean pdb = new PackBean();
					for(int i = 0; i < RecommendPack.size(); i++)
					{
						pdb =(PackBean)RecommendPack.get(i);
				%>
				
				<td>
					<table>
						<tr>
							<td id="num<%=i %>" style="display: none;"><%=pdb.getNum() %></td>
			
							<td><img id="Rcom_pd" src="./upload/<%=pdb.getFile1() %>" onclick="Rcom_move(<%=i %>)"></td>
						</tr>
						<tr>
							<td><div class="info"><%=pdb.getCost() %></div></td>
						</tr>
					</table>
				</td>
				<%
					}
				%>
				
			</tr>
		</table>
	</div>
	<%
	}
	%>

	<!-- 왼쪽 메뉴 -->
	<jsp:include page="../inc/leftMenu.jsp"></jsp:include>
	<!-- 왼쪽 메뉴 -->
	<!--여행지 검색창 -->
	<div id="wrap"> 
		<div id="package_head">
			<div id="article_head">
		<div id="article_title"><img src="./img/shop.png" width="30px" style="margin-right: 8px; vertical-align: bottom;">상품</div>
	<div class="empty"></div>
	</div>
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
	<%
				for (int i = 0; i < productList.size(); i++) {

						pb = (ProductBean) productList.get(i);
			%>
		<div id="pack_btn">
		<!--글제목 -->
		<br>
		<h3><%=pb.getSubject()%></h3>
		<!--글제목 -->
		<!--관리자만 보이게 -->
		<%
		if (user_id != null)
		{
			if (user_id.equals("admin"))
			{
		%>
			<input type="button" value="상품편집" onclick="winOpen('<%=pb.getName() %>',<%=num %>);">
			<input type="button" value="상품글수정" onclick="location.href='./ProductUpdate.bo?num=<%=num%>&pageNum=<%=pageNum%>'">
		<%
			}
		}
		%>
		</div>
		<!--관리자만 보이게 -->
		<hr>
		<div id="top">
			<!--상품 이미지 -->
			<div id="imgdiv">
				<!--첫번째 이미지는 무조건 첨부하게 제어 -->
				<img src="./upload/<%=pb.getImg() %>" id="main">
				<!--첫번째 이미지는 무조건 첨부하게 제어 -->
				<ul class="bxslider">
					<li><img src="./upload/<%=pb.getImg() %>" style="box-sizing : border-box; border : 5px solid #A6A6A6;"></li>
					<%
					// 2~5번째 이미지는 null이 아닐 경우 출력 o   null 경우 출력 x
					String img[] = {pb.getImg2(), pb.getImg3(), pb.getImg4(), pb.getImg5()};
					
					for (int j = 0; j < img.length; j++)
					{
						if(img[j] != null && !img[j].equals(""))
						{
						%>
							<li><img src="./upload/<%=img[j] %>"></li>
						<%
						}
					}
					%>
				</ul>
			</div>
			<!--상품 이미지 -->
			
			<!--인원수, 가격 -->
				<div id="contentdiv1">
				<form name="input_fr" method="post" onsubmit="return false">
					<table>
						<tr>
							<td class="contentdiv1_1">판매가</td>
							<td class="contentdiv1_2" id="avg_cost"><%=pb.getCost() %></td>
							
							<td class="contentdiv1_3"></td>
						</tr>
							<%} %>
						<tr>
							<td class="contentdiv1_1">color</td>
								<td class="contentdiv1_2"><select id="color" name="color" onchange="people_Calc2(<%=num%>)">
								<option value ="">선택하세요</option>
								<%
				for (int i = 0; i < productList3.size(); i++) {

						pb = (ProductBean) productList3.get(i);
			%>
	
								<option value = "<%=pb.getColor()%>"><%=pb.getColor()%></option>
								<%} %>
							</select></td>
							<td class="contentdiv1_3"></td>
						</tr>
						<tr>
							<td class="contentdiv1_1">size</td>
							<td class="contentdiv1_2">
							<select  name="size"  id ="size"class="size" onchange="people_Calc3(<%=num%>)">
								<option  value = "5555" >선택하세요</option>
								
								</select></td>
				
								<td class="contentdiv1_3"><input type="hidden" id="hstock" value=""></td>
								<div id="dstock"></div>
						</tr>
						
						
						<tr>
							<td class="contentdiv1_1">합계</td>
							<td colspan="2">
								<input type="hidden" id="cost" name="cost" value="">
								<input type="hidden" id="ori_num" name="tnum" value="">
								<input type="hidden" name="type" value="T">
								<p id="p"></p>
							</td>
						</tr>
						
						
					</table>
					<br>
					<table id ="stocktable"></table>
										<%
				for (int i = 0; i < productList.size(); i++) {

						pb = (ProductBean) productList.get(i);
			%>
							<input type="hidden" id="ori_num_chk" value="<%=pb.getNum() %>">
								<%} %>
					
				
					<input type="button" class="contentbtn" id="jjim_o" value="♡ 찜" onclick="submit_fun(1, '<%=user_id %>')">
					<input type="button" class="contentbtn" id="jjim_x" value="♥ 찜" style="display:none;" onclick="submit_fun(2, '<%=user_id %>')">
					<input type="button" class="contentbtn2" value="장바구니" onclick="submit_fun(3, '<%=user_id %>')">
					<input type="button" class="contentbtn2" value="예약하기" onclick="submit_fun(4, '<%=user_id %>')">
					
					
					<p id="content_notice">※color를 선택해주셔야 size부분이 나옵니다!!!</p>
					
							<script type="text/javascript">
// 							function up(){
								
// 								var val = $("#avg_cost").html();
// 								var str = $("#stack").val();
								
// 								var str2 = $("#size option:selected").val();
// 								var str3 = parseInt($("#dstock"+str2).val());
// 								alert(str3);
								
// // 								var str2 = $("#hstock").val().split(",");
// // 								var str3 = parseInt($("#size option").index($("#size option:selected")));
// 								var max = 10;
// 								var alertmsg = "";
// 								if(str3 != 0){
// 									str++;
// 									document.input_fr.stack.value = str;
// 								if(str2[str3]<max){
// 									max = str2[str3];
// 									alertmsg = "재고가 부족합니다\n"+str2[str3]+"만큼 선택해주세요.";
									
// 								}else{
// 									alertmsg = "10개 이하로 주문해주세요";
								
// 								}
								
// 								if(str > max){
// 									alert(alertmsg);
// 									$("#stack").val(parseInt($("#stack").val())-1);
// 								}else{
// 									var sum = str * val;
									
// 								    str = String(sum);
// 								    var commasum = str.replace(/(\d)(?=(?:\d{3})+(?!\d))/g, '$1,');
// 									$('#p').html(commasum);
								
// 								}
								
								
// 								}else{
// 									alert("size를 선택하여주세요.");
// 								}
// 							}
						function up(){
								
								var val = $("#avg_cost").html();
								var str = $("#stack").val();
								
								var str2 = $("#size option:selected").val();
								var str3 = $("#dstock"+str2).val();
								
								
// 								var str2 = $("#hstock").val().split(",");
// 								var str3 = parseInt($("#size option").index($("#size option:selected")));
								var max = 10;
								var alertmsg = "";
								if(str3 != 0){
									str++;
									document.input_fr.stack.value = str;
								if(str3<max){
									max = str3;
									alertmsg = "재고가 부족합니다\n"+str3+"만큼 선택해주세요.";
									
								}else{
									alertmsg = "10개 이하로 주문해주세요";
								
								}
								
								if(str > max){
									alert(alertmsg);
									$("#stack").val(parseInt($("#stack").val())-1);
								}else{
									var sum = str * val;
									
								    str = String(sum);
								    var commasum = str.replace(/(\d)(?=(?:\d{3})+(?!\d))/g, '$1,');
									$('#p').html(commasum);
								
								}
								
								
								}else{
									alert("size를 선택하여주세요.");
								}
							}
						function up(num){
							
							var val = $("#avg_cost").html();
							var str = parseInt($("#stack2"+num).val());
							
							var str2 = $("#size option:selected").val();
							var str3 = $("#dstock"+str2).val();
							
							
//								var str2 = $("#hstock").val().split(",");
//								var str3 = parseInt($("#size option").index($("#size option:selected")));
							var max = 10;
							var alertmsg = "";
							if(str3 != 0){
								str++;
								$("#stack2"+num).val(str);
							if(str3<max){
								max = str3;
								alertmsg = "재고가 부족합니다\n"+str3+"만큼 선택해주세요.";
								
							}else{
								alertmsg = "10개 이하로 주문해주세요";
								
							}
							
							if(str > max){
								alert(alertmsg);
								$("#stack2"+num).val(parseInt($("#stack2"+num).val())-1);
							}else{
								var sum = str * val;
								
							    str = String(sum);
							    var commasum = str.replace(/(\d)(?=(?:\d{3})+(?!\d))/g, '$1,');
								$('#p'+num).html(commasum);
							
							}
							
							
							}else{
								alert("size를 선택하여주세요.");
							}
						}
						
						
							function down(num){
								
								var val = $("#avg_cost").html();
								var str = parseInt($("#stack2"+num).val());
								if(str <= 1){
									alert("더이상클릭할수업습니다.")
								}else{
								str--;
								$("#stack2"+num).val(str);
								}
								var sum = str * val;
							    str = String(sum);
							    var commasum = str.replace(/(\d)(?=(?:\d{3})+(?!\d))/g, '$1,');
								$('#p'+num).html(commasum);
							}
							
							function keyup(num){
								 if (window.event.keyCode == 13) {
								
								var val = $("#avg_cost").html();
								var str = parseInt($("#stack2"+num).val());
								
								var str2 = $("#size option:selected").val();
								var str3 = $("#dstock"+str2).val();
								
								
//									var str2 = $("#hstock").val().split(",");
//									var str3 = parseInt($("#size option").index($("#size option:selected")));
								var max = 10;
								var alertmsg = "";
								if(str3 != 0){
									$("#stack2"+num).val(str);
								if(str3<max){
									max = str3;
									alertmsg = "재고가 부족합니다\n"+str3+"만큼 선택해주세요.";
									
								}else{
									alertmsg = "10개 이하로 주문해주세요";
									
								}
								
								if(str > max){
									alert(alertmsg);
									
								
								}else{
									var sum = str * val;
									
								    str = String(sum);
								    var commasum = str.replace(/(\d)(?=(?:\d{3})+(?!\d))/g, '$1,');
									$('#p'+num).html(commasum);
								
								}
								
								
								}else{
									alert("size를 선택하여주세요.");
								}
							}
							}
							
							
							
							function people_Calc2(str){			
								$(document).ready(function(){
									var val1 = $("#color option:selected").val();
									var val2 = str
									
									
									
									$("#size").find("option").remove();
									$("#dstock").find("input").remove();
									$('#size').append("<option  value = '5555' >선택하세요</option>");
									$.getJSON('./product/json3.jsp?num='+val2+'&color='+val1,function(data){
										var stocktest = "";
										$.each(data,function(index,qwer){
										//body태그 추가 key:value	
											$('#size').append("<option value=" + qwer.num + ">" + qwer.size +"</option>");
											$('#dstock').append("<input type = 'hidden' value ='"+qwer.stock+"'id='dstock"+qwer.num+"'>");
											
										stocktest+=","+ qwer.stock;
									
										});
										$("#hstock").val(stocktest);
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
					
							function people_Calc3(str){
								$(document).ready(function(){
									var val1 = $("#color option:selected").val();
									var val2 = str
									var val3 = $("#size option:selected").val();
									

									if(val3 != 5555){
									
									
									$.getJSON('./product/json4.jsp?num='+val3+'&color='+val1,function(data){
										var stocktest = "";
										$.each(data,function(index,qqqq){
										//body태그 추가 key:value	
											$('#stocktable').append(
													"<tr id='stocktr"+qqqq.num+"'><td class='contentdiv1_2'>"
													+qqqq.size+"-"+qqqq.color+"</td><td>"+
													"<input type='button' value='▲' onclick='up("+qqqq.num+")'>"+
													"<input type='text' id = 'stack2"+qqqq.num+
													"' name = 'count' value='1' onkeydown='keyup("+qqqq.num+")'>"+
													"<input type='button' value='▼' onclick='down("+qqqq.num+")'>"+
													"</td><td><p id='p"+qqqq.num+"'></p></td></tr>");
											
										});
									
									});
									}else{alert("닌멍청하다")
									}
								});
							
								
								
							}
							
						</script>
				</form>
			</div>
			<!--인원수, 가격 -->
		</div>
		<div class="clear"></div>
		

		
		<!--상품 정보, 내용이 들어가는 영역 -->
	
		<div id="middle1">
		<%
				for (int i = 0; i < productList.size(); i++) {

						pb = (ProductBean) productList.get(i);
			%>
			<div id="contentdiv2">
				<div id="contentdiv2_1"><%=pb.getContent() %>
				</div>
				</div>
			<%} %>
		</div>
		<!--상품 정보, 내용이 들어가는 영역 -->

		

		<!--상품 문의 -->
			<div id="QnA">
			<h3>상품 문의</h3>
			<hr>
			<div id="middle3">
			<table border="1" id="replyTable">
				<tr>
<!-- 					<td>번호</td> -->
<!-- 					<td>작성자</td> -->
<!-- 					<td>내용</td> -->
				</tr>
				<%
				
				if(commentcount == 0)
				{
				%>
					<tr>
						<td style="width:800px; text-align: center; height:50px;">문의 내역이 없습니다</td>
					</tr>
				<%
				}
				
					if (commentcount != 0) {
						for (int i = 0; i < commentList.size(); i++) 
						{
							comb  = (CommentBean)commentList.get(i);
				%>

				<tr id="relist<%=comb.getNum()%>">
<%-- 					<td><%=rb.getNum()%></td> --%>
					<td><%=comb.getId()%></td>
					<%
					if ((comb.getId().equals(user_id) && comb.getH_or_s() == 1) || comb.getH_or_s() == 0){
					%>
					<td id="replyContent">
						<span class="reply_align">
						
						<%
							// 답글 들여쓰기 모양
							int wid = 0;
							if (comb.getRe_lev() > 0) {
								wid = 10 * comb.getRe_lev();
						%> 
						<%--<img src="level.gif" id="reimg" width=<%=wid%>> <img src="re.gif"> --%>
							<img src="./img/re.gif">
							<span>[답변]</span>
						<%
							}
							else
							{
						
						%>
						<span>[문의]</span>
						<%
						}
						%> 
						
						<%=comb.getContent()%><span style="font-size: 0.8em; margin-left:5px;">(<%=comb.getDate() %>)</span>
						
						<%
						if(comb.getH_or_s() == 1)
						{
						%>
						<img src="./img/lock.png" width="10px" height="10px">
						
						<%
						}
						%>
						</span>
						<span style="float: right;">
						<%
						if(user_id.equals("admin"))
						{
						%>
						
						<input type="button" value="답글" id="rereply" onclick="rewrite(<%=comb.getNum()%>)">
						<%
						}
						if(comb.getId().equals(user_id))
						{
						%>
						<input type="button" value="수정" id="re_update" onclick="reupdate(<%=comb.getNum() %>)">
						<%
						}
						if(comb.getId().equals(user_id) || user_id.equals("admin"))
						{
						%>
						<input type="button" value="삭제" id="re_delete" onclick="ReplyDel(<%=comb.getNum() %>, '<%=user_id%>');">
						<%
						}
						%>
						</span>
					</td>
					<%
					}
					else if (comb.getH_or_s() == 1 && !comb.getId().equals(user_id)){
					%>
					<td style="height:50px;">
						<span class="reply_align">
						비밀글입니다<img src="./img/lock.png" width="10px" height="10px">
<%-- 						<span>(<%=rb.getDate() %>)</span> --%>
						(<%=comb.getDate() %>)
						</span>
						<span style="float: right;">
						<%
						if(user_id.equals("admin"))
						{
						%>
						<input type="button" value="답글" id="rereply" onclick="rewrite(<%=comb.getNum()%>)">
						<%
						}
						if(comb.getId().equals(user_id))
						{
						%>
						<input type="button" value="수정" id="re_update" onclick="reupdate(<%=comb.getNum() %>)">
						<%
						}
						if(comb.getId().equals(user_id) || user_id.equals("admin"))
						{
						%>
						<input type="button" value="삭제" id="re_delete" onclick="ReplyDel(<%=comb.getNum() %>, '<%=user_id%>');">
						<%
						}
						%>
						</span>
					</td>
					<%
					}
					%>
					
					
				</tr>
				
				<tr id="conup<%=comb.getNum()%>" style="display: none;">
					<td>
						<%=user_id %>
					</td>
					
					<td>
						<span class="reply_align">
						<textarea style="width: 550px;" cols="60" rows="2" id="contentup<%=comb.getNum() %>" name="contentup"><%=comb.getContent() %></textarea>
						</span>
						<span style="float: right;">
						<input type="button" value="수정" onclick="reUpdateAction(<%=comb.getNum() %>)">
						<input type="button" value="취소" onclick="reupdate(<%=comb.getNum() %>)"><br>
						<input type="checkbox" class="up_secretChk<%=comb.getNum() %>" name="secretChk" value="1" <%if(comb.getH_or_s() == 1){%>checked<%} %>>비밀글
						</span>
					</td>
					</td>
				</tr>
				<tr id="con<%=comb.getNum()%>" style="display: none;">
					<td>
						<input type="hidden" id="num" name="num" value="<%=num%>">
						<input type="hidden" id="repageNum" name="pageNum" value="<%=pageNum%>">
						<input type="hidden" id="replynum" name="replynum" value="<%=comb.getNum()%>">
						<input type="hidden" id="re_ref<%=comb.getNum() %>" name="re_ref" value="<%=comb.getRe_ref()%>">
						<input type="hidden" id="re_lev" name="re_lev" value="<%=comb.getRe_lev()%>">
						<input type="hidden" id="re_seq" name="re_seq" value="<%=comb.getRe_seq()%>">
						<p><%=user_id %></p>
						<input type="hidden" id="reid" name="id" class="box" value="<%=user_id %>">
					</td>
					<td>
						<span class="reply_align">
						<textarea style="width: 550px;" cols="60" rows="2" id="recontent<%=comb.getNum() %>" name="recontent"></textarea>
						</span>
						<span style="float: right;">
						<input type="button" value="답글등록" onclick="Re_Reply_Write(<%=comb.getNum() %>)">
						<input type="button" value="취소" onclick="rewrite(<%=comb.getNum() %>)"><br>
						<input type="checkbox" class="re_secretChk" name="secretChk" value="1">비밀글
						</span>
					</td>
				</tr>
			
				<%
					}
						// 최근글위로 re_ref 그룹별 내림차순 re_se q 오름차순
						// 			re_ref desc   re_seq asc
						// 글잘라오기 limit 시작행-1, 개수
					}
				%>
				
			</table>
			<br>
			
			
			<center>
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
			</center>

			<br>
			
			<table id="replyWrite">
				<tr>
					<%
						if (user_id.equals(""))
						{
					%>
					<td>
						<textarea type="text" id="content" name="content" class="box" style="width:790px; height:50px;" placeholder="로그인이 필요한 서비스입니다" readonly onclick="loginChk()"></textarea>
					</td>
					<tr>
							<td>
								<div style="text-align:right; margin-top:15px; width:790px;">
									<input type="checkbox" class="secretChk" name="secretChk" value="1" onclick="loginChk()">비밀글
									<input type="button" value="문의글쓰기" onclick="loginChk()">
								</div>
							</td>
						</tr>
					<td>
					<%
						}
						else
						{
					%><!-- 글넣는부분 -->
						<td>
							<textarea type="text" id="content" name="content" class="box" style="width:790px; height:50px;"></textarea>
							<input type="hidden" id="id" name="id" class="box" value="<%=user_id %>">
							<input type="hidden" name="pageNum" value="<%=pageNum%>">
							<input type="hidden" id="num" name="num" value="<%=num %>">
						</td>
						<tr>
							<td>
								<div style="text-align:right; margin-top:15px; width:790px;">
									<input type="checkbox" class="secretChk" name="secretChk" value="1">비밀글
									<input type="button" value="문의글쓰기" onclick="ReplyWrite(<%=num %>)">
								</div>
							</td>
						</tr>
					<%
						}
					%>
				</tr>
			</table>
		</div>
			</div>
	<!--상품 문의 -->
	</div>
	<!-- 오른쪽 메뉴 -->
	<jsp:include page="../inc/rightMenu.jsp"></jsp:include>
	<!-- 오른쪽 메뉴 -->
	<jsp:include page="../inc/footer.jsp"></jsp:include>
</body>
</html>