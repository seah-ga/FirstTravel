<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="true"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../include/nds/header.jsp" %>	
	
	
<html lang="en">
<head>
<!-- Required Meta Tags -->
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">

<!-- Page Title -->
<title>Comport</title>

<!-- Favicon -->
<link rel="shortcut icon" href="assets/images/logo/favicon.png"
	type="image/x-icon">

<!-- CSS Files -->
<link rel="stylesheet"
	href="/resources/psj/assets/css/animate-3.7.0.css">
<link rel="stylesheet"
	href="/resources/psj/assets/css/font-awesome-4.7.0.min.css">
<link rel="stylesheet"
	href="/resources/psj/assets/fonts/flat-icon/flaticon.css">
<link rel="stylesheet"
	href="/resources/psj/assets/css/bootstrap-4.1.3.min.css">
<link rel="stylesheet"
	href="/resources/psj/assets/css/owl-carousel.min.css">
<link rel="stylesheet" href="/resources/psj/assets/css/nice-select.css">
<link rel="stylesheet" href="/resources/psj/assets/css/style.css">
<!--  제이쿼리 , 부트스트랩 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">										
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>										
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>										

<script type="text/javascript">
		<!-- ctrl f   '달력', '비용', '호텔', '항공' -->
	//달력관력
		var today = null;
		var year = null;
		var month = null;
		var firstDay = null;
		var lastDay = null;
		var $tdDay = null;
		var $tdSche = null;
	//비용관련
		var top_adult_charge = 0; // 인원당 비용
		var top_child_charge = 0; // 
		var top_adult_num = 1;   // 인원
		var top_child_num = 0;
		var top_sum_charge = 0; // 비용합계 
	
		
	function chargeInit() {
		 top_adult_charge = 0; // 인원당 비용
		 top_child_charge = 0; // 
		 top_adult_num = 1;   // 인원
		 top_child_num = 0;
		 top_sum_charge = 0; // 비용합계 
	}
	$(document).ready(function() {
		
		
		// 오늘 날짜 받기
			function getDate() {
				var d = new Date();
				var year = d.getFullYear();
				var month = d.getMonth() + 1;
				if(month < 10){
					month = "0" + month;
				}
				var day = d.getDate();
				if(day < 10){
					day = "0" + day;
				}
				var date = year.toString() + month.toString() + day.toString();
				return date;	
			}
			var date = getDate();
			$("#txt_date").val(date);
			////////////////////////////////////////////////////
		
// 			비용 변경시 이용할 함수들 
		
		function ifCheckEl(checkBox, childCharge, adultCharge) {
			if(checkBox.is(":checked")){ // 체크를 할때
				top_adult_charge += adultCharge; 
				top_child_charge += childCharge; 
		
			
			}else if(!checkBox.is(":checked")){ // 체크를 풀 때
				top_adult_charge -= adultCharge; 
				top_child_charge -= childCharge; 
				
			}	
			ifValChange();
		} 
		// 인당 요금이 변경될때마다 호출할 함수
		function ifValChange() {
		
			$("#adult_char").text(top_adult_charge);  
			$("#child_char").text(top_child_charge); // 가격출력변경  char --> 하단 charge --> 상단
			$("#adult_charge").text(top_adult_charge);
			$("#child_charge").text(top_child_charge); 
			
		
			top_sum_charge = (top_adult_num * top_adult_charge) + (top_child_num * top_child_charge);
			console.log("비용합계:" + top_sum_charge);
			$("#result_char").text(top_sum_charge);
		}
		
		// 인원이 변경될때 마다 호출할 함수
		function ifNumChange() {
			top_adult_num = parseInt($("#adNum").val());
			top_child_num = parseInt($("#cdNum").val());
			$("#child_num").text(top_child_num);
			$("#adult_num").text(top_adult_num);
			
		
			top_sum_charge = (top_adult_num * top_adult_charge) + (top_child_num * top_child_charge);
		
			$("#result_char").text(top_sum_charge);
		} 	
		//달력관련함수
		function drawCalendar() {
			var setTableHTML = "";
			setTableHTML += '<table class="calendar">';
			setTableHTML += '<tr><th>SUN</th><th>MON</th><th>TUE</th><th>WED</th><th>THU</th><th>FRI</th><th>SAT</th></tr>';
			for (var i = 0; i < 6; i++) {
				setTableHTML += '<tr height="80">';
				for (var j = 0; j < 7; j++) {
					setTableHTML += '<td style="text-overflow:ellipsis;overflow:hidden;white-space:nowrap"'
									+ 'onMouseOver="' +  "this.style.backgroundColor='#9BB9DE'"  +'"'
									+	'onMouseOut="' +  "this.style.backgroundColor=''" + '"' + 'class="tDay">';
					setTableHTML += '    <div class="cal-day"></div>';
					setTableHTML += '    <div class="cal-schedule"></div>';
					setTableHTML += '</td>';
				}
				setTableHTML += '</tr>';
			}
			setTableHTML += '</table>';
			console.log(setTableHTML);
			$("#cal_tab").html(setTableHTML);
		}

		//날짜 초기화
		function initDate() {
			$tdDay = $("td div.cal-day")
			$tdSche = $("td div.cal-schedule")
			dayCount = 0;
			today = new Date();
			year = today.getFullYear();
			month = today.getMonth() + 1;
			if(month < 10){
				month = "0" + month;
			}
			firstDay = new Date(year, month - 1, 1);
			lastDay = new Date(year, month, 0);
		}

		//calendar 날짜표시
		function drawDays() {
			$("#cal_top_year").text(year);
			$("#cal_top_month").text(month);
			for (var i = firstDay.getDay(); i < firstDay.getDay()
					+ lastDay.getDate(); i++) {
				$tdDay.eq(i).text(++dayCount);
			}
			for (var i = 0; i < 42; i += 7) {
				$tdDay.eq(i).css("color", "red");
			}
			for (var i = 6; i < 42; i += 7) {
				$tdDay.eq(i).css("color", "blue");
			}
		}

		//calendar 월 이동
		function movePrevMonth() {
			month--;
			if (month <= 0) {
				month = 12;
				year--;
			}
			if (month < 10) {
				month = String("0" + month);
			}
			getNewInfo();
		}

		function moveNextMonth() {
			month++;
			if (month > 12) {
				month = 1;
				year++;
			}
			if (month < 10) {
				month = String("0" + month);
			}
			getNewInfo();
		}

		function getNewInfo() {
			for (var i = 0; i < 42; i++) {
				$tdDay.eq(i).text("");
			}
			dayCount = 0;
			firstDay = new Date(year, month - 1, 1);
			lastDay = new Date(year, month, 0);
			drawDays();
		}
		
		$("#btn_searchHotel").click(function() {
			/// 제공되는 무료 오픈 api 정보가 부족해 일단 울산 숙박업만 출력하기로.
			
			if($("#sel_hotel_loc option:selected").text() == '울산'){
				var url = "/rest/hotel-list";
				$.ajax({
					"type" : "get",
					"url" : url,
					"headers" :  {
						"Content-Type" : "application/json",
						"X-HTTP-Method-Override" : "get"
					},
					"success" : function(rData) {
						var data = rData.rfcOpenApi.body.data.list
						var strLi = ""; 
						
						$(data).each(function(index, hotel) {
							var priceChild = (Math.round((((Math.random() * 20000) + 20000)/ 1000)) * 1000);
							var priceAdult = (Math.round((((Math.random() * 60000) + 50000)/ 1000)) * 1000);
							strLi += "<tr>"
									+  "<td>" + index + "</td>"
										+  "<td >" + hotel.ulsanhotelTitle  +"</td>"  // 호텔이름
										+  "<td>" + hotel.ulsanhotelNewAddr + "</td>" //호텔주소
										+  "<td>" + priceChild  + "</td>" // 가격 소인( 가격정보를 제공하지않아 임의로 지정).
										+  "<td>" +  priceAdult + "</td>" // 가격 대인
										+  "<td>" + "<button type='button' class='btn btn-info' data-toggle='modal'"  
										+			"data-target='#modal_hotelInfo'" 
										+				"data-hotelName='" + hotel.ulsanhotelTitle + "'" 
										+				" data-hotelAddr='" + hotel.ulsanhotelNewAddr  + "'" 
										+   			" data-hotelTel='" + hotel.ulsanhotelTel  + "'" 
										+				" data-hotelId='" + hotel.ulsanhotelEntId + "'" 
										+ 				">상세정보</button>"  
										+  "</td>" // 호텔상세정보 보기 버튼
										+  "<td>" + "<input type='checkbox' class='chk_hotel'" 
												  +		"data-childChar='"+ priceChild  +"'" 
												  +     "data-adultChar='" + priceAdult +"'>" + "</td>"
									
									+  "</tr>";
// 									console.log(data);
							
						});//--each
// 						console.log(strLi);
						$("#hotelList").html(strLi);
					} // --- success
				}); // -- ajax
			}//-- if
		}); // -- click
		$("#hotelList").on("click",".chk_hotel", function() {
			$(".chk_hotel").not($(this)).prop("checked",false); // 체크박스를 라디오버튼 처럼
			childCharge = parseInt($(this).attr("data-childChar"));
			adultCharge = parseInt($(this).attr("data-adultChar"));
			
			ifCheckEl($(this), childCharge, adultCharge);
// 			console.log(childCharge);
		});
		
		$("#hotelList").on("click",".btn-info", function(e) {
			var hotelName = $(this).attr("data-hotelName");
			var hotelAddr = $(this).attr("data-hotelAddr");
			var hotelTel = $(this).attr("data-hotelTel");
			var hotelId = $(this).attr("data-hotelId");
			
			console.log(hotelName + ":::" + hotelAddr + "::::" + hotelTel + ":::" + hotelId);
			// --- 호텔 사진 받아오기 ------------------
			var url_picture = "/rest/hotel-picture";
			var data_hotel = {
					"hotelEntId" : hotelId
			};
			$.ajax({
				"type" : "get",
				"url" : url_picture,
				"headers" : {
					"Content-Type" : "application/json",
					"X-HTTP-Method-Override" : "get"
				},
				"data" : data_hotel,
				"success" : function(rData) {
					var picData = rData.rfcOpenApi.body.data.list; // 사진url이 있는 하위항목까지 이동
// 					console.log(rData);
// 					console.log(picData);
					var pictureUrl =  [];
					$(picData).each(function() {
						pictureUrl.push(this.fileUrl);
					});
// 					console.log(pictureUrl);
					var strLi = "";
					for(var i = 0; i < pictureUrl.length; i++){
						strLi += "<li>"  
								+		"<img src='"+ pictureUrl[i] +"'" + 
											"style='max-width: 100%;width: 750px;'>"
								+"<li>";
					} // 사진수에 맞춰 사진등록
					console.log("strLi : " + strLi);
					$(".hotel-picture").html(strLi);
				}
			});
			//---------- 호텔사진 받기 끝
			//------ 호텔 상세정보 받기
			var url_detail = "/rest/hotel-detail";
			
			$.ajax({
				"type" : "get",
				"url" : url_detail,
				"headers" : {
					"Content-Type" : "application/json",
					"X-HTTP-Method-Override" : "get"
				},
				"data" : data_hotel,
				"success" : function(rData) {
					var parsingData = rData.rfcOpenApi.body.data.list;
					var strLi = "";
					var strExplain = "";
					var fullExplanation = "";
					var cutExplanation = [];
					
					$(parsingData).each(function() {
						fullExplanation = parsingData.ulsanhotelInfo;
// 						console.log("호텔 설명자르기전 :" + fullExplanation );
						while(true){
							if(fullExplanation.length > 60){ // 60 글자씩 줄바꿈 시키기.
								var infoOneLine =
									fullExplanation.substring(0,  61);
								
								cutExplanation.push(infoOneLine);
							// 40글자씩 잘라서 배열에 저장
							// substring은 endIndex - 1 까지 자르므로 61
							
								fullExplanation = fullExplanation.substring(61);
								// 잘라낸 부분을 제외하고 원 문자열에 저장.
							
							}else{
								cutExplanation.push(fullExplanation);
								break; // 60 글자 이상 남지 않았으면 반복탈출.
							}
						}
// 						console.log("자른후호텔설명:" + cutExplanation);
						
						for(var i = 0; i < cutExplanation.length; i++ ){
							strExplain += "<p>" + cutExplanation[i] + "</p>";
						}
												
						strLi += "<tr>";  
						strLi += "<td>" + parsingData.ulsanhotelNewAddr + "</td>";
						strLi += "<td>" + parsingData.ulsanhotelParking + "</td>";
						strLi += "<td>" + "<a href='" + parsingData.ulsanhotelHP + "'>"
									+ parsingData.ulsanhotelHP + "</a>"
								+ "</td>";
						strLi += "<td>" + parsingData.ulsanhotelTel + "</td>";
						strLi += "</tr>";
					});
					console.log(strLi);
					$("#hotelDetail").html(strLi);
					$("#hotelExplain").html(strExplain);
				}
			});	//호텔상세정보 받기 끝
			
		
		});// 호텔 상세정보 보기.
	
		
	
		
		
		/// 항공정보 검색
		$("#btn_searchAir").click(function() {
			console.log("서치에어 클릭");
			chargeInit(); // 이전에 선택했던 값정보 초기화 
			var depPort = $("#sel_dep").val();
			var arrPort = $("#sel_arr").val();
			var depDate = $("#txt_date").val();
			console.log("dep :" +depPort + "arr:" + arrPort + "date:" + depDate);
			var dat = {
					"depAirportId" : depPort,
					"arrAirportId" : arrPort,
					"depPlandTime" : depDate
			};
		
			var url = "/rest/air-info";
			
			$.ajax({
				"type" : "get",
				"url" : url,
				"headers" : {
					"Content-Type" : "application/json",
					"X-HTTP-Method-Override" : "get"
				},
				"data" : dat,
				"success" : function(rData) {
					console.log("성공");
					var data = rData.response.body.items.item;
					var strLi = "";
					$(data).each(function() {
							
// 							console.log("data :" + this.economyCharge);
							var economyCharge = "";
							if (this.economyCharge != null
									&& this.prestigeCharge != "undefined"
									&& this.economyCharge != 0) {
								economyCharge = this.economyCharge;
								console.log("if");
							} else {
								economyCharge = "--";
							}
							;
							var prestigeCharge = "";
							if (this.prestigeCharge != null
									&& this.prestigeCharge != ""
									&& this.prestigeCharge != 0) {
								prestigeCharge = this.prestigeCharge;
							} else {
								prestigeCharge = "--";
							}
							;
							var dTime = this.depPlandTime + ""; // 문자열로 변경   
							var aTime =   this.arrPlandTime + "";
							dTime = dTime.substring(8);
							aTime = aTime.substring(8); // 날짜제외 시간만 자르기
							strLi += "<tr>";
							strLi += "<td>"
									+ this.airlineNm
									+ "</td>";
							strLi += "<td>"
									+ dTime
									+ "</td>";
							strLi += "<td>"
									+ aTime
									+ "</td>";
							strLi += "<td>"
									+ economyCharge
									+ "</td>";
							strLi += "<td>"
									+ prestigeCharge
									+ "</td>"
							strLi += "<td> <input type='checkbox' class='chk_airEconomy'></td>"
							strLi += "<td> <input type='checkbox' class='chk_airPrestige'></td>"
								
									+ "</tr>";
					});// -----each
					$("#airInfo").html(strLi);
				}// --- success
			});// -- ajax
		});// -- click
		
		
		
		// 항공편 체크 
		//이코노미
		$("#airInfo").on("click",".chk_airEconomy", function() {
			$(".chk_airEconomy").not($(this)).prop("checked",false); // 체크박스를 라디오처럼
			$(".chk_airPrestige").not($(this)).prop("checked",false);
			var charge = parseInt($(this).parent().prev().prev().text()); // data- 사용하지 않고 엘리먼트 찾기 연습.
			ifCheckEl($(this), charge, charge); // 아이 어른가격이 같음.
		});
		// 프레스티지
		$("#airInfo").on("click",".chk_airPrestige", function() {
			$(".chk_airEconomy").not($(this)).prop("checked",false); // 체크박스를 라디오처럼
			$(".chk_airPrestige").not($(this)).prop("checked",false);
			var charge = parseInt($(this).parent().prev().prev().text());
			ifCheckEl($(this), charge, charge);
		});
		
		
		
		$("#adNum").change(function (){
			ifNumChange();
		});
		$("#cdNum").change(function (){
			ifNumChange();
			
		});  //코드  중복 제거할것 -- 완료
		
		/// 달력 그리기
		
		drawCalendar();
		initDate();
		drawDays();
		$("#movePrevMonth").on("click", function() {
			movePrevMonth();
		});
		$("#moveNextMonth").on("click", function() {
			moveNextMonth();
		});


	//////////////////////////////////////////////////////////////////////	
		// 달력 클릭시 해당 날짜 정보출력을 위해 박스에 저장.
		$(".tDay").click(function() {
			var strDay = $(this).children().eq(0).text();
			console.log(strDay);
			if(!!strDay){ // not null
				var day = parseInt(strDay);
				
				if(day < 10) {
					day = "0" + day;
				}
				var year = $("#cal_top_year").text();
				var month = parseInt($("#cal_top_month").text());
				if(month < 10) {
					month = "0" + month;
				}
				console.log(year + month.toString() + day.toString());
				var date = year + month.toString() + day.toString();
				$("#txt_date").val(date);
			}	
			
		});
	
		//// 달력에 마우스 올라갈시 스케쥴러로 이동 버튼보이기 
		$("#cal_tab").on("mouseenter",".tDay", function() {
			var enterYear = $("#cal_top_year").text();
			var enterMonth = $("#cal_top_month").text();
			var enterDay = $(this).children(".cal-day").text();
// 			console.log(enterYear + enterMonth + enterDay);
			var enterDate = enterYear + enterMonth + enterDay;
			if(enterDay != null && enterDay != ""){
				var div_sch = $(this).children(".cal-schedule");
				var str_html = "<input type='button' value='스케쥴' class='btn-primary btn-sch' data-date='" + enterDate +"'>";
				div_sch.html(str_html);
			}
		});
		$("#cal_tab").on("mouseleave",".tDay", function() {
			var div_sch = $(this).children(".cal-schedule");
// 			div_sch.remove(":button");
			div_sch.children("input[type='button']").remove();
		});
		
		$("#cal_tab").on("click", ".btn-sch", function() {
// 			console.log("스케쥴가기 클릭");
			var enterDate = $(this).attr("data-date");
			console.log(enterDate);
			location.href = "/psj/schedule?enterDate=" + enterDate;
		});
		
		
		$("#btn_cart").click(function() {
		
			var url = "/sch/cart";
			var depCity = $("#sel_dep option:checked").text();
			var arrCity = $("#sel_arr option:checked").text();
			var departure_date = $("#txt_date").val();
// 			console.log($("#sel_dep option:checked").text());
// 			console.log($("#sel_arr option:checked").text());
			var data = {
				"user_code" : "${memberVo.user_code}",
				"dep_city" : depCity,
				"arr_city" : arrCity,
				"departure_date" : departure_date,
				"adult_count" : top_adult_num,
				"child_count" :top_child_num,
				"adult_price" : top_adult_charge,
				"child_price" :	top_child_charge
			};
			var jsonData = JSON.stringify(data);
			$.ajax({
					"type" : "put",
					"url" : url,
					"headers" :  {
						"Content-Type" : "application/json",
						"X-HTTP-Method-Override" : "put"
					},
					"data" : jsonData,
					"success" : function(rData) {
						var showHtml = "<p>" + depCity + "출발 " + "</p>";
							showHtml += "<p>" + arrCity + "도착" + "<p>";
						
					}
			});		
			
		});
	
	
	
	}); // -- ready
			
