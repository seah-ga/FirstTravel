<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<!-- header -->
<!DOCTYPE html>
<html lang="en">
  <head>
    <title>First Travel &mdash; Colorlib Website Template</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Poppins:200,300,400,700,900|Display+Playfair:200,300,400,700"> 
    <link rel="stylesheet" href="/resources/ljh/fonts/icomoon/style.css">

    <link rel="stylesheet" href="/resources/ljh/css/bootstrap.min.css">
    <link rel="stylesheet" href="/resources/ljh/css/magnific-popup.css">
    <link rel="stylesheet" href="/resources/ljh/css/jquery-ui.css">
    <link rel="stylesheet" href="/resources/ljh/css/owl.carousel.min.css">
    <link rel="stylesheet" href="/resources/ljh/css/owl.theme.default.min.css">

    <link rel="stylesheet" href="/resources/ljh/css/bootstrap-datepicker.css">

    <link rel="stylesheet" href="/resources/ljh/fonts/flaticon/font/flaticon.css">

    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/mediaelement@4.2.7/build/mediaelementplayer.min.css">


    <link rel="stylesheet" href="/resources/ljh/css/aos.css">

    <link rel="stylesheet" href="/resources/ljh/css/style.css">
    
    <!-- 추가된 투어css-->
<!--       <link rel="stylesheet" type="text/css" href="http://image1.hanatour.com/2010/css/smoothness/jquery-ui-1.8.4.custom.css">  -->
<!--      <link rel="stylesheet" type="text/css" href="http://image1.hanatour.com/2010/css/jquery-ui.hanatour.css">   -->
<!--     <link rel="stylesheet" type="text/css" href="//www.hanatour.com/_css/hana/common/tnb.css">   -->
<!--      <link rel="stylesheet" type="text/css" href="//www.hanatour.com/_css/2011/hanatour.css"><script type="text/javascript" src="//www.hanatour.com/_script/util/jquery-1.8.3.min.js"></script>   -->

<link rel="stylesheet" type="text/css" href="//www.tour2000.co.kr/css/reset.css?ver=20181226" />
	<link rel="stylesheet" type="text/css" href="//www.tour2000.co.kr/css/swiper.min.css">
	<link rel="stylesheet" type="text/css" href="//www.tour2000.co.kr/css/jquery-ui.css" />
	<link rel="stylesheet" type="text/css" href="//www.tour2000.co.kr/css/component.css?ver=20190611" />
	<link rel="stylesheet" type="text/css" href="//www.tour2000.co.kr/css/common.css?ver=20181226" />
	<link rel="stylesheet" type="text/css" href="//www.tour2000.co.kr/css/main.css?ver=20181226" />
	<script type="text/javascript" src="//www.tour2000.co.kr/js/jquery/jquery-1.12.4.min.js"></script>
	<script type="text/javascript" src="//www.tour2000.co.kr/js/jquery.form.js"></script>
	<script type="text/javascript" src="//www.tour2000.co.kr/js/jquery.dotdotdot.min.js"></script>
	<script type="text/javascript" src="//www.tour2000.co.kr/js/jquery-ui.js"></script>
	<script type="text/javascript" src="//www.tour2000.co.kr/js/swipe/swiper.jquery.min.js"></script>


    <script type="text/javascript" src="//www.tour2000.co.kr/js/tweenmax/TweenMax.min.js"></script>
	<script type="text/javascript" src="//www.tour2000.co.kr/js/common.js?ver=20181122"></script>
	<script type="text/javascript" src="//www.tour2000.co.kr/js/json2.js?ver=20171220"></script>
	<script type="text/javascript" src="//www.tour2000.co.kr/js/utils.js?ver=20171220"></script>
	<script type="text/javascript" src="//www.tour2000.co.kr/js/main.js?ver=20181121"></script>
	
	<!-- 부트스트랩 cdn -->
 	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">											 
 	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>											
 	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>		
	
 
 
  </head>
  
  
  <body>
   
  <div class="site-wrap">

    <div class="site-mobile-menu">
      <div class="site-mobile-menu-header">
        <div class="site-mobile-menu-close mt-3">
          <span class="icon-close2 js-menu-toggle"></span>
        </div>
      </div>
      <div class="site-mobile-menu-body"></div>
    </div>
    
    <header class="site-navbar py-1" role="banner">

      <div class="container">
        <div class="row align-items-left">
          
          <div class="topAreaWrap">
            <h1 class="mb-0"><a href="index.html" class="text-black h2 mb-0">First Travel</a></h1>
            
