<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.bundle.min.js"></script>
</head>
<body>
<div class="container-fluid">
	<div class="row">
		<div class="col-md-12">
			<div class="row">
				<div class="col-md-12">
					<img alt="Bootstrap Image Preview" src="http://www.v3wall.com/wallpaper/3840_1200/1406/3840_1200_201406240300012185162.jpg" height="250px" width="100%" />
				</div>
			</div>
			<div class="row">
				<div class="col-md-12">
					<div class="tabbable" id="tabs-847237">
						<ul class="nav nav-tabs">
							<li class="nav-item active">
								<a class="nav-link active" href="#tab1" data-toggle="tab">게시판보기</a>
							</li>
							<li class="nav-item">
								<a class="nav-link" href="#tab2" data-toggle="tab">겔러리보기</a>
							</li>
						</ul>
						<div class="tab-content">
							<div class="tab-pane active" id="panel-749780">
							</div>
							<div class="tab-pane" id="tab2">
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
								<a href="#">메인</a>
							</li>
							<li class="breadcrumb-item">
								<a href="#">커뮤니티</a>
							</li>
							<li class="breadcrumb-item active">
								겔러리
							</li>
						</ol>
					</nav>
				</div>
				<div class="col-md-6">
				<select >
					<option>지역</option>
				</select>
				<input type="text">
				<input type="button" value="검색" class="btn btn-primary">
				</div>
				<div class="col-md-2">
					 
					<button type="button" class="btn btn-success">
						글쓰기
					</button>
				</div>
			</div>
			<div class="row">
				<div class="col-md-12">
					<table class="table">
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
						<c:forEach items="${list}" var="gBoardVo">
							<tr>
								<td>${gBoardVo.g_no }</td>
								<td>${gBoardVo.g_location }</td>
								<td>${gBoardVo.g_file_path }</td>
								<td><a href="#">${gBoardVo.g_title }</a></td>
								<td>${gBoardVo.g_writer }</td>
								<td>${gBoardVo.g_regdate }</td>
								<td>${gBoardVo.g_viewcnt }</td>
							</tr>
						</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
			<nav>
				<ul class="pagination">
					<li class="page-item">
						<a class="page-link" href="#">Previous</a>
					</li>
					<li class="page-item">
						<a class="page-link" href="#">1</a>
					</li>
					<li class="page-item">
						<a class="page-link" href="#">2</a>
					</li>
					<li class="page-item">
						<a class="page-link" href="#">3</a>
					</li>
					<li class="page-item">
						<a class="page-link" href="#">4</a>
					</li>
					<li class="page-item">
						<a class="page-link" href="#">5</a>
					</li>
					<li class="page-item">
						<a class="page-link" href="#">Next</a>
					</li>
				</ul>
			</nav>
		</div>
	</div>
</div>
</body>
</html>