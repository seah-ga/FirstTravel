<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="../include/nds/search.jsp" %>
<!DOCTYPE html>
<html>
<head>
<!-- 달력 스타일 -->
<style type="text/css">
.cal_top{
    text-align: center;
    font-size: 20px;
}
.cal{
    text-align: center;    
}
table.calendar{
    border: 1px solid black;
   	display: inline-table; 
    text-align: left;
}
table.calendar td{
    vertical-align: top;
    border: 1px solid skyblue;
    width: 45px;
}
</style>
<!-- 캘린더 출력 -->
<script type="text/javascript">
    
    var today = null;
    var year = null;
    var month = null;
    var firstDay = null;
    var lastDay = null;
    var $tdDay = null;
    var $tdSche = null;
 // 캘린더 이전버튼, 다음버튼
    $(document).ready(function() {
        drawCalendar();
        initDate();
        drawDays();
        $("#movePrevMonth").on("click", function(){movePrevMonth();});
        $("#moveNextMonth").on("click", function(){moveNextMonth();});
    });
    
    //calendar 그리기
    function drawCalendar(){
        var setTableHTML = "";
        setTableHTML+='<table class="calendar">';
        setTableHTML+='<tr><th>SUN</th><th>MON</th><th>TUE</th><th>WED</th><th>THU</th><th>FRI</th><th>SAT</th></tr>';
        for(var i=0;i<6;i++){
            setTableHTML+='<tr height="35">';
            for(var j=0;j<7;j++){
            	setTableHTML += '<td style="text-overflow:ellipsis;overflow:hidden;white-space:nowrap"'
					+ 'onMouseOver="' +  "this.style.backgroundColor='#9BB9DE'"  +'"'
					+	'onMouseOut="' +  "this.style.backgroundColor=''" + '"' + 'class="tDay">';
					setTableHTML += '    <div class="cal-day"></div>';
					setTableHTML += '    <div class="cal-schedule"></div>';
					setTableHTML += '</td>';
            }
            setTableHTML+='</tr>';
        }
        setTableHTML+='</table>';
        $("#cal_tab").html(setTableHTML);
    }
 
    //날짜 초기화
    function initDate(){
        $tdDay = $("td div.cal-day")
        $tdSche = $("td div.cal-schedule")
        dayCount = 0;
        today = new Date();
        year = today.getFullYear();
        
        month = today.getMonth()+1;
        if(month < 10) {
        	month = "0" + month;
        }
        firstDay = new Date(year,month-1,1);
        lastDay = new Date(year,month,0);
    }
    
    //calendar 날짜표시
    function drawDays(){
        $("#cal_top_year").text(year);
        $("#cal_top_month").text(month);
        for(var i=firstDay.getDay();i<firstDay.getDay()+lastDay.getDate();i++){
            $tdDay.eq(i).text(++dayCount);
        }
        for(var i=0;i<42;i+=7){
            $tdDay.eq(i).css("color","red");
        }
        for(var i=6;i<42;i+=7){
            $tdDay.eq(i).css("color","blue");
        }
    }
 
    //calendar 월 이동
    function movePrevMonth(){
        month--;
        if(month<=0){
            month=12;
            year--;
        }
        if(month<10){
            month=String("0"+month);
        }
        getNewInfo();
        }
    
    function moveNextMonth(){
        month++;
        if(month>12){
            month=1;
            year++;
        }
        if(month<10){
            month=String("0"+month);
        }
        getNewInfo();
    }

    
    function getNewInfo(){
        for(var i=0;i<42;i++){
            $tdDay.eq(i).text("");
        }
        dayCount=0;
        firstDay = new Date(year,month-1,1);
        lastDay = new Date(year,month,0);
        drawDays();
    }
    $(document).ready(function(){
    	 
    	//	검색 창
    	$("#country").change(function() {
    		var overseas_Country = $("#country option:selected").val();
    		var data = {
    				"overseas_Country" : overseas_Country
    		};
    		var url = "/ndsrest/countrychk";
    		
    		$.ajax({
    			"type" : "post",
    			"url" : url,
    			"headers" : {
    				"content-type" : "application/json",
    				"X-HTTP-Method-Override" : "post"
    			},
    			"dataType" : "text",
    			"data" : JSON.stringify(data),
    			"success" : function(rData) {
    			var	parsedJson = JSON.parse(rData);
    			var str = "";
    				for (var i = 0; i<parsedJson.length; i++) {
    					str +="<option value='"+parsedJson[i].airPort+"'>"+parsedJson[i].overseas_City+"</option>";
    				}
    				$("#city").html(str);
    			}
    		});
    	});
    	// 출발일 선택.
    	// API 항공
    	$(".tDay").click(function() {
    		var year = $("#cal_top_year").text();
    		var month = $("#cal_top_month").text();
			var day = $(this).children().eq(0).text();
			var urlstr = window.location.href;
    		var airPort = urlstr.substr(urlstr.lastIndexOf("=") +1, 3);
    		var datestr = year+month+day;
    		var overseasapiurl = "/ndsrest/overseasapi?airPort="+airPort+"&datestr="+datestr;
    		$.ajax({
    			"type" : "get",
    			"url" : overseasapiurl,
    			"headers" : {
    				"content-type" : "application/json",
    				"X-HTTP-Method-Override" : "get"
    			},
    			"success" : function(rData) {
    				console.log(rData);
    				var data = rData.response.body.items.item;
    				console.log(data);
    		var str = "";
    		if (data == null || data == "" || day == null || day == "") {
    			str += "<tr>"
    			str += "<td><h2>해당 날짜의 항공정보가 없습니다.<h2></td>"
    			str += "</tr>"
    			$("#airtable").html(str);
    		} else {
    			
	    		for (var i = 0 ; i < data.length ; i++) {
	    			
	    			var a = Math.floor(Math.random() * 430000) + 350000;
	    			var b = Math.floor(Math.random() * 340000) + 100000;
	    			var air_price_economy = Math.round(b/100)*100;
	        		var air_price_prestige = Math.round(a/100)*100;
		            str += 	 "<tr>";
		            str +=  	  "<td>"+data[i].internationalStdate+"</td>";
		            str +=  	  "<td>"+data[i].internationalEddate+"</td>";
		            str +=  	  "<td>"+data[i].airlineKorean+"</td>";
		            str +=  	  "<td>"+data[i].internationalNum+"</td>";
		            str +=  	  "<td>"+String(air_price_economy).substring(0,3)+","+String(air_price_economy).substring(3)+"원&nbsp;/&nbsp;"+String(air_price_prestige).substring(0,3)+","+String(air_price_prestige).substring(3)+"원&nbsp;</td>";
		            str +=  	 " <td><input type='radio' name='airrad' class='airchk' data-price-economy='"+air_price_economy+"' data-price-prestige='"+air_price_prestige+"'></td>";
		            str +=   "</tr>";
	           	 		$("#airtable").html(str);
	    		}
    		}	
    	}	
    });	
    		hotel_date = year+"-"+month+"-"+day;
   			// 파라미터값 한글로 받아오기
    		var nowAddress = unescape(encodeURIComponent(location.href));
            nowAddress = decodeURIComponent(nowAddress)
            //url 인덱스해서 city파라미터 값 가져오기
      		var cityurlstr = nowAddress.indexOf("&");
    		var hotel_citystr = nowAddress.substr(cityurlstr + 15, nowAddress.substr(cityurlstr + 15).indexOf("&"));
    		var data = {
    			"hotel_date" : hotel_date,
    			"hotel_city" : hotel_citystr
    		};
    		var hotelurl = "/ndsrest/selecthotel"; 
			// 데이터베이스에있는 호텔 ajax 불러오기
    		$.ajax({
    			"type" : "post",
    			"url" : hotelurl,
    			"headers" : {
    				"content-type" : "application/json",
    				"X-HTTP-Method-Override" : "post"
    			},
    			"dataType" : "text",
    			"data" : JSON.stringify(data),
    			"success" : function(rData) {
    				var	parsedJson = JSON.parse(rData);
    				console.log(parsedJson);
    				var hotelstr = "";
    				
    				for (var i = 0 ; i < parsedJson.length ; i++) {
		    	    		hotelstr += "<tr>";
		    	    		hotelstr += "<td><img src='/ndsupload/displayFile?fileName="+parsedJson[i].hotel_image+"' alt=''/></td>";
		    	    		hotelstr += "<td>"+parsedJson[i].hotel_date+"</td>";
		    	    		hotelstr += "<td>"+parsedJson[i].hotel_city+"</td>";
		    	    		hotelstr += "<td>"+parsedJson[i].hotel_name+"</td>";
		    	    		hotelstr += "<td>"+parsedJson[i].hotel_location+"</td>";
		    	    		hotelstr += "<td>"+String(parsedJson[i].price_adult).substring(0,3)+","+String(parsedJson[i].price_adult).substring(3)+"원&nbsp;/&nbsp;"+String(parsedJson[i].price_child).substring(0,2)+","+String(parsedJson[i].price_child).substring(2)+"원&nbsp;</td>";
		    	    		hotelstr += "<td><input type='radio' name='hotelrad' class='hotelchk' data-price-adult='"+parsedJson[i].price_adult+"' data-price-child='"+parsedJson[i].price_child+"'></td>";
		    	    		hotelstr += "</tr>";
			    	    		
					} 
					if (hotelstr == null || hotelstr == "") {
						hotelstr += "<tr>";
						hotelstr += "<td><h2>해당 날짜의 호텔정보가 없습니다.<h2></td>";
						hotelstr += "</tr>";
					}
    				$("#hoteltable").html(hotelstr);
    			}
    		});
    			
  });
    	// 호텔 테이블에 있는 체크를 눌렀을때 호텔 가격 텍스트 띄우기
    	$("#hoteltable").on("change",".hotelchk",function(){
			var hotel_price_adult = parseInt($(this).attr("data-price-adult"));
			var hotel_price_child = parseInt($(this).attr("data-price-child"));
			if ($(this).is(":checked")) {
				var adultnum = $("#adultnum").val();
				var childnum = $("#childnum").val();
				
				var result = (hotel_price_adult*adultnum) + (hotel_price_child*childnum);
				
				$("#hotelmoney").text("호텔 :" + result);
			}
    });
    	// 항공 테이블에 있는 체크를 눌렀을때 항공 가격 텍스트 띄우기
    	$("#airtable").on("change",".airchk",function(){
    		var air_price_economy = parseInt($(this).attr("data-price-economy"));	
    		var air_price_prestige = parseInt($(this).attr("data-price-prestige"));	
    		if ($(this).is(":checked")) {
    			var adultnum = $("#adultnum").val();
				var childnum = $("#childnum").val();
				var resultnum = parseInt(adultnum) + parseInt(childnum);
				if ($("#economyrad").is(":checked")) {
					var result = air_price_economy*resultnum;
					console.log("이코노미");
					
				} else if($("#prestigerad").is(":checked")) {
					var result = parseInt(air_price_prestige*resultnum);
					console.log("프레스티지");
				}
				
					$("#airmoney").text("항공 :" + result);
			}
    });	
    	// 가격 합계 (호텔,항공 가격 텍스트를 불러와서 가격 합산 출력)
    	function moneyresult() {
    		var hotelmoney = $("#hotelmoney").text().substring(4);
    		var airmoney = $("#airmoney").text().substring(4);
    		
    		var result = parseInt(hotelmoney) + parseInt(airmoney);
    		
    		$("#moneyval").text("합계: " + result + "원");
    	}
    	// 호텔 체크 눌렀을때 합계출력
    	$("#hoteltable").on("change",".hotelchk",function(){
    		moneyresult();
    	});
    	// 항공 체크 눌렀을때 합계출력
    	$("#airtable").on("change",".airchk",function(){
    		moneyresult();
    	});
    	// 인원 고정
    	$("#peoplelock").click(function(){
    		$("#adultnum").attr("disabled",true);
        	$("#childnum").attr("disabled",true);
    	});
    	// 인원 고정 해제
    	$("#peopleunlock").click(function(){
    		$("#adultnum").attr("disabled",false);
        	$("#childnum").attr("disabled",false);
    	});
});
</script>
<title>해외(상세정보)</title>
</head>
<body>
<!-- 헤드부분 국가,도시 출력 -->
<section class="page">
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<div class="content">
					<h1 class="page-name">해외상품 상세보기</h1>
					<ol class="breadcrumb">
					</ol>
				</div>
			</div>
		</div>
	</div>
