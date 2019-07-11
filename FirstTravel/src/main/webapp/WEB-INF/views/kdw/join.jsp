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
  <script type="text/javascript" src="/resources/kdw/js/jquery-3.4.1.min.js"></script>
  <!-- Bootstrap tooltips -->
  <script type="text/javascript" src="/resources/kdw/js/popper.min.js"></script>
  <!-- Bootstrap core JavaScript -->
  <script type="text/javascript" src="/resources/kdw/js/bootstrap.min.js"></script>
  <!-- validate -->
  <script type="text/javascript" src="/resources/kdw/js/jquery.validate.js"></script>
  <!-- validate additional-methods -->
  <script type="text/javascript" src="/resources/kdw/js/additional-methods.js"></script>
  <!-- validate messages_ko -->
  <script type="text/javascript" src="/resources/kdw/js/additional-methods.js"></script>
  <!-- 다음 주소 api -->
  <script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
  <link rel="stylesheet" href="/resources/kdw/css/myTooltip.css"> 
<!--   <script src="/resources/kdw/js/myTooltip.js"></script> -->
<!--   <script src="/resources/kdw/js/myTooltipuse.js"></script> -->

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
	var message = "";
	isNull = function(object) { try { if (typeof object == "boolean"){ return false; } else { return (object == null || typeof object == "undefined" || object === "" || object == "undefined"); } } catch (e) { alert("isNull: " + object +"::"+ e.message); WebSquare.exception.printStackTrace(e); } }; 
	// 아이디 중복 체크
	$("#btn_chkid").click(function() {
		console.log("클릭");
		var user_id = $("#user_id").val();
		if (user_id.length == 0) {
			alert("아이디를 입력해 주세요");
			$("#user_id").focus();
			return;
		} else if (user_id.length > 0 && user_id.length < 4) {
			alert("아이디 길이가 짧습니다.");
			$("#user_id").focus();
			return;
		}
		var get_check = /^[a-zA-Z0-9]{4,12}$/;
		if (!get_check.test(user_id) == true) {
			alert("영문 또는 숫자만 입력해 주세요");
			$("#user_id").focus();
			return;
		}
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
				console.log(received);
				if(received == 0) {
					$("#chk_id_text").text("사용가능한 아이디입니다.");
					$("#user_id").focus();
					message = "useable_id";
				} else if (received > 0) {
					$("#chk_id_text").text("사용중인 아이디입니다.");
					message = "use_id";
					$("#user_id").focus();
				}
			}	
		});
		
	});
	
	// 이메일 인증번호 발송
	$("#btn_chk_email").click(function() {
		console.log("이메일 인증 버튼 클릭");
		var user_email = $("#user_email").val();
		var url = "/kdw/join/chkemail";
		var data = {
				"user_email" : user_email
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
				console.log(received);
				$("#authkey").val(received);
				$("#user_key").val(received);
			}
		});
	});
	
	// 광고 수신 체크 박스
	$("#chk_ad").click(function() {
		var checked = $("#chk_ad").is(":checked");
		if (checked == true) {
			$("#chk_ad").val("Y");
		} else if(checked == false) {
			$("#chk_ad").val("N");
		}
		console.log($("#chk_ad").val());
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
	            $("#search_address").val(addr);
	            // 커서를 상세주소 필드로 이동한다.
	            $("#detail_address").focus();
	        }
	    }).open();
	}); // 주소 api
	
	// 회원가입 버튼
	$("#btn_join").click(function() {
		console.log("회원가입 버튼 클릭");
		console.log("message" + message);
		var user_key = $("#user_key").val();
		var authkey = $("#authkey").val();
		console.log("user_key" + user_key);
		console.log("authkey" + authkey);
		var user_id = $("#user_id").val();
		if (user_id.length == 0) {
			alert("아이디를 입력해 주세요.");
			$("#user_id").focus();
			return;
		} else if(message == "use_id") {
			alert("아이디가 중복입니다.");
			return;
		}
		if (user_key != authkey) {
			alert("이메일 인증번호가 틀립니다.");
			return;
		} else if (authkey == "") {
			alert("이메일 인증을 진행해주세요.");
			return;
		}
		var pw_score = $("#pw_score").val();
		if (pw_score == "weak") {
			alert("비밀번호 안전도가 낮습니다.")
			return;
		} else if ($("#user_pw").val().length < 8) {
			alert("비밀번호의 길이가 짧습니다.");
			return;
		}
		var address = $("#search_address").val();
		if (address == null || address == "") {
			alert("주소를 입력해주세요.");
			return;
		}
		$("#joinForm").submit();
	});
	
