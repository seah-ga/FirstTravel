<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
<!--   <main class="mt-5 pt-4"> -->
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
            <form class="card-body" action="/kdw/memberinfo-run" method="post">

              <!--Grid row-->
              
              <!-- 유저 아이디 -->
              <div class="md-form mb-5">
                <input type="text" id="user_id" class="form-control" value="${memberVo.user_id}" readonly="readonly">
                <label for="user_id" class="">아이디</label>
              </div>
              
              <!-- 비밀번호 -->
              <div class="md-form mb-5">
                <input type="password" id="user_pw" class="form-control" value="${memberVo.user_pw }">
                <label for="user_pw" class="">비밀번호</label>
              </div>
              
              <!-- 연락처 -->
              <div class="md-form mb-5">
                <input type="text" id="user_phone" class="form-control" value="${memberVo.user_phone }">
                <label for="user_phone" class="">연락처</label>
              </div>

              <!--email-->
              <div class="md-form mb-5">
                <input type="text" id="email" class="form-control" value="${memberVo.user_email}">
                <label for="email" class="">Email</label>
              </div>

              <!-- 주소 -->
              <div class="md-form mb-5">
                <input type="text" id="address" class="form-control" value="${memberVo.user_address }">
                <label for="address" class="">주소</label>
              </div>

              <!--Grid row-->

              <hr>

              <div class="custom-control custom-checkbox">
                <input type="checkbox" class="custom-control-input" id="chk_ad" value="${memberVo.chk_ad }">
                <label class="custom-control-label" for="chk_ad">여행정보 / 이벤트 / 쿠폰 수신에 동의합니다.</label>
              </div>
              
			  <div class="row">
                <!--Grid column-->
              		<div class="col-md-6 mb-2">
	              		<hr class="mb-4">
	              		<button class="btn btn-unique btn-block" type="submit">수정</button>
					</div>
              		<div class="col-md-6 mb-2">
	              		<hr class="mb-4">
	              		<button class="btn btn-blue-grey btn-block" id="btn_cancel">취소</button>
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
<!--   </main> -->
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