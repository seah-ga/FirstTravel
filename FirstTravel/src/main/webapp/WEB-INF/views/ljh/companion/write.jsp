<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="../include/header.jsp" %>								

<script>
$(document).ready(function(){
	$("#btnSubmit").click(function(){
		$("#writeForm").submit();
	});
});
</script>
<!-- localhost/board/regist -->
<br>
<br>
<br>
<h1>글쓰기</h1>
<br>
<br>
<div class="container-fluid">
	<div class="row">
		<div class="col-md-12">
			<form role="form" method="post" id="writeForm">
				<div class="form-group">
					<label for="companion_title">제목</label>
					<input type="text" class="form-control" name="companion_title" id="companion_title">
				</div>
				<div class="form-group">
					<label for="companion_writer">작성자</label>
					<input type="text" class="form-control" name="companion_writer" id="companion_writer" value="${memberVo.user_id}" readonly/>
				</div>
				<div class="form-group">
					<label for="companion_content">내용</label>
					<textarea rows="10" cols="80" class="form-control" name="companion_content" id="companion_content"></textarea>
				</div>
				<input type="button" class="btn btn-warning" value="작성완료" id="btnSubmit">
			</form>
		</div>
	</div>
</div>
<%@ include file="../include/footer.jsp" %>
    