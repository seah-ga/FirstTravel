<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<style>
.search {
-webkit-appearance: none;  /* 네이티브 외형 감추기 */
    -moz-appearance: none;
    appearance: none;
    width: 200px; /* 원하는 너비설정 */
    padding: .8em .5em; /* 여백으로 높이 설정 */
    font-family: inherit;  /* 폰트 상속 */
    background: no-repeat 95% 50%; /* 네이티브 화살표를 커스텀 화살표로 대체 
    border: 1px solid #999;
    border-radius: 0px; /* iOS 둥근모서리 제거 */
    -webkit-appearance: none; /* 네이티브 외형 감추기 */
    -moz-appearance: none;
    appearance: none;
    margin-top: 30px;
    float: left;
}
</style>
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
<script>
$(document).ready(function() {
	// 검색 버튼을 클릭했을때 (메인,리드 쪽하고 연동)
	$("#btnsearch").click(function() {
		var overseas_Country = $("#country").val();
		var overseas_City = $("#city option:selected").text();
		var airPort = $("#city").val();
		console.log(airPort);
		location.href="/nds/itemoverseasread?overseas_Country="+overseas_Country+"&overseas_City="+overseas_City+"&airPort="+airPort;
	});
});
</script>


<!-- 검색 창 -->
<div class="search-area">
        <div class="search-bg">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12">
                    		<h2>해외 검색</h2>
                            <select id="country" class="search" style="border-bottom: 2px black; border-bottom-style: solid; ">
                            	<option>국가(선택)</option>
	                            <c:forEach var="overseasVo" items="${countrylist}">
                                <option value="${overseasVo.overseas_Country}">${overseasVo.overseas_Country}</option>
                                </c:forEach>
                            </select>
                            <select id="city" class="search" style="margin-left: 20px; border-bottom: 2px black; border-bottom-style: solid;">
                           		<option>(도시)국가를 선택해주세요.</option>
                            </select>
                     
                            <input type="button" value="검색" id="btnsearch" style="margin-top: 30px; height: 44px; border-bottom: 2px 
                             black; border-style: solid;">
                    </div>
                </div>
            </div>
        </div>
    </div>