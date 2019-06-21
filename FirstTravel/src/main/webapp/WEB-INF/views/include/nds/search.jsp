<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
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
    <link rel="stylesheet" href="/resources/psj/assets/css/animate-3.7.0.css">
    <link rel="stylesheet" href="/resources/psj/assets/css/font-awesome-4.7.0.min.css">
    <link rel="stylesheet" href="/resources/psj/assets/fonts/flat-icon/flaticon.css">
    <link rel="stylesheet" href="/resources/psj/assets/css/bootstrap-4.1.3.min.css">
    <link rel="stylesheet" href="/resources/psj/assets/css/owl-carousel.min.css">
    <link rel="stylesheet" href="/resources/psj/assets/css/nice-select.css">
    <link rel="stylesheet" href="/resources/psj/assets/css/style.css">


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
</head>
<body>
<div class="search-area">
        <div class="search-bg">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12" style="margin-top: 40px;">
                        <form action="/nds/itemoverseasread" class="d-md-flex justify-content-between">
                            <select><c:forEach var="overseasVo" items="${list}">
                                <option value="">${overseasVo.overseas_Country}</option>
                                </c:forEach>
                            </select>
                            <select>
                                <option value="1">도시</option>
                                <option value="2">Dhaka</option>
                                <option value="3">Rajshahi</option>
                                <option value="4">Barishal</option>
                                <option value="5">Noakhali</option>
                            </select>
                            <select>
                                <option value="1">출발월(전체)</option>
                                <option value="2">Part Time</option>
                                <option value="3">Full Time</option>
                                <option value="4">Remote</option>
                                <option value="5">Office Job</option>
                            </select>
                            <button type="submit" class="template-btn">검색</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>