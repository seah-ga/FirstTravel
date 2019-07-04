<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
<title>후기 게시판</title>
<!-- 검색 스타일 -->
<style>
fieldset {
  position: relative;
  display: inline-block;
  background: #fff;
  border: 2;
  border-color:#000000;
  border-radius: 5px;
  
}

input,
button {
  position: relative;
  width: 200px;
  height: 50px;
  padding: 0;
  display: inline-block;
  float: left;
  border-color: #000000;
}

input {
  color: #666;
  z-index: 2;
  border: 2;
  border-color: #000000;
}
input:focus {
  border: 2;
  border-color: #000000;
}
input:focus + button {
  -webkit-transform: translate(0, 0);
      -ms-transform: translate(0, 0);
          transform: translate(0, 0);
  -webkit-transition-duration: 0.3s;
          transition-duration: 0.3s;
  background-color: #a5e3ff;
}
input:focus + button .fa {
  -webkit-transform: translate(0px, 0);
      -ms-transform: translate(0px, 0);
          transform: translate(0px, 0);
  -webkit-transition-duration: 0.3s;
          transition-duration: 0.3s;
  color: #000000;

}

button {
  z-index: 1;
  width: 50px;
  border: 2;
  background: #a5e3ff;
  cursor: pointer;
  border-radius: 0 5px 5px 0;  
  -webkit-transform: translate(-50px, 0);
      -ms-transform: translate(-50px, 0);
          transform: translate(-50px, 0);
  -webkit-transition-duration: 0.3s;
          transition-duration: 0.3s;
}

.fa-search {
  font-size: 1.4rem;
  color: #000000;
  z-index: 3;
  top: 25%;
  -webkit-transform: translate(-190px, 0);
      -ms-transform: translate(-190px, 0);
          transform: translate(-190px, 0);
  -webkit-transition-duration: 0.3s;
          transition-duration: 0.3s;
  -webkit-transition: all 0.1s ease-in-out;
          transition: all 0.1s ease-in-out;
}
</style>
<script>
// 페이지네이션 클릭 했을때 폼으로 보내기
$(document).ready(function() {
	$(".a_pagination").click(function(e) {
		e.preventDefault();
		var page = $(this).attr("data-page");
		$("input[name=page]").val(page);
		$("#pageForm").submit();
	});
// 검색클릭했을때 폼으로 보내기
	$("#searchbtn").click(function(){
		var keyword = $("#keyword").val();
		var searchType = $("#searchType option:selected").val();
		$("input[name=keyword]").val(keyword);
		$("input[name=searchType]").val(searchType);
		$("#pageForm").submit();
	});
	// 이미지,제목 클릭했을때 폼으로 리드 보내기
	$(".readloaction").click(function() {
		var review_num = $(this).attr("data-num");
		$("input[name=review_num]").val(review_num);
		$("#pageForm").attr("action", "/nds/reviewread");
		$("#pageForm").submit();
	});
	
});
</script>
</head>
<!-- 페이징, 서치 폼 -->
<body id="body">
<form id="pageForm" action="/nds/reviewlist">
	<input type="hidden" name="review_num"
		value="${param.review_num}">
	<input type="hidden" name="page"
		value="${paginationDto.pagingDto.page}">
	<input type="hidden" name="perPage"
		value="${paginationDto.pagingDto.perPage}">
	<input type="hidden" name="searchType"
		value="${paginationDto.pagingDto.searchType}">
	<input type="hidden" name="keyword"
		value="${paginationDto.pagingDto.keyword}">
</form>

<!-- 헤드 제목 -->
<section class="page">
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<div class="content">
					<h1 class="page-name">여행 후기</h1>
					<ol class="breadcrumb">
					</ol>
				</div>
			</div>
		</div>
	</div>
</section>
<!-- 글 내용 -->
<div class="page-wrapper">
	<div class="container">
		<div class="row">
		 <c:forEach var="reviewVo" items="${reviewList}">
      		<div class="col-md-6">
		        <div class="post">
		          <div class="post-thumb">
		            <a href="#">
		              <img class="img-responsive readloaction" data-num="${reviewVo.review_num}" src="
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
		          <h2 class="post-title"><a href="#" class="readloaction" data-num="${reviewVo.review_num}">[${reviewVo.review_country}:${reviewVo.review_city}]${reviewVo.review_name}</a></h2>
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
      <!-- 이전 -->
       <div class="col-md-4">
			<ul class="pagination post-pagination">
			<c:if test="${paginationDto.prev == true}">
				<li><a href="#" class="a_pagination" data-page="${paginationDto.startPage - 1}">&lt;</a>
				</li>
			</c:if>
			<!--  페이징 -->
			<c:forEach var="i" begin="${paginationDto.startPage}"
							   end="${paginationDto.endPage}">
				<li class="
				<c:if test="${paginationDto.pagingDto.page == i}">
					active
				</c:if>
				">
					<a href="#" class="a_pagination" data-page="${i}">${i}</a>
				</li>
			</c:forEach>
			<!-- 다음 -->
			<c:if test="${paginationDto.next == true}">
				<li><a href="#" class="a_pagination" data-page="${paginationDto.endPage + 1}">&gt;</a>
				</li>
			</c:if>
			</ul>
			</div>
			<!-- 검색 타입-->
			<div class="col-md-8" style="margin-top: 20px">
			<select id="searchType" style="width: 70px; height:50px; border-color:#000000; float: left; background-color: #ffffff; margin-right: 30px;">
				<option value="review_writer" selected="selected">작성자</option>
				<option value="review_name">제목</option>
				<option value="review_country">국가</option>
				<option value="review_city">도시</option>
			</select>
			<!-- 검색 값 -->
				<fieldset><input type="search" id="keyword"/><button id="searchbtn"><i class="fa fa-search"></i></button></fieldset>
			<!-- 글쓰기 버튼 -->
				<a class="btn btn-main mt-10" id="btnregist" style="margin-bottom: 40px; float: right;" onclick="location.href='/nds/reviewregist'">리뷰 작성</a>
			</div>
  		</div> 	
	</div>
           

<%@ include file="../include/nds/ndsfooter.jsp" %>
</body>
</html>