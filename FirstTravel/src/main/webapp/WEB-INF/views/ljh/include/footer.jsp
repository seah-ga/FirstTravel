<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <!-- footer -->
<!--  <hr> -->
<!-- <div class="callcenter_area text-center"> -->
<!-- <div class="section_01"> -->
<!-- <div class="hgroup"> -->
<!-- <h3 id="cpText">FirstTravel 닷컴 예약센터</h3> -->
<!-- <p class="h_comt">고객님의 문의사항에 친절히 안내해 드립니다.</p> -->
<!-- </div> -->
<!-- <div class="callcenter_info text-center"> -->
<!-- 지역별 패키지 전용상담 연락처 안내 -->
<!-- <br> -->
<!-- <table class="text-center" border="1" cellpadding="0" cellspacing="0" summary="동남아,중국,일본,남태평양,유럽,미주,Help Desk 연락처" id="jq_dotcom"> -->
<!-- <colgroup> -->
<!-- <col width="20%"> -->
<!-- <col width="20%"> -->
<!-- <col width="20%"> -->
<!-- <col width="20%"> -->
<!-- <col width="20%"> -->
<!-- </colgroup> -->
<!-- <tr> -->
<!-- <th rowspan="2">지역별 패키지 전용상담<br>(예약문의)</th> -->
<!-- <td colspan="3" class="desk_infomation"> -->
<!-- 						      1577-1233<span class="txt_st0">+</span><span class="txt_st1">1번</span><span class="txt_st2">예약상담</span><span class="txt_st0">+</span><span class="txt_st1">1번</span><span class="txt_st2">해외여행</span><span class="txt_st0">+</span><span class="txt_st1">1번</span><span class="txt_st2">패키지</span></td> -->
<!-- <td rowspan="2"><span class="desk_tit">Help Desk</span><br><b class="desk_num">1587-4533+3번+0번</b></td> -->
<!-- </tr> -->
<!-- <tr> -->
<!-- <td colspan="3" class="desk_infomation"><span class="txt_st3 fir">1번</span><span class="txt_st4">동남아</span><span class="txt_st3">2번</span><span class="txt_st4">중국</span><span class="txt_st3">3번</span><span class="txt_st4">일본</span><span class="txt_st3">4번</span><span class="txt_st4">유럽/아프리카</span><span class="txt_st3">5번</span><span class="txt_st4">미주/중남미</span><span class="txt_st3">6번</span><span class="txt_st4">남태평양</span></td> -->
<!-- </tr> -->
<!-- </table> -->
<!-- <br> -->
<!-- <table cellpadding="0" cellspacing="0" summary="범용공탬 연락처" id="jq_universal" style="display:none;"> -->
<!-- <caption>지역별 패키지 전용상담 연락처 안내</caption> -->
<!-- <colgroup> -->
<!-- <col width="50%"> -->
<!-- <col width="50%"> -->
<!-- </colgroup> -->
<!-- <tr> -->
<!-- <th rowspan="2" id="cpName2"></th> -->
<!-- <td style="font-size:16px; text-align:center;"><b id="cpTel"></b></td> -->
<!-- </tr> -->
<!-- </table> -->
<!-- </div> -->
<!-- </div> -->
<!-- </div> -->
<script type="text/javascript"> 
/*범용공템 전화번호 노출*/
if (objCommercialFooter.isCommercialSite()) {
    $.ajax({
        url: "/_include/xml/infobannerXml.asp",
        type: "get",
        data: ({}),
        dataType: "xml",
        contentType: 'text/html; charset=utf-8',
        cache: false,
        error: function (data, textStatus) { },
        success: function (xml) {
            
            $("table#jq_dotcom").css("display","none");
            $("table#jq_universal").css("display","");
            var cpText = $(xml).find("text:eq(0)").text();
            var cpName2 = $(xml).find("text:eq(1)").text();
            var cpTel = $(xml).find("tel_number:eq(0)").text();
            
            if (cpText != ""){
				        $("#cpText").text($(xml).find("text:eq(0)").text());
			        };
            if (cpName2 != ""){
				        $("#cpName2").text($(xml).find("text:eq(1)").text());
			        };
            if (cpTel != ""){
				         $("#cpTel").text($(xml).find("tel_number:eq(0)").text());
			        };

        }
    });


} else {
	//document.getElementById("Commercial").style.display = "none";
}
     </script></div>
     
     
     
   <script type="text/javascript">
		// Criteo (eventType, prdType, item, startDt, EndDt, resCod)
		objAD.Criteo('viewHome', 'P', '', '', '', '');
	</script><span id="HntFooterStart" style="display:none"></span><link rel="stylesheet" type="text/css" href="//www.hanatour.com/_css/hana/common/footer.css">
