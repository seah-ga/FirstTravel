<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta http-equiv="x-ua-compatible" content="ie=edge">
  <title>Material Design Bootstrap</title>
  <!-- Font Awesome -->
  <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.2/css/all.css">
  <!-- Bootstrap core CSS -->
  <link href="/resources/kdw/css/bootstrap.min.css" rel="stylesheet">
  <!-- Material Design Bootstrap -->
  <link href="/resources/kdw/css/mdb.min.css" rel="stylesheet">
  <!-- Your custom styles (optional) -->
  <link href="/resources/kdw/css/style.min.css" rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <style type="text/css">
    html,
    body,
    header,
    .view {
      height: 100%;
    }

    @media (max-width: 740px) {
      html,
      body,
      header,
      .view {
        height: 1000px;
      }
    }

    @media (min-width: 800px) and (max-width: 850px) {
      html,
      body,
      header,
      .view {
        height: 650px;
      }
    }
    @media (min-width: 800px) and (max-width: 850px) {
              .navbar:not(.top-nav-collapse) {
                  background: #1C2331!important;
              }
          }
  </style>
<script>
$(document).ready(function() {
	console.log("123");
	
	// 회원가입 버튼 클릭시
	$("#btn_join").click(function() {
		location.href = "/kdw/join";
		console.log("12355");
	});
	
	// 로그인 유지 체크시
	$("#chk_id").click(function() {
		console.log("유지 체크");
		var chk_status = $(this).val();
		if (chk_status == "N") {
			$(this).val("Y");
		} else {
			$(this).val("N");
		}
		console.log("체크상태: " + $(this).val());
	});
	
	// 아이디 비밀번호 찾기 클릭시 모달창
	$("#search_id").click(function(e) {
		e.preventDefault();
		console.log("아이디 비밀번호 찾기");
		$("#btn_modal").trigger("click");
	});
	
	// 아이디/비밀번호 발송
	$("#btn_search_id").click(function() {
		var user_id = $("#user_id").val();
		var user_email = $("#user_email").val();
		var data = {
				"user_id" : user_id,
				"user_email" : user_email
		};
		var url = "/kdw/search_id";
		$.ajax({
			"type" : "post",
			"url" : url,
			"headers" : {
				"content-type" : "application/json",
				"X-HTTP-Method-Override" : "post"
			},
			"data" : JSON.stringify(data),
			"dataType" : "text",
			"success" : function(receivedData) {
				console.log("아이디 비밀번호 발송");
				console.log(receivedData);
				if (receivedData == "success") {
					alert("새로운 비밀번호를 메일로 발송했습니다.");
				} else if (receivedData == "non-success") {
					alert("아이디 또는 메일을 확인해 주세요.");
				} else if (receivedData == "bad") {
					alert("아이디/메일을 입력해 주세요.");
				}
			}
			
		});
		
	});
});
</script>  
</head>

<body>
<!-- 아이디/비번 찾기 모달창 -->
<div class="modal fade" id="modalRegisterForm" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
  aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header text-center">
        <h4 class="modal-title w-100 font-weight-bold">아이디/비밀번호 찾기</h4>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body mx-3">
        <div class="md-form mb-5">
          <i class="fas fa-user prefix grey-text"></i>
          <input type="text" class="form-control validate" id="user_id" name="user_id">
          <label data-error="wrong" data-success="right" for="orangeForm-name">아이디</label>
        </div>
        <div class="md-form mb-5">
          <i class="fas fa-envelope prefix grey-text"></i>
          <input type="email" class="form-control validate" id="user_email" name="user_email">
          <label data-error="wrong" data-success="right" for="orangeForm-email">이메일</label>
        </div>


      </div>
      <div class="modal-footer d-flex justify-content-center">
        <button class="btn btn-deep-orange" id="btn_search_id">보내기</button>
      </div>
    </div>
  </div>
</div>
<!-- // 모달창 -->



  <!-- Full Page Intro -->
  <div class="view full-page-intro" style="background-image:url('/resources/kdw/img/bg.jpg'); background-repeat: no-repeat; background-size: cover;">

    <!-- Mask & flexbox options-->
    <div class="mask rgba-black-light d-flex justify-content-center align-items-center">

      <!-- Content -->
      <div class="container">

        <!--Grid row-->
        <div class="row wow fadeIn">

          <!--Grid column-->
          <div class="col-md-6 mb-4 white-text text-center text-md-left">

            <h1 class="display-4 font-weight-bold">First Trevel에 <br>오신걸 환영합니다.</h1>

            <hr class="hr-light">

            <p>
              <strong>아직 회원이 아니신가요?</strong>
            </p>

            <p class="mb-4 d-none d-md-block">
              <strong>회원가입시 FT 머니 ￦1,000 증정<br>
              오직 회원에게만 드리는 다양한 혜택</strong>
            </p>

            <button class="btn btn-main-color btn-lg" id="btn_join">회원가입<i class="fas fa-sign-in-alt"></i></button>

          </div>
          <!--Grid column-->

          <!--Grid column-->
          <div class="col-md-6 col-xl-5 mb-4">

            <!--Card-->
            <div class="card">

              <!--Card content-->
              <div class="card-body">

                <!-- Form -->
                <form action="/kdw/login-run" method="post">
                  <!-- Heading -->
                  <h3 class="dark-grey-text text-center">
                    <strong>Login</strong>
                  </h3>
                  <hr>

                  <div class="md-form">
                    <i class="fas fa-user prefix grey-text"></i>
                    <input type="text" id="user_id" name="user_id" class="form-control" value="user1">
                    <label for="form3">아이디</label>
                  </div>
                  <div class="md-form">
                    <i class="fas fa-key prefix grey-text"></i>
                    <input type="password" id="user_pw" name="user_pw" class="form-control" value="1234">
                    <label for="form2">비밀번호</label>
                  </div>

<!--                   <div class="md-form"> -->
<!--                     <i class="fas fa-pencil-alt prefix grey-text"></i> -->
<!--                     <textarea type="text" id="form8" class="md-textarea"></textarea> -->
<!--                     <label for="form8">Your message</label> -->
<!--                   </div> -->

                  <div class="text-center">
                    <input type="submit" class="btn btn-main-color" value="로그인">
                    <hr>
                    <fieldset class="form-check">
                      <input type="checkbox" class="form-check-input" id="chk_id" name="chk_id" value="N">
                      <label for="chk_id" class="form-check-label dark-grey-text">로그인 유지</label>
                      <a href="" class="form-check-label dark-grey-text" id="search_id">아이디/비밀번호 찾기</a>
                      <div><a href="/ljh/main" style="color:#333;">메인으로</a></div>
                      <input type="button" style="display:none;" id="btn_modal" class="btn btn-default btn-rounded mb-4" data-toggle="modal" data-target="#modalRegisterForm" value="모달">
                    </fieldset>
                  </div>

                </form>
                <!-- Form -->

              </div>

            </div>
            <!--/.Card-->

          </div>
          <!--Grid column-->

        </div>
        <!--Grid row-->

      </div>
      <!-- Content -->

    </div>
    <!-- Mask & flexbox options-->

  </div>
  <!-- Full Page Intro -->


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
</body>

</html>
