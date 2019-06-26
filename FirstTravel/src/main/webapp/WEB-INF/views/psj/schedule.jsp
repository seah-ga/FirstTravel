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
		if(enterDay != null && enterDay != ""){
			var div_sch = $(this).children(".cal-schedule");
			var str_html = "<input type='button' value='스케쥴' class='btn-primary btn-sch' data-date='" + enterDate +"'>";
			div_sch.html(str_html);
		}
	});
	$("#cal_tab").on("mouseleave",".tDay", function() {
		var div_sch = $(this).children(".cal-schedule");
//			div_sch.remove(":button");
		div_sch.children("input[type='button']").remove();
	});
	
	$("#cal_tab").on("click", ".btn-sch", function() {
//			console.log("스케쥴가기 클릭");
		var enterDate = $(this).attr("data-date");
		console.log(enterDate);
		location.href = "/psj/schedule?enterDate=" + enterDate;
	});
	$("#tSch").on("mouseenter", ".tdBtn", function() {
		var btnHtml = "<input type='button' value='입력' class='btn-success btn-xs btn-input'>"
		if($(this).text() != "-" || !$(this).text() != ""){
			btnHtml = "<input type='button' value='수정' class='btn-warning btn-xs btn-update'>"
					+ "<input type='button' value='삭제' class='btn-danger btn-xs btn-delete'>";
		}
		$(this).html(btnHtml);
		$(this).parent().css("background-color", "#9BB9DE");
	});
	$("#tSch").on("mouseleave", ".tdBtn", function() {
		$(this).html("");
		$(this).parent().css("background-color", "");
	})
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
			schHtml += "<td>" + time    + "</td>";
			schHtml += "<td class='tdSch'>" +  "-"   + "</td>";
			schHtml += "<td class='tdBtn'>" + "</td>"
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