<div id="hanatour_sns">
<div class="sns_section">
<div class="hnt_sns">
<h2>FirstTravel과 소통하는 7가지 방법!</h2>
<ul>
<li class="facebook"><a href="https://www.facebook.com/HanaTour.fb" title="하나투어 페이스북으로 이동하기" target="_blank"><span class="ir"></span></a></li>
<li class="insta"><a href="https://www.instagram.com/hanatour_official" title="하나투어 인스타그램 이동하기" target="_blank"><span class="ir"></span></a></li>
<li class="blog"><a href="http://blog.hanatour.com/" title="하나투어 블로그로 이동하기" target="_blank"><span class="ir"></span></a></li>

<li class="kakaostory"><a href="http://bit.ly/1Mqx1La" title="하나투어 카카오톡 플러스친구 이동하기" target="_blank"><span class="ir"></span></a></li>
<li class="youtube"><a href="https://www.youtube.com/user/HanaTour" title="유트브로 이동하기" target="_blank"><span class="ir"></span></a></li>
<li class="twitter"><a href="https://twitter.com/hanatour" title="하나투어 트위터로 이동하기" target="_blank"><span class="ir"></span></a></li>
</ul>
</div>
<div class="hnt_mobileweb" id="jq__main_hnt_mobileweb">
<h2>모바일 앱</h2>
<div class="jCarouselLite2">
<ul class="mobile_list">
<li><a href="http://www.hanatour.com/asp/mobile/mb-00000.asp?hanacode=main_mobile"><span class="ico hnt"><span class="ir"></span></span>모바일 전용특가와 여행정보를 하나로!
                    </a></li>
<li><a href="http://www.hanatour.com/asp/mobile/mb-00000.asp?hanacode=main_mobile"><span class="ico free_air"><span class="ir"></span></span>전세계 최저가 항공권 실시간 예약!
                    </a></li>
<li><a href="http://www.hanatour.com/asp/mobile/mb-00000.asp?hanacode=main_mobile"><span class="ico free_hotel"><span class="ir"></span></span>모바일 전용 특가 + 호텔앱 예약 시 2000마일 적립!
                    </a></li>
<li><a href="http://www.hanatour.com/asp/mobile/mb-00000.asp?hanacode=main_mobile"><span class="ico free_airtel"><span class="ir"></span></span>특가 에어텔(항공+호텔+보험) 실속 예약!
                    </a></li>
<li><a href="http://www.hanatour.com/asp/mobile/mb-00000.asp?hanacode=main_mobile"><span class="ico free_free"><span class="ir"></span></span>나만의 자유여행 만들면, 최대 30% 할인!
                    </a></li>
