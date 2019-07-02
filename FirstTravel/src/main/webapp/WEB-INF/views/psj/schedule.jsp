<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>    
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<!--  jquery & bootstrap -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>

<script>
////////////////// 이 페이지는 시간나면 꼭 리팩토링할것
/////TODO MONDAY ------ document 시작부분에 있는 달력에 title 띄우기 코드 

var top_date = ${enterDate};
var top_date_toString = top_date.toString();
var top_month = top_date_toString.substring(4,6);
var top_year = top_date_toString.substring(0,4);
// console.log(top_date_toString.substring(4,6));
// var newd = new Date(top_date_toString.substring(5,7));
// console.log(newd);
// console.log("${allSchList}");
function drawCalendar() {
	var setTableHTML = "";
	setTableHTML += '<table class="calendar">';
	setTableHTML += '<tr><th>SUN</th><th>MON</th><th>TUE</th><th>WED</th><th>THU</th><th>FRI</th><th>SAT</th></tr>';
	var j_list_index = 0;
	for (var i = 0; i < 6; i++) {
		setTableHTML += '<tr height="80">';
		
		for (var j = 0; j < 7; j++) {
			
			setTableHTML += '<td style="text-overflow:ellipsis;overflow:hidden;white-space:nowrap"'
							+ 'onMouseOver="' +  "this.style.backgroundColor='#9BB9DE'"  +'"'
							+ 'class="tDay">';
			setTableHTML += '    <div class="cal-day"></div>';
			setTableHTML += '    <div class="cal-schedule"></div>';
			setTableHTML += '</td>'; 
		}
		setTableHTML += '</tr>';
	}
	setTableHTML += '</table>';
// 	console.log(setTableHTML);
	$("#cal_tab").html(setTableHTML);
}

