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
$(document).ready(function() {
	drawCalendar();
	drawScheduler();
	initDate();
	drawDays();
	$("#movePrevMonth").on("click", function() {
		movePrevMonth();
	});
	$("#moveNextMonth").on("click", function() {
		moveNextMonth();
	});
	
	// 달력 클릭시 해당 날짜 정보출력을 위해 박스에 저장.
	$(".tDay").click(function() {
		var day = parseInt($(this).children().eq(0).text());
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
		
	});

	//// 달력에 마우스 올라갈시 스케쥴러로 이동 버튼보이기 
	$("#cal_tab").on("mouseenter",".tDay", function() {
		var enterYear = $("#cal_top_year").text();
		var enterMonth = $("#cal_top_month").text();
		var enterDay = $(this).children(".cal-day").text();
//			console.log(enterYear + enterMonth + enterDay);
		var enterDate = enterYear + enterMonth + enterDay;
		
	});
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
			$("#txt_enterDate").val(date);
		}	
		
	});
	
	
	$("#cal_tab").on("mouseleave",".tDay", function() {
		var div_sch = $(this).children(".cal-schedule");
//			div_sch.remove(":button");
		div_sch.children("input[type='button']").remove();
	});
	
	
	
	$("#tSch").on("mouseenter", ".tdBtn", function() {
		var prevHtml = $(this).prev().html();
		var type = prevHtml.substring(1,6);  /// input box가 떠있나 안떠있나 구분을 위한
// 		console.log(prevHtml.substring(1,6));
		var btnHtml = ""
		if(type != 'input'){
			if(!$(this).prev().text() && type != 'input'){  // 내용물이 없고 인풋박스가 없을때
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
		
		if(btnTxt != '확인' ){ // input 박스가 떠 있을때는 상태가 유지 되도록.
			$(this).html("");
			$(this).parent().css("background-color", ""); 
		}	
	})
	
	// 확인 버튼 클릭 ( 스케쥴 데이터 입력 )
	$("#tSch").on("click", ".btn-confirm", function() {
		var date = $("#txt_enterDate").text();
		var time = $(this).parent().attr("data-time");
		var content = $(this).parent().prev().children("input[type=text]").val(); 
		
		console.log("date :" + date);
		console.log("time :" + time);
		console.log("content :" + content);
	});
	
	
	/// 입력 버튼클릭
	$("#tSch").on("click", ".btn-input", function() { 
		console.log("인풋버튼클릭됨");
		inputHtml = "<input type='text' class='inp-sch' size='80%'>";
		$(this).val("확인");
		$(this).attr("class","btn-success btn-xs btn-confirm");
		$(this).parent().prev().html(inputHtml);
		$(this).parent().prev().children(".inp-sch").focus();
		
	});
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
			schHtml += "<td class='tdSch'> </td>";
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
</style>
<title>스케쥴러</title>
</head>
<body>
<div class="container-fluid">
	<div class="row">
		<input type="text" readonly="readonly" id="txt_enterDate"> 
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
	</div>
</div>
</body>
</html>