</ul>
</div>
</div>
</div>
</div>
<div id="company_info">
<div class="company_section">
<ul class="provision">
<li><a href="http://www.hanatourcompany.com/kor/main/main.asp?hanacode=main_bottom_01" target="_blank">회사소개</a></li>
<li><b><a href="http://www.hanatour.com/asp/policy/etc-main.asp?xslpage=policy&amp;hanacode=main_bottom_02">개인정보처리방침</a></b></li>
<li><a href="http://www.hanatour.com/asp/policy/etc-main.asp?xslpage=agreement&amp;hanacode=main_bottom_03">여행약관</a></li>
<li><a href="http://www.hanatour.com/asp/policy/etc-main.asp?xslpage=useinfo&amp;hanacode=main_bottom_04">이용약관</a></li>
<li><a href="http://www.hanatour.com/asp/policy/etc-main.asp?xslpage=ace&amp;hanacode=main_bottom_05">해외여행자보험</a></li>
<li><a href="http://www.hanatour.com/marketing/01_main.asp?hanacode=main_bottom_06" target="_blank">마케팅제휴</a></li>
<li><a href="http://www.hanatour.com/asp/agentinfo/ag-10000.asp?hanacode=main_bottom_08">공식인증예약센터 검색</a></li>
</ul>
<div class="link_neighbor">
<div class="global_link"><select class="selbox_link" id="jq_main_global_link" onchange="if(this.value) window.open(this.value);"><option value="">글로벌 네트워크</option>
<option value="http://www.hanatour.us?hanacode=main_bottom_network">하나투어 U.S.A</option>
<option value="http://www.hanatour.cn?hanacode=main_bottom_network">하나투어 CHINA</option>
<option value="http://www.hanatour.com.tw?hanacode=main_bottom_network">하나투어 TAIWAN</option>
<option value="http://www.hanatourjapan.jp?hanacode=main_bottom_network">하나투어 JAPAN</option>
<option value="http://www.hanatourhk.com?hanacode=main_bottom_network">하나투어 HONGKONG</option>
<option value="http://www.hanatour.co.th?hanacode=main_bottom_network">하나투어 BANGKOK</option>
<option value="http://www.hanatour.co.nz?hanacode=main_bottom_network">하나투어 New Zealand</option></select></div>
<div class="family_link"><select class="selbox_link" id="jq_main_family_link" onchange="if(this.value) window.open(this.value);"><option value="">패밀리 사이트</option>
<option value="http://www.hanatourcompany.com/kor/main/main.asp?hanacode=main_bottom_familysite">기업 사이트</option>
<option value="http://www.koreats.co.kr?hanacode=main_bottom_familysite">고려여행사</option>
<option value="http://www.tourtips.com?hanacode=main_bottom_familysite">투어팁스</option>
<option value="http://www.webtour.com?hanacode=main_bottom_familysite">웹투어</option>
<option value="http://www.hanatour.com/asp/weblog/FS_SMDF.html?hanacode=main_bottom_smdutyfreesite">SM면세점</option>
<option value="http://www.hanatouritc.com?hanacode=main_bottom_familysite">하나투어 ITC</option>
<option value="http://www.jejuhanatour.com?hanacode=main_bottom_familysite">하나투어제주</option>
<option value="http://www.hanatourbiz.com/?hanacode=main_bottom_familysite">하나투어비즈니스</option>
<option value="http://www.hanayouth.com?hanacode=main_bottom_familysite">하나투어유스</option>
<option value="http://www.hanatourist.co.kr?hanacode=main_bottom_familysite">하나투어리스트</option>
<option value="http://cjworldis.com?hanacode=main_bottom_familysite">CJ월디스</option>
<option value="http://www.hanatour.com/asp/weblog/main/hshop.html?hanacode=main_bottom_familysite">하나샵</option>
<option value="http://www.rccl.kr?hanacode=main_bottom_familysite">투어마케팅코리아</option>
<option value="http://www.centermarkhotel.com?hanacode=main_bottom_familysite">센터마크호텔</option>
<option value="http://www.hntmkt.com?hanacode=main_bottom_familysite">에이치엔티마케팅</option>
<option value="http://www.travel00.co.kr?hanacode=main_bottom_familysite">공공연수</option>
<option value="http://www.nextour.co.kr?hanacode=main_bottom_familysite">넥스투어</option>
<option value="http://www.tmarkhotel.com?hanacode=main_bottom_familysite">티마크호텔</option>
<option value="http://www.thetravellermagazine.co.kr?hanacode=main_bottom_familysite">하나티앤미디어</option>
<option value="http://www.hotelnair.com?hanacode=main_bottom_familysite">호텔앤에어닷컴</option></select></div>
</div>
</div>
</div>
<style type="text/css">
      .selbox_link {width:130px}
      /* #company_info .selbox_link {position:relative; zoom:1; color:#646464; text-align:left;}
      #company_info .selbox_link .display {display:block; overflow:hidden; position:relative; height: 28px; margin: -1px 0 0 0 ; padding: 12px 0 0 22px; border: 1px solid #c4c7c8; font-size: 11px; font-family: '돋움',Dotum, '굴림',Gulim,Helvetica,sans-serif; background-color: #f2f2f2; cursor:pointer; color: #666; text-indent:5px; text-decoration:none;}
      #company_info .selbox_link.disabled .display {color:#999; font-family:'NanumGothic','나눔고딕';}
      #company_info .selbox_link.focused .display .text {zoom:1; font-size: 11px; cursor:pointer; display:block; overflow:hidden; height:18px;text-indent:5px;}
      #company_info .selbox_link .display.active {border-color:#c4c7c8;}
      #company_info .selbox_link .display .arrow_btn {position: absolute; right: 0; top: 0; width:30px; height:42px; background: none}
      #company_info .selbox_link .display .arrow_btn * {padding:0;}
      #company_info .selbox_link .display .arrow_btn .arrow {display: block; width:30px; height:42px; background:url('http://image1.hanatour.com/_images/main/icon_set.png') 0 -222px no-repeat; outline: none; cursor: pointer}
      #company_info .selbox_link .display .arrow_btn .arrow {background-position: 0 -222px !important}
      #company_info .selbox_link .display.active .arrow_btn { border-left: none;}
      #company_info .selbox_link .display.hover .arrow_btn {}
      #company_info .selbox_link .value {display:none;}*/
    </style>
