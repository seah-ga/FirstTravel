<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<%@include file="../../include/nds/header.jsp" %>  
<meta charset="UTF-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.bundle.min.js"></script>
<link rel="stylesheet" href="/resources/kdw/css/mystyle.css">
<script>
$(document).ready(function() {
	
	// 글 제목 클릭시
	$(".a_title").click(function(e) {
		e.preventDefault();
		var href = $(this).attr("href");
		var g_no = $(this).attr("data-g_no");
		var index = $(this).attr("data-index");
		searchType_select();
		$("input[name=g_no]").val(g_no);
		$("input[name=index]").val(index);
		$("#list_form").attr("action", href).submit();
		
	});
	
	// 글쓰기 버튼 클릭시
	$("#btn_write").click(function() {
		location.href = "/kdw/gallery/gallery_write";
	});
	
	// 검색 버튼 클릭시
	$("#btn_search").click(function() {
		console.log("검색 버튼 클릭");
		searchType_select();
		$("input[name=page]").val(1);
		$("#list_form").submit();
	});
	
	// 검색 항목 변경시
	$("#searchType").change(function() {
		var searchType = $("#searchType").val();
		searchType_select();
	});
	
	// 검색 select
	function searchType_select() {
		var searchType = $("#searchType").val();
		if (searchType == null || searchType == "") {
			$("input[name=searchType]").val("type");
		}
		$("input[name=searchType]").val(searchType);
		var keyword = $("#keyword").val();
		$("input[name=keyword]").val(keyword);
		var page = "${pagingDto.page}";
		if (page == "") {
			page = 1;
		}
		$("input[name=page]").val(page);
	}
	
	// 지역 선택시
	$("#g_location").change(function() {
		var location = $("#g_location").val();
		$("input[name=g_location]").val(location);
	});
	
	// 페이지 전환
	$(".a_pagination").click(function(e) {
		e.preventDefault();
		var page = $(this).attr("data-page");
		console.log(page);
		$("input[name=page]").val(page);
		$("#list_form").submit();
	});
	
	// tap
	$(".a_list").click(function(e) {
		e.preventDefault();
		var type = $(this).attr("data-type");
		if (type == "list") {
			$("#boardList").css("display", "block");
			$("#galleryList").css("display", "none");
			searchType_select();
		} else if (type == "gallery") {
			$("#boardList").css("display", "none");
			$("#galleryList").css("display", "block");
			searchType_select();
		}
	});
});
</script>
<style>
.breadcrumb a:before {
    content: '';
    display: inline-block;
    margin-right: 10px;
    font-size: 10px;
    vertical-align: middle;
}
</style>
<form id="list_form">
	<input type="hidden" name="g_no" value="${param.g_no}">
	<input type="hidden" name="index" value="${param.g_no}">
	<input type="hidden" name="keyword" value="${pagingDto.keyword }">
	<input type="hidden" name="searchType" value="${pagingDto.searchType }">
	<input type="hidden" name="page" value="${pagingDto.page }">
	<input type="hidden" name="g_location" value="${pagingDto.g_location }">
