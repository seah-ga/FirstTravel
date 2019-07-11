<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../include/nds/header.jsp" %>
<style>
.container{
	padding-bottom:50px;
}
</style>

<br>
<br>
<br>
<h1>글수정</h1>
<br>
<br>
<div class="container-fluid">
	<div class="row">
		<div class="col-md-12">
			<!-- form action 속성 생략시 현재 경로(board/regist)가 액션 -->
			<form role="form" method="post" action="update-run">
				<input type="hidden" name="companion_numbercode" value="${companionVo.companion_numbercode}"/>
				<div class="form-group">
					<label for="companion_title">글제목</label>
					<input type="text" class="form-control" id="companion_title"
						name="companion_title" value="${companionVo.companion_title}"/>
				</div>
				<div class="form-group">
					<label for="companion_writer">작성자</label>
					<input type="text" class="form-control" id="companion_writer"
						name="companion_writer" value="${companionVo.companion_writer}"/>
				</div>
				<div class="form-group">
					<label for="companion_content">글내용</label>
					<textarea rows="10" cols="80" id="companion_content"
						class="form-control" name="companion_content">${companionVo.companion_content}</textarea>
				</div>
				
				<div class="row">
					<div class="col-md-12">
						<input type="submit" class="btn btn-warning" value="수정완료"/>
					</div>
				</div>
			</form>
		</div>
	</div>
</div>
<%@ include file="../../include/nds/footer.jsp" %>