<div id="footer">
<div class="footer_section" id="bottom_html">
<address>(주)FirstTravel┃대표:아담코퍼필드┃주소:(03161) 네바다주 라스베이거스 인사동 5길 41</address>
<p>
          사업자 등록번호: 101-81-39440┃통신판매업신고번호: 자유로 01-1901호┃<a href="http://www.ftc.go.kr/info/bizinfo/communicationList.jsp" target="_blank" title="공정거래위원회 통신판매사업자 새창열림">사업자정보확인</a>┃관광사업자 등록번호: 제2019-000001호┃영업보증보험: 22억1천만원 가입
        </p>
<p>FirstTravel 고객센터: 2367-1258┃팩스: 162-954-0592┃개인정보 보호책임자: 제임스왓슨</p>
<p>부득이한 사정에 의해 여행일정이 변경되는 경우 여행자의 사전 동의를 받습니다.</p>
<p class="copyright">
          COPYRIGHT(C) FirstTravel SERVICE INC. ALL RIGHTS RESERVED<script type="text/javascript" src="//www.hanatour.com/_script/util/serverCheck.js"></script></p>
<p class="HanatourBi" id="id_HanatourBi"></p>
<ul class="travel_mark">
<li class="t_mark_01"><a href="http://www.smartoutbound.or.kr/guide/html/guideInfo4.do?menu_code=0000000016" target="_blank" title="국외여행상품 여행정보 표준안"><span class="ir"></span></a></li>
<li class="t_mark_02"><a href="http://vkc.or.kr/" target="_blank" title="한국방문위원회"><span class="ir"></span></a></li>
</ul>
<ul class="certification_mark">
<li class="mark_01"><a href="javascript:;" onclick="markPopupE('2018-R050',500,700)" title="개인정보보호 우수사이트 새창열림"><span class="ir"></span></a></li>
<li class="mark_04"><a href="http://www.kca.go.kr/ccm/certSystemOutlineView.do" target="_blank"><span class="ir"></span></a></li>
</ul>
<div class="selection">
<div class="jCarouselLiteSelection">
<ul>
<li class="sle_01"><span class="ir"></span></li>
<li class="sle_02"><span class="ir"></span></li>
<li class="sle_03"><span class="ir"></span></li>
<li class="sle_04"><span class="ir"></span></li>
<li class="sle_05"><span class="ir"></span></li>
<li class="sle_06"><span class="ir"></span></li>
<li class="sle_07"><span class="ir"></span></li>
<li class="sle_08"><span class="ir"></span></li>
<li class="sle_09"><span class="ir"></span></li>
</ul>
</div><button type="button" class="btn prev" title="이전"><span class="ir"></span></button><button type="button" class="btn next" title="다음"><span class="ir"></span></button></div>
</div>
</div><script type="text/javascript" src="//www.hanatour.com/_script/util/HntAppSmsLayer.js?v=20140515"></script><form name="etrust" method="post" action="//www.etrust.or.kr/jsp/open/eTrust_info.jsp"><input type="hidden" name="unique_id" value="1278576313390"></form><script language="JavaScript">
      //var noticeYn = "N";
    </script>
    
    <script type="text/javascript" src="//www.hanatour.com/_script/footer_content.js?v=20151221"></script><link rel="stylesheet" type="text/css" href="//www.hanatour.com/_css/2014/floating.css?v=201405"><script type="text/javascript" src="//www.hanatour.com/_script/util/floating_fixedBnr.js"></script><script type="text/javascript" src="//www.hanatour.com/_script/util/floating_fixedBnr2.js"></script>
    
    <div class="floating_content close" style="right: 0; top: -1px; width: 37px; display: none;">