</form>
<div class="container-fluid">
	<div class="row">
		<div class="col-md-12">
			<div class="row">
				<div class="col-md-12">
					<img alt="Image" src="/resources/kdw/img/background-image.jpg" height="250px" width="100%" />
				</div>
			</div>
			<div class="row">
				<div class="col-md-12">
					<div class="tabbable" id="tabs-847237">
						<ul class="nav nav-tabs">
							<li class="nav-item">
								<a class="nav-link active a_list" href="#tab1" data-toggle="tab" data-type="list">게시판보기</a>
							</li>
							<li class="nav-item active">
								<a class="nav-link active a_list" href="#tab2" data-toggle="tab" data-type="gallery">겔러리보기</a>
							</li>
						</ul>
						<div class="tab-content">
							<div class="tab-pane" id="panel-749780">
							</div>
							<div class="tab-pane active" id="tab2">
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-md-4">
					<nav>
						<ol class="breadcrumb" style="background-color:#ffffff;">
							<li class="breadcrumb-item">
								<a href="/ljh/main" style="color:#000;">메인</a>
							</li>
							<li class="breadcrumb-item">
								<a href="/kdw/memberinfo" style="color:#000;">커뮤니티</a>
							</li>
							<li class="breadcrumb-item active">
								겔러리
							</li>
						</ol>
					</nav>
				</div>
				<!-- 검색 -->
				<div class="col-md-6">
				<select id="searchType" style="border-width:0 0 1px 0;border-style:solid;border-color:#000;padding:5px;" >
					<option value="type">검색항목</option>
					<option value="title" <c:if test="${pagingDto.searchType == 'title'}">selected</c:if>>제목</option>
					<option value="writer" <c:if test="${paginationDto.pagingDto.searchType == 'writer'}">selected="selected"</c:if>>작성자</option>
					<option value="content" <c:if test="${paginationDto.pagingDto.searchType == 'content'}">selected="selected"</c:if>>내용</option>
				</select>
				<select id="g_location" style="border-width:0 0 1px 0;border-style:solid;border-color:#000;padding:5px;" >
					<option value="지역선택">지역선택</option>
					<option value="유럽" <c:if test="${pagingDto.g_location == '유럽'}">selected</c:if>>유럽</option>
					<option value="중국/대만" <c:if test="${paginationDto.pagingDto.g_location == '중국/대만'}">selected="selected"</c:if>>중국/대만</option>
					<option value="동남아/홍콩" <c:if test="${paginationDto.pagingDto.g_location == '동남아/홍콩'}">selected="selected"</c:if>>동남아/홍콩</option>
					<option value="일본" <c:if test="${paginationDto.pagingDto.g_location == '일본'}">selected="selected"</c:if>>일본</option>
					<option value="미국/캐나다/특수" <c:if test="${paginationDto.pagingDto.g_location == '미국/캐나다/특수'}">selected="selected"</c:if>>미국/캐나다/특수</option>
					<option value="제주/내륙" <c:if test="${paginationDto.pagingDto.g_location == '제주/내륙'}">selected="selected"</c:if>>제주/내륙</option>
				</select>
				<input type="text" id="keyword" style="border-width:0 0 1px 0;border-style:solid;border-color:#000;padding:1.5px;" value="${pagingDto.keyword }">
				<input type="button" value="검색" class="btn btn-success" id="btn_search" style="color:inherit;">
				</div>
				
				<!-- 글쓰기 버튼 -->
				<div class="col-md-2">
					 
					<button type="button" class="btn btn-success" id="btn_write" style="margin:5px;">글쓰기</button>
				</div>
			</div>
			<div class="row"  style="display:none;" id="boardList">
	        
			
				<div class="col-md-12" >
				<!-- 게시판 -->
					<table class="table" style="width:80%;margin:auto;text-align:center;">
						<thead>
							<tr>
								<th>번호</th>
								<th>지역</th>
								<th>사진</th>
								<th>제목</th>
								<th>작성자</th>
								<th>작성일</th>
								<th>조회수</th>
							</tr>
						</thead>
						
						<tbody>
						<c:forEach items="${list}" var="gBoardVo" varStatus="status">
							<tr>
								<td>${status.index} - ${gBoardVo.g_no }</td>
								<td>${gBoardVo.g_location }</td>
								<td>
									<c:choose>
										<c:when test="${gBoardVo.fileone != null }">
											<img src="/kdw/upload/displayFile?fileName=${gBoardVo.fileone }" style="width:100px;">
										</c:when>
										<c:otherwise>
											<img src="/resources/kdw/img/baseImage.jpg" style="width:100px;">
										</c:otherwise>								
									</c:choose>
								</td>
								<td><a href="/kdw/gallery/gallery_read" class="a_title" data-g_no="${gBoardVo.g_no }" 
								data-index=${status.index }>${gBoardVo.g_title }</a></td>
								<td>${gBoardVo.g_writer }</td>
								<td>${gBoardVo.g_regdate }</td>
								<td>${gBoardVo.g_viewcnt }</td>
							</tr>
						</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
			<div class="row" id="galleryList" style="display:block table;width:80%;margin:auto;">
			<c:forEach items="${list}" var="gBoardVo" varStatus="status">
	          <div class="col-md-2 col-lg-3 mb-3 mb-lg-2" style="dispaly:table-cell;text-align:center; margin-bottom: 50px;padding-bottom:20px;">
	            <a href="/kdw/gallery/gallery_read" class="unit-1 text-center a_title" data-g_no="${gBoardVo.g_no }">
	              <c:choose>
					<c:when test="${gBoardVo.fileone != null }">
						<img src="/kdw/upload/displayFile?fileName=${gBoardVo.fileone }" style="width:719px;height:300px;">
					</c:when>
					<c:otherwise>
						<img src="/resources/kdw/img/baseImage.jpg" style="width:719px;height:300px;">
					</c:otherwise>								
				</c:choose>
	              <div class="unit-1-text">
	                <h3>${gBoardVo.g_title }</h3>
	                <h4 style="color:#aaa;">${gBoardVo.g_writer }</h4>
	              </div>
	            </a>
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
	</div>
</div>
<%@include file="../../include/nds/footer.jsp" %>  
</body>
</html>