</script>


<style type="text/css">
input.btn-sch{
	border: 1px solid blue;
	background-color: rgba(0,0,0,0);
	color: blue;
	padding: 5px;
}
input.btn-pay{
	border: 1px solid blue;
	background-color: rgba(0,0,0,0);
	color: blue;
	padding: 5px;
}
input.btn-cart{
	border: 1px solid #FF8000;
	background-color: rgba(0,0,0,0);
	color: #FF8000;
	padding: 5px;
}
input.btn-search {
	border: 1px solid red;
	background-color: rgba(255,255,255,255);
	color: red;
	padding: 5px;
}
input[type=text] {
	border-bottom: 1px solid black;
}

.div_chargeOutPut {
	font-size: 200%;
	font-family: "Times New Roman", Times, sans-serif;
	font-weight: bold;
	
}

.div_chargeOutPut #result_char {
	color:#9BB9DE;
}
.city {
	
border: 0.5px solid #500;

}

.city::-ms-expand{
	display:none;
}



}
.sumPrice {
	font-family: "Times New Roman", Times, sans-serif;
	font-size: 150%;
	font-weight: bold;
}

.cal_top {
	text-align: center;
	font-size: 30px;
}

.cal {
	text-align: center;
}

table.calendar {
	border: 1px solid black;
	display: inline-table;
	text-align: left;
}

