
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="../include/nds/header.jsp" %>		

<style>
.container{
	padding-bottom:50px;
}
</style>

  
	<br>
	<br>
	<br>
    <div class="slide-one-item home-slider owl-carousel">
      
      <div class="site-blocks-cover overlay" style="background-image: url(/resources/ljh/images/sweden.jpg);" data-aos="fade" data-stellar-background-ratio="0.5">
        <div class="container">
          <div class="row align-items-center justify-content-center text-center">

            <div class="col-md-8" data-aos="fade-up" data-aos-delay="400">
              

              <h1 class="text-white font-weight-light">해외</h1>
              <p class="mb-5">세계속으로 발걸음을 딛여보아요</p>
              <p><a href="/nds/itemoverseasmain" class="btn btn-primary py-3 px-5 text-white">지금 당장 예약하세요!<br>Book Now!</a></p>

            </div>
          </div>
        </div>
      </div>  

      <div class="site-blocks-cover overlay" style="background-image: url(/resources/ljh/images/jeju.jpg);" data-aos="fade" data-stellar-background-ratio="0.5">
        <div class="container">
          <div class="row align-items-center justify-content-center text-center">

            <div class="col-md-8" data-aos="fade-up" data-aos-delay="400">
              <h1 class="text-white font-weight-light">국내</h1>
              <p class="mb-5">주변의 전통을 둘러보아요</p>
              <p><a href="/psj/plan" class="btn btn-primary py-3 px-5 text-white">지금 당장 예약하세요!<br>Book Now!</a></p>
            </div>
          </div>
        </div>
      </div>  

    </div>


    <div class="site-section">
      
      <div class="container overlap-section">
        <div class="row">
          <div class="col-md-6 col-lg-4 mb-4 mb-lg-0">
            <a href="/nds/itemoverseasread?overseas_Country=${overseas[10].overseas_Country}&overseas_City=${overseas[10].overseas_City}&airPort=${overseas[10].airPort}" class="unit-1 text-center">
              <img src="/ndsupload/displayFile?fileName=${overseas[10].image1}" alt="Image" class="img-fluid">
              <div class="unit-1-text">
                <h3 class="unit-1-heading">${overseas[10].overseas_City}</h3>
              </div>
            </a>
          </div>
          <div class="col-md-6 col-lg-4 mb-4 mb-lg-0">
            <a href="/nds/itemoverseasread?overseas_Country=${overseas[25].overseas_Country}&overseas_City=${overseas[25].overseas_City}&airPort=${overseas[25].airPort}" class="unit-1 text-center">
              <img src="/ndsupload/displayFile?fileName=${overseas[25].image1}" alt="Image" class="img-fluid">
              <div class="unit-1-text">
                <h3 class="unit-1-heading">${overseas[25].overseas_City}</h3>
              </div>
            </a>
          </div>
          <div class="col-md-6 col-lg-4 mb-4 mb-lg-0">
            <a href="/nds/itemoverseasread?overseas_Country=${overseas[26].overseas_Country}&overseas_City=${overseas[26].overseas_City}&airPort=${overseas[26].airPort}" class="unit-1 text-center">
              <img src="/ndsupload/displayFile?fileName=${overseas[26].image1}" alt="Image" class="img-fluid">
              <div class="unit-1-text">
                <h3 class="unit-1-heading">${overseas[26].overseas_City}</h3>
              </div>
            </a>
          </div>
        </div>
      </div>
    
    </div>


    <div class="site-section">
      
      <div class="container">
        <div class="row justify-content-center mb-5">
          <div class="col-md-7 text-center">
            <h2 class="font-weight-light text-black">추천 여행지</h2>
            <p class="color-black-opacity-5">Choose Your Next Destination</p>
          </div>
        </div>
        <div class="row">
          <div class="col-md-6 col-lg-4 mb-4 mb-lg-4">
            <a href="/nds/itemoverseasread?overseas_Country=${overseas[23].overseas_Country}&overseas_City=${overseas[23].overseas_City}&airPort=${overseas[23].airPort}" class="unit-1 text-center">
              <img src="/ndsupload/displayFile?fileName=${overseas[23].image1}" alt="Image" class="img-fluid">
              <div class="unit-1-text">
                
                <h3 class="unit-1-heading">독일, 베를린</h3>
              </div>
            </a>
          </div>
          <div class="col-md-6 col-lg-4 mb-4 mb-lg-4">
            <a href="/nds/itemoverseasread?overseas_Country=${overseas[19].overseas_Country}&overseas_City=${overseas[19].overseas_City}&airPort=${overseas[19].airPort}" class="unit-1 text-center">
              <img src="/ndsupload/displayFile?fileName=${overseas[19].image1}" alt="Image" class="img-fluid">
              <div class="unit-1-text">
               
                <h3 class="unit-1-heading">미국, 롱비치</h3>
              </div>
            </a>
          </div>
          <div class="col-md-6 col-lg-4 mb-4 mb-lg-4">
            <a href="/nds/itemoverseasread?overseas_Country=${overseas[21].overseas_Country}&overseas_City=${overseas[21].overseas_City}&airPort=${overseas[21].airPort}" class="unit-1 text-center">
              <img src="/ndsupload/displayFile?fileName=${overseas[21].image1}" alt="Image" class="img-fluid">
              <div class="unit-1-text">
                
                <h3 class="unit-1-heading">일본 ,삿보로 </h3>
              </div>
            </a>
          </div>

          <div class="col-md-6 col-lg-4 mb-4 mb-lg-4">
            <a href="/nds/itemoverseasread?overseas_Country=${overseas[13].overseas_Country}&overseas_City=${overseas[13].overseas_City}&airPort=${overseas[13].airPort}" class="unit-1 text-center">
              <img src="/ndsupload/displayFile?fileName=${overseas[13].image1}" alt="Image" class="img-fluid">
              <div class="unit-1-text">
               
                <h3 class="unit-1-heading">러시아 , 레닌그라드</h3>
              </div>
            </a>
          </div>
          <div class="col-md-6 col-lg-4 mb-4 mb-lg-4">
            <a href="/nds/itemoverseasread?overseas_Country=${overseas[9].overseas_Country}&overseas_City=${overseas[9].overseas_City}&airPort=${overseas[9].airPort}" class="unit-1 text-center">
              <img src="/ndsupload/displayFile?fileName=${overseas[9].image1}" alt="Image" class="img-fluid">
              <div class="unit-1-text">
                
                <h3 class="unit-1-heading">말레이시아 ,라부안 </h3>
              </div>
            </a>
          </div>
          <div class="col-md-6 col-lg-4 mb-4 mb-lg-4">
            <a href="/nds/itemoverseasread?overseas_Country=${overseas[7].overseas_Country}&overseas_City=${overseas[7].overseas_City}&airPort=${overseas[7].airPort}" class="unit-1 text-center">
              <img src="/ndsupload/displayFile?fileName=${overseas[7].image1}" alt="Image" class="img-fluid">
              <div class="unit-1-text">
                
                <h3 class="unit-1-heading">미국, 라스베가스</h3>
              </div>
            </a>
          </div>
        </div>
      </div>
    
    </div>
    
    
    <div class="site-section block-13 bg-light">
  
  
   <div class="site-section">
      <div class="container">
        <div class="row justify-content-center mb-5">
          <div class="col-md-7 text-center">
            <h2 class="font-weight-light text-black">BEST 상품</h2>
            <p class="color-black-opacity-5">The best products people choose </p>
          </div>
        </div>
        <div class="row mb-3 align-items-stretch">
          <div class="col-md-4 col-lg-4 mb-4 mb-lg-4">
            <div class="h-entry">
              <img src="/ndsupload/displayFile?fileName=${overseas[5].image1}" alt="Image" class="img-fluid">
              <h2 class="font-size-regular"><a href="/nds/itemoverseasread?overseas_Country=${overseas[5].overseas_Country}&overseas_City=${overseas[5].overseas_City}&airPort=${overseas[5].airPort}">1위 인도네시아 - 라부하</a></h2>
              
              <p>인도네시아4일 #아동 #가족온라인박람회 인도네시아4일 실속있는 가격과 알찬 일정 가볍게 떠나고 싶다면! #가성비 #비교불가</p>
            </div> 
          </div>
          <div class="col-md-4 col-lg-4 mb-4 mb-lg-4">
            <div class="h-entry">
              <img src="/ndsupload/displayFile?fileName=${overseas[14].image1}" alt="Image" class="img-fluid">
              <h2 class="font-size-regular"><a href="/nds/itemoverseasread?overseas_Country=${overseas[14].overseas_Country}&overseas_City=${overseas[14].overseas_City}&airPort=${overseas[14].airPort}">2위 독일 - 라이프치히</a></h2>
              
              <p>독일 항공일주 #가족여행 라이프치히 숙박 슈미트성, 구텐탁호수, 구프궁전 등 독일을 완벽하게 느낄 수 있는 여행!</p>
            </div>
          </div>
          <div class="col-md-4 col-lg-4 mb-4 mb-lg-4">
            <div class="h-entry">
              <img src="/ndsupload/displayFile?fileName=${overseas[6].image1}" alt="Image" class="img-fluid">
              <h2 class="font-size-regular"><a href="/nds/itemoverseasread?overseas_Country=${overseas[6].overseas_Country}&overseas_City=${overseas[6].overseas_City}&airPort=${overseas[6].airPort}">3위 필리핀 - 라오아그</a></h2>
              
              <p>필리핀/3위 필리핀,라오아그 #가족 #모임 베스트셀러 TOP 온라인박람회 최저가 보장 대표관광지와 맛있는 특식 포함 박람회 전용상품 깜짝선물 제공</p>
            </div>
          </div>
          
          
        </div>
       
      </div>
    </div>
  
  

    <div class="container">
        <div class="row justify-content-center mb-5">
          <div class="col-md-7">
            <h2 class="font-weight-light text-black text-center">현재 BEST 여행 후기글</h2>
             <p class="text-center">The best travel stories people wrote<p>
          </div>
        </div>

        <div class="nonloop-block-13 owl-carousel">

          <div class="item">
            <div class="container">
              <div class="row">
                <div class="col-lg-6 mb-5">
                  <img src="/ndsupload/displayFile?fileName=${overseas[13].image1}" alt="Image" class="img-md-fluid">
                </div>
                <div class="overlap-left col-lg-6 bg-white p-md-5 align-self-center">
                  <p class="text-black lead">&ldquo;<a href=/nds/reviewread?review_num=701&page=1&perPage=6&searchType=&keyword=">프랑스 마르세유에서  열차를타고 20시간을 달려 도착한 베를린의 아름다움&rdquo;</a></p>
                  <p class="">&mdash; <em>제임스 마틴</em>, 독일 베를린 여행중</p>
                </div>
              </div>
            </div>
          </div>

          <div class="item">
            <div class="container">
              <div class="row">
                <div class="col-lg-6 mb-5">
                  <img src="/ndsupload/displayFile?fileName=${overseas[8].image1}" alt="Image" class="img-md-fluid">
                </div>
                <div class="overlap-left col-lg-6 bg-white p-md-5 align-self-center">
                  <p class="text-black lead">&ldquo;<a href=/nds/reviewread?review_num=685&page=1&perPage=6&searchType=&keyword=">제 고향에서는 이런 화창한날씨를 보기힘들었는데 여기는 일상이더군요&rdquo;</a></p>
                  <p class="">&mdash; <em>클레어 어거스틴</em>, 미국 LA 여행중</p>
                </div>
              </div>
            </div>
          </div>

          <div class="item">
            <div class="container">
              <div class="row">
                <div class="col-lg-6 mb-5">
                  <img src="/ndsupload/displayFile?fileName=${overseas[12].image1}" alt="Image" class="img-md-fluid">
                </div>
                <div class="overlap-left col-lg-6 bg-white p-md-5 align-self-center">
                  <p class="text-black lead">&ldquo;<a href=/nds/reviewread?review_num=675&page=1&perPage=6&searchType=&keyword=">처음에는 망설였습니다 하지만... &rdquo;</a></p>
                  <p class="">&mdash; <em>신드라 캠벨</em>, 한국 군산 여행중</p>
                </div>
              </div>
            </div>
          </div>
          
          

        </div>
      </div>
    </div>
    <!-- 여행후기글 -->
     <div class="site-section bg-light">
      <div class="container">
        <div class="row justify-content-center mb-5">
          <div class="col-md-4 text-center">
            <h2 class="font-weight-light text-black">BEST 여행후기글</h2>
             <p>travel stories people wrote<p>
          </div>
        </div>
             <div class="container latest">
      <c:forEach items="${reviewbestlist}" begin="0" end="2" var="reviewVo">
  <div class="col-md-4">
    <figure class="shadow">
    				  <a href="/nds/reviewread?review_num=${reviewVo.review_num}" class="thumb"><img src="
	    				  <c:choose>
		          		    <c:when test="${reviewVo.review_image != 'null'}">
		           			   /ndsupload/display?fileName=${reviewVo.review_image}
 		           		   </c:when>
		             		 <c:when test="${reviewVo.review_image == 'null'}">
 		            		  /resources/nds/images/b_nullImage.jpg
		             	    </c:when>
		             		 </c:choose>" alt="alt" /></a>
    		  <figcaption>
       <a href="/nds/reviewread?review_num=${reviewVo.review_num}">
        <h3 class="heading">${reviewVo.review_name}</h3>
        </a>
        <p class="bioquote">${reviewVo.review_content}</p>
      </figcaption>
    </figure>
  </div>
  </c:forEach>
  <!-- one_third ends here --> 
</div>
      </div>
    </div>
      <!-- /여행후기글 -->
      
    <div class="site-section border-top">
      <div class="container">
        <div class="row text-center">
          <div class="col-md-12">
            <!-- <h2 class="mb-5 text-black">공지사항&이벤트</h2> -->
            <p class="mb-0"><a href="booking.html" class="btn btn-primary py-3 px-5 text-white">동행자찾기 & 이벤트</a></p>
          </div>
        </div>
      </div>
    </div>
   
  
  
    </div>
  </body>
</html>

<%@ include file="../include/nds/footer.jsp" %>		