<div class="floating_menu" style="right: 0; top: -1px; ">
<ul class="close_list">
<li class="myhana"><button type="button" title="마이하나열기" onclick="openBnr()"><span class="ir"></span></button></li>
<li class="top" title="상단이동"><a href="#"><span class="ir"></span></a></li>
</ul>
</div>
</div>
<div class="floating_content open" style="right: 0; top: -1px; width: 109px; display: none; ">
<div class="floating_menu" style="right: 0; top: -1px;"><button type="button" class="btn_floating" title="마이하나닫기" onclick="closeBnr()"><span class="ir"></span></button><div class="quick_mov"><a href="http://www.hanatour.com/asp/issue/issue.asp?hanacode=main_rb_event" class="go_event" title="이벤트가기"><span class="ir"></span></a><a href="http://www.hanatour.com/asp/contents/eventBoard/cp-00001.asp?hanacode=main_coupon" class="go_coupon" title="쿠폰존가기"><span class="ir"></span></a></div>
<ul class="floating_cont">
<li class="millage_li"><span class="myhana">MY HANA</span><p class="name loginN">
                            여행의 즐거움!<br>하나투어
                        </p><span class="mlg_inquiry nl">
                            회원가입 하시고<br>마일리지 적립<br>받으세요
                        </span><p class="name loginY"><strong class="my"></strong><br>여행을 준비하세요!
                        </p><a href="http://www.hanatour.com/asp/mypage/ps-10000.asp?hanacode=main_rb_mileage" class="mlg_inquiry y" style="display:none;">
                            FirstTravel 마일리지<strong class="go_inq">조회하기</strong></a><a href="https://www.hanatour.com/asp/member/me-20000.asp" class="mlg_inquiry n" style="display:none;">
                           	FirstTravel 마일리지<strong class="go_inq">회원가입하기</strong></a></li>
<li class="myinfo"><a class="loginN" href="http://www.hanatour.com/asp/login/lg-00000.asp?hanacode=main_rb_login">로그인</a><a class="loginN" href="http://www.hanatour.com/asp/member/me-00000.asp?hanacode=main_rb_member">회원가입</a><a class="loginN" href="http://www.hanatour.com/asp/booking/bookmgr/book-main.asp?hanacode=main_rb_confirmcancel">예약확인/결제</a><a class="loginN" href="http://www.hanatour.com/asp/mypage/cp-10000.asp">쿠폰</a><a class="loginN" href="http://www.hanatour.com/asp/mypage/ps-20000.asp">나의 혜택 확인</a><a class="loginY" href="http://www.hanatour.com/asp/weblog/main/mshop.html?hanacode=main_rb_mshop" target="_blank">마일리지샵</a><a class="loginY" href="http://www.hanatour.com/asp/mypage/my_cart.asp?hanacode=main_rb_basket">장바구니</a><a class="loginY" href="http://www.hanatour.com/asp/booking/bookmgr/book-main.asp?hanacode=main_rb_confirmcancel">예약확인/결제</a><a class="loginY" href="http://www.hanatour.com/asp/mypage/cp-10000.asp">쿠폰<span class="CPnum"></span></a><a class="loginY" href="http://www.hanatour.com/asp/mypage/ps-20000.asp">나의 혜택 확인</a></li>
<li class="view_product">
<p class="tit" style="display:none;"><strong>최근 본 상품</strong><span class="num"></span></p>
<p class="non_view" style="display:none;">
                            최근 본 상품이<br> 없습니다.
                        </p><button type="button" class="btn_up" title="위로이동"><span class="ir">위로</span></button><ul class="product_float_list" id="product_list" style="display:none;"></ul><button type="button" class="btn_down" title="아래로이동"><span class="ir">아래로</span></button></li>