table.calendar td {
	vertical-align: top;
	border: 1px solid skyblue;
	width: 80px;
}

</style>

</head>
<body>

	<section class="feature-area section-padding2">
		
		<div class="container">

			<div class="row">
				<div class="col-md-6">
					<div class="cal_top">
						<a href="#" id="movePrevMonth"><span id="prevMonth"
							class="cal_tit">&lt;</span></a> <span id="cal_top_year"></span> <span
							id="cal_top_month"></span> <a href="#" id="moveNextMonth"><span
							id="nextMonth" class="cal_tit">&gt;</span></a>
					</div>
					<div id="cal_tab" class="cal"></div>

				</div>
				<!--  여행 인원선택 -->
				<div class="col-md-6">
					<br> <br>
					<div class="col-md-12">
						<div class="col-md-7">
							<img src="/resources/psj/images/travel2.jpg">
						</div>
						<div class="col-md-5">
							유의사항 : 유류할증료&제세공과금 포함<br> ※유류할증료 및 제세공과금은 유가와 환율에 따라 변동될 수
							있습니다.<br> ※ 아동, 유아요금은 성인 2인과 같은 방 사용조건이며, 미충족시 아동추가 요금이
							발생합니다.<br> ※ 1인 객실 사용시 추가요금 발생
						</div>
					</div>
					<div class="scroll">
						<table class="table">
							<tr>
								<td>성인 &nbsp;&nbsp;&nbsp; <input type="number" value="1"
									min="0" max="15" class="peopleNum" id="adNum">
								</td>
								<td><span id="adult_charge">0</span>원</td>

							</tr>
							<tr class="table-active">
								<td>유아 &nbsp;&nbsp;&nbsp; <input type="number" value="0"
									min="0" max="15" class="peopleNum" id="cdNum">
								</td>
								<td><span id="child_charge">0</span>원</td>
							</tr>
						</table>
					</div>
					<div class="col-md-12 div_chargeOutPut">
						<p class="sumPrice">총 예정 금액 :</p> <span id="adult_char">0</span> x <span id="adult_num">1</span> +
																 <span id="child_char">0</span> x <span id="child_num">0</span> =
																 <span id="result_char">0</span>
																  
					</div>
					<div class="col-md-6">
						<input type="button" value="장바구니" class="btn-warning  btn-block btn-cart" id="btn_cart">
					</div>
					<div class="col-md-6">
						<input type="button" value="결제하기" class="btn-primary  btn-block btn-pay"
							id="btn-test">
					</div>
				</div>
			</div>

		</div>
	</section>
	<!-- Feature Area End -->

	<!-- Category Area Starts -->
	<div class="container">
	
 <ul id="myTab" class="nav nav-tabs" role="tablist">
    <li role="presentation" class=""><a href="#home" id="home-tab" role="tab" data-toggle="tab" aria-controls="home" aria-expanded="false">
    항공정보</a></li>
    <li role="presentation" class="active"><a href="#profile" role="tab" id="profile-tab" data-toggle="tab" aria-controls="profile" aria-expanded="true">
    호텔정보</a></li>

  </ul>
  <div id="myTabContent" class="tab-content">
    <div role="tabpanel" class="tab-pane fade" id="home" aria-labelledby="home-tab">
    <h2>항공 정보</h2>
      
		<div class="container">
			<div class="container-fluid">
				<div class="row">
					<div class="col-md-4">
						<select class="city" id="sel_dep">
							<option>출발도시</option>
							<c:forEach var="CityVo" items="${cityList}">
							<option value="${CityVo.airport}">${CityVo.domestic_city}</option>
							</c:forEach>
						</select>
					</div>
					<div class="col-md-4">
						<select class="city" id="sel_arr">
							<option>도착도시</option>
							<c:forEach var="CityVo" items="${cityList}">
							<option value="${CityVo.airport}">${CityVo.domestic_city}</option>
							</c:forEach>
						</select>
						
					
					</div>
					<div class="col-md-4">
					<input type="button" class="btn-outline-danger btn-lg btn-search" id="btn_searchAir" value="검색"
					style="background-color: red; color: white;">
					&nbsp;
					<label for="txt_date">출발 날짜 :</label>
					<input type="text" id="txt_date">
					</div><br><br>
					
					<div class="col-md-12">
			
						<table class="table">
							<thead>
								<tr>
									<th>항공사</th>
									<th>출발 시각</th>
									<th>도착 시각</th>
									<th>Economy</th>
									<th>Prestige</th>
								</tr>
							</thead>
							<tbody id="airInfo">
						
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
	
    </div>
    <!-- - Tab 1 끝 ( 항공정보) -->
    <!-- Tab2  호텔정보 탭 -->
    <div role="tabpanel" class="tab-pane fade active in" id="profile" aria-labelledby="profile-tab" >
      <h2>호텔정보</h2>
      <div>
      	<div class="col-md-4">
		     <select class="city" id="sel_hotel_loc">
					<option>지역 선택</option>
					<c:forEach var="CityVo" items="${cityList}">
					<option value="${CityVo.airport}">${CityVo.domestic_city}</option>
				</c:forEach>
			</select>
		</div>
		<div class="col-md-8">
			<input type="button" class="btn-outline-danger btn-lg btn-search" id="btn_searchHotel" value="검색">
		</div>
	 </div>
	 <div>
	 	<div class="col-md-12">
			
						<table class="table">
							<thead>
								<tr>
									<th>no</th>
									<th>호텔 이름</th>
									<th>주소</th>
									<th>가격(어린이)</th>
									<th>(어른)</th>
									<th></th>
								</tr>
							</thead>
							<tbody id="hotelList">
						
							</tbody>
						</table>
					</div>
	 </div>
    </div>
   
  </div>

