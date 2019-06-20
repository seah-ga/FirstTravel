<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
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
  <script type="text/javascript" src="/resources/kdw/js/jquery-3.4.1.min.js"></script>
  <!-- Bootstrap tooltips -->
  <script type="text/javascript" src="/resources/kdw/js/popper.min.js"></script>
  <!-- Bootstrap core JavaScript -->
  <script type="text/javascript" src="/resources/kdw/js/bootstrap.min.js"></script>
  <!-- 다음 주소 api -->
  <script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
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
	// 아이디 중복 체크
	$("#btn_chkid").click(function() {
		var user_id = $("#user_id").val();
		var url = "/kdw/join/checkid";
		var data = {
			"user_id" : user_id
		};
		$.ajax({
			"type" : "post",
			"url" : url,
			"headers" : {
				"content-type" : "application/json",
				"X-HTTP-Method-Override" : "post"
			},
			"dataType" : "text",
			"data" : JSON.stringify(data),
			"success" : function(received) {
// 				console.log(received);

			}
		});
		
	});
	
	
	// 주소 api
	$("#btn_address").click(function() {
		console.log("123");
	    new daum.Postcode({
	        oncomplete: function(data) {
	            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
	
	            // 각 주소의 노출 규칙에 따라 주소를 조합한다.
	            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
	            var addr = ''; // 주소 변수
	
	            //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
	            if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
	                addr = data.roadAddress;
	            } else { // 사용자가 지번 주소를 선택했을 경우(J)
	                addr = data.jibunAddress;
	            }
	
	
	            // 우편번호와 주소 정보를 해당 필드에 넣는다.
	            console.log(data.zonecode);
	            var code = data.zonecode;
	            console.log("code" + data.zonecode);
	            console.log("code" + code);
	            if (code == null) {
	            	code = "";
	            } else if(code != null){
	            	
		        $("#address_num").val(code);
	            	
	            }
	            $("#address").val(addr);
	            // 커서를 상세주소 필드로 이동한다.
	            $("#detail_address").focus();
	        }
	    }).open();

	});
});
</script>  
</head>
<body>


  <!-- Full Page Intro -->
  <div class="view full-page-intro" style="background-image:url('/resources/kdw/img/bg.jpg'); background-repeat: no-repeat; background-size: cover;">

    <!-- Mask & flexbox options-->
    <div class="mask rgba-black-light d-flex justify-content-center align-items-center">

      <!-- Content -->
      <div class="container">


          <!--Grid column-->
          <div class="col-md-12 col-xl-12 center">

            <!--Card-->
            <div class="card">

              <!--Card content-->
              <div class="card-body">
			<!-- Default form register -->
<form class="text-left border border-light p-5">

    <p class="h4 mb-4">회원가입</p>

    
    <!-- 아이디 -->
    <input type="text" id="user_id" name="user_id" class="form-control" placeholder="아이디">
    <!-- 아이디 중복체크버튼 -->
    <input type="button" class="btn btn-info mb-1 p-1" id="btn_chkid" value="중복체크">
   

    <!-- 비밀번호 -->
    <input type="password" id="user_pw" name="user_pw" class="form-control" placeholder="패스워드" aria-describedby="defaultRegisterFormPasswordHelpBlock">
    <small class="form-text text-muted mb-4">
        8자 이상 입력하세요
    </small>
    
    <!-- E-mail -->
    <input type="email" id="user_email" name="user_email" class="form-control mb-4" placeholder="E-mail">
    
    <!-- 주소 입력 -->
     <div class="form-row mb-4">
        <div class="col">
            <input type="text" id="address_num" name="address_num" class="form-control" placeholder="우편번호" readonly="readonly">
        </div>
        <div class="col">
            <!-- address button -->
			<input type="button" value="주소" id="btn_address" class="btn btn-info p-1">
       </div>
    </div>
	<input type="text"  class="form-control mb-4" readonly="readonly" id="address" name="address">
	<input type="text"  class="form-control mb-4" placeholder="상세주소" id="detail_address" name="detail_address">

    <!-- 휴대폰 번호 -->
    <input type="text" id="user_phone" name="user_phone" class="form-control" placeholder="연락처" aria-describedby="defaultRegisterFormPhoneHelpBlock">

    <!-- 광고 수신동의 -->
    <div class="custom-control custom-checkbox">
        <input type="checkbox" class="custom-control-input" id="defaultRegisterFormNewsletter">
        <label class="custom-control-label" for="defaultRegisterFormNewsletter">광고 이메일 수신 동의</label>
    </div>

    <!-- 회원가입 버튼 -->
    <input type="submit" class="btn btn-info my-4 btn-block" value="회원가입" >

    <hr>

    <!-- Terms of service -->
    <p>By clicking
        <em>Sign up</em> you agree to our
        <a href="" target="_blank">terms of service</a>

</form>
<!-- Default form register -->


              </div>

            </div>
            <!--/.Card-->

          </div>
          <!--Grid column-->

        </div>
        <!--Grid row-->

      </div>
      <!-- Content -->

    <!-- Mask & flexbox options-->

  </div>
  <!-- Full Page Intro -->
</body>

</html>