<!--             <div class="topAreaSch" > -->
<!-- 			<input type="text" name="total_keyword"  value="[오키나와] 일본의 하와이"  data-link-url="/event/plan/view.do?curPage=1&ttSeq=3330&event_seq=&disp_area=&disp_ev_area=&rownum="  onclick="this.value=''"  />	 -->
<!-- 				<button class="btn" onclick="totalSearch()" type="button">검색</button> -->
			
<!-- 			</div> -->
            
			</div>
			
			<!-- 검색버튼 -->
			<div class="topAreaSch" >
			
			<input type="text" name="total_keyword"  value="[오키나와] 일본의 하와이"  data-link-url="/event/plan/view.do?curPage=1&ttSeq=3330&event_seq=&disp_area=&disp_ev_area=&rownum="  onclick="this.value=''"  />	
				<button class="btn" onclick="totalSearch()" type="button">검색</button>
			
			</div>
			
			<!-- 인기검색어-->
				<div id="topPopularKeyword-slider" class="topAreaBest swiper-container">
					<ul class="swiper-wrapper">
								<li  class="swiper-slide" >
								
												<a href="/totalSearch/index.do?total_keyword=%ED%84%B0%ED%82%A4&utm_source=tour2000&utm_medium=live_keyword&utm_campaign=tour2000_livekeyword&utm_content=터키" >
						
										<span class="topAreaBestNum">1</span>
										<span class="topAreaBestTxt">터키</span>
									</a>									
									
								</li>
						
								<li  class="swiper-slide" >
							
												<a href="/totalSearch/index.do?total_keyword=%EB%B3%B4%EB%9D%BC%EC%B9%B4%EC%9D%B4&utm_source=tour2000&utm_medium=live_keyword&utm_campaign=tour2000_livekeyword&utm_content=보라카이" >
											
							
										<span class="topAreaBestNum">2</span>
										<span class="topAreaBestTxt">보라카이</span>
									</a>									
									
								</li>
							
						
							
								<li  class="swiper-slide" >
								
										
											
												<a href="/totalSearch/index.do?total_keyword=%EB%8B%A4%EB%82%AD&utm_source=tour2000&utm_medium=live_keyword&utm_campaign=tour2000_livekeyword&utm_content=다낭" >
											
											
										
									
										<span class="topAreaBestNum">3</span>
										<span class="topAreaBestTxt">다낭</span>
									</a>									
									
								</li>
							
						
							
								<li  class="swiper-slide" >
								
										
											
												<a href="/totalSearch/index.do?total_keyword=%EC%8A%A4%ED%8E%98%EC%9D%B8&utm_source=tour2000&utm_medium=live_keyword&utm_campaign=tour2000_livekeyword&utm_content=스페인" >
											
											
										
									
										<span class="topAreaBestNum numG">4</span>
										<span class="topAreaBestTxt">스페인</span>
									</a>									
									
								</li>
							
						
							
								<li  class="swiper-slide" >
								
										
											
												<a href="/totalSearch/index.do?total_keyword=%EB%B6%80%EC%82%B0%EC%B6%9C%EB%B0%9C&utm_source=tour2000&utm_medium=live_keyword&utm_campaign=tour2000_livekeyword&utm_content=부산출발" >
											
											
										
									
										<span class="topAreaBestNum numG">5</span>
										<span class="topAreaBestTxt">부산출발</span>
									</a>									
									
								</li>
							
						
							
								<li  class="swiper-slide" >
								
										
											
												<a href="/totalSearch/index.do?total_keyword=%EC%9E%A5%EA%B0%80%EA%B3%84&utm_source=tour2000&utm_medium=live_keyword&utm_campaign=tour2000_livekeyword&utm_content=장가계" >
											
											
										
									
										<span class="topAreaBestNum numG">6</span>
										<span class="topAreaBestTxt">장가계</span>
									</a>									
									
								</li>
							
						
							
								<li  class="swiper-slide" >
								
										
											
												<a href="/totalSearch/index.do?total_keyword=베네룩스&utm_source=tour2000&utm_medium=live_keyword&utm_campaign=tour2000_livekeyword&utm_content=베네룩스" >
											
											
										
									
										<span class="topAreaBestNum numG">7</span>
										<span class="topAreaBestTxt">베네룩스</span>
									</a>									
									
								</li>
							
						
							
								<li  class="swiper-slide" >
								
										
											
												<a href="https://www.tour2000.co.kr/totalSearch/index.do?total_keyword=%EB%AA%BD%EA%B3%A8&utm_source=tour2000&utm_medium=live_keyword&utm_campaign=tour2000_livekeyword&utm_content=몽골" >
											
											
										
									
										<span class="topAreaBestNum numG">8</span>
										<span class="topAreaBestTxt">몽골</span>
									</a>									
									
								</li>
							
						
							
								<li  class="swiper-slide" >
								
										
											
												<a href="/totalSearch/index.do?total_keyword=%EB%B0%B1%EB%91%90%EC%82%B0&utm_source=tour2000&utm_medium=live_keyword&utm_campaign=tour2000_livekeyword&utm_content=백두산" >
											
											
										
									
										<span class="topAreaBestNum numG">9</span>
										<span class="topAreaBestTxt">백두산</span>
									</a>									
									
								</li>
							
						
							
								<li  class="swiper-slide" >
								
										
											
												<a href="/totalSearch/index.do?total_keyword=%EC%BD%94%ED%83%80%ED%82%A4%EB%82%98%EB%B0%9C%EB%A3%A8&utm_source=tour2000&utm_medium=live_keyword&utm_campaign=tour2000_livekeyword&utm_content=코타키나발루" >
											
											
										
									
										<span class="topAreaBestNum numG">10</span>
										<span class="topAreaBestTxt">코타키나발루</span>
									</a>									
									
								</li>
							
						
						
					</ul>
				</div> <!--// topAreaBest-->

				<!--인기검색어 마우스 오버시-->
				<div id="topPopularKeywordList" class="topAreaBest_on" style="display:none;">
					<p>인기 검색어</p>
					<ul>
								<li>
										
												<a href="/totalSearch/index.do?total_keyword=%ED%84%B0%ED%82%A4&utm_source=tour2000&utm_medium=live_keyword&utm_campaign=tour2000_livekeyword&utm_content=터키" >
											
											
										
									
										<span class="topAreaBestNum">1</span>
										<span class="topAreaBestTxt">터키</span>
									</a>									
									
								</li>
							
						
							
								<li>
								
										
											
												<a href="/totalSearch/index.do?total_keyword=%EB%B3%B4%EB%9D%BC%EC%B9%B4%EC%9D%B4&utm_source=tour2000&utm_medium=live_keyword&utm_campaign=tour2000_livekeyword&utm_content=보라카이" >
											
											
										
									
										<span class="topAreaBestNum">2</span>
										<span class="topAreaBestTxt">보라카이</span>
									</a>									
									
								</li>
							
						
							
								<li>
								
										
											
												<a href="/totalSearch/index.do?total_keyword=%EB%8B%A4%EB%82%AD&utm_source=tour2000&utm_medium=live_keyword&utm_campaign=tour2000_livekeyword&utm_content=다낭" >
											
											
										
									
										<span class="topAreaBestNum">3</span>
										<span class="topAreaBestTxt">다낭</span>
									</a>									
									
								</li>
							
						
							
								<li>
								
										
											
												<a href="/totalSearch/index.do?total_keyword=%EC%8A%A4%ED%8E%98%EC%9D%B8&utm_source=tour2000&utm_medium=live_keyword&utm_campaign=tour2000_livekeyword&utm_content=스페인" >
											
											
										
									
										<span class="topAreaBestNum numG">4</span>
										<span class="topAreaBestTxt">스페인</span>
									</a>									
									
								</li>
							
						
							
								<li>
								
										
											
												<a href="/totalSearch/index.do?total_keyword=%EB%B6%80%EC%82%B0%EC%B6%9C%EB%B0%9C&utm_source=tour2000&utm_medium=live_keyword&utm_campaign=tour2000_livekeyword&utm_content=부산출발" >
											
											
										
									
										<span class="topAreaBestNum numG">5</span>
										<span class="topAreaBestTxt">부산출발</span>
									</a>									
									
								</li>
							
						
							
								<li>
								
										
											
												<a href="/totalSearch/index.do?total_keyword=%EC%9E%A5%EA%B0%80%EA%B3%84&utm_source=tour2000&utm_medium=live_keyword&utm_campaign=tour2000_livekeyword&utm_content=장가계" >
											
											
										
									
										<span class="topAreaBestNum numG">6</span>
										<span class="topAreaBestTxt">장가계</span>
									</a>									
									
								</li>
						
								<li>
	
												<a href="/totalSearch/index.do?total_keyword=베네룩스&utm_source=tour2000&utm_medium=live_keyword&utm_campaign=tour2000_livekeyword&utm_content=베네룩스" >
		
										<span class="topAreaBestNum numG">7</span>
										<span class="topAreaBestTxt">베네룩스</span>
									</a>									
									
								</li>
	
								<li>
		
												<a href="https://www.tour2000.co.kr/totalSearch/index.do?total_keyword=%EB%AA%BD%EA%B3%A8&utm_source=tour2000&utm_medium=live_keyword&utm_campaign=tour2000_livekeyword&utm_content=몽골" >
	
										<span class="topAreaBestNum numG">8</span>
										<span class="topAreaBestTxt">몽골</span>
									</a>									
									
								</li>
		
							
								<li>
	
											
												<a href="/totalSearch/index.do?total_keyword=%EB%B0%B1%EB%91%90%EC%82%B0&utm_source=tour2000&utm_medium=live_keyword&utm_campaign=tour2000_livekeyword&utm_content=백두산" >

									
										<span class="topAreaBestNum numG">9</span>
										<span class="topAreaBestTxt">백두산</span>
									</a>									
									
								</li>

								<li>
			
											
												<a href="/totalSearch/index.do?total_keyword=%EC%BD%94%ED%83%80%ED%82%A4%EB%82%98%EB%B0%9C%EB%A3%A8&utm_source=tour2000&utm_medium=live_keyword&utm_campaign=tour2000_livekeyword&utm_content=코타키나발루" >
		
									
										<span class="topAreaBestNum numG">10</span>
										<span class="topAreaBestTxt">코타키나발루</span>
									</a>									
									
								</li>
							
						
						
					</ul>
				</div>
		
	           		
