<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@ include file="../include/nds/header.jsp" %>
<script>
$(document).ready(function(){
	// CompanionController.writePost() 에서 RedirectAttrubutes에 넘겨진 값 (메시지관련)
 	var message = "${message};"
	if(message == "success_insert"){
 		alert("글을 등록하였습니다");
 	}

	//글쓰기 버튼
	$("#btnWrite").click(function(){
		location.href="/ljh/companion/write";
	});
	//페이지설정
	function setPage() {
		var page = "${pagingDto.page}";
		if (page == "") {
			page = 1;
		}
		var perPage = $("select[name=perPage]").val();
		console.log("perPage" + perPage);
// 		location.href = "/board/list?page=1&perPage=" + perPage;
		$("input[name=page]").val(page);
		$("input[name=perPage]").val(perPage);
	}
	function setSearch() {
		var searchType = $("#searchType").val();
		var keyword = $("#keyword").val();
		$("input[name=searchType]").val(searchType);
		$("input[name=keyword]").val(keyword);
	}
	
	// 제목 클릭
	$(".companion_title").click(function(e) {
		e.preventDefault(); // 브라우저의 기본기능 막기
		setSearch();	// a - 링크 기능 막기 setSearch
		var page = "${pagingDto.page}";
		if (page == "") {
			page = 1;
		}
// 		var perPage = $("input"[name=perPage]").val();
// 		console.log("perPage" + perPage);
// 		if(perPage == "" ) {
// 			perPage = 10;
// 		}
		var perPage = 10;
		console.log("perPage", perPage);
// 		location.href = "/board/list?page=1&perPage=" + perPage;
		$("input[name=page]").val(page);
		$("input[name=perPage]").val(perPage);
	
		
		
		var companion_numbercode = $(this).attr("data-companion_numbercode");
		$("input[name=companion_numbercode]").val(companion_numbercode);
		
		var href = $(this).attr("href");
		$("#pageForm").attr("action", href).submit();
	});
	
	// 페이지 번호 클릭
	$(".a_pagination").click(function(e) {
		e.preventDefault(); // a 태그 동작 막기
// 		$(this).text();
		var page = $(this).attr("data-page"); // 페이지 숫자 읽기
		$("input[name=page]").val(page); // 아래쪽 폼의 page에 설정
		$("#pageForm").submit(); // 폼 전송
	});
	
});
</script>
<!--${paginationDto.pagingDto.perPage } -->
<!-- 사진 -->
<br>
<br>
<br>
<br>
<div class="slide-one-item home-slider owl-carousel">
      
      <div class="site-blocks-cover overlay" style="background-image: url(/resources/ljh/images/sweden.jpg);" data-aos="fade" data-stellar-background-ratio="0.5">
        <div class="container">
          <div class="row align-items-center justify-content-center text-center">

            <div class="col-md-8" data-aos="fade-up" data-aos-delay="400">
              

              <h1 class="text-white font-weight-light">해외</h1>
              <p class="mb-5">세계속으로 발걸음을 딛여보아요</p>
              <p><a href="/nds/itemoverseasmain" class="btn btn-primary py-3 px-5 text-white">지금 당장 예약하세요!<br>Book Now!</a></p>

            </div>
          </div>
        </div>
      </div>  

      <div class="site-blocks-cover overlay" style="background-image: url(/resources/ljh/images/jeju.jpg);" data-aos="fade" data-stellar-background-ratio="0.5">
        <div class="container">
          <div class="row align-items-center justify-content-center text-center">

            <div class="col-md-8" data-aos="fade-up" data-aos-delay="400">
              <h1 class="text-white font-weight-light">국내</h1>
              <p class="mb-5">주변의 전통을 둘러보아요</p>
              <p><a href="/psj/plan" class="btn btn-primary py-3 px-5 text-white">지금 당장 예약하세요!<br>Book Now!</a></p>
            </div>
          </div>
        </div>
      </div>  

    </div>
    <!-- /사진 -->

<br>
<br>	
<br>
		<!-- 안보이는데 데이터는전송됨 -->
<form id="pageForm" action="/ljh/companion">
	<input type="hidden" name="companion_numbercode" 
		value="${param.companion_numbercode}">
	<input type="hidden" name="page" 
		value="${paginationDto.pagingDto.page}">
	<input type="hidden" name="perPage" 
		value="${paginationDto.pagingDto.perPage }">
	<input type="hidden" name="searchType" 
		value="${paginationDto.pagingDto.searchType}">
	<input type="hidden" name="keyword" 
		value="${paginationDto.pagingDto.keyword}">
</form>
		
		
		<!-- 글의 목록 보이기 -->								
<h1>동행자 구하기</h1>
<br>
<br>
<div class="container-fluid">
	<div class="row">
		<div class="col-md-12">
			<input type="button" class="btn btn-warning"
				value="글쓰기" id="btnWrite">
				
		</div>
	</div>
	<!-- 검색-->
	<!-- tbody 안에 글목록 list넣어야합니다 -->
	<div class="row">
		<div class="col-md-12">
			<table class="table">
				<thead>
					<tr>
						<th>글번호</th>
						<th>글제목</th>
						<th>작성자</th>
						<th>작성일</th>
						<th>조회수</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${list}" var="companionVo">
					<tr>
						<td>${companionVo.companion_numbercode}</td>
						<td><a href="/ljh/companion/read" class="companion_title"
						data-companion_numbercode="${companionVo.companion_numbercode}">${companionVo.companion_title}</a></td>
						<td>${companionVo.companion_writer}</td>
						<td><fmt:formatDate value="${companionVo.companion_date}" pattern="yyyy/MM/dd HH:mm:ss"/></td>
						<td>${companionVo.companion_reading}</td>
					</tr>
					</c:forEach>	
				</tbody>
			</table>
		</div>
	</div>
	<!-- 페이징 만들기 -->
	<div class="row">
		<div class="col-md-12 text-center">
			<nav>
				<ul class="pagination">
				<!-- 이전 -->
				<c:if test="${paginationDto.prev == true}">
					<li class="page-item">
						<a class="page-link a_pagination" href="#"
							data-page="${paginationDto.startPage - 1}">이전</a>
					</li>
				</c:if>	
				<!-- 페이징 -->
				
				<c:forEach var="i" begin="${paginationDto.startPage}" 
									end="${paginationDto.endPage}">	
					<li class="page-item
					<c:if test="${paginationDto.pagingDto.page == i}">
						active
					</c:if>
					">
						<a class="page-link a_pagination" href="#"
							data-page="${i}">${i}</a>
					</li>
				</c:forEach>
				<!-- 다음 -->
				<c:if test="${paginationDto.next == true}">	
					<li class="page-item">
						<a class="page-link a_pagination" href="#"
							data-page="${paginationDto.endPage + 1}">다음</a>
					</li>
				</c:if>
				</ul>
			</nav>
		</div>
	</div>
</div>
<%@ include file="../include/nds/footer.jsp" %>