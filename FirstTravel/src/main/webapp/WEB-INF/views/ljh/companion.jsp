<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../ljh/include/header.jsp" %>
<br>
<br>	
<br>			
		<!-- 검색-->								
<h1>글목록</h1>
<br>
<br>
<div class="container-fluid">
	<div class="row">
		<div class="col-md-12">
			<input type="button" class="btn btn-primary"
				value="글쓰기" id="btnWrite">
		</div>
	</div>
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
				
				
				</tbody>
			</table>
		</div>
	</div>
	<!-- 페이징 만들기 -->
	
</div>
<%@ include file="../ljh/include/footer.jsp" %>