//날짜 초기화
function initDate() {
	$tdDay = $("td div.cal-day")
	$tdSche = $("td div.cal-schedule")
	dayCount = 0;
// 	today = new Date();

	year =  new Date(top_year).getFullYear();
	month = new Date(top_month).getMonth() + 1;
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
// 	console.log(firstDay + "firstDay");
// 	console.log(lastDay + "lastDay");
	drawDays();
}
$(document).ready(function() {
	drawCalendar();
// 	drawScheduler();
	initDate();
	drawDays();
	console.log("drawDays()");
	
	/// 달력에 title 띄우기
	var j_list = JSON.parse('${schTitleJSONList}');
// 	console.log("j_list", j_list);
	var cal_days = $(".calendar .cal-day");
	var isSchDate = ${isSchDate};

	$.each(j_list,function(vo) {
	 	$.each(cal_days, function(i) {
			// 0 제거를 위해 parseInt
			var sch_d_date_toInt = j_list[vo].sch_d_date.substring(6,9);
			var cal_day_toInt = parseInt($(this).text());
			if(sch_d_date_toInt == cal_day_toInt ){ 
				var innerHtml = "<br><span class='spanSchTitle'>" + j_list[vo].sch_d_content + "</span>"
				$(this).next().html(innerHtml);
			}
		});
	});
	//스케쥴 데이터가 있는 날짜는 기본 배경색 부여.
	for(var i in isSchDate){
// 		console.log("isSchDate_toInt", isSchDate);
		$.each(cal_days, function(j){
			var isSchDate_toInt = parseInt(isSchDate[i]);
			var cal_day_toInt = parseInt($(this).text());

			
			if(isSchDate_toInt == cal_day_toInt)  {
// 				console.log(isSchDate[i]);
				console.log($(this).parent());

				$(this).parent().css("background-color", "#9BB9DE");
			}
		});
	}
	$("#movePrevMonth").on("click", function() {  
		// ajax로 구현하려 했으나 실패 기한이 남으면 시도해볼것
		movePrevMonth();
		location.href = "/psj/schedule?enterDate=" + year + month + "31";
	});
	$("#moveNextMonth").on("click", function() {
		moveNextMonth();
		location.href = "/psj/schedule?enterDate=" + year + month + "01";
	});
	
	$(".tDay").mouseleave(function() {
// 		console.log($(this).children(".cal-day").text());
// 		console.log("dd:" + isSchDate.includes(3));
		if(!isSchDate.includes(parseInt($(this).children(".cal-day").text().trim()))){
			// 스케쥴 데이터가 없는 날짜에서만.
			$(this).css("background-color","");
		}
	});
	
	// 달력 클릭시 해당 날짜 정보출력을 위해 박스에 저장.
// 	$(".tDay").click(function() {
// 		var day = parseInt($(this).children().eq(0).text());
// 		if(day < 10) {
// 			day = "0" + day;
// 		}
// 		var year = $("#cal_top_year").text();
// 		var month = parseInt($("#cal_top_month").text());
// 		if(month < 10) {
// 			month = "0" + month;
// 		}
// // 		console.log(year + month.toString() + day.toString());
// 		var date = year + month.toString() + day.toString();
// 		$("#txt_date").val(date);
// 		top_date = date;
		
// 	});

	

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
			location.href = "/psj/schedule?enterDate=" + date;
		}	
		
	});
	
	
	$("#cal_tab").on("mouseleave",".tDay", function() {
		var div_sch = $(this).children(".cal-schedule");
//			div_sch.remove(":button");
		div_sch.children("input[type='button']").remove();
	});
	$("#cal_tab").on("mouseenter",".tDay", function() {
		var div_sch = $(this).children(".cal-schedule");
//			div_sch.remove(":button");
		var originHtml = div_sch.html();
		if(!!originHtml){
			var newHtml = "<input type='button' class='btn-danger btn-xs btn-deleteTitle' value='삭제'>";
			div_sch.append(newHtml);
		}	
	});
	
	
	
	$("#tSch").on("mouseenter", ".tdBtn", function() {
		var prevHtml = $(this).prev().html();
		var type = prevHtml.substring(1,6);  /// input box가 떠있나 안떠있나 구분을 위한
		console.log(prevHtml);
		var btnHtml = ""
		if(type != 'input'){
			if(prevHtml.trim() != "" && type != 'input'){  // 내용물이 있고 인풋박스가 없을때
				btnHtml = "<input type='button' value='수정' class='btn-warning btn-xs btn-update'>"
						+ "<input type='button' value='삭제' class='btn-danger btn-xs btn-delete'>";
			}else{
				btnHtml = "<input type='button' value='입력' class='btn-success btn-xs btn-input'>"		
			}
			$(this).html(btnHtml);
		}	
		$(this).parent().css("background-color", "#9BB9DE");
	});
	
	$("#tSch").on("mouseleave", ".tdBtn", function() {
		var btn = $(this).children("input[type=button]");
		var btnTxt = btn.val(); // 테이블에 띄워져 있는 버튼의 텍스트
		
// 		console.log("dd" + btnTxt);
		
		if(btnTxt != '확인' && btnTxt != '수정완료' ){ // input 박스가 떠 있을때는 상태가 유지 되도록.
			$(this).html("");
			$(this).parent().css("background-color", ""); 
		}	
	})
	
	
	// 확인 버튼 클릭 ( 스케쥴 데이터 입력 )
	$("#tSch").on("click", ".btn-confirm", function() {
		var time = $(this).parent().attr("data-time");
		var btn_td = $(this).parent(); // 버튼 td
		var this_tr = btn_td.parent(); // tr
		var txt_td = btn_td.prev(); // 텍스트박스 td
		var date = $
		
		var content = txt_td.children("input[type=text]").val(); 
		
// 		console.log("date :" + date);
// 		console.log("time :" + time);
// 		console.log("content :" + content);
		var url = "/sch/insert";
		var data = {
				"user_code" : "111",
				"sch_date" : top_date,
				"sch_time" : time,
				"sch_content" : content
		};
		var jsonData = JSON.stringify(data);
		
		$.ajax({
			"type" : "post",
			"data" : jsonData,
			"url" : url,
			"headers" : {
				"Content-Type" : "application/json",
				"X-HTTP-Method-Override" : "post"
			
			},
			"dataType" : "text",
			"success" :function(rData){
				console.log(rData);
				if(rData == "success"){
					console.log("if문 실행");
					var showHtml = "<p>" + content + "</p>";
					var btnHtml = "<input type='button' value='수정' class='btn-warning btn-xs btn-update'>"
						+ "<input type='button' value='삭제' class='btn-danger btn-xs btn-delete'>";
					txt_td.html(showHtml);
					btn_td.html(btnHtml);
					this_tr.css("background-color","");
				}// -- if
			}// --success
		});	// -- ajax
	});
	// 삭제버튼 클릭 (스케쥴 데이터 삭제)
	$("#tSch").on("click", ".btn-delete", function() {
		var txt_td = $(this).parent().prev();
		var time = $(this).parent().attr("data-time");
		console.log("삭제 " + "date:" + top_date + "time :" + time);
		var url = "/sch/delete";
		var data = {
			"user_code" : "111",
			"sch_date" : top_date,
			"sch_time" : time
		}
		
		var jsonData = JSON.stringify(data);
		
		$.ajax({
			"type" : "delete",
			"data" : jsonData,
			"url" : url,
			"headers" : {
				"Content-Type" : "application/json",
				"X-HTTP-Method-Override" : "post"
			
			},
			"dataType" : "text",
			"success" :function(rData){
				console.log("삭제성공");
				txt_td.html("");
			}
		});// --- ajax
	});	
	
	// 수정버튼 클릭 --> 텍스트박스출력 // 수정완료 버튼 생성
	$("#tSch").on("click", ".btn-update", function(){
		var originTxt = $(this).parent().prev().text();
// 		console.log(originTxt);
		inputHtml = "<input type='text' class='inp-sch' size='80%'" 
					+		"value='" +  originTxt +"'>";
		$(this).parent().prev().html(inputHtml);
		$(this).parent().prev().children(".inp-sch").focus();
		
		var btnHtml = "<input type='button' class='btn-warning "
					+	"btn-xs btn-updateConfirm' value='수정완료'>";
		
		$(this).parent().html(btnHtml);
		
	});
	
	// 수정 완료버튼 클릭 --> data 수정
	$("#tSch").on("click", ".btn-updateConfirm", function() {
		var txt_td = $(this).parent().prev();
		var btn_td = $(this).parent();
		var this_tr = $(this).parent().parent();
		var updateTxt = $(this).parent().prev().children("input[type=text]").val();
		var time = $(this).parent().attr("data-time");
		var url = "/sch/update";
		var data = {
			"sch_content" : updateTxt,
			"sch_date" : top_date,
			"sch_time" : time,
			"user_code" : "111"
		};
		
		var jsonData = JSON.stringify(data);
			
			
		$.ajax({
			"type" : "put",
			"data" : jsonData,
			"url" : url,
			"headers" : {
				"Content-Type" : "application/json",
				"X-HTTP-Method-Override" : "post"
			
			},
			"dataType" : "text",
			"success" :function(rData){
				var showHtml = "<p>" + updateTxt + "</p>";
				var btnHtml = "<input type='button' value='수정' class='btn-warning btn-xs btn-update'>"
					+ "<input type='button' value='삭제' class='btn-danger btn-xs btn-delete'>";
				txt_td.html(showHtml);
				btn_td.html(btnHtml);
				this_tr.css("background-color","");
				
			}
		});// --- ajax
	});
	
	/// 입력 버튼클릭 --> 텍스트인풋박스 출력/ 버튼메시지 확인 으로 변경
	$("#tSch").on("click", ".btn-input", function() { 
		console.log("인풋버튼클릭됨");
		inputHtml = "<input type='text' class='inp-sch' size='80%'>";
		$(this).val("확인");
		$(this).attr("class","btn-success btn-xs btn-confirm");
		$(this).parent().prev().html(inputHtml);
		$(this).parent().prev().children(".inp-sch").focus();
		
	});
	
	/// 날짜별 대표스케쥴 입력 / 수정
	$("#btn_schTitle").click(function() {
		var cal_days = $(".calendar .cal-day");
		var enterDate = $("#txt_enterDate").val();
		var sch_d_content = $("#txt_sch_title").val();
		var ajaxType = "";
		var url = "";
		$.each(cal_days, function(i) {
			var enterDate_day_toInt = parseInt(enterDate.substring(6,9));
			var cal_day_toInt = parseInt($(this).text());
			// 달력의 날짜와 타이틀 데이터가 입력될 날짜가 같은 cal div를 찾기위한 순회.
			if(enterDate_day_toInt ==  cal_day_toInt){
				var isScheduleExist = $(this).next().text();
				if(!isScheduleExist){
					url = "/sch/insertTitle"; /// title Data가 이미 입력되어 있는 날이면 update 아니면 insert
					ajaxType = "post";
				}else{
					url = "/sch/updateTitle";
					ajaxType = "put";
				}	
			}
		});
		var data = {
				"user_code" : "111",
				"sch_d_date" : enterDate,
				"url" : url,
				"sch_d_content" : sch_d_content
		}
		var jsonData = JSON.stringify(data);
		
		$.ajax({
			"type" : ajaxType,
			"data" : jsonData,
			"url" : url,
			"headers" : {
				"Content-Type" : "application/json",
				"X-HTTP-Method-Override" : "post"
			
			},
			"dataType" : "text",
			"success" :function(rData){
				
				$.each(cal_days, function(i) {
					var enterDate_day_toInt = parseInt(enterDate.substring(6,9));
					var cal_day_toInt = parseInt($(this).text());
					if(enterDate_day_toInt == cal_day_toInt ){
						var innerHtml = "<br><span class='spanSchTitle'>" + sch_d_content + "</span>"
						$(this).next().html(innerHtml);	
					}
				});
			}
		}); // --- ajax	
	});// -- click
	
	// 타이틀 삭제
