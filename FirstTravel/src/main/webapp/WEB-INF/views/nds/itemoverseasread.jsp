<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="../include/nds/search.jsp" %>
<!DOCTYPE html>
<html>
<head>
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
<script type="text/javascript">
    
    var today = null;
    var year = null;
    var month = null;
    var firstDay = null;
    var lastDay = null;
    var $tdDay = null;
    var $tdSche = null;
 
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
                setTableHTML+='<td style="text-overflow:ellipsis;overflow:hidden;white-space:nowrap">';
                setTableHTML+='    <div class="cal-day"></div>';
                setTableHTML+='    <div class="cal-schedule"></div>';
                setTableHTML+='</td>';
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
</script>
<title>해외(상세정보)</title>
</head>
<body>
<section class="page-header">
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<div class="content">
					<h1 class="page-name">일본</h1>
				</div>
			</div>
		</div>
	</div>
	
</section>
 <div class="row mt-20">
			<div class="col-md-5">
				<div class="single-product-slider">
					<div id='carousel-custom' class='carousel slide' data-ride='carousel'>
						<div class='carousel-outer'>
							<!-- me art lab slider  위에 큰그림-->
							<div class='carousel-inner '>
								<div class='item active'>
									<img src='/resources/nds/images/portfolio/a.jpg' alt='' data-zoom-image="images/shop/single-products/product-1.jpg" />
								</div>
								<div class='item'>
									<img src='/resources/nds/images/portfolio/a.jpg' alt='' data-zoom-image="images/shop/single-products/product-2.jpg" />
								</div>
								
								<div class='item'>
									<img src='/resources/nds/images/portfolio/a.jpg' alt='' data-zoom-image="images/shop/single-products/product-3.jpg" />
								</div>
								<div class='item'>
									<img src='/resources/nds/images/portfolio/a.jpg' alt='' data-zoom-image="images/shop/single-products/product-4.jpg" />
								</div>
								<div class='item'>
									<img src='/resources/nds/images/portfolio/a.jpg' alt='' data-zoom-image="images/shop/single-products/product-5.jpg" />
								</div>
								<div class='item'>
									<img src='/resources/nds/images/portfolio/a.jpg' alt='' data-zoom-image="images/shop/single-products/product-6.jpg" />
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
						
						<!-- thumb  밑에꺼 -->
						<ol class='carousel-indicators mCustomScrollbar meartlab'>
							<li data-target='#carousel-custom' data-slide-to='0' class='active'>
								<img src='/resources/nds/images/portfolio/a.jpg' alt='' />
							</li>
							<li data-target='#carousel-custom' data-slide-to='1'>
								<img src='/192.168.0.127/shared/upload_team2/test2.jpg' alt='u' />
							</li>
							<li data-target='#carousel-custom' data-slide-to='2'>
								<img src='/resources/nds/images/portfolio/a.jpg' alt='' />
							</li>
							<li data-target='#carousel-custom' data-slide-to='3'>
								<img src='/resources/nds/images/portfolio/a.jpg' alt='' />
							</li>
							<li data-target='#carousel-custom' data-slide-to='4'>
								<img src='/resources/nds/images/portfolio/a.jpg' alt='' />
							</li>
							<li data-target='#carousel-custom' data-slide-to='5'>
								<img src='/resources/nds/images/portfolio/a.jpg' alt='' />
							</li>
							<li data-target='#carousel-custom' data-slide-to='6'>
								<img src='/resources/nds/images/portfolio/a.jpg' alt='' />
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
			
			<div class="row">
				<div class="col-md-6">
					<h4>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;출발일 선택</h4>
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
					<div class="col-md-3">
					<div class="single-product-details">
					<h4>인원</h4>
					<p>성인 : <input type="number"></p>
					<p>아동 : <input type="number"></p>
					<p>유아 : <input type="number"></p>
					<h3>합산 : 600.000원</h3>
					<a href="" class="btn btn-main mt-20">장바구니</a>
					<a href="" class="btn btn-main mt-20">결제</a>
			</div>
		</div>
		<div class="row">
			<div class="col-xs-12">
				<div class="tabCommon mt-20">
					<ul class="nav nav-tabs">
						<li class="active"><a data-toggle="tab" href="#a" aria-expanded="true">항공정보</a></li>
						<li class=""><a data-toggle="tab" href="#b" aria-expanded="false">호텔정보</a></li>
					</ul>
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
                  <th>출발/도착</th>
                  <th>항공</th>
                  <th>가격 성인&nbsp;/&nbsp;유아&nbsp;/&nbsp;아동</th>
                  <th>선택</th>
                  <th></th>
                </tr>
              </thead>
              <tbody>
                <tr>
                  <td>06/24 (월)20:40 <br>~ 06/28 (금)09:20</td>
                  <td>제주 항공</td>
                  <td>100.500원&nbsp;/&nbsp;20000원&nbsp;/&nbsp;60474원</td>
                  <td><input type="checkbox"></td>
                </tr>
                <tr>
                  <td>06/24 (월)20:40 <br>~ 06/28 (금)09:20</td>
                  <td>제주 항공</td>
                  <td>100.000원&nbsp;/&nbsp;200.000원&nbsp;/&nbsp;300.000원</td>
                  <td><input type="checkbox"></td>
                </tr>
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
						<a class="page-link" href="#">&lt;</a>
					</li>
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
                  <th>체크인/체크아웃</th>
                  <th>호텔명</th>
                  <th>가격 성인&nbsp;/&nbsp;유아&nbsp;/&nbsp;아동</th>
                  <th>선택</th>
                  <th></th>
                </tr>
              </thead>
              <tbody>
                <tr>
                  <td>06/24 (월)20:40 <br>~ 06/28 (금)09:20</td>
                  <td>메메메호텔</td>
                  <td>100.500원&nbsp;/&nbsp;20000원&nbsp;/&nbsp;60474원</td>
                  <td><input type="checkbox"></td>
                </tr>
                <tr>
                  <td>06/24 (월)20:40 <br>~ 06/28 (금)09:20</td>
                  <td>에에에호텔</td>
                  <td>100.500원&nbsp;/&nbsp;20000원&nbsp;/&nbsp;60474원</td>
                  <td><input type="checkbox"></td>
                </tr>
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
						<a class="page-link" href="#">&lt;</a>
					</li>
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