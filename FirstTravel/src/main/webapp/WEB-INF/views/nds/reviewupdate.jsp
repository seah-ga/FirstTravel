<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="../include/nds/header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<script src="https://cdnjs.cloudflare.com/ajax/libs/modernizr/2.8.3/modernizr.min.js" type="text/javascript"></script>

<link href='https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css' rel='stylesheet'/>
<link rel="shortcut icon" type="image/x-icon" href="/resources/nds/ndsread/images/favicon.png" />
  
  <!-- Themefisher Icon font -->
  <link rel="stylesheet" href="/resources/nds/ndsread/plugins/themefisher-font/style.css">
  <!-- bootstrap.min css -->
  <link rel="stylesheet" href="/resources/nds/ndsread/plugins/bootstrap/css/bootstrap.min.css">
  
  <!-- Revolution Slider -->
  <link rel="stylesheet" type="text/css" href="/resources/nds/ndsread/plugins/revolution-slider/revolution/fonts/pe-icon-7-stroke/css/pe-icon-7-stroke.css">
  <link rel="stylesheet" type="text/css" href="/resources/nds/ndsread/plugins/revolution-slider/revolution/fonts/font-awesome/css/font-awesome.css">

  <!-- REVOLUTION STYLE SHEETS -->
  <link rel="stylesheet" type="text/css" href="/resources/nds/ndsread/plugins/revolution-slider/revolution/css/settings.css">
  <link rel="stylesheet" type="text/css" href="/resources/nds/ndsread/plugins/revolution-slider/revolution/css/layers.css">
  <link rel="stylesheet" type="text/css" href="/resources/nds/ndsread/plugins/revolution-slider/revolution/css/navigation.css">
  
  <!-- Main Stylesheet -->
  <link rel="stylesheet" href="/resources/nds/ndsread/css/style.css">
<link rel="shortcut icon" href="assets/images/logo/favicon.png" type="image/x-icon">

    <!-- CSS Files -->

<link rel="stylesheet" href="/resources/nds/css/base.css">
<link rel="stylesheet" href="/resources/nds/css/skeleton.css">
<link rel="stylesheet" href="/resources/nds/css/screen.css">
<link rel="stylesheet" href="/resources/nds/css/prettyPhoto.css" type="text/css" media="screen" />

<!-- Favicons ==================================================
================================================== -->

<link rel="shortcut icon" href="/resources/nds/images/favicon.png">
<link rel="apple-touch-icon" href="/resources/nds/images/apple-touch-icon.png">
<link rel="apple-touch-icon" sizes="72x72" href="/resources/nds/images/apple-touch-icon-72x72.png">
<link rel="apple-touch-icon" sizes="114x114" href="/resources/nds/images/apple-touch-icon-114x114.png">

<!-- Google Fonts ==================================================
================================================== -->
<link href='http://fonts.googleapis.com/css?family=Oswald:400,300,700' rel='stylesheet' type='text/css'>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">												
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>												
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<meta charset="UTF-8">
<title>리뷰게시판(글쓰기)</title>
<style>
.selectinsert {
-webkit-appearance: none;  /* 네이티브 외형 감추기 */
    -moz-appearance: none;
    appearance: none;
    width: 200px; /* 원하는 너비설정 */
    padding: .8em .5em; /* 여백으로 높이 설정 */
    font-family: inherit;  /* 폰트 상속 */
    background: no-repeat 95% 50%; /* 네이티브 화살표를 커스텀 화살표로 대체 */
    border: 1px solid #999;
    border-radius: 0px; /* iOS 둥근모서리 제거 */
    -webkit-appearance: none; /* 네이티브 외형 감추기 */
    -moz-appearance: none;
    appearance: none;
    float: left;
}
</style>
<script>
var notcitystr = "<option>국가를 선택해주세요.</option>";