</div>
	<!--  tab2 호텔정보 긑 -->
	<!-- Category Area End -->

	
	
	

	<!--  호텔 상세정보 모달창 -->
		<div class="container-fluid">
			<div class="row">
				<div class="col-md-12">
				<div class="modal fade" id="modal_hotelInfo"  role="dialog"  aria-labelledby="myModalLabel" aria-hidden="true">
				<div class="modal-dialog modal-lg" style="max-width: 100%; width: auto; display: table;">
					<div class="modal-content">
						<div class="modal-header">
							<h5 class="modal-title" id="modal-hotel-Title">
								
							</h5> 
							<button type="button" class="close" data-dismiss="modal">
								<span aria-hidden="true">×</span>
							</button>
						</div>
						<div class="modal-body" id="hotel-modal-body">
							
								<ul class="hotel-picture">
									
								</ul>
						
						</div>
						<div class="col-md-12" id="hotelExplain">
						
						
						</div>
						
						<div class="col-md-12" id="modal-hotel-info">
						
						<table class="table">
							<thead>
								<tr>
									<th>주소</th>
									<th>주차가능 여부</th>
									<th>홈페이지</th>
									<th>전화번호</th>
								</tr>
							</thead>
							<tbody id="hotelDetail">
						
							</tbody>
						</table>
						</div>
						
						</div>
						
						<div class="modal-footer">
							 
							<button type="button" class="btn btn-primary">
								선택
							</button> 
							<button type="button" class="btn btn-secondary" data-dismiss="modal">
								닫기
							</button>
						</div>
					</div>
					
				</div>
				
			</div>
			
		</div>
	</div>

		<!--  호텔 상세정보 모달창 끝 -->

			
	<!-- Download Area End -->


	
	<!-- Javascript -->
<!-- 	<script src="/resources/psj/assets/js/vendor/jquery-2.2.4.min.js"></script> -->
<!-- 	<script src="/resources/psj/assets/js/vendor/bootstrap-4.1.3.min.js"></script> -->
	<script src="/resources/psj/assets/js/vendor/wow.min.js"></script>
	<script src="/resources/psj/assets/js/vendor/owl-carousel.min.js"></script>
	<script src="/resources/psj/assets/js/vendor/jquery.nice-select.min.js"></script>
	<script src="/resources/psj/assets/js/vendor/ion.rangeSlider.js"></script>
	<script src="/resources/psj/assets/js/main.js"></script>
	<%@include file="../include/nds/footer.jsp" %>	
</body>
</html>