// 	$(".btn-deleteTitle").click(function(event) {
// 		event.stopPropagation();
// 		console.log("삭제버튼클릭");
// 	});
	$(".tDay").on("click",".btn-deleteTitle", function(event){
		event.stopPropagation(); // 상위 div에 걸려있는 페이지 이동 막기.
		var d = $(this).parent().parent().children().eq(0).text(); // 날짜받기
		var y = $("#cal_top_year").text();
		var m = $("#cal_top_month").text();
		if(parseInt(d) < 10){
			d = "0" + d;
		}
// 		console.log(y+m+d);
		var sch_d_date = y + m + d;
		var url = "/sch/deleteTitle";
		var data = {
			"sch_d_date" : sch_d_date,
			"user_code" : "111"
		};
		var jsonData = JSON.stringify(data); // 코드 전체 data와 이름이 바뀌었지만 그냥 사용..
		
		var div_schedule = $(this).parent();
		console.log("div_schedule", div_schedule);
		$.ajax({
			"type" : "delete",
			"data" : jsonData,
			"url" : url,
			"headers" : {
				"Content-Type" : "application/json",
				"X-HTTP-Method-Override" : "post"
			
			},
			"dataType" : "text",
			"success" :function(rData){
				div_schedule.remove(); // 출력 되어 있는 스케쥴 타이틀 지우기
			}
		}); // -- ajax	
	});// -- click
	
	//스케쥴러 그리기
	function drawScheduler() { 
		var schHtml = "";
		for(var i = 0; i <= 24; i++){
			
			var time = "";
			if(i < 10){
				time = "0" + i + ": 00";
			}else{
				time = i + ": 00";
			}
			schHtml += "<tr>"
			schHtml += "<td class='tdTime'>" + time    + "</td>";
			schHtml += "<td class='tdSch'></td>";
			schHtml += "<td class='tdBtn' data-time='"+ time + "'>" + "</td>"
			schHtml += "</tr>"
		}
		$("#tSch").html(schHtml);
		
		
	}
	
	
});

