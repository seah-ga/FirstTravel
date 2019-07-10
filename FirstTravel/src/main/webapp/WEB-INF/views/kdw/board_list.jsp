<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@include file="../include/nds/header.jsp" %>      

<meta charset="UTF-8">
<title>Insert title here</title>
<!-- Font Awesome -->
  <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.2/css/all.css">
  <!-- Bootstrap core CSS -->
  <link href="/resources/kdw/css/bootstrap.min.css" rel="stylesheet">
  <!-- Material Design Bootstrap -->
  <link href="/resources/kdw/css/mdb.min.css" rel="stylesheet">
  <!-- Your custom styles (optional) -->
  <link href="/resources/kdw/css/style.min.css" rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script>
$(document).ready(function() {
	var chk_ad = $("#chk_ad").val();
	if(chk_ad == "Y") {
		$("#chk_ad").prop("checked", true);
	} else if (chk_ad == "N") {
		$("#chk_ad").prop("checked", false);
	}
	
	// 취소 버튼
	$("#btn_cancel").click(function() {
		location.href = "/kdw/login";
	});
	
	// 겔러리 페이지 인동
	$(".a_title").click(function(e) {
		e.preventDefault();
		var g_no = $(this).attr("data-g_no");
		var href = $(this).attr("href");
		$("input[name=g_no]").val(g_no);
		setPage();
		$("#list_form").attr("action", href).submit();
	});
	
	// 리뷰 페이지 이동
	$(".readloaction").click(function() {
		var review_num = $(this).attr("data-num");
		$("input[name=review_num]").val(review_num);
		$("#list_form").attr("action", "/nds/reviewread");
		$("#list_form").submit();
	});
	
	// 페이지 전환
	$(".a_pagination").click(function(e) {
		e.preventDefault();
		var page = $(this).attr("data-page");
		$("input[name=page]").val(page);
		$("#list_form").submit();
	});
	
	
	
	function setPage() {
		var page = "${pagingDto.page}";
		if (page == "") {
			page = 1;
		}
		$("input[name=page]").val(page);
	}
});
</script>
<style>
.container {
	padding-bottom: 50px;
}
</style>
</head>
<body class="lighten-3">

  <!--Main layout-->
  <main class="mt-5 pt-4">
    <div class="container wow fadeIn">

      <!-- Heading -->
      <h2 class="my-5 h2 text-center">개인정보수정</h2>

      <!--Grid row-->
      <div class="row">

        <!--Grid column-->
        <div class="col-md-8 mb-4">

          <!--Card-->
          <div class="card">

            <!--Card content-->
            <form class="card-body" id="list_form">
			<input type="hidden" name="g_no"/>
			<input type="hidden" name="page" value="${pagingDto.page }">
			<input type="hidden" name="review_num" value="${param.review_num}">
              <!--Grid row-->
              <ul class="nav nav-tabs" id="myTab" role="tablist">
				  <li class="nav-item">
				    <a class="nav-link active" id="home-tab" data-toggle="tab" href="#home" role="tab" aria-controls="home"
				      aria-selected="true">겔러리게시판</a>
				  </li>
				  <li class="nav-item">
				    <a class="nav-link" id="profile-tab" data-toggle="tab" href="#profile" role="tab" aria-controls="profile"
				      aria-selected="false">후기게시판</a>
				  </li>
				  <li class="nav-item">
				    <a class="nav-link" id="contact-tab" data-toggle="tab" href="#contact" role="tab" aria-controls="contact"
				      aria-selected="false">팁게시판</a>
				  </li>
				  <li class="nav-item">
				    <a class="nav-link" id="contact-tab" data-toggle="tab" href="#list" role="tab" aria-controls="contact"
				      aria-selected="false">동행자게시판</a>
				  </li>
				</ul>
				<div class="tab-content" id="myTabContent">
				  <div class="tab-pane fade show active" id="home" role="tabpanel" aria-labelledby="home-tab">
				  <table class="table">
				  <thead>
				    <tr>
				      <th scope="col">게시글 번호</th>
				      <th scope="col">제목</th>
				      <th scope="col">작성일</th>
				      <th scope="col">조회수</th>
				    </tr>
				  </thead>
				  <tbody>
				  	<c:forEach items="${galleryList }" var="gBoardVo">
				    <tr>
				      <th scope="row">${gBoardVo.g_no}</th>
				      <td><a href="/kdw/gallery/gallery_read" class="a_title" data-g_no="${gBoardVo.g_no }" 
								data-index=${status.index }>${gBoardVo.g_title }</a></td>
				      <td>${gBoardVo.g_regdate }</td>
					  <td>${gBoardVo.g_viewcnt }</td>
				    </tr>
				  	</c:forEach>
				  </tbody>
				</table>
					<!-- 페이지네이션 -->
					<nav>
						<ul class="pagination">
							<c:if test="${paginationDto.prev == true }">
							<li class="page-item">
								<a class="page-link a_pagination" href="#" data-page="${paginationDto.startPage - 1}">Previous</a>
							</li>
							</c:if>
							<c:forEach begin="${paginationDto.startPage }" end="${paginationDto.endPage }" var="i">
							<li class="page-item <c:if test="${paginationDto.pagingDto.page == i}">active</c:if>">
								<a class="page-link a_pagination" href="#" data-page="${i }">${i }</a>
							</li>
							
							</c:forEach>
							<c:if test="${paginationDto.next == true }">
							<li class="page-item">
								<a class="page-link a_pagination" data-page="${paginationDto.endPage + 1}" href="#">Next</a>
							</li>
							</c:if>
						</ul>
					</nav>
				  </div>
				  <div class="tab-pane fade" id="profile" role="tabpanel" aria-labelledby="profile-tab">
				  <div class="row">
					 <c:forEach var="reviewVo" items="${reviewList}">
			      		<div class="col-md-6">
					        <div class="post">
					          <div class="post-thumb">
					            <a href="#">
					              <img class="img-responsive readloaction" style="width: 300px; height: 200px;" data-num="${reviewVo.review_num}" src="
					              <c:choose>
					              <c:when test="${reviewVo.review_image != 'null'}">
					              /ndsupload/display?fileName=${reviewVo.review_image}
					              </c:when>
					              <c:when test="${reviewVo.review_image == 'null'}">
					              /resources/nds/images/b_nullImage.jpg
					              </c:when>
					              </c:choose>
					              ">
					            </a>
					          </div>
					          <h3 class="post-title"><a href="#" class="readloaction" data-num="${reviewVo.review_num}">[${reviewVo.review_country}:${reviewVo.review_city}]${reviewVo.review_name}</a></h3>
					          <div class="post-meta">
					            <ul>
					              <li>
					                <i class="tf-ion-ios-calendar"></i> ${reviewVo.review_date}
					              </li>
					              <li>
					                <i class="tf-ion-android-person"></i>작성자:&nbsp;${reviewVo.review_writer}
					              </li>
					              <li>
					                <i class="tf-ion-chatbubbles"></i>조회수:&nbsp;${reviewVo.review_reading}
					              </li>
					            </ul>
					          </div>
					          <div class="post-content">
					            <p>${reviewVo.review_content}</p>
					          </div>
							</div>
			        	</div>
			        </c:forEach>
			      </div>
			      <!-- 페이지네이션 -->
					<nav>
						<ul class="pagination">
							<c:if test="${paginationDto.prev == true }">
							<li class="page-item">
								<a class="page-link a_pagination" href="#" data-page="${paginationDto.startPage - 1}">Previous</a>
							</li>
							</c:if>
							<c:forEach begin="${paginationDto.startPage }" end="${paginationDto.endPage }" var="i">
							<li class="page-item <c:if test="${paginationDto.pagingDto.page == i}">active</c:if>">
								<a class="page-link a_pagination" href="#" data-page="${i }">${i }</a>
							</li>
							
							</c:forEach>
							<c:if test="${paginationDto.next == true }">
							<li class="page-item">
								<a class="page-link a_pagination" data-page="${paginationDto.endPage + 1}" href="#">Next</a>
							</li>
							</c:if>
						</ul>
					</nav>
				  </div>
				  <div class="tab-pane fade" id="contact" role="tabpanel" aria-labelledby="contact-tab">
				  </div>
				  <div class="tab-pane fade" id="list" role="tabpanel" aria-labelledby="contact-tab">
				  </div>
				</div>
			
            </form>
          </div>
          <!--/.Card-->

        </div>
        <!--Grid column-->

        <!--Grid column-->
        <div class="col-md-4 mb-4">

          <!-- Heading -->
          <h4 class="d-flex justify-content-between align-items-center mb-3">
            <span class="text-muted">마이페이지</span>
            <span class="badge badge-secondary badge-pill">0</span>
          </h4>

          <!-- Cart -->
          <ul class="list-group mb-3 z-depth-1">
            <li class="list-group-item d-flex justify-content-between lh-condensed">
              <div>
                <h6 class="my-0">보유 포인트</h6>
              </div>
              <span class="text-muted">${memberVo.user_point}point</span>
            </li>
            <li class="list-group-item d-flex justify-content-between lh-condensed">
              <div>
                <h6 class="my-0">여행예약</h6>
              </div>
              <span class="text-muted">0건</span>
            </li>
            <li class="list-group-item d-flex justify-content-between lh-condensed">
              <div>
                <h6 class="my-0">관심상품</h6>
              </div>
              <span class="text-muted">0건</span>
            </li>
            <li class="list-group-item d-flex justify-content-between lh-condensed">
              <div>
                <h6 class="my-0">내가 쓴글 보기</h6>
              </div>
              <span class="text-muted"><a href="/kdw/board_list">${memberBoardVo.writeCount }건</a></span>
            </li>
          </ul>
          <!-- Cart -->

          <!-- Promo code -->
          <form class="card p-2">
            <div class="input-group">
              <input type="text" class="form-control" placeholder="Promo code" aria-label="Recipient's username" aria-describedby="basic-addon2">
              <div class="input-group-append">
                <button class="btn btn-secondary btn-md waves-effect m-0" type="button">Redeem</button>
              </div>
            </div>
          </form>
          <!-- Promo code -->

        </div>
        <!--Grid column-->

      </div>
      <!--Grid row-->

    </div>
  </main>
 <!-- SCRIPTS -->
  <!-- JQuery -->
  <script type="text/javascript" src="/resources/kdw/js/jquery-3.4.1.min.js"></script>
  <!-- Bootstrap tooltips -->
  <script type="text/javascript" src="/resources/kdw/js/popper.min.js"></script>
  <!-- Bootstrap core JavaScript -->
  <script type="text/javascript" src="/resources/kdw/js/bootstrap.min.js"></script>
  <!-- MDB core JavaScript -->
  <script type="text/javascript" src="/resources/kdw/js/mdb.min.js"></script>
  <!-- Initializations -->
  <script type="text/javascript">
    // Animations initialization
    new WOW().init();
  </script>
<%@include file="../include/nds/footer.jsp" %> 
</body>
</html>