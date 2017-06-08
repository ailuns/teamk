<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    	<%@ page import="net.member.db.*"%>
<%@ page import="java.util.List"%>
<%@ page import="java.text.DecimalFormat" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>상품편집</title>
<link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
<script src="./js/jquery-3.2.0.js"></script>
<script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
<style>
#datecontent 
{
	width: 390px;
	height: 350px;
	border: 3px solid gray;
	overflow: auto;
	text-align: center;
}

#datecontent table
{
	border : 1px solid black;
	border-collapse: collapse;
}

#datecontent tr:FIRST-CHILD
{
	background-color: gray;
	height : 30px;
}

#datecontent tr:HOVER
{
	cursor: pointer;
	background-color: #D5D5D5;
}

#datecontent .date_td_size
{
	height : 50px;
	border : 1px solid black;
}

#datecontent #date_date
{
	width : 150px;
}
#datecontent #date_cost
{
	width : 150px;
}

#datecontent #date_stock
{
	width : 70px;
}

#sub_notice
{
	font-size: 0.8em;
	color : gray;
}

</style>
</head>
<script type="text/javascript">

	jQuery(document).ready(function($){
		// 달력 관련 소스
		$("#add_date").datepicker({
			dateFormat: 'yy-mm-dd',    // 날짜 포맷 형식
			minDate : 0,			   // 최소 날짜 설정      0이면 오늘부터 선택 가능
			numberOfMonths: 1,		   // 보여줄 달의 갯수
	        dayNamesMin: ['월', '화', '수', '목', '금', '토', '일'],  // 일(Day) 표기 형식
	        monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],   // 월(Month) 표기 형식
	        //showOn: "both",		// 버튼을 표시      both : input과 buttom 둘다 클릭 시 달력 표시           bottom  :  buttom 클릭 했을 때만 달력 표시
	        //buttonImage: "./img/calendar.png",   // 버튼에 사용될 이미지
	        //buttonImageOnly: true,					// 이미지만 표시한다    버튼모양 x
		});
		
		$("#Date_modify").hide();
	});

	// 날짜 추가
	function dateAdd()
	{
	
		$.ajax({   // 날짜를 클릭할때 마다 찜목록과 비교
			type:"post",
			url:"./ProductAddChk.bo",
			data:{
// 				제목, 날짜
				name:$("#name").val(),
				color:$("#add_color").val(),
				size:$("#add_size").val()
			},
			success:function(date)
			{
				if (date == 1)
				{
					alert("이미 추가된 상품정보입니다. 다시입력해주세요");
					return false;
				}else{
					$.ajax({
						type:"post",
						url:"./ProductAddAction.bo",   // java로 보냄
						data:{
							name:$("#name").val(),
							subject:$("#subject").val(),
							intro:$("#intro").val(),
							car_num:$("#car_num").val(),
							type:$("#type").val(),
							cost:$("#cost").val(),
							area:$("#area").val(),
							color:$("#add_color").val(),
							size:$("#add_size").val(),
							stock:$("#add_stock").val(),
							date:$("#add_date").val(),
							img:$("#file1").val(),
							img2:$("#file2").val(),
							img3:$("#file3").val(),
							img4:$("#file4").val(),
							img5:$("#file5").val()
							},
						success:function()
						{
							window.location.reload(true);  // 페이지 새로고침
						}
					});
				}
				
				
			}
		});
		
		
		
		
	}
	
	
	function date_chk()
	{
		$("#subject").val();
		$("#add_date").val();
		
		
		$.ajax({   // 날짜를 클릭할때 마다 찜목록과 비교
			type:"post",
			url:"./PackDateAddChk.po",
			data:{
// 				제목, 날짜
				subject:$("#subject").val(),
				date:$("#add_date").val()
			},
			success:function(date)
			{
				if (date == 1)
				{
					alert("이미 추가된 상품정보입니다");
					return false;
				}
			}
		});
	}
	
	
	// 날짜 수정 버튼 클릭 이벤트
	function winOpen(num) {
		win = window.open("./ProductModify.bo?num=" + num, "Product_modify.jsp",
				"width=500, height=300, left=800, top=100");
	}
	
	
	
	// 날짜 선택시 이벤트
	function select_date(select_num)
	{
		var packnum = $("#select_rbtn" + select_num).val();  // 해당 라디오버튼의 글번호 값을 불러온다
		$(".select_color").css("background-color","");		// tr 부분 모든 배경색을 없앤다
		$("#select_rbtn" + select_num).prop("checked", "true"); // 클릭된 라디오 버튼을 체크로 바꾼다
		$("#select_date" + select_num).css("background-color", "#D5D5D5");  // 클릭된 tr 부분의 배경색을 #D5D5D5로 바꾼다		
		
		var num = $("#num" + select_num).val();
		winOpen(num);
// 		var num = $("#num"+select_num).val();
// 		var subject = $("#subject").val();
// 		location.href="./PackDateAdd.po?num=" + num + "&subject=" + subject;
		
		
// 		$("#Date_modify").show();
// 		$("#Date_add").hide();
		
// 		$.ajax({   // 날짜를 클릭할때 마다 찜목록과 비교
// 			type:"post",
// 			url:"./PackDateAdd.po",
// 			async: false,
// 			data:{
// 				num:$("#num"+select_num).val(),
// 				subject:$("#subject").val()
// 			},
// 			success:function(data)
// 			{
// // 				alert(data);
// 				window.location.reload(true); 
// 			}
// 		});
	}

	// 창닫기
	function cls()
	{
		opener.parent.location.reload();
		window.close();
	}

	