$(document).ready(function(){
	// 클래스에 따른 국가 변경
	$("#review_class").change(function() {
		$("#review_city").html(notcitystr);
		
		var review_class = $("#review_class option:selected").val();
		var str = "";
		
		if (review_class == "국내") { // 국내 일때
			str += "<option>국가 (선택)</option>";
			str += "<option>한국</option>";
			$("#review_country").html(str);
						
		} else if (review_class == "해외") { // 해외 일때
		var countrylisturl = "/ndsrest/countrylist";
		
			$.ajax ({
				"type" : "get",
				"url" : countrylisturl,
				"headers" : {
					"content-type" : "application/json",
					"X-HTTP-Method_Override" : "get"
				},
				"success" : function(rData) {
					str += "<option>국가 (선택)</option>";
					for (var i = 0 ; i < rData.length ; i++) {
					str += "<option>"+rData[i].overseas_Country+"</option>";
					$("#review_country").html(str);
					}
				}
			});
		} else {
			$("#review_country").html("<option>클래스를 선택해주세요.</option>")
		}
	});
	// 국가에 따른 도시 변경
	$("#review_country").change(function(){
		var review_country = $("#review_country").val();
		var domesticurl = "/ndsrest/domesticlist";
		var countrychkurl = "/ndsrest/countrychk";
		var str = "";
		
		if (review_country == "한국") { // 국가가 한국일때
			$.ajax ({
				"type" : "get",
				"url" : domesticurl,
				"headers" : {
					"content-type" : "application/json",
					"X-HTTP-Method_Override" : "get"
				},
				"success" : function(rData) {
					console.log(rData);
					str += "<option>도시(선택)</option>"
					for (var i = 0 ; i < rData.length ; i++) {
						str += "<option>"+rData[i].domestic_city +"</option>"
						$("#review_city").html(str);					
					}
				}
			});
		} else { // 국가가 한국이 아닐때
			var data = {
					"overseas_Country" : review_country
			};
			
			$.ajax({
				"type" : "post",
				"url" : countrychkurl,
				"headers" : {
					"content-type" : "application/json",
					"X-HTTP-Method-Override" : "post"
				},
				"dataType" : "text",
				"data" : JSON.stringify(data),
				"success" : function(rData) {
				var	parsedJson = JSON.parse(rData);
						str += "<option>도시(선택)</option>"
					for (var i = 0; i<parsedJson.length; i++) {
						str += "<option>"+parsedJson[i].overseas_City+"</option>";
					}
					$("#review_city").html(str);					
				}
			});
		}
	});
	$("#review_image").change(function(e){
		var fileValue = $("#review_image").prop('files')[0];
		var fileName = fileValue[fileValue.length-1]; // 파일명
		
		var formData = new FormData();
		formData.append("file",fileValue);
        var url = "/ndsupload/uploadAjax";
		$.ajax({
            "url": url,
            "data" : formData,
            "processData" : false,
            "contentType" : false,
            "type" : "POST",
            success: function(fullName){
            	var isImageval = fullName.indexOf(".");
            	var isImagestr = fullName.substring(isImageval);
            	var slashIndex = fullName.lastIndexOf("/");
            	var front = fullName.substring(0, slashIndex + 1);
            	var rear = fullName.substring(slashIndex + 1);
            	var thumbnailName = front + "s_" + rear;
            	var startIndex = fullName.indexOf("_");
            	var fileName = fullName.substring(startIndex + 1);
            	var str = "";
            	
            	if (isImagestr == ".jpg" || isImagestr == ".png" || isImagestr == ".gif") {
            		str = "<div data-filename='"+ fullName +"'>" + fileName
            			+  "<img src='/ndsupload/display?fileName="+ thumbnailName +"'>"
            			+  "</div>";
            	} else {
            		str = "<div data-filename='null'>" + fileName
            			+ "<img src='/resources/nds/images/file_image.png'>"
            			+ "</div>";
            	}
            	$("#file_image").html(str);
            }
        });
	});
	
	$("#btnregist").click(function(){
		var filename = $("#file_image > div").attr("data-filename");
		var hiddenstr = "<input type='hidden' name='review_image' value='"+ filename +"'>";
		
		$("#review_form").append(hiddenstr);
		$("#review_form").submit();
	});
});
</script>
</head>
<body>
<section class="page">
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<div class="content">
					<h1 class="page-name">후기 작성</h1>
					<ol class="breadcrumb">
					</ol>
				</div>
			</div>
		</div>
	</div>
</section>
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<form id="review_form" action="/nds/reviewupdate-run" method="post" enctype="multipart/form-data">
					<input type="hidden" name="user_code" value="${reviewVo.user_code}">
					<input type="hidden" name="review_writer" value="${reviewVo.review_writer}">
					<input type="hidden" name="review_num" value="${reviewVo.review_num}">
					<div style="float: left;">				
						<select id="review_class" class="selectinsert" name="review_class">
						<option selected="selected">${reviewVo.review_class}</option>
						<option>국내</option>						
						<option>해외</option>
						</select>
						<select id="review_country" class="selectinsert" name="review_country">
							<option>클래스를 선택해주세요.</option>
							<option selected="selected">${reviewVo.review_country}</option>
						</select>
						<select id="review_city" class="selectinsert" name="review_city">
							<option>국가를 선택해주세요.</option>
							<option selected="selected">${reviewVo.review_city}</option>
						</select>
					</div>
						<div class="form" style="width: 400px;">
							<input style="background-color: #ffffff;  margin-top: 40px;" type="text" placeholder="제목" class="form-control" id="review_name" name="review_name" value="${reviewVo.review_name}">
						</div>
						
						<div class="form" style="height:400px;">
							<textarea style="height:400px;" rows="20" placeholder="내용" class="form-control" id="review_content" name="review_content"> ${reviewVo.review_content}</textarea>	
						</div>
						<div class="form-group" id="file">
							<input type="file" id="review_image">
						</div>
						<div id="file_image">
						</div>						
					</form>
					<a class="btn btn-main mt-10" id="btnregist">글 쓰기</a>
				</div>
		</div>
	</div>
 <%@ include file="../include/nds/ndsfooter.jsp" %>
</body>
</html>