// 	jQuery.validator.setDefaults({
//         errorPlacement: function(error, element) {
//         	console.log(error);
//         	console.log(element);
//             var pos = element.offset();
             
//             error.css({
//                 left: pos.left,
//                 top: pos.top + 20
//             });
             
//             error.insertAfter(element);
//         }
//     });

// 	 $('form').each(function(){
// 	        $(this).validate();
// 	    }); 
	 
	 $("#user_pw").keyup(function(e) {
		 var str_score = checkPassStrength($("#user_pw").val());
		 $("#pw_score").val(str_score);
		 console.log(str_score);
		 checkPassword($("#user_pw").val(), str_score);
		 function checkPassword(password, str_score){
			    
			   
			    
			    if(password.length < 8){
			    	help_close();
			    	$("#help1_5").css("display", "block"); //비밀번호는 8자 이상 입력하셔야 합니다.
			    } else if (password.length >= 8) {
			    	help_close();
			    }
			    var checkNumber = password.search(/[0-9]/g);
			    var checkEnglish = password.search(/[a-z]/ig);
			    if((checkNumber <0 || checkEnglish <0) && password.length > 8){
			    	help_close();
// 			        alert("숫자와 영문자를 혼용하여야 합니다.");
			        $("#help1_2").css("display", "block"); // 안전도가 높은 비밀번호를 권장합니다.
			    }
			    if(/(\w)\1\1\1/.test(password)){
			    	help_close();
// 			        alert('같은 문자를 4번 이상 사용하실 수 없습니다.');
			        $("#help1_2").css("display", "block");
			    }
			    if(str_score == "weak" && password.length >= 8) {
			    	help_close();
			    	$("#help1_2").css("display", "block");
			    }
			    
			    if(str_score == "strong") {
			    	help_close();
			    	$("#help1_4").css("display", "block");
			    }
			    if(str_score == "good") {
			    	help_close();
			    	$("#help1_3").css("display", "block");
			    }
			   
			        
			}
		 $("#user_pw").focusout(function(){
			 help_close();
		 });
	 });
	 
	 function help_close() {
		 console.log("close작동");
		 $("#help1_2").css("display", "none");
		 $("#help1_3").css("display", "none");
		 $("#help1_4").css("display", "none");
		 $("#help1_5").css("display", "none");
	 }
	 
	 function scorePassword(pass) {
		    var score = 0;
		    if (!pass)
		        return score;

		    // award every unique letter until 5 repetitions
		    var letters = new Object();
		    for (var i=0; i<pass.length; i++) {
		        letters[pass[i]] = (letters[pass[i]] || 0) + 1;
		        score += 5.0 / letters[pass[i]];
		    }

		    // bonus points for mixing it up
		    var variations = {
		        digits: /\d/.test(pass),
		        lower: /[a-z]/.test(pass),
		        upper: /[A-Z]/.test(pass),
		        nonWords: /\W/.test(pass),
		    }

		    variationCount = 0;
		    for (var check in variations) {
		        variationCount += (variations[check] == true) ? 1 : 0;
		    }
		    score += (variationCount - 1) * 10;

		    return parseInt(score);
		}
	 
	 function checkPassStrength(pass) {
		    var score = scorePassword(pass);
		    if (score > 80)
		        return "strong";
		    if (score > 60)
		        return "good";
		    if (score >= 30)
		        return "weak";

		    return "";
		
	 }

});
</script>  
<style>
    label.error {
        position: absolute;
        border: 2px solid red;
        background: #EEE;
        padding: 3px;
    }
.help {
    display: inline-block;
    position: absolute;
    background: #ffffff;
    height: 100px;
    width: 200px;
    margin: 0 auto 10px;
    border: 1px solid #999;
}
.help:after {
    content: '';
    position: absolute;
    border-top: 10px solid #ffffff;
    border-right: 5px solid transparent;
    border-left: 5px solid transparent;
    bottom: -9px;
    left: 5px;
}
.help:before {
    content: '';
    position: absolute;
    border-top: 10px solid #999;
    border-right: 5px solid transparent;
    border-left: 5px solid transparent;
    bottom: -11px;
    left: 5px;
}

</style>
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
<form class="text-left border border-light p-5" action="/kdw/join-run" method="post" id="joinForm">

    <p class="h4 mb-4">회원가입</p>

    
    <!-- 아이디 -->
    <input type="text" id="user_id" name="user_id" class="form-control" placeholder="아이디" maxlength="12">
    <!-- 아이디 중복체크버튼 -->
    <input type="button" class="btn btn-info mb-1 p-1" id="btn_chkid" value="중복체크">
    <p><small class="form-text text-muted mb-4" id="chk_id_text">4~12자리의 영문 대소문자와 숫자로만 입력하세요</small></p>
   
	    <!--비밀번호 안전도 말풍선-->