<!-- 	           			<a href="javascript:void(0);" onclick="goLogin()" class="topAreaLogIn"><span>로그인</span></a> -->
						<a href="javascript:void(0);" onclick="viewLoginOpen()" class="topAreaLogIn"><span>로그인</span></a>
	           	
				<!-- 아이콘들-->
				<div class="topAreaIcon">
					<a href="https://www.tour2000.co.kr/departure/index.do" class="topAreaIcon01">출발확정</a>
				
		           			<a href="https://www.tour2000.co.kr/member_join/agree.do" class="topAreaIcon02">회원가입</a>
		          
				</div>	
                
             	
                     
			</div><!--//topAreaBox--> 
		</div> <!--  //topAreaWrap-->
			

          <div class="col-10 col-md-8 d-none d-xl-block">
            <nav class="site-navigation position-relative text-right text-lg-center" role="navigation">
				
              <ul class="site-menu js-clone-nav mx-auto d-none d-lg-block">
              
                <li class="has-children">
                  <a href="index.html">국내</a>
                   <ul class="dropdown">
                    <li><a href="#">Japan</a></li>
                    <li><a href="#">Europe</a></li>
                    <li><a href="#">China</a></li>
                    <li><a href="#">France</a></li>
                  </ul>
                </li>
                <li class="has-children">
                  <a href="destination.html">해외</a>
                  <ul class="dropdown">
                    <li><a href="#">Japan</a></li>
                    <li><a href="#">Europe</a></li>
                    <li><a href="#">China</a></li>
                    <li><a href="#">France</a></li>
                  </ul>
                </li>
                
                <li class="has-children">
                <a href="discount.html">커뮤니티</a>
                <ul class="dropdown">
                    <li><a href="#">Japan</a></li>
                    <li><a href="#">Europe</a></li>
                    <li><a href="#">China</a></li>
                    <li><a href="#">France</a></li>
                  </ul>
                  </li>
                
                <li class="has-children"><a href="about.html">날씨정보</a>
                <ul class="dropdown">
                    <li><a href="#">Japan</a></li>
                    <li><a href="#">Europe</a></li>
                    <li><a href="#">China</a></li>
                    <li><a href="#">France</a></li>
                  </ul></li>
                <li class="has-children"><a href="blog.html">숙박정보</a>
                <ul class="dropdown">
                    <li><a href="#">Japan</a></li>
                    <li><a href="#">Europe</a></li>
                    <li><a href="#">China</a></li>
                    <li><a href="#">France</a></li>
                  </ul></li>
                <li class="has-children"><a href="contact.html">이벤트</a>
                <ul class="dropdown">
                    <li><a href="#">Japan</a></li>
                    <li><a href="#">Europe</a></li>
                    <li><a href="#">China</a></li>
                    <li><a href="#">France</a></li>
                  </ul></li>
                
                <!-- <li><a href="booking.html">Book Online</a></li> -->
              </ul>
            </nav>
          </div>
			
			<!-- 작은아이콘 -->