</section>
	
<!-- 도시에 따른 이미지 출력 -->
 <div class="row mt-20">
			<div class="col-md-5">
				<div class="single-product-slider">
					<div id='carousel-custom' class='carousel slide' data-ride='carousel'>
						<div class='carousel-outer'>
							<!-- me art lab slider  위에 큰그림-->
							<div class='carousel-inner '>
								<div class='item active'>
									<img src='/ndsupload/displayFile?fileName=${overseasVo.image1}' alt='' data-zoom-image="images/shop/single-products/product-1.jpg" />
								</div>
								<div class='item'>
									<img src='/ndsupload/displayFile?fileName=${overseasVo.image2}' alt='' data-zoom-image="images/shop/single-products/product-2.jpg" />
								</div>
								
								<div class='item'>
									<img src='/ndsupload/displayFile?fileName=${overseasVo.image3}' alt='' data-zoom-image="images/shop/single-products/product-3.jpg" />
								</div>
								<div class='item'>
									<img src='/ndsupload/displayFile?fileName=${overseasVo.image4}' alt='' data-zoom-image="images/shop/single-products/product-4.jpg" />
								</div>
								<div class='item'>
									<img src='/ndsupload/displayFile?fileName=${overseasVo.image5}' alt='' data-zoom-image="images/shop/single-products/product-5.jpg" />
								</div>
								<div class='item'>
									<img src='/ndsupload/displayFile?fileName=${overseasVo.image6}' alt='' data-zoom-image="images/shop/single-products/product-6.jpg" />
								</div>
								
							</div>
							
							<!-- sag sol -->
							<a class='left carousel-control' href='#carousel-custom' data-slide='prev'>
								<i class="tf-ion-ios-arrow-left"></i>
							</a>
							<a class='right carousel-control' href='#carousel-custom' data-slide='next'>
								<i class="tf-ion-ios-arrow-right"></i>
							</a>
						</div>
						
						<!-- thumb  밑에꺼 작은 이미지 -->
						<ol class='carousel-indicators mCustomScrollbar meartlab'>
							<li data-target='#carousel-custom' data-slide-to='0' class='active'>
								<img src='/ndsupload/displayFile?fileName=${overseasVo.image1}' alt='' />
							</li>
							<li data-target='#carousel-custom' data-slide-to='1'>
								<img src="/ndsupload/displayFile?fileName=${overseasVo.image2}" alt='1' />	
							</li>
							<li data-target='#carousel-custom' data-slide-to='2'>
								<img src='/ndsupload/displayFile?fileName=${overseasVo.image3}' alt='' />
							</li>
							<li data-target='#carousel-custom' data-slide-to='3'>
								<img src='/ndsupload/displayFile?fileName=${overseasVo.image4}' alt='' />
							</li>
							<li data-target='#carousel-custom' data-slide-to='4'>
								<img src='/ndsupload/displayFile?fileName=${overseasVo.image5}' alt='' />
							</li>
							<li data-target='#carousel-custom' data-slide-to='5'>
								<img src='/ndsupload/displayFile?fileName=${overseasVo.image6}' alt='' />
							</li>
						</ol>
					</div>
				</div>
			</div>
			<div class="col-md-4">
				<div class="single-product-details">
					 <div class="container-fluid">
				</div>
			</div>
			<!-- 캘린더 출력 부분 -->
			<div class="row">
				<div class="col-md-6">
					<h4>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;운행기간 선택</h4>
					 <div class="cal_top">
				        <a href="#" id="movePrevMonth"><span id="prevMonth" class="cal_tit" style="">&lt;</span></a>
				        <span id="cal_top_year"></span>
				        <span id="cal_top_month"></span>
				        <a href="#" id="moveNextMonth"><span id="nextMonth" class="cal_tit">&gt;</span></a>
    				</div>
    			<div id="cal_tab" class="cal">
    		</div>
				
				</div>

				</div>	
			</div>
				<!-- 인원 체크하는 부분 -->
					<div class="col-md-3">
					<div class="single-product-details">
					<h4>인원 <br>(항공은 유아와 성인 가격이 같습니다)</h4>
					<p>성인 : <input type="number" value="1"
									min="0" max="30" class="peopleNum" id="adultnum"></p>
					<p>유아 : <input type="number" value="0"
									min="0" max="30" class="peopleNum" id="childnum"></p>
					<a class="btn btn-main mt-10" id="peoplelock">인원 고정</a>
					<a class="btn btn-main mt-10" id="peopleunlock">고정 해제</a>
					<h4>항공석 : 이코노미<input type="radio" name="airclass" id="economyrad" checked="checked"> 프레스티지<input type="radio" name="airclass" id="prestigerad"></h4>
									
					<h3 id="hotelmoney">호텔 : 0</h3>
					<h3 id="airmoney">항공 : 0</h3>
					<h3 id="moneyval">합계 : 0</h3>
					<a class="btn btn-main mt-20">스케쥴 등록</a>
					
			</div>
		</div>
		
		<!-- 항공, 호텔 테이블 탭 -->
		<div class="row">
			<div class="col-xs-12">
				<div class="tabCommon mt-20">
					<ul class="nav nav-tabs">
						<li class="active"><a data-toggle="tab" href="#a" aria-expanded="true">항공정보</a></li>
						<li class=""><a data-toggle="tab" href="#b" aria-expanded="false">호텔정보</a></li>
					</ul>
					<!-- 항공탭 -->
					<div class="tab-content patternbg">
						<div id="a" class="tab-pane fade active in">
						<h3>항공정보</h3>
							<div class="media-body">
								 <div class="comment-info">
								     <div class="dashboard-wrapper user-dashboard">
          <div class="table-responsive">
         <table class="table">
           <thead>
              <tr>
     	  		 <th>운항 시작일</th>
     	  		 <th>운항 종료일</th>
      	 		 <th>항공</th>
      	 		 <th>항공편</th>
       	  		 <th>가격 이코노미&nbsp;/&nbsp;프레스티지&nbsp;</th>
        		 <th>선택</th>
          	     <th></th>
              </tr>
          </thead>
          	<tbody id="airtable">
          	
          	</tbody>
         </table>
          </div>
        </div>
        <div class="container-fluid">
	<div class="row">
		<div class="col-md-12" >
			<nav>
				<ul class="pagination">
					<li class="page-item">
						<a class="page-link" href="#">1</a>
					</li>
					<li class="page-item">
						<a class="page-link" href="#">2</a>
					</li>
					<li class="page-item">
						<a class="page-link" href="#">3</a>
					</li>
					<li class="page-item">
						<a class="page-link" href="#">4</a>
					</li>
					<li class="page-item">
						<a class="page-link" href="#">5</a>
					</li>
					<li class="page-item">
						<a class="page-link" href="#">&gt;</a>
					</li>
				</ul>
			</nav>
		</div>
	</div>
