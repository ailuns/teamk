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
<script type="text/javascript">	
	$(document).ready(function() {
	$('#aa').hide();
	$('#aa2').hide();
	$('#aa3').hide();
	$('#aa4').hide();
	$('#select1').hide();
	$('#select2').hide();
	$('#select3').hide();
	$('#select4').hide();
	$('#select5').hide();
	$('#select6').hide();
	});
	

	function winopen(){
	$('#aa').show('slow', function() {
	});
}
	function winopen2(){
		$('#aa2').show('slow', function() {
		});
	}
	function winopen3(){
		$('#aa3').show('slow', function() {
		});
	}
	function winopen4(){
		$('#aa4').show('slow', function() {
		});
	}
	function winopen5(){
		$('#aa').hide();
		$('#aa2').hide();
		$('#aa3').hide();
		$('#aa4').hide();
		$('#select1').hide();
		$('#select2').hide();
		$('#select3').hide();
		$('#select4').hide();
		$('#select5').hide();
		$('#select6').hide();
	}

	function people_Calc(){			
		$(document).ready(function(){
			var val = $("#name option:selected").val();
			if(val == "select"){
				var oEditors = [];
				nhn.husky.EZCreator.createInIFrame({
					oAppRef: oEditors,
					elPlaceHolder: "ir1",
					sSkinURI: "./se1/SmartEditor2Skin.html",	
					htParams : {
						bUseToolbar : true,				// 툴바 사용 여부 (true:사용/ false:사용하지 않음)
						bUseVerticalResizer : true,		// 입력창 크기 조절바 사용 여부 (true:사용/ false:사용하지 않음)
						bUseModeChanger : true,			// 모드 탭(Editor | HTML | TEXT) 사용 여부 (true:사용/ false:사용하지 않음)
						fOnBeforeUnload : function(){
							//alert("아싸!");	
						}
					}, //boolean
					fOnAppLoad : function(){
						// 로딩이 될 때 textarea 부분에 보여주는 내용
						var sHTML = '<table border="0" cellpadding="0" cellspacing="0" style="border:1px solid #cccccc; border-left:0; border-bottom:0;" class="__se_tbl"><tbody><tr><td style="border-width: 0px 0px 1px 1px; border-bottom-style: solid; border-left-style: solid; border-bottom-color: rgb(204, 204, 204); border-left-color: rgb(204, 204, 204); border-image: initial; border-top-style: initial; border-top-color: initial; border-right-style: initial; border-right-color: initial; width: 717px; height: 54px; background-color: rgb(235, 235, 235);" class=""><p><b><span style="font-size: 12pt;">&nbsp;여행 정보</span></b></p></td></tr><tr><td style="border-width: 0px 0px 1px 1px; border-bottom-style: solid; border-left-style: solid; border-bottom-color: rgb(204, 204, 204); border-left-color: rgb(204, 204, 204); border-image: initial; border-top-style: initial; border-top-color: initial; border-right-style: initial; border-right-color: initial; width: 717px; height: 54px; background-color: rgb(255, 255, 255);" class=""><p>&nbsp;</p><p>&nbsp; 여행 상품 정보 이미지를 넣어주세요</p><p><br></p></td></tr></tbody></table><br><table border="0" cellpadding="0" cellspacing="0" style="border:1px solid #cccccc; border-left:0; border-bottom:0;" class="__se_tbl"><tbody>' + 
						'<tr><td style="border-width: 0px 0px 1px 1px; border-bottom-style: solid; border-left-style: solid; border-bottom-color: rgb(204, 204, 204); border-left-color: rgb(204, 204, 204); border-image: initial; border-top-style: initial; border-top-color: initial; border-right-style: initial; border-right-color: initial; width: 717px; height: 47px; background-color: rgb(235, 235, 235);" class=""><p>&nbsp;<b><span style="font-size: 12pt;">여행 조건</span></b></p></td>' + 
						'</tr><tr><td style="border-width: 0px 0px 1px 1px; border-bottom-style: solid; border-left-style: solid; border-bottom-color: rgb(204, 204, 204); border-left-color: rgb(204, 204, 204); border-image: initial; border-top-style: initial; border-top-color: initial; border-right-style: initial; border-right-color: initial; width: 717px; height: 18px; background-color: rgb(255, 255, 255);" class=""><p><br></p><p>&nbsp; &nbsp;<b style="color: rgb(55, 55, 55); font-family: &quot;Nanum Gothic&quot;, NanumGothic, 나눔고딕, NanumGothicWeb, &quot;맑은 고딕&quot;, &quot;Malgun Gothic&quot;, Dotum, applegothic, sans-serif, arial; letter-spacing: -0.25px; margin: 0px; padding: 0px; border: 0px; vertical-align: baseline; outline: 0px;">&lt; 여행예약 시 주의사항&nbsp;<font color="#ff0000" style="margin: 0px; padding: 0px;">(반드시 필독)</font>&nbsp;&gt;&nbsp;</b></p><div style="margin: 0px; padding: 0px; border: 0px; font-family: &quot;Nanum Gothic&quot;, NanumGothic, 나눔고딕, NanumGothicWeb, &quot;맑은 고딕&quot;, &quot;Malgun Gothic&quot;, Dotum, applegothic, sans-serif, arial; vertical-align: baseline; outline: 0px; color: rgb(55, 55, 55); letter-spacing: -0.25px;">&nbsp; 1. 울릉도 상품은 날씨의 영향을 많이 받으므로, 기상으로 인하여 현지 일정이 조정될 수 있습니다.</div><div style="margin: 0px; padding: 0px; border: 0px; font-family: &quot;Nanum Gothic&quot;, NanumGothic, 나눔고딕, NanumGothicWeb, &quot;맑은 고딕&quot;, &quot;Malgun Gothic&quot;, Dotum, applegothic, sans-serif, arial; vertical-align: baseline; outline: 0px; color: rgb(55, 55, 55); letter-spacing: -0.25px;">&nbsp; 2. 관광객이 폭주하는 연휴/성수기에는 일정표 외 가이드 안내에 따른 관광일정으로 진행됩니다.</div><div style="margin: 0px; padding: 0px; border: 0px; font-family: &quot;Nanum Gothic&quot;, NanumGothic, 나눔고딕, NanumGothicWeb, &quot;맑은 고딕&quot;, &quot;Malgun Gothic&quot;, Dotum, applegothic, sans-serif, arial; vertical-align: baseline; outline: 0px; color: rgb(55, 55, 55); letter-spacing: -0.25px;">&nbsp; 3. 본 상품은 여행계약 후 에도 여객선사정으로&nbsp;&nbsp;<font color="#ff3366" style="margin: 0px; padding: 0px;">월별 선박출항 / 입항시간이 변경</font>&nbsp;될 수 있으며,</div><div style="margin: 0px; padding: 0px; border: 0px; font-family: &quot;Nanum Gothic&quot;, NanumGothic, 나눔고딕, NanumGothicWeb, &quot;맑은 고딕&quot;, &quot;Malgun Gothic&quot;, Dotum, applegothic, sans-serif, arial; vertical-align: baseline; outline: 0px; color: rgb(55, 55, 55); letter-spacing: -0.25px;">&nbsp; &nbsp; &nbsp;최종 운항시간은 출발 5일전 확정나며, 변경 시 출발 전 전화로 알려드립니다.</div><div style="margin: 0px; padding: 0px; border: 0px; font-family: &quot;Nanum Gothic&quot;, NanumGothic, 나눔고딕, NanumGothicWeb, &quot;맑은 고딕&quot;, &quot;Malgun Gothic&quot;, Dotum, applegothic, sans-serif, arial; vertical-align: baseline; outline: 0px; color: rgb(55, 55, 55); letter-spacing: -0.25px;">&nbsp; 4.&nbsp;<font color="#ff3366" style="margin: 0px; padding: 0px;">안내전화는 출발 1일전</font>&nbsp;최종적으로 기상체크 후 나가오니, 안내전화가 늦더라도 양해하여 주시기 바랍니다.</div><div style="margin: 0px; padding: 0px; border: 0px; font-family: &quot;Nanum Gothic&quot;, NanumGothic, 나눔고딕, NanumGothicWeb, &quot;맑은 고딕&quot;, &quot;Malgun Gothic&quot;, Dotum, applegothic, sans-serif, arial; vertical-align: baseline; outline: 0px; color: rgb(55, 55, 55); letter-spacing: -0.25px;">&nbsp; 5. 대아리조트는 시내와는 거리가 먼곳에 위치하고 있으며, 정해진 셔틀운행시간 이외에는 개별적으로</div><div style="margin: 0px; padding: 0px; border: 0px; font-family: &quot;Nanum Gothic&quot;, NanumGothic, 나눔고딕, NanumGothicWeb, &quot;맑은 고딕&quot;, &quot;Malgun Gothic&quot;, Dotum, applegothic, sans-serif, arial; vertical-align: baseline; outline: 0px; color: rgb(55, 55, 55); letter-spacing: -0.25px;">&nbsp; &nbsp; &nbsp;택시를 이용하셔야 하며, 아침식사(조식)는 리조트식 으로 제공 됩니다.</div><div style="margin: 0px; padding: 0px; border: 0px; font-family: &quot;Nanum Gothic&quot;, NanumGothic, 나눔고딕, NanumGothicWeb, &quot;맑은 고딕&quot;, &quot;Malgun Gothic&quot;, Dotum, applegothic, sans-serif, arial; vertical-align: baseline; outline: 0px; color: rgb(55, 55, 55); letter-spacing: -0.25px;">&nbsp; 6. 울릉도 숙박 및 기타 편의시설은 도시보다 굉장히 열악하므로 고객님의 협조과</div><div style="margin: 0px; padding: 0px; border: 0px; font-family: &quot;Nanum Gothic&quot;, NanumGothic, 나눔고딕, NanumGothicWeb, &quot;맑은 고딕&quot;, &quot;Malgun Gothic&quot;, Dotum, applegothic, sans-serif, arial; vertical-align: baseline; outline: 0px; color: rgb(55, 55, 55); letter-spacing: -0.25px;">&nbsp; &nbsp; &nbsp;이해가 절실히 필요합니다.&nbsp;<font color="#ff3366" style="margin: 0px; padding: 0px;">민박/모텔/대아리조트</font>로 나누어지며,&nbsp;<font color="#ff3366" style="margin: 0px; padding: 0px;">개인 세면도구(칫솔,수건,샴푸 등)를 준비</font>하셔야 합니다.<b style="margin: 0px; padding: 0px; border: 0px; vertical-align: baseline; outline: 0px;"></b></div><div style="margin: 0px; padding: 0px; border: 0px; font-family: &quot;Nanum Gothic&quot;, NanumGothic, 나눔고딕, NanumGothicWeb, &quot;맑은 고딕&quot;, &quot;Malgun Gothic&quot;, Dotum, applegothic, sans-serif, arial; vertical-align: baseline; outline: 0px; color: rgb(55, 55, 55); letter-spacing: -0.25px;"><b style="margin: 0px; padding: 0px; border: 0px; vertical-align: baseline; outline: 0px;"></b>&nbsp;</div><div style="margin: 0px; padding: 0px; border: 0px; font-family: &quot;Nanum Gothic&quot;, NanumGothic, 나눔고딕, NanumGothicWeb, &quot;맑은 고딕&quot;, &quot;Malgun Gothic&quot;, Dotum, applegothic, sans-serif, arial; vertical-align: baseline; outline: 0px; color: rgb(55, 55, 55); letter-spacing: -0.25px;"><b style="margin: 0px; padding: 0px; border: 0px; vertical-align: baseline; outline: 0px;">&nbsp; &lt; 갑작스런 기상악화 발생 시 예약내용 변경안내 &gt;</b></div><div style="margin: 0px; padding: 0px; border: 0px; font-family: &quot;Nanum Gothic&quot;, NanumGothic, 나눔고딕, NanumGothicWeb, &quot;맑은 고딕&quot;, &quot;Malgun Gothic&quot;, Dotum, applegothic, sans-serif, arial; vertical-align: baseline; outline: 0px; color: rgb(55, 55, 55); letter-spacing: -0.25px;">&nbsp; 1. 출발 전 : 주의보 및 선박 결항 시 전화로 행사 취소를 알려드리며, 전액 환불됩니다.</div><div style="margin: 0px; padding: 0px; border: 0px; font-family: &quot;Nanum Gothic&quot;, NanumGothic, 나눔고딕, NanumGothicWeb, &quot;맑은 고딕&quot;, &quot;Malgun Gothic&quot;, Dotum, applegothic, sans-serif, arial; vertical-align: baseline; outline: 0px; color: rgb(55, 55, 55); letter-spacing: -0.25px;">&nbsp; 2. 출발 후 : 묵호/포항 도착 후 선박결항 / 입항이 불가능할 경우 사용하신<font color="#ff3366" style="margin: 0px; padding: 0px;">실비공제 후 환불</font>됩니다.</div><div style="margin: 0px; padding: 0px; border: 0px; font-family: &quot;Nanum Gothic&quot;, NanumGothic, 나눔고딕, NanumGothicWeb, &quot;맑은 고딕&quot;, &quot;Malgun Gothic&quot;, Dotum, applegothic, sans-serif, arial; vertical-align: baseline; outline: 0px; color: rgb(55, 55, 55); letter-spacing: -0.25px;">&nbsp; 3. 체류 후 : 울릉도 출항(→묵호항/포항) 순서는 울릉도 입도 순서에 따르며,</div><div style="margin: 0px; padding: 0px; border: 0px; font-family: &quot;Nanum Gothic&quot;, NanumGothic, 나눔고딕, NanumGothicWeb, &quot;맑은 고딕&quot;, &quot;Malgun Gothic&quot;, Dotum, applegothic, sans-serif, arial; vertical-align: baseline; outline: 0px; color: rgb(55, 55, 55); letter-spacing: -0.25px;">&nbsp; &nbsp; &nbsp;예약 코스가 아닌 다른 항구 / 셔틀로 변경 출항 시 발생되는&nbsp;<font color="#ff3366" style="margin: 0px; padding: 0px;">차액금은 개별적으로 부담</font>하셔야 합니다.<b style="margin: 0px; padding: 0px; border: 0px; vertical-align: baseline; outline: 0px;"><font color="#ff0000" style="margin: 0px; padding: 0px;">&nbsp;</font></b></div><div style="margin: 0px; padding: 0px; border: 0px; font-family: &quot;Nanum Gothic&quot;, NanumGothic, 나눔고딕, NanumGothicWeb, &quot;맑은 고딕&quot;, &quot;Malgun Gothic&quot;, Dotum, applegothic, sans-serif, arial; vertical-align: baseline; outline: 0px; color: rgb(55, 55, 55); letter-spacing: -0.25px;"><b style="margin: 0px; padding: 0px; border: 0px; vertical-align: baseline; outline: 0px;"><font color="#ff0000" style="margin: 0px; padding: 0px;"><br></font></b></div></td>' + 
						'</tr></tbody></table><p><br></p><table border="0" cellpadding="0" cellspacing="0" style="border:1px solid #cccccc; border-left:0; border-bottom:0;" class="__se_tbl"><tbody><tr><td style="border-width: 0px 0px 1px 1px; border-bottom-style: solid; border-left-style: solid; border-bottom-color: rgb(204, 204, 204); border-left-color: rgb(204, 204, 204); border-image: initial; border-top-style: initial; border-top-color: initial; border-right-style: initial; border-right-color: initial; width: 717px; height: 52px; background-color: rgb(235, 235, 235);" class=""><p>&nbsp;<b style="font-size: 12pt;">연 락 처</b>&nbsp;</p></td></tr><tr><td style="border-width: 0px 0px 1px 1px; border-bottom-style: solid; border-left-style: solid; border-bottom-color: rgb(204, 204, 204); border-left-color: rgb(204, 204, 204); border-image: initial; border-top-style: initial; border-top-color: initial; border-right-style: initial; border-right-color: initial; width: 717px; height: 144px; background-color: rgb(255, 255, 255);" class=""><p>&nbsp;</p><div style="margin: 0px; padding: 0px; border: 0px; font-family: &quot;Nanum Gothic&quot;, NanumGothic, 나눔고딕, NanumGothicWeb, &quot;맑은 고딕&quot;, &quot;Malgun Gothic&quot;, Dotum, applegothic, sans-serif, arial; vertical-align: baseline; outline: 0px; color: rgb(129, 21, 205); letter-spacing: -0.25px;"><b style="margin: 0px; padding: 0px; border: 0px; vertical-align: baseline; outline: 0px;"><font color="#8115cd" style="margin: 0px; padding: 0px;">&nbsp; 국내사업부 대표번호 : 02-3455-0003<br></font><font color="#000000" style="margin: 0px; padding: 0px;">&nbsp; 담당자 :</font></b><font color="#000000" style="margin: 0px; padding: 0px;">&nbsp;<b style="margin: 0px; padding: 0px; border: 0px; vertical-align: baseline; outline: 0px;">조정희</b></font><b style="margin: 0px; padding: 0px; border: 0px; vertical-align: baseline; outline: 0px;"><font color="#000000" style="margin: 0px; padding: 0px;">&nbsp;사원<br></font><font color="#107ad8" style="margin: 0px; padding: 0px;">&nbsp; 직통번호</font></b><font color="#107ad8" style="margin: 0px; padding: 0px;">&nbsp;:&nbsp;</font><font color="#107ad8" style="margin: 0px; padding: 0px;"><b style="margin: 0px; padding: 0px; border: 0px; vertical-align: baseline; outline: 0px;">02-3455-0067</b></font></div><div style="margin: 0px; padding: 0px; border: 0px; font-family: &quot;Nanum Gothic&quot;, NanumGothic, 나눔고딕, NanumGothicWeb, &quot;맑은 고딕&quot;, &quot;Malgun Gothic&quot;, Dotum, applegothic, sans-serif, arial; vertical-align: baseline; outline: 0px; color: rgb(129, 21, 205); letter-spacing: -0.25px;"><font color="#107ad8" style="margin: 0px; padding: 0px;"><b style="margin: 0px; padding: 0px; border: 0px; vertical-align: baseline; outline: 0px;">&nbsp; 팩스 : 02-3783-3865<br></b></font><font color="#000000" style="margin: 0px; padding: 0px;">&nbsp; 메일 :&nbsp;<a href="mailto:zhao_hee@jautour.com" style="margin: 0px; padding: 0px; border: 0px; color: rgb(68, 68, 68); text-decoration-line: none;">zhao_hee@jautour.com</a></font><br><font color="#000000" style="margin: 0px; padding: 0px;"><b style="margin: 0px; padding: 0px; border: 0px; vertical-align: baseline; outline: 0px;">&nbsp; 문자 : #37833865</b></font></div><p><br></p></td></tr></tbody></table><p><br></p><table border="0" cellpadding="0" cellspacing="0" style="border:1px solid #cccccc; border-left:0; border-bottom:0;" class="__se_tbl"><tbody><tr><td style="border-width: 0px 0px 1px 1px; border-bottom-style: solid; border-left-style: solid; border-bottom-color: rgb(204, 204, 204); border-left-color: rgb(204, 204, 204); border-image: initial; border-top-style: initial; border-top-color: initial; border-right-style: initial; border-right-color: initial; width: 717px; height: 49px; background-color: rgb(235, 235, 235);" class=""><p><b><span style="font-size: 12pt;">&nbsp; 결제 안내</span></b></p></td></tr><tr><td style="border-width: 0px 0px 1px 1px; border-bottom-style: solid; border-left-style: solid; border-bottom-color: rgb(204, 204, 204); border-left-color: rgb(204, 204, 204); border-image: initial; border-top-style: initial; border-top-color: initial; border-right-style: initial; border-right-color: initial; width: 717px; height: 126px; background-color: rgb(255, 255, 255);" class=""><p style="margin-left: 0px;"><b style="color: rgb(55, 55, 55); font-family: &quot;Nanum Gothic&quot;, NanumGothic, 나눔고딕, NanumGothicWeb, &quot;맑은 고딕&quot;, &quot;Malgun Gothic&quot;, Dotum, applegothic, sans-serif, arial; letter-spacing: -0.25px; margin: 0px; padding: 0px; border: 0px; vertical-align: baseline; outline: 0px;"><font color="#107ad8" style="margin: 0px; padding: 0px;">&nbsp; ◇ 입금계좌 안내 신한은행 : 100-029-154721 예금주 (주)자유투어</font></b></p><div style="margin: 0px; padding: 0px; border: 0px; font-family: &quot;Nanum Gothic&quot;, NanumGothic, 나눔고딕, NanumGothicWeb, &quot;맑은 고딕&quot;, &quot;Malgun Gothic&quot;, Dotum, applegothic, sans-serif, arial; vertical-align: baseline; outline: 0px; color: rgb(55, 55, 55); letter-spacing: -0.25px;"><font color="#000000" style="margin: 0px; padding: 0px;">&nbsp; ◇ 예약후 계약금 100,000원을 결제하셔야 예약이 확정됩니다. 잔금은 출발 일주일 전까지 완납하셔야 합니다.</font></div><div style="margin: 0px; padding: 0px; border: 0px; font-family: &quot;Nanum Gothic&quot;, NanumGothic, 나눔고딕, NanumGothicWeb, &quot;맑은 고딕&quot;, &quot;Malgun Gothic&quot;, Dotum, applegothic, sans-serif, arial; vertical-align: baseline; outline: 0px; color: rgb(55, 55, 55); letter-spacing: -0.25px;"><b style="margin: 0px; padding: 0px; border: 0px; vertical-align: baseline; outline: 0px;"><font color="#e1568f" style="margin: 0px; padding: 0px;"></font></b>&nbsp;</div><div style="margin: 0px; padding: 0px; border: 0px; font-family: &quot;Nanum Gothic&quot;, NanumGothic, 나눔고딕, NanumGothicWeb, &quot;맑은 고딕&quot;, &quot;Malgun Gothic&quot;, Dotum, applegothic, sans-serif, arial; vertical-align: baseline; outline: 0px; color: rgb(55, 55, 55); letter-spacing: -0.25px;"><font color="#e42121" style="margin: 0px; padding: 0px;">&nbsp; ※취소수수료는 출발일 전으로 계산되기 때문에&nbsp;&nbsp;&nbsp;</font></div><div style="margin: 0px; padding: 0px; border: 0px; font-family: &quot;Nanum Gothic&quot;, NanumGothic, 나눔고딕, NanumGothicWeb, &quot;맑은 고딕&quot;, &quot;Malgun Gothic&quot;, Dotum, applegothic, sans-serif, arial; vertical-align: baseline; outline: 0px; color: rgb(55, 55, 55); letter-spacing: -0.25px;"><font color="#e42121" style="margin: 0px; padding: 0px;">&nbsp; 취소수수료가 적용되는 기간안에 오전 예약결제후 예약한 날 오후에 바로취소하셔도 취소수수료가 적용됩니다.<br><br></font></div></td></tr></tbody></table><p><br></p><table border="0" cellpadding="0" cellspacing="0" style="border:1px solid #cccccc; border-left:0; border-bottom:0;" class="__se_tbl"><tbody><tr><td style="border-width: 0px 0px 1px 1px; border-bottom-style: solid; border-left-style: solid; border-bottom-color: rgb(204, 204, 204); border-left-color: rgb(204, 204, 204); border-image: initial; border-top-style: initial; border-top-color: initial; border-right-style: initial; border-right-color: initial; width: 717px; height: 51px; background-color: rgb(235, 235, 235);" class=""><p><b style="font-size: 12pt;">&nbsp;여행자 보험정보</b></p></td></tr><tr><td style="border-width: 0px 0px 1px 1px; border-bottom-style: solid; border-left-style: solid; border-bottom-color: rgb(204, 204, 204); border-left-color: rgb(204, 204, 204); border-image: initial; border-top-style: initial; border-top-color: initial; border-right-style: initial; border-right-color: initial; width: 717px; height: 90px; background-color: rgb(255, 255, 255);" class=""><p>&nbsp;</p><div style="margin: 0px; padding: 0px; border: 0px; font-family: &quot;Nanum Gothic&quot;, NanumGothic, 나눔고딕, NanumGothicWeb, &quot;맑은 고딕&quot;, &quot;Malgun Gothic&quot;, Dotum, applegothic, sans-serif, arial; vertical-align: baseline; outline: 0px; color: rgb(55, 55, 55); letter-spacing: -0.25px;"><b style="margin: 0px; padding: 0px; border: 0px; vertical-align: baseline; outline: 0px;"><font color="#e42121" style="margin: 0px; padding: 0px;">&nbsp; ※2014년 8월 1일부터 출발하는 자사의 모든 국내여행상품은 개인정보 보호법</font></b></div><div style="margin: 0px; padding: 0px; border: 0px; font-family: &quot;Nanum Gothic&quot;, NanumGothic, 나눔고딕, NanumGothicWeb, &quot;맑은 고딕&quot;, &quot;Malgun Gothic&quot;, Dotum, applegothic, sans-serif, arial; vertical-align: baseline; outline: 0px; color: rgb(55, 55, 55); letter-spacing: -0.25px;"><b style="margin: 0px; padding: 0px; border: 0px; vertical-align: baseline; outline: 0px;"><font color="#e42121" style="margin: 0px; padding: 0px;">&nbsp; &nbsp; &nbsp;제 24조 2 (주민등록번호 처리의 제한) 에 의거하여 주민번호 수집이 불가함에 따라</font></b></div><div style="margin: 0px; padding: 0px; border: 0px; font-family: &quot;Nanum Gothic&quot;, NanumGothic, 나눔고딕, NanumGothicWeb, &quot;맑은 고딕&quot;, &quot;Malgun Gothic&quot;, Dotum, applegothic, sans-serif, arial; vertical-align: baseline; outline: 0px; color: rgb(55, 55, 55); letter-spacing: -0.25px;"><b style="margin: 0px; padding: 0px; border: 0px; vertical-align: baseline; outline: 0px;"><font color="#e42121" style="margin: 0px; padding: 0px;">&nbsp; &nbsp; &nbsp;여행자보험가입이 불포함으로 변경되었습니다</font></b></div><p><br></p></td></tr></tbody></table><p><br></p><p><br></p><table border="0" cellpadding="0" cellspacing="0" style="border:1px solid #cccccc; border-left:0; border-bottom:0;" class="__se_tbl"><tbody><tr><td style="border-width: 0px 0px 1px 1px; border-bottom-style: solid; border-left-style: solid; border-bottom-color: rgb(204, 204, 204); border-left-color: rgb(204, 204, 204); border-image: initial; border-top-style: initial; border-top-color: initial; border-right-style: initial; border-right-color: initial; width: 717px; height: 57px; background-color: rgb(235, 235, 235);" class=""><p>&nbsp;&nbsp;<b><span style="font-size: 12pt;">특별 약관</span></b></p></td></tr><tr><td style="border-width: 0px 0px 1px 1px; border-bottom-style: solid; border-left-style: solid; border-bottom-color: rgb(204, 204, 204); border-left-color: rgb(204, 204, 204); border-image: initial; border-top-style: initial; border-top-color: initial; border-right-style: initial; border-right-color: initial; background-color: rgb(255, 255, 255); width: 717px; height: 522px;"><p>&nbsp;</p><div style="margin: 0px; padding: 0px; border: 0px; font-family: &quot;Nanum Gothic&quot;, NanumGothic, 나눔고딕, NanumGothicWeb, &quot;맑은 고딕&quot;, &quot;Malgun Gothic&quot;, Dotum, applegothic, sans-serif, arial; vertical-align: baseline; outline: 0px; color: rgb(55, 55, 55); letter-spacing: -0.25px;"><font color="#e42121" style="margin: 0px; padding: 0px;"><b style="margin: 0px; padding: 0px; border: 0px; vertical-align: baseline; outline: 0px;">&nbsp; ★예약취소료 규정★</b></font></div><div style="margin: 0px; padding: 0px; border: 0px; font-family: &quot;Nanum Gothic&quot;, NanumGothic, 나눔고딕, NanumGothicWeb, &quot;맑은 고딕&quot;, &quot;Malgun Gothic&quot;, Dotum, applegothic, sans-serif, arial; vertical-align: baseline; outline: 0px; color: rgb(55, 55, 55); letter-spacing: -0.25px;">&nbsp;</div><div style="margin: 0px; padding: 0px; border: 0px; font-family: &quot;Nanum Gothic&quot;, NanumGothic, 나눔고딕, NanumGothicWeb, &quot;맑은 고딕&quot;, &quot;Malgun Gothic&quot;, Dotum, applegothic, sans-serif, arial; vertical-align: baseline; outline: 0px; color: rgb(55, 55, 55); letter-spacing: -0.25px;">&nbsp; [하단 취소료규정은 당사 국내여행 표준약관보다 우선 적용되는 특약규정입니다.]</div><div style="margin: 0px; padding: 0px; border: 0px; font-family: &quot;Nanum Gothic&quot;, NanumGothic, 나눔고딕, NanumGothicWeb, &quot;맑은 고딕&quot;, &quot;Malgun Gothic&quot;, Dotum, applegothic, sans-serif, arial; vertical-align: baseline; outline: 0px; color: rgb(55, 55, 55); letter-spacing: -0.25px;">&nbsp; 공정거래위원회 소비자분쟁 해결기준과 별도로 진행되는 규정입니다. 예약 취소 시&nbsp;<u style="margin: 0px; padding: 0px; border: 0px;"><font color="#e42121" style="margin: 0px; padding: 0px;">국내여행 약관</font></u></div><div style="margin: 0px; padding: 0px; border: 0px; font-family: &quot;Nanum Gothic&quot;, NanumGothic, 나눔고딕, NanumGothicWeb, &quot;맑은 고딕&quot;, &quot;Malgun Gothic&quot;, Dotum, applegothic, sans-serif, arial; vertical-align: baseline; outline: 0px; color: rgb(55, 55, 55); letter-spacing: -0.25px;"><u style="margin: 0px; padding: 0px; border: 0px;"><font color="#e42121" style="margin: 0px; padding: 0px;">&nbsp; 제5조(특약)에&nbsp;</font></u><u style="margin: 0px; padding: 0px; border: 0px;"><font color="#e42121" style="margin: 0px; padding: 0px;">의한 자체 특별약관이 적용됨을&nbsp;</font></u>양지하여 주시기 바랍니다.</div><div style="margin: 0px; padding: 0px; border: 0px; font-family: &quot;Nanum Gothic&quot;, NanumGothic, 나눔고딕, NanumGothicWeb, &quot;맑은 고딕&quot;, &quot;Malgun Gothic&quot;, Dotum, applegothic, sans-serif, arial; vertical-align: baseline; outline: 0px; color: rgb(55, 55, 55); letter-spacing: -0.25px;">&nbsp;</div><div style="margin: 0px; padding: 0px; border: 0px; font-family: &quot;Nanum Gothic&quot;, NanumGothic, 나눔고딕, NanumGothicWeb, &quot;맑은 고딕&quot;, &quot;Malgun Gothic&quot;, Dotum, applegothic, sans-serif, arial; vertical-align: baseline; outline: 0px; color: rgb(55, 55, 55); letter-spacing: -0.25px;">&nbsp; &nbsp;▶ 인터넷상에서 예약/결제 취소 및 변경은 불가능하오니, 예약/결제 취소나 여행자정보 변경을 원하시면</div><div style="margin: 0px; padding: 0px; border: 0px; font-family: &quot;Nanum Gothic&quot;, NanumGothic, 나눔고딕, NanumGothicWeb, &quot;맑은 고딕&quot;, &quot;Malgun Gothic&quot;, Dotum, applegothic, sans-serif, arial; vertical-align: baseline; outline: 0px; color: rgb(55, 55, 55); letter-spacing: -0.25px;">&nbsp; &nbsp; &nbsp; &nbsp;반드시 예약담당자에게 연락하여 주시기바랍니다.</div><div style="margin: 0px; padding: 0px; border: 0px; font-family: &quot;Nanum Gothic&quot;, NanumGothic, 나눔고딕, NanumGothicWeb, &quot;맑은 고딕&quot;, &quot;Malgun Gothic&quot;, Dotum, applegothic, sans-serif, arial; vertical-align: baseline; outline: 0px; color: rgb(55, 55, 55); letter-spacing: -0.25px;">&nbsp;</div><div style="margin: 0px; padding: 0px; border: 0px; font-family: &quot;Nanum Gothic&quot;, NanumGothic, 나눔고딕, NanumGothicWeb, &quot;맑은 고딕&quot;, &quot;Malgun Gothic&quot;, Dotum, applegothic, sans-serif, arial; vertical-align: baseline; outline: 0px; color: rgb(55, 55, 55); letter-spacing: -0.25px;">&nbsp; ※ 여행자의 취소요청시 하기의 경우에 해당시 여행약관에 의거 취소료가 부과됩니다.</div><div style="margin: 0px; padding: 0px; border: 0px; font-family: &quot;Nanum Gothic&quot;, NanumGothic, 나눔고딕, NanumGothicWeb, &quot;맑은 고딕&quot;, &quot;Malgun Gothic&quot;, Dotum, applegothic, sans-serif, arial; vertical-align: baseline; outline: 0px; color: rgb(55, 55, 55); letter-spacing: -0.25px;">&nbsp;</div><div style="margin: 0px; padding: 0px; border: 0px; font-family: &quot;Nanum Gothic&quot;, NanumGothic, 나눔고딕, NanumGothicWeb, &quot;맑은 고딕&quot;, &quot;Malgun Gothic&quot;, Dotum, applegothic, sans-serif, arial; vertical-align: baseline; outline: 0px; color: rgb(55, 55, 55); letter-spacing: -0.25px;"><span style="margin: 0px; padding: 0px; vertical-align: baseline; outline: 0px; display: block; color: rgb(255, 0, 153);"><b style="margin: 0px; padding: 0px; border: 0px; vertical-align: baseline; outline: 0px;">&nbsp; ■ 예약 변경 및 취소시 수수료에 대한 규정 ■&nbsp;<br><br></b></span><b style="margin: 0px; padding: 0px; border: 0px; vertical-align: baseline; outline: 0px;"><span style="margin: 0px; padding: 0px; vertical-align: baseline; outline: 0px; display: block; color: rgb(255, 102, 0);">&nbsp; 1.비수기 일반규정</span></b><span style="margin: 0px; padding: 0px; vertical-align: baseline; outline: 0px; display: block; color: rgb(255, 102, 0);"><br></span>&nbsp; - 출발 7일전 취소시 총 여행경비 10%공제 후 환불<br>&nbsp; - 출발 5일전 취소시 총 여행경비 20%공제 후 환불<br>&nbsp; - 출발 3일전 취소시 총 여행경비 30% 공제후 환불<br>&nbsp; - 출발 1일전 취소시 총 여행경비 50%공제 후 환불<br>&nbsp; - 당일 취소시 여행경비 환불 불가<br><br><b style="margin: 0px; padding: 0px; border: 0px; vertical-align: baseline; outline: 0px;"><span style="margin: 0px; padding: 0px; vertical-align: baseline; outline: 0px; display: block; color: rgb(255, 102, 0);">&nbsp; 2.연휴 및 성수기 특별규정<br></span></b>&nbsp; - 출발 15일전 취소시 총 여행경비 30%공제 후 환불<br>&nbsp; - 출발 10일전 취소시 총 여행경비 40%공제 후 환불<br>&nbsp; - 출발 07일전 취소시 총 여행경비 50%공제 후 환불<br>&nbsp; - 출발 04일전 취소시 총 여행경비 70%공제 후 환불<br>&nbsp; - 출발 03일전 ~ 당일 취소시 여행경비 환불 불가&nbsp;</div><p><br></p></td></tr></tbody></table><p><br></p><br>';
						oEditors.getById["ir1"].exec("PASTE_HTML", [sHTML]);
					},
					fCreator: "createSEditor2"
				});

				
				function pasteHTML(filepath) {
					// textarea에 이미지를 넣어줍니다
					var sHTML = '<img src="<%=request.getContextPath()%>/se1/upload/'+filepath+'">';
				    oEditors.getById["ir1"].exec("PASTE_HTML", [sHTML]);
				}


				function setDefaultFont() {
					var sDefaultFont = '궁서';
					var nFontSize = 24;
					oEditors.getById["ir1"].setDefaultFont(sDefaultFont, nFontSize);
				}

				$("#save").click(function(){
				    oEditors.getById["ir1"].exec("UPDATE_CONTENTS_FIELD", []);
				    $("#fr").submit();
				}); 
				$('#select1').show('slow', function() {
				});
				$('#select2').show('slow', function() {
				});
				$('#select3').show('slow', function() {
				});
				$('#select4').show('slow', function() {
				});
				$('#select5').show('slow', function() {
				});
				$('#select6').show('slow', function() {
				});
			}else{
				$('#aa').hide();
				$('#aa2').hide();
				$('#aa3').hide();
				$('#aa4').hide();
				$('#select1').hide();
				$('#select2').hide();
				$('#select3').hide();
				$('#select4').hide();
				$('#select5').hide();
				$('#select6').hide();
				document.fr.subject.value= ""; 
				document.fr.intro.value= ""; 
				document.fr.content.value= ""; 
				document.fr.file1.value= ""; 
				document.fr.file2.value= ""; 
				document.fr.file3.value= ""; 
				document.fr.file4.value= ""; 
				document.fr.file5.value= ""; 
			}
		
		});
	}
	
</script>

</head>
<body>
	<%
		request.setCharacterEncoding("utf-8");
		List productList = (List) request.getAttribute("productList");
		List productList2 = (List) request.getAttribute("productList2");
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
				<td><span id="select4"><input type="type" name="name2">&nbsp;&nbsp;&nbsp;</span><select id = "name" name="name" onchange="people_Calc()">
						<option value="">선택하세요</option>
						<%
							for (int i = 0; i < productList.size(); i++) {

								pb = (ProductBean) productList.get(i);
						%>
						<option value="<%=pb.getName()%>"><%=pb.getName()%></option>
						<%
							}
						%>
						<option value="select">직접넣으세요</option>
				</select></td>
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