</script>
<body>
<center>
<br><br>
<%
	request.setCharacterEncoding("UTF-8");

	String name = (String)request.getAttribute("name");
	List productaddList;
	productaddList = (List)request.getAttribute("productaddList");
	
	
	
%>
 

<form name="fr" method="POST">
<%-- <input type="text" name="id" value="<%=id %>"> --%>
<!-- <input type="button" value="중복확인" onclick="idchk(document.fr.id.value)"><br><br> -->
<p><b>상품명 : <%=name %></b></p>
<p id="sub_notice">※해당 상품정보 클릭 시 수정/삭제 페이지로 이동합니다</p>
<div id="datecontent">
	<table>
		<tr>
			<td id="date_date">Color</td>
			<td id="date_cost">Size</td>
			<td id="date_stock">갯수</td>
		</tr>
		
		<%
			ProductBean pb;
			for (int i = 0; i < productaddList.size(); i++)
			{
				pb =(ProductBean)productaddList.get(i);
				DecimalFormat Commas = new DecimalFormat("#,###");
				String cost = (String)Commas.format(pb.getCost());

				%>	
			
			<tr id="select_date<%=i %>" class="select_color" onclick="select_date(<%=i %>)">
				<input id="num<%=i %>" style="display:none;" value="<%=pb.getNum() %>"></input>
				<input id="name" style="display:none;" value="<%=pb.getName() %>"></input>
				<input id="subject" style="display:none;" value="<%=pb.getSubject() %>"></input>
				<input id="intro" style="display:none;" value="<%=pb.getIntro() %>"></input>
				<input id="car_num" style="display:none;" value="<%=pb.getCar_num()%>"></input>
				<input id="type" style="display:none;" value="<%=pb.getType() %>"></input>
				<input id="cost" style="display:none;" value="<%=pb.getCost() %>"></input>
				<input id="area" style="display:none;" value="<%=pb.getArea() %>"></input>
				<input id="file1" style="display:none;" value="<%=pb.getImg() %>"></input>
				<input id="file2" style="display:none;" value="<%=pb.getImg2() %>"></input>
				<input id="file3" style="display:none;" value="<%=pb.getImg3() %>"></input>
				<input id="file4" style="display:none;" value="<%=pb.getImg4() %>"></input>
				<input id="file5" style="display:none;" value="<%=pb.getImg5() %>"></input>
				<td class="date_td_size"><%=pb.getColor() %></td>
				<td class="date_td_size"><%=pb.getSize() %></td>
				<td class="date_td_size"><%=pb.getStock() %></td>
			</tr>
		<%
			}
		%>
	</table>
</div>

</form>
 <div id="Date_add">
		<h4>추가 페이지</h4>
		<table>
			<tr>
				<td>
					Color
				</td>
				<td>
					<input type="text" id="add_color" ><br>
				</td>
			</tr>
			
			<tr>
				<td>
					Size
				</td>
				<td>
					<input type="text" id="add_size" >
				</td>
			</tr>
			
			<tr>
				<td>
					수량
				</td>
				<td>
					<input type="text" id="add_stock">
				</td>
			</tr>
			<tr>
				<td>
					<input type="button" value="추가" onclick="dateAdd()">
				</td>
				<td>
					<input type="button" value="닫기" onclick="cls()">
				</td>
			</tr>
		</table>
	</div>
</center>

</body>
</html>