<li class="ars">
<p><a href="javascript:void;" onclick="window.open('http://www.hanatour.com/xsl/promotion/autopromo/callcenter/callcenter_guide_pop.html', '', 'resizable=no scrollbars=yes width=983, height=678 left=0 top=0'); return false" target="_new">ARS 안내</a></p>
<p><a href="http://hc.hanatour.com/hc/card/card_main.jsp?hanacode=main_rb_credit" target="_blank">제휴카드 안내</a></p>
<p><a href="http://www.hanatour.com/asp/custcenter/fq-10000.asp?hanacode=main_rb_faq">자주하는 질문</a></p>
</li>
</ul><a href="#" class="btn_top"><span class="ir"></span></a></div>
</div>
<div class="layer_pop notice_change" style="width: 445px; left: 50%; margin-left: -223px; top: 270px; font-size:14px;display:none;" id="default_city_layer">
<p class="cont" style="text-align:center;">고객님께서 선택하신 <strong class="location" id="defalt_city_location">부산/대구</strong>로 출발지가 변경됩니다.</p>
<div class="btn_area" style="text-align:center;"><button type="button" class="btn_confirm" id="btn_default_city_confirm">확인</button><button type="button" class="btn_cansel" id="btn_default_city_cancel">취소</button></div>
</div>
<div class="floating_dim" id="default_city_dim" style="display:none;"></div><script type="text/javascript">		
			if(objCustSss.mid_enc != "") {
				$(".CPnum").text($(".CPnum_tnb").text());
				$(".name.loginY").css('display', 'block')
				$(".name.loginN").css('display', 'none')
				$(".mlg_inquiry.nl").css('display', 'none')
			if(objCustSss.mc_reg_yn == "Y") {
				$(".mlg_inquiry.y").css('display', 'block');
			} else {
				$(".mlg_inquiry.n").css('display', 'block');
			}
				$(".myinfo > a.loginY").css('display', 'block');
				$(".myinfo > a.loginN").css('display', 'none');
			} else {
				$(".name.loginY").css('display', 'none')
				$(".name.loginN").css('display', 'block')
				$(".mlg_inquiry.nl").css('display', 'block')
				$(".myinfo > a.loginY").css('display', 'none');
				$(".myinfo > a.loginN").css('display', 'block');
			}
		</script><span id="HntFooterEnd" style="display:none"></span><script type="text/javascript">
      if (navigator.appVersion.indexOf("MSIE 7") > 0){
      } else {				
			window.piwikAsyncInit = function () {
			try {
			var ccTracker = Piwikc.getTracker("//tracker7.crosscounter.co.kr/cctracker/piwik.php", 1);
			ccTracker.setCookieDomain("*.hanatour.com");
			ccTracker.setDomains("*.hanatour.com");
			ccTracker.trackPageView();
			ccTracker.enableLinkTracking();
			} catch( err ) {}
			};
			(function() {
			//var c="//tracker7.crosscounter.co.kr/cctracker/";
			var c="//tx.theline13.com/tracker7/js/";			
			var d=document, g=d.createElement('script'), s=d.getElementsByTagName('script')[0];
			g.type='text/javascript'; g.async=true; g.defer=true; g.src=c+'piwik.js'; s.parentNode.insertBefore(g,s);
			})();
      }
    </script><script type="text/javascript"> 
	  $(function(){
		  if(typeof parent.bottomFrame !== 'undefined' && typeof parent.bottomFrame.site_url !== 'undefined' && typeof parent.bottomFrame.site_url !== null) {
			 if(parent.bottomFrame.site_url == 'hotelscombined.hanatour.com') {
				 $('#header_section .menu_whole').css('display','none');
				 $('#GnbHntHomeA').attr('href','http://www.hanatour.com/asp/booking/lodge/lg-30000.asp?hanacode=FIT_GNB_hotel');
			 }
		  } 
	  });

	  </script>

    
    
	
  

  <script src="/resources/ljh/js/jquery-3.3.1.min.js"></script>
  <script src="/resources/ljh/js/jquery-migrate-3.0.1.min.js"></script>
  <script src="/resources/ljh/js/jquery-ui.js"></script>
  <script src="/resources/ljh/js/popper.min.js"></script>
  <script src="/resources/ljh/js/bootstrap.min.js"></script>
  <script src="/resources/ljh/js/owl.carousel.min.js"></script>
  <script src="/resources/ljh/js/jquery.stellar.min.js"></script>
  <script src="/resources/ljh/js/jquery.countdown.min.js"></script>
  <script src="/resources/ljh/js/jquery.magnific-popup.min.js"></script>
  <script src="/resources/ljh/js/bootstrap-datepicker.min.js"></script>
  <script src="/resources/ljh/js/aos.js"></script>

  <script src="/resources/ljh/js/main.js"></script>
  <!--/footer  --> 
  
  
    </div>
  </body>
</html>