<div id="help1_2" class="help left" style="top:150px;right:300px;display:none;">
	<!-- 비밀번호 안전도 -->
	<div class="txt">
		<p>
		비밀번호 안전도 <em>|</em> <strong>낮음</strong>
	 <img src="https://static.nid.naver.com/images/web/user/safetybar1_140811.gif" width="47" height="3" alt="" /><br />
		<span class="ex">안전도가 높은 비밀번호를 권장합니다.</span></p>
	</div>
	<!-- //비밀번호 안전도 -->
	<span class="arrow"></span>
</div>

<div id="help1_3" class="help left" style="top:150px;right:300px;display:none;">
	<!-- 비밀번호 안전도 -->
	<div class="txt">
		<p>
		비밀번호 안전도 <em>|</em> <strong>적정</strong>
	 <img src="https://static.nid.naver.com/images/web/user/safetybar2_140811.gif" width="47" height="3" alt="" /><br />
		<span>안전하게 사용하실 수 있는 비밀번호 입니다.</span></p>
	</div>
	<!-- //비밀번호 안전도 -->
	<span class="arrow"></span>
</div>

<div id="help1_4" class="help left" style="top:150px;right:300px;display:none;">
	<!-- 비밀번호 안전도 -->
	<div class="txt">
		<p>
		비밀번호 안전도 <em>|</em> <strong>높음</strong>
	 <img src="https://static.nid.naver.com/images/web/user/safetybar3_140811.gif" width="47" height="3" alt="" /><br />
		<span>예측하기 힘든 비밀번호로 더욱 안전합니다.</span></p>
	</div>
	<!-- //비밀번호 안전도 -->
	<span class="arrow"></span>
</div>

<div id="help1_5" class="help left" style="top:150px;right:300px;display:none;">
	<!-- 비밀번호 안전도 -->
	<div class="txt">
		<p>비밀번호는 8자 이상 입력하셔야 합니다.</p>
	</div>
	<!-- //비밀번호 안전도 -->
	<span class="arrow"></span>
</div>


<!--비밀번호 안전도 말풍선-->
    <!-- 비밀번호 -->
    <input type="password" id="user_pw" name="user_pw" class="form-control" placeholder="패스워드" >
	<input type="hidden" id="pw_score">
    <small class="form-text text-muted mb-4">
        8자 이상 입력하세요
    </small>
    
    <!-- 이름 -->
    <input type="text" id="user_name" name="user_name" class="form-control mb-4" placeholder="이름">
    
    <!-- E-mail -->
    <div class="form-row mb-4">
    	<div class="col">
	   		<input type="email" id="user_email" name="user_email" class="form-control mb-4" placeholder="E-mail" value="seah632@naver.com">
    	</div>
    	<div class="col">
	   		<input type="text" class="form-control mb-4" placeholder="인증번호" id="user_key">
	   		<input type="hidden" id="authkey">
    	</div>
    	<div class="col">
	   		<input type="button" value="이메일 인증하기" class="btn btn-info p-1" id="btn_chk_email">
    	</div>
    </div>
    
    <!-- 주소 입력 -->
     <div class="form-row mb-2">
        <div class="col">
            <input type="text" id="address_num" name="address_num" class="form-control" placeholder="우편번호" readonly="readonly">
        </div>
        <div class="col">
            <!-- address button -->
			<input type="button" value="주소" id="btn_address" class="btn btn-info p-1">
       </div>
    </div>
	<input type="text"  class="form-control mb-2" readonly="readonly" id="search_address" name="search_address">
	<input type="text"  class="form-control mb-4" placeholder="상세주소" id="detail_address" name="detail_address">

    <!-- 휴대폰 번호 -->
    <input type="text" id="user_phone" name="user_phone" class="form-control" placeholder="연락처" aria-describedby="defaultRegisterFormPhoneHelpBlock">

    <!-- 광고 수신동의 -->
	<div class="custom-control custom-checkbox">
    <input type="checkbox" class="custom-control-input" id="chk_ad" name="chk_ad" value="N">
    <label class="custom-control-label" for="chk_ad">여행정보 / 이벤트 / 쿠폰 수신에 동의합니다.</label>
	</div>

    <!-- 회원가입 버튼 -->
    <input type="button" class="btn btn-info my-4 btn-block" value="회원가입" id="btn_join">

    <hr>

    <!-- Terms of service -->
<!--     <p>By clicking -->
<!--         <em>Sign up</em> you agree to our -->
<!--         <a href="" target="_blank">terms of service</a> -->

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