</div>
		</div>	
	</div>						
</div>
		<!--  호텔탭 -->
						<div id="b" class="tab-pane fade">
							<div class="post-comments">
								<h3>호텔정보</h3>
								    <!-- Comment Item start-->
								        <div class="media-body">
								            <div class="comment-info">
								              	<div class="dashboard-wrapper user-dashboard">
            <table class="table">
              <thead>
                <tr>
                  <th>호텔 사진</th>
                  <th>체크인 날짜</th>
                  <th>도시</th>
                  <th>호텔 이름</th>
                  <th>위치</th>
                  <th>가격 성인&nbsp;/&nbsp;유아&nbsp;</th>
                  <th>선택</th>
                </tr>
              </thead>
              <tbody id="hoteltable">
                
              </tbody>
            </table>
          </div>
        </div>
        <div class="container-fluid">
	<div class="row">
		<div class="col-md-12" >
			<nav>
				<ul class="pagination">
					<li class="page-item">
						<a class="page-link" href="#">1</a>
					</li>
					<li class="page-item">
						<a class="page-link" href="#">2</a>
					</li>
					<li class="page-item">
						<a class="page-link" href="#">3</a>
					</li>
					<li class="page-item">
						<a class="page-link" href="#">4</a>
					</li>
					<li class="page-item">
						<a class="page-link" href="#">5</a>
					</li>
					<li class="page-item">
						<a class="page-link" href="#">&gt;</a>
					</li>
				</ul>
			</nav>
		</div>
	</div>
</div>
								        </div>
									</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>


    
    
    
    
    
    <%@ include file="../include/nds/ndsfooter.jsp" %>
</body>
</html>