<!--           <div class="col-6 col-xl-2 text-right"> -->
<!--             <div class="d-none d-xl-inline-block"> -->
<!--               <ul class="site-menu js-clone-nav ml-auto list-unstyled d-flex text-right mb-0" data-class="social"> -->
<!--                 <li> -->
<!--                   <a href="#" class="pl-0 pr-3 text-black"><span class="icon-tripadvisor"></span></a> -->
<!--                 </li> -->
<!--                 <li> -->
<!--                   <a href="#" class="pl-3 pr-3 text-black"><span class="icon-twitter"></span></a> -->
<!--                 </li> -->
<!--                 <li> -->
<!--                   <a href="#" class="pl-3 pr-3 text-black"><span class="icon-facebook"></span></a> -->
<!--                 </li> -->
<!--                 <li> -->
<!--                   <a href="#" class="pl-3 pr-3 text-black"><span class="icon-instagram"></span></a> -->
<!--                 </li> -->
                
<!--               </ul> -->
<!--             </div> -->

<!--             <div class="d-inline-block d-xl-none ml-md-0 mr-auto py-3" style="position: relative; top: 3px;"><a href="#" class="site-menu-toggle js-menu-toggle text-black"><span class="icon-menu h3"></span></a></div> -->

<!--           </div> -->

        </div>
      </div>
      
    </header>
<!--/header -->
