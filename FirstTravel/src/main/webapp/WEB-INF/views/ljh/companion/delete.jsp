<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../include/nds/header.jsp" %>
<script>
$(document).ready(function(){
	//수정완료 메시지
	var message = "${message}";
	if (message == "success_update") {
		alert("수정이 완료되었습니다.");
	}
	
	
	$("btnDeleteFinish").click
});
</script>
<div class="container-fluid">
	<div class="row">
		<div class="col-md-12">
			<!-- form action 속성 생략시 현재 경로(board/regist)가 액션 model로 데이터를 뷰되게 -->
			<form role="form" method="post">
				<div class="form-group">
					
					<label for="companion_numbercode">비밀번호삭제</label>
					<input type="text" class="form-control" id="companion_numbercode" name="companion_numabercode" 
					/>
				</div>
			
			</form>
		</div>
	</div>
	<!--  삭제완료  -->
		<div class="row">
		<div class="col-md-12">
				
				<input type="button" class="btn btn-success" value="삭제완료"
				id="btnDeleteFinish"/>
		</div>
	</div>
</div>


<%@ include file="../../include/nds/footer.jsp" %>