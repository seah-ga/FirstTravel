<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>




<script>


$(document).ready(function(){
	//수정완료 메시지
	var message = "${message}";
	if (message == "success_update") {
		alert("수정이 완료되었습니다.");
	}
	//글수정 버튼
	$("#btnUpdate").click(function(){
		location.href = "/ljh/companion/update?companion_numbercode=${companionVo.companion_numbercode}";
	});
	//글삭제 버튼
	$("#btnDelete").click(function(){
		location.href = "/ljh/companion/delete?companion_numbercode=${companionVo.companion_numbercode}";
	});
	//글목록 버튼 (페이지폼 제출시키기)
	$("#btnList").click(function(){
		$("#pageForm").submit();
	});
	
	
});
</script>


<br>
<br>
<br>
<h1>글읽기</h1>
<br>
<br>
<!-- 보이지않게 데이터를 목록으로 전송 -->
<form id="pageForm" action="/ljh/companion">
	<input type="hidden" name="companion_numbercode" 
		value="${param.companion_numbercode}">
	<input type="hidden" name="page" 
		value="${param.page}">
	<input type="hidden" name="perPage" value="${param.perPage}">
	<input type="hidden" name="searchType" 
		value="${param.searchType}">
	<input type="hidden" name="keyword" 
		value="${param.keyword}">
</form>
<div class="container-fluid">
	<div class="row">
		<div class="col-md-12">
			<!-- form action 속성 생략시 현재 경로(board/regist)가 액션 model로 데이터를 뷰되게 -->
			<form role="form" method="post">
				<div class="form-group">
					<label for="companion_title">글제목</label>
					<input type="text" class="form-control" id="companion_title" name="companion_title" 
					value="${companionVo.companion_title}"  readonly/>
				</div>
				<div class="form-group">
					<label for="companion_writer">작성자</label>
					<input type="text" class="form-control" id="companion_writer"
						name="companion_writer" value="${companionVo.companion_writer}" readonly/>
				</div>
				<div class="form-group">
					<label for="companion_content">글내용</label>
					<textarea rows="10" cols="80" id="companion_content"
						name="companion_content" class="form-control" readonly>${companionVo.companion_content}</textarea>
				</div>
				<div class="form-group">
					<label for="companion_reading">조회수</label>
					<input type="text" class="form-control" id="companion_reading" value="${companionVo.companion_reading}" readonly/>
				</div>
				<div class="form-group">
					<label for="companion_date">작성일</label>
					<input type="text" class="form-control" id="companion_date"
						value='<fmt:formatDate value="${companionVo.companion_date}" pattern="yyyy-MM-dd HH:mm:ss"/>' readonly/>
				</div>
			
			</form>
		</div>
	</div>
	<!--  목록 버튼 -->
		<div class="row">
		<div class="col-md-12">
				<c:if test="${memberVo.user_id == boardVo.writer}">
				<input type="button" class="btn btn-warning" value="수정"
				id="btnUpdate"/>
				<input type="button" class="btn btn-warning" value="삭제"
				id="btnDelete"/>
				</c:if>
				<input type="button" class="btn btn-success" value="목록"
				id="btnList"/>
		</div>
	</div>
</div>
	
<%@ include file="../include/footer.jsp" %>		
