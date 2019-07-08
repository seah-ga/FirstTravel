
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
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
	
 
 
  </head>
  <body>
   

    
    <header class="site-navbar py-1" role="banner" >

      <div class="container"  style="border-bottom: 2px black; border-bottom-style: solid;">
        <div class="row align-items-left">
          
          <div class="topAreaWrap">
            <div class="row">
            <a href="/ljh/main" class="text-black h2 mb-0">First Travel</a>
<!--             <div class="topAreaSch" > -->
<!-- 			<input type="text" name="total_keyword"  value="[오키나와] 일본의 하와이"  data-link-url="/event/plan/view.do?curPage=1&ttSeq=3330&event_seq=&disp_area=&disp_ev_area=&rownum="  onclick="this.value=''"  />	 -->
<!-- 				<button class="btn" onclick="totalSearch()" type="button">검색</button> -->
			
<!-- 			</div> -->
            
				<div class="topAreaSch" style="border-bottom:0px; margin-left: 600px; margin-bottom: 0px;">
				
		           		
	<!-- 	           			<a href="javascript:void(0);" onclick="goLogin()" class="topAreaLogIn"><span>로그인</span></a> -->
							<a href="/kdw/login" onclick="viewLoginOpen()" class="topAreaLogIn"><span>로그인</span></a>
		           	
		           	
		           	--${memberVo}--
					<div class="topAreaIcon">
					<!-- 아이콘들-->
					<c:choose>
						<c:when test="${memberVo == null}">
			           		<a href="/kdw/join" class="topAreaIcon02">회원가입</a>
						</c:when>
						<c:otherwise>	
							<a href="#" class="topAreaIcon01">마이페이지</a>
			          	</c:otherwise>
			        </c:choose>
					</div>	
	             	
	                     
					</div><!--//topAreaBox--> 
                </div>
			
			<!-- 검색버튼 -->
		</div> <!--  //topAreaWrap-->
		</div>
			

          <div class="col-10 col-md-8 d-none d-xl-block">
            <nav class="site-navigation position-relative text-right text-lg-center" role="navigation">
				
              <ul class="site-menu js-clone-nav mx-auto d-none d-lg-block"  style="float: left; padding-left: 2px;">
              
                 <li class="has-children">
                  <a href="#">여행</a>
                   <ul class="dropdown">
                    <li><a href="/psj/plan">국내</a></li>
                    <li><a href="/nds/itemoverseasmain">해외</a></li>
                  </ul>
                </li>
                
                <li class="has-children">
                <a href="#">커뮤니티</a>
                <ul class="dropdown">
                    <li><a href="/psj/wiki">여행Tip</a></li>
                    <li><a href="/kdw/gallery/gallery_list">포토갤러리</a></li>
                    <li><a href="/nds/reviewlist">여행후기게시판</a></li>
                    <li><a href="/ljh/companion">동행자구하기</a></li>
                  </ul>
                  </li>
                
                <li class="has"><a href="contact.html">이벤트</a>
<!--                 <ul class="dropdown"> -->
<!--                     <li><a href="#">항공권이벤트</a></li> -->
<!--                     <li><a href="#">숙박권이벤트</a></li> -->
<!--                     <li><a href="#">여행상품이벤트</a></li> -->
<!--                     <li><a href="#">가이드이벤트</a></li> -->
<!--                   </ul></li> -->
                
                <!-- <li><a href="booking.html">Book Online</a></li> -->
              </ul>
            </nav>
               <hr>
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
      
    </header>
<!-- header -->