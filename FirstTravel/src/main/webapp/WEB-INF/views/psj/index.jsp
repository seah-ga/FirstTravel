<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
<!--  JQUERy & BOOTSTRAP CDN -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>

<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script>
	$(document)
			.ready(
					function() {
						$("#btn-test")
								.click(
										function() {
											var url = "/airport/test";
											console.log("클릭");
											$
													.ajax({
														"type" : "get",

														"url" : url,
														"headers" : {
															"Content-Type" : "application/json",
															"X-HTTP-Method-Override" : "get"

														},

														"success" : function(
																rData) {
															console.log("성공");
															console
																	.log(rData.response.body.items.item);
															var data = rData.response.body.items.item;
															var strLi = "";
															$(data)
																	.each(
																			function() {
																				console
																						.log("data : "
																								+ this.economyCharge);
																				var economyCharge = "";
																				if (this.economyCharge != null
																						&& this.prestigeCharge != "undefined"
																						&& this.economyCharge != 0) {
																					economyCharge = this.economyCharge;
																					console
																							.log("if");
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
																				strLi += "<tr>";
																				strLi += "<td>"
																						+ this.airlineNm
																						+ "</td>";
																				strLi += "<td>"
																						+ this.depPlandTime
																						+ "</td>";
																				strLi += "<td>"
																						+ this.arrPlandTime
																						+ "</td>";
																				strLi += "<td>"
																						+ economyCharge
																						+ "</td>";
																				strLi += "<td>"
																						+ prestigeCharge
																						+ "</td>"
																						+ "</tr>";
																			});
															console.log(strLi);
															$("#airInfo").html(
																	strLi);
														}

													});
											// 			console.log("클릭됨");
											// 			console.log("222")
											// 			$.getJSON(url, function(rData) {
											// 				console.log("ㅇㅇ");
											// 				console.log(rData);
											// 			});

										});
					});
</script>

<style type="text/css">
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
<script>
	function change(num) {
		var x = document.form;
		var y = Number(x.count.value) + num;
		if (y < 1)
			y = 1;
		x.count.value = y;
	}

	function scroll_follow(id) {
		$(window).scroll(function() //스크롤이 움직일때마다 
		{
			var position = $(window).scrollTop(); // 크롤바의 위치값을 반환
			$(id).stop().animate({
				top : position + "px"
			}, 1); //해당 오브젝트 위치값 재설정
		});
	}
	scroll_follow("#scroll");
</script>
</head>
<body>
	<!-- Preloader Starts -->
	<div class="preloader">
		<div class="spinner"></div>
	</div>
	<!-- Preloader End -->

	<!-- Header Area Starts -->
	<header class="header-area main-header">
		<div class="container">
			<div class="row">
				<div class="col-lg-2">
					<div class="logo-area">
						<a href="index.html"><img src="assets/images/logo.png"
							alt="logo"></a>
					</div>

				</div>
				<div class="col-lg-10">
					<div class="custom-navbar">
						<span></span> <span></span> <span></span>
					</div>
					<div class="main-menu">
						<ul>
							<li class="active"><a href="index.html">home</a></li>
							<li><a href="about.html">about us</a></li>
							<li><a href="job-category.html">category</a></li>
							<li><a href="#">blog</a>
								<ul class="sub-menu">
									<li><a href="blog-home.html">Blog Home</a></li>
									<li><a href="blog-details.html">Blog Details</a></li>
								</ul></li>
							<li><a href="contact-us.html">contact</a></li>
							<li><a href="#">pages</a>
								<ul class="sub-menu">
									<li><a href="job-search.html">Job Search</a></li>
									<li><a href="job-single.html">Job Single</a></li>
									<li><a href="pricing-plan.html">Pricing Plan</a></li>
									<li><a href="elements.html">Elements</a></li>
								</ul></li>
							<li class="menu-btn"><a href="#" class="login">log in</a> <a
								href="#" class="template-btn">sign up</a></li>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</header>
	<!-- Header Area End -->

	<!-- Banner Area Starts -->
	<section class="banner-area">
		<div class="container-fluid">
			<div class="row">
				<div class="col-lg-6 px-0">
					<div class="banner-bg"></div>
				</div>
				<div class="col-lg-6 align-self-center">
					<div class="banner-text">
						<h1>
							find your dream <span>job</span> with comport
						</h1>
						<p class="py-3">Wherein herb beginning. Moved after gathering.
							Sea hi crate fowl man replenish place divided likeness herb one
							two lnetn Winged moving saw, may over.</p>
						<a href="#" class="secondary-btn">explore now<span
							class="flaticon-next"></span></a>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- Banner Area End -->

	<!-- Search Area Starts -->
	<div class="search-area">
		<div class="search-bg">
			<div class="container">
				<div class="row">
					<div class="col-lg-12">
						<form action="#" class="d-md-flex justify-content-between">
							<select>
								<option value="1">All Category</option>
								<option value="2">Part Time</option>
								<option value="3">Full Time</option>
								<option value="4">Remote</option>
								<option value="5">Office Job</option>
							</select> <select>
								<option value="1">Select Location</option>
								<option value="2">Dhaka</option>
								<option value="3">Rajshahi</option>
								<option value="4">Barishal</option>
								<option value="5">Noakhali</option>
							</select> <input type="text" placeholder="Search Keyword"
								onfocus="this.placeholder = ''"
								onblur="this.placeholder = 'Search Keyword'" required>
							<button type="submit" class="template-btn">find job</button>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- Search Area End -->

	<!-- Feature Area Starts -->
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
									min="0" max="15" class="peopleNum">
								</td>
								<td><span>100000</span>원</td>

							</tr>
							<tr class="table-active">
								<td>유아 &nbsp;&nbsp;&nbsp; <input type="number" value="0"
									min="0" max="15" class="peopleNum">
								</td>
								<td><span>50000</span>원</td>
							</tr>
						</table>
					</div>
					<div class="col-md-12">
						<p class="sumPrice">총 예정 금액 :</p>
					</div>
					<div class="col-md-6">
						<input type="button" value="장바구니" class="btn-warning  btn-block">
					</div>
					<div class="col-md-6">
						<input type="button" value="결제하기" class="btn-primary  btn-block"
							id="btn-test">
					</div>
				</div>
			</div>

		</div>
	</section>
	<!-- Feature Area End -->

	<!-- Category Area Starts -->
	<section class="category-area section-padding">
		<div class="container">
			<div class="container-fluid">
				<div class="row">
					
					<div class="col-md-4">
						<select class="city">
							<option>출발도시</option>
							<c:forEach var="CityVo" items="${cityList}">
							<option value="${CityVo.airport}">${CityVo.domestic_city}</option>
							</c:forEach>
						</select>
						
						
					</div>
					<div class="col-md-4">
						<select class="city">
							<option>도착도시</option>
							<c:forEach var="CityVo" items="${cityList}">
							<option value="${CityVo.airport}">${CityVo.domestic_city}</option>
							</c:forEach>
						</select>
						
					
					</div>
					<div class="col-md-4">
					<input type="button" class="btn-outline-danger btn-lg" id="btn_searchAir" value="검색">
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
	</section>
	<!-- Category Area End -->

	<!-- Jobs Area Starts -->
	<section class="jobs-area section-padding3">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="jobs-title">
						<h2>Browse recent jobs</h2>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-lg-12">
					<div class="jobs-tab tab-item">
						<ul class="nav nav-tabs" id="myTab" role="tablist">
							<li class="nav-item"><a class="nav-link active"
								id="home-tab" data-toggle="tab" href="#recent" role="tab"
								aria-controls="home" aria-selected="true">recent</a></li>
							<li class="nav-item"><a class="nav-link" id="profile-tab"
								data-toggle="tab" href="#full-time" role="tab"
								aria-controls="profile" aria-selected="false">full time</a></li>
							<li class="nav-item"><a class="nav-link" id="contact-tab"
								data-toggle="tab" href="#part-time" role="tab"
								aria-controls="part-time" aria-selected="false">part time</a></li>
							<li class="nav-item"><a class="nav-link" id="contact-tab2"
								data-toggle="tab" href="#intern" role="tab"
								aria-controls="intern" aria-selected="false">intern</a></li>
						</ul>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-lg-12">
					<div class="tab-content" id="myTabContent">
						<div class="tab-pane fade show active" id="recent" role="tabpanel"
							aria-labelledby="home-tab">
							<div class="single-job mb-4 d-lg-flex justify-content-between">
								<div class="job-text">
									<h4>Assistant Executive - Production/ Quality Control</h4>
									<ul class="mt-4">
										<li class="mb-3"><h5>
												<i class="fa fa-map-marker"></i> new yourk, USA
											</h5></li>
										<li class="mb-3"><h5>
												<i class="fa fa-pie-chart"></i> Applied Chemistry & Chemical
												Engineering / Chemistry
											</h5></li>
										<li><h5>
												<i class="fa fa-clock-o"></i> Deadline Deadline: Dec 11,
												2018
											</h5></li>
									</ul>
								</div>
								<div class="job-img align-self-center">
									<img src="assets/images/job1.png" alt="job">
								</div>
								<div class="job-btn align-self-center">
									<a href="#" class="third-btn job-btn1">full time</a> <a
										href="#" class="third-btn">apply</a>
								</div>
							</div>
						</div>
						<div class="tab-pane fade" id="full-time" role="tabpanel"
							aria-labelledby="profile-tab">
							<div class="single-job mb-4 d-lg-flex justify-content-between">
								<div class="job-text">
									<h4>Asst. Manager, Production (Woven Dyeing)</h4>
									<ul class="mt-4">
										<li class="mb-3"><h5>
												<i class="fa fa-map-marker"></i> new yourk, USA
											</h5></li>
										<li class="mb-3"><h5>
												<i class="fa fa-pie-chart"></i> Applied Chemistry & Chemical
												Engineering / Chemistry
											</h5></li>
										<li><h5>
												<i class="fa fa-clock-o"></i> Deadline Deadline: Dec 11,
												2018
											</h5></li>
									</ul>
								</div>
								<div class="job-img align-self-center">
									<img src="assets/images/job2.png" alt="job">
								</div>
								<div class="job-btn align-self-center">
									<a href="#" class="third-btn job-btn2">full time</a> <a
										href="#" class="third-btn">apply</a>
								</div>
							</div>
						</div>
						<div class="tab-pane fade" id="part-time" role="tabpanel"
							aria-labelledby="contact-tab">
							<div class="single-job mb-4 d-lg-flex justify-content-between">
								<div class="job-text">
									<h4>Deputy Manager/ Assistant Manager - Footwear</h4>
									<ul class="mt-4">
										<li class="mb-3"><h5>
												<i class="fa fa-map-marker"></i> new yourk, USA
											</h5></li>
										<li class="mb-3"><h5>
												<i class="fa fa-pie-chart"></i> Applied Chemistry & Chemical
												Engineering / Chemistry
											</h5></li>
										<li><h5>
												<i class="fa fa-clock-o"></i> Deadline Deadline: Dec 11,
												2018
											</h5></li>
									</ul>
								</div>
								<div class="job-img align-self-center">
									<img src="assets/images/job3.png" alt="job">
								</div>
								<div class="job-btn align-self-center">
									<a href="#" class="third-btn job-btn3">full time</a> <a
										href="#" class="third-btn">apply</a>
								</div>
							</div>
						</div>
						<div class="tab-pane fade" id="intern" role="tabpanel"
							aria-labelledby="contact-tab2s">
							<div class="single-job mb-4 d-lg-flex justify-content-between">
								<div class="job-text">
									<h4>R&D Manager (Technical Lab Department)</h4>
									<ul class="mt-4">
										<li class="mb-3"><h5>
												<i class="fa fa-map-marker"></i> new yourk, USA
											</h5></li>
										<li class="mb-3"><h5>
												<i class="fa fa-pie-chart"></i> Applied Chemistry & Chemical
												Engineering / Chemistry
											</h5></li>
										<li><h5>
												<i class="fa fa-clock-o"></i> Deadline Deadline: Dec 11,
												2018
											</h5></li>
									</ul>
								</div>
								<div class="job-img align-self-center">
									<img src="assets/images/job4.png" alt="job">
								</div>
								<div class="job-btn align-self-center">
									<a href="#" class="third-btn job-btn4">full time</a> <a
										href="#" class="third-btn">apply</a>
								</div>
							</div>
						</div>
					</div>
					<!-- <div class="single-job d-lg-flex justify-content-between">
                        <div class="job-text">
                            <h4>Manager/ Asst. Manager (Quality Assurance)</h4>
                            <ul class="mt-4">
                                <li class="mb-3"><h5><i class="fa fa-map-marker"></i> new yourk, USA</h5></li>
                                <li class="mb-3"><h5><i class="fa fa-pie-chart"></i> Applied Chemistry & Chemical Engineering / Chemistry</h5></li>
                                <li><h5><i class="fa fa-clock-o"></i> Deadline Deadline: Dec 11, 2018</h5></li>
                            </ul>
                        </div>
                        <div class="job-img align-self-center">
                            <img src="assets/images/job5.png" alt="job">
                        </div>
                        <div class="job-btn align-self-center">
                            <a href="#" class="third-btn job-btn2">full time</a>
                            <a href="#" class="third-btn">apply</a>
                        </div>
                    </div> -->
				</div>
			</div>
			<div class="more-job-btn mt-5 text-center">
				<a href="#" class="template-btn">more job post</a>
			</div>
		</div>
	</section>
	<!-- Jobs Area End -->

	<!-- Newsletter Area Starts -->
	<section class="newsletter-area section-padding">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="section-top text-center">
						<h2>Get job information daily</h2>
						<p>Subscribe to our newsletter and get a coupon code!</p>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-lg-12">
					<form action="#">
						<input type="email" placeholder="Your email here"
							onfocus="this.placeholder = ''"
							onblur="this.placeholder = 'Your email here'" required>
						<button type="submit" class="template-btn">subscribe now</button>
					</form>
				</div>
			</div>
		</div>
	</section>
	<!-- Newsletter Area End -->

	<!-- Employee Area Starts -->
	<section class="employee-area section-padding">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="section-top text-center">
						<h2>Happy employee</h2>
						<p>Open lesser winged midst wherein may morning</p>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-lg-12">
					<div class="employee-slider owl-carousel">
						<div class="single-slide d-sm-flex">
							<div class="slide-img employee1">
								<div class="hover-state">
									<div class="hover-text text-center">
										<h3>david aron</h3>
										<h5>Facebook</h5>
									</div>
								</div>
							</div>
							<div class="slide-text align-self-center">
								<i class="fa fa-quote-left"></i>
								<p>Appear, called day. Sixth two after eve moved called
									winged very heaven two lights let all third gathered.</p>
							</div>
						</div>
						<div class="single-slide d-sm-flex">
							<div class="slide-img employee2">
								<div class="hover-state">
									<div class="hover-text text-center">
										<h3>david aron</h3>
										<h5>Twitter</h5>
									</div>
								</div>
							</div>
							<div class="slide-text align-self-center">
								<i class="fa fa-quote-left"></i>
								<p>Appear, called day. Sixth two after eve moved called
									winged very heaven two lights let all third gathered.</p>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- Employee Area End -->

	<!-- News Area Starts -->
	<section id="blog" class="news-area section-padding3">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="section-top text-center">
						<h2>Company latest news</h2>
						<p>Open lesser winged midst wherein may morning</p>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-lg-4 col-md-6">
					<div class="single-news mb-5 mb-lg-0">
						<div class="news-img news-img1"></div>
						<div class="news-tag">
							<ul class="my-4">
								<li><h5>
										<i class="fa fa-calendar-o"></i> 20th sep, 2018
									</h5></li>
								<li class="separator mx-2"><span></span></li>
								<li><h5>
										<i class="fa fa-folder-open-o"></i> company
									</h5></li>
							</ul>
						</div>
						<div class="news-title">
							<h4>
								<a href="#">Lime recalls electric scooters over battery
									fire.</a>
							</h4>
						</div>
					</div>
				</div>
				<div class="col-lg-4 col-md-6">
					<div class="single-news mb-5 mb-lg-0">
						<div class="news-img news-img2"></div>
						<div class="news-tag">
							<ul class="my-4">
								<li><h5>
										<i class="fa fa-calendar-o"></i> 18th sep, 2018
									</h5></li>
								<li class="separator mx-2"><span></span></li>
								<li><h5>
										<i class="fa fa-folder-open-o"></i> company
									</h5></li>
							</ul>
						</div>
						<div class="news-title">
							<h4>
								<a href="#">Apple resorts to promo deals trade to boost</a>
							</h4>
						</div>
					</div>
				</div>
				<div class="col-lg-4 col-md-6">
					<div class="single-news">
						<div class="news-img news-img3"></div>
						<div class="news-tag">
							<ul class="my-4">
								<li><h5>
										<i class="fa fa-calendar-o"></i> 25th sep, 2018
									</h5></li>
								<li class="separator mx-2"><span></span></li>
								<li><h5>
										<i class="fa fa-folder-open-o"></i> company
									</h5></li>
							</ul>
						</div>
						<div class="news-title">
							<h4>
								<a href="#">Lime recalls electric scooters over battery
									fire.</a>
							</h4>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- News Area End -->

	<!-- Download Area Starts -->
	<section class="download-area section-padding">
		<div class="container-fluid">
			<div class="row">
				<div class="col-lg-6">
					<div class="download-text">
						<h2>Download the app your mobile today</h2>
						<p class="py-3">Light earth also land can't. May you midst
							shall lights blessed in lights Have gathered image morning
							blessed grass him. Appear female rule all seas she'd winged</p>
						<div
							class="download-button d-sm-flex flex-row justify-content-start">
							<div class="download-btn mb-3 mb-sm-0 flex-row d-flex">
								<i class="fa fa-apple" aria-hidden="true"></i> <a href="#">
									<p>
										<span>Available</span> <br> on App Store
									</p>
								</a>
							</div>
							<div class="download-btn dark flex-row d-flex">
								<i class="fa fa-android" aria-hidden="true"></i> <a href="#">
									<p>
										<span>Available</span> <br> on Play Store
									</p>
								</a>
							</div>
						</div>
					</div>
				</div>
				<div class="col-lg-6 pr-0">
					<div class="download-img"></div>
				</div>
			</div>
		</div>
	</section>
	<!-- Download Area End -->

	<!-- Footer Area Starts -->
	<footer class="footer-area section-padding">
		<div class="footer-widget">
			<div class="container">
				<div class="row">
					<div class="col-xl-2 col-lg-3">
						<div class="single-widget-home mb-5 mb-lg-0">
							<h3 class="mb-4">top products</h3>
							<ul>
								<li class="mb-2"><a href="#">managed website</a></li>
								<li class="mb-2"><a href="#">managed reputation</a></li>
								<li class="mb-2"><a href="#">power tools</a></li>
								<li><a href="#">marketing service</a></li>
							</ul>
						</div>
					</div>
					<div class="col-xl-5 offset-xl-1 col-lg-6">
						<div class="single-widget-home mb-5 mb-lg-0">
							<h3 class="mb-4">newsletter</h3>
							<p class="mb-4">You can trust us. we only send promo offers,
								not a single.</p>
							<form action="#">
								<input type="email" placeholder="Your email here"
									onfocus="this.placeholder = ''"
									onblur="this.placeholder = 'Your email here'" required>
								<button type="submit" class="template-btn">subscribe
									now</button>
							</form>
						</div>
					</div>
					<div class="col-xl-3 offset-xl-1 col-lg-3">
						<div class="single-widge-home">
							<h3 class="mb-4">instagram feed</h3>
							<div class="feed">
								<img src="assets/images/feed1.jpg" alt="feed"> <img
									src="assets/images/feed2.jpg" alt="feed"> <img
									src="assets/images/feed3.jpg" alt="feed"> <img
									src="assets/images/feed4.jpg" alt="feed"> <img
									src="assets/images/feed5.jpg" alt="feed"> <img
									src="assets/images/feed6.jpg" alt="feed"> <img
									src="assets/images/feed7.jpg" alt="feed"> <img
									src="assets/images/feed8.jpg" alt="feed">
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="footer-copyright">
			<div class="container">
				<div class="row">
					<div class="col-lg-8 col-md-6">
						<span>
							<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
							Copyright &copy;<script>
								document.write(new Date().getFullYear());
							</script>
							All rights reserved | This template is made with <i
							class="fa fa-heart-o" aria-hidden="true"></i> by <a
							href="https://colorlib.com" target="_blank">Colorlib</a> <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
						</span>
					</div>
					<div class="col-lg-4 col-md-6">
						<div class="social-icons">
							<ul>
								<li><a href="#"><i class="fa fa-facebook"></i></a></li>
								<li><a href="#"><i class="fa fa-twitter"></i></a></li>
								<li><a href="#"><i class="fa fa-dribbble"></i></a></li>
								<li><a href="#"><i class="fa fa-behance"></i></a></li>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</div>
	</footer>
	<!-- Footer Area End -->
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
			$("#movePrevMonth").on("click", function() {
				movePrevMonth();
			});
			$("#moveNextMonth").on("click", function() {
				moveNextMonth();
			});
			
			$(".tDay").click(function() {
				var day = $(this).children().eq(0).text();
				console.log(day);
			});
			
		});

		//calendar 그리기
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
	</script>

	<script>
		
	</script>
	<!-- Javascript -->
	<script src="/resources/psj/assets/js/vendor/jquery-2.2.4.min.js"></script>
	<script src="/resources/psj/assets/js/vendor/bootstrap-4.1.3.min.js"></script>
	<script src="/resources/psj/assets/js/vendor/wow.min.js"></script>
	<script src="/resources/psj/assets/js/vendor/owl-carousel.min.js"></script>
	<script src="/resources/psj/assets/js/vendor/jquery.nice-select.min.js"></script>
	<script src="/resources/psj/assets/js/vendor/ion.rangeSlider.js"></script>
	<script src="/resources/psj/assets/js/main.js"></script>
</body>
</html>