</script>
<style type="text/css">
table .tdBtn {
	width: 100px;
	
}

table .tdTime {
	width: 100px;
	
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
.spanSchTitle {
	font-weight: bold;
}
</style>
<title>스케쥴러</title>
</head>
<body>
<div class="container-fluid">
	<div class="row">
		<label for="txt_enterDate">날짜: </label>
		<input type="text" readonly="readonly" id="txt_enterDate" value="${enterDate}"> 
		<label for="txt_sch_title">대표 스케쥴 입력: </label>
		<input type="text" id="txt_sch_title">
		<input type="button" id="btn_schTitle" value="확인">
		<div class="col-md-6">
			<table class="table">
					<thead>
						<tr>
							<th>시간</th>
							<th>스케쥴</th>
							<th>-</th>
						</tr>
					</thead>
					<tbody id="tSch">
					<c:forEach var="i" begin="0" end="24">
						<c:choose>
							<c:when test="${i < 10}">
								<c:set  var="time"  value="0${i}: 00"/>
							</c:when>
							<c:otherwise>
								<c:set var="time" value="${i}: 00"/>
							</c:otherwise>
						</c:choose>
							<tr>
									<td class='tdTime'>${time}</td>
									
										<td class='tdSch'>
										<c:forEach var="schVo" items="${schList}">
											<c:if test="${time == schVo.sch_time}">
											${schVo.sch_content}
											</c:if>
										</c:forEach>
										</td>
									
									<td class='tdBtn' data-time="${time}"></td>
							</tr>
					</c:forEach>
						
					</tbody>
				</table>
		</div>
		<div class="col-md-6">
				<div class="cal_top">
					<a href="#" id="movePrevMonth"><span id="prevMonth"
						class="cal_tit">&lt;</span></a> <span id="cal_top_year"></span> 
						<span id="cal_top_month"></span> <a href="#" id="moveNextMonth">
						<span id="nextMonth" class="cal_tit">&gt;</span></a>
				</div>
			<div id="cal_tab" class="cal"></div>
		</div>
		
		<p>** 스케쥴이 있는 날은 파랑 배경색 유지</p>
		<p>** 주요 스케쥴을 달력에 출력하고 싶다면 상단에서 입력해 주세요.</p>
	</div>
</div>
</body>
</html>