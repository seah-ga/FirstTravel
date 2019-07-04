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
<script>
$(document).ready(function(){
	
	// 리플레이 리스트 불러오기
	function replylist (review_reply_writer, review_reply_content, review_reply_date, review_reply_num) {
	var str = "";	
    str +=  "<tr>"
          +    "<td>"+ review_reply_writer +"</td>"
          +    "<td>"+ review_reply_content +"</td>"
          +   "<td>"+ review_reply_date +"</td>";
    str +=     "<td>"
 		  +   	 "<div class='btn-group' role='group'>"
          +        "<button type='button' class='btn btn-default btnreplydelete' data-num='"+ review_reply_num +"'><i class='tf-ion-close' aria-hidden='true'></i></button>"
          +      "</div>"
          +   "</td>"
          + "</tr>";
    return str;
	}
 	
	
	
	// 댓글 작성 버튼을 눌렀을때 댓글 작성 ajax
	$("#btnreply").click(function(){
		var review_reply_content = $("#replytext").val();
		var review_num = "${param.review_num}";
		var data = {
			"review_reply_content" : review_reply_content,
			"review_num" : review_num
		};
		var replyregisturl = "/ndsrest/reviewreply-regist";
		$.ajax({
			"type" : "post",
			"url" : replyregisturl,
			"data" : data,
			"headers" : {
				"content-type" : "application/json",
				"X-HTTP-Method-Override" : "post"
			},
			"dataType" : "text",
			"data" : JSON.stringify(data),
			"success" : function(rData) {
				var	parsedJson = JSON.parse(rData);
				var str = "";
				for (var i = 0 ; i < parsedJson.length ; i++) {
			 str += replylist (parsedJson[i].review_reply_writer,
							   parsedJson[i].review_reply_content,
							   parsedJson[i].review_reply_date,
							   parsedJson[i].review_reply_num);
					
					$("#replytable").html(str);
				}
					$("#replytext").val("");
			}
		});
	});
	// 댓글 리스트 삭제버튼
	$("#replytable").on("click",".btnreplydelete",function(){
		var review_reply_num = $(this).attr("data-num");
		var review_num = "${param.review_num}";
		var replydeleteurl = "/ndsrest/reviewreply-delete";
		var data = {
			"review_reply_num" : review_reply_num,
			"review_num" : review_num
		};
		$.ajax({
			"type" : "post",
			"url" : replydeleteurl,
			"data" : data,
			"headers" : {
				"content-type" : "application/json",
				"X-HTTP-Method-Override" : "post"
			},
			"dataType" : "text",
			"data" : JSON.stringify(data),
			"success" : function(rData) {
				var	parsedJson = JSON.parse(rData);
				var str = "";
				for (var i = 0 ; i < parsedJson.length ; i++) {
			 	str += replylist (parsedJson[i].review_reply_writer,
							   parsedJson[i].review_reply_content,
							   parsedJson[i].review_reply_date,
							   parsedJson[i].review_reply_num);
					
					$("#replytable").html(str);
				}
			}
		});
		
	});
	// 게시글 삭제
	$("#btnreivewdelete").click(function() {
		var review_num = "${param.review_num}";
		location.href = "/nds/reviewdelete?review_num="+review_num;
	});
	
	// 게시글 수정
	$("#btnreviewupdate").click(function() {
		var review_num = "${param.review_num}";
		location.href = "/nds/reviewupdate?review_num="+review_num;
	})
	
});
</script>
<title>리뷰(상세보기)</title>
</head>
<body>
<section class="page">
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<div class="content">
					<h1 class="page-name">후기 상세보기</h1>
					<ol class="breadcrumb">
					</ol>
				</div>
			</div>
		</div>
	</div>
</section>
<section class="about section">
	<div class="container">
		<div class="row">
			<div class="col-md-5">
				<img class="img-responsive" src="
		              <c:choose>
		              <c:when test="${reviewVo.review_image != 'null'}">
		              /ndsupload/display?fileName=${reviewVo.review_image}
		              </c:when>
		              <c:when test="${reviewVo.review_image == 'null'}">
		              /resources/nds/images/b_nullImage.jpg
		              </c:when>
		              </c:choose>
		              ">
			</div>
			<div class="col-md-5">
				<h2 class="mt-40">${reviewVo.review_name}</h2>
				<p>${reviewVo.review_content}</p>
			</div>
		</div>
		</div>
</section>
			
<section class="about section">
<div class="container">
	<a class="btn btn-main" id="btnreivewdelete">삭제</a>
	<a class="btn btn-main" id="btnreviewupdate">수정</a>
	<h2>댓글작성</h2>
		<input type="text" id="replytext" style="float:left; background-color: #ffffff; width:20cm;"><a class="btn btn-main" id="btnreply" style="height: 45px;">등록</a>
	<div class="dashboard-wrapper user-dashboard">
          <div class="table-responsive">
            <table class="table">
              <thead>
                <tr>
                  <th>글쓴이</th>
                  <th>내용</th>
                  <th>올린날짜</th>
                  <th></th>
                </tr>
              </thead>
              <tbody id="replytable">
                <c:forEach var="reviewReplyVo" items="${reviewReplyList}">
	            <tr>
		            <td>${reviewReplyVo.review_reply_writer}</td>
		          	<td>${reviewReplyVo.review_reply_content}</td>
		    	   	<td>${reviewReplyVo.review_reply_date}</td>
		  		  <td>
         		 	<div class='btn-group' role='group'>
	           			<button type='button' class='btn btn-default btnreplydelete' data-num="${reviewReplyVo.review_reply_num}"><i class='tf-ion-close' aria-hidden='true'></i></button>
	            	</div>
	             </td>
	            </tr>
                </c:forEach>
				</tbody>
			</table>
		</div>
	</div>
</div>
</section>
<%@ include file="../include/nds/ndsfooter.jsp" %>
</body>
</html>