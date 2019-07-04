<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<script>
$(document)
</script>
<style>
div.div_in {
	float : left;
	width : 25%;
	margin : 0;
}
div.div_text {
	text-align:left;
}
.blind {
	visibility: false;
}
</style>
</head>
<body>

<div class="container-fluid">
	<div class="row">
		<div class="col-md-12">
			<div class="row">
				<div class="col-md-2">
				</div>
				<div class="col-md-8">
				<ul class="gallery-info">
						<li><h3>겔러리 게시판</h3> / 회원님들께서 꾸며주시는 공간입니다.</li>
					</ul>
				</div>
				<div class="col-md-2">
				</div>
			</div>
			<div class="row">
				<div class="col-md-2">
				</div>
				<div class="col-md-8">
					<form role="form" action="/kdw/gallery/gallery_write_run" id="write_form" method="post">
						<table class="table">
				<thead>
					<tr>
						<th scope="col" colspan="2" style="text-align:center;font-size: 20px;"><strong>${gBoardVo.g_title }</strong></strong></th>
					</tr>
					<tr>
						<td colspan="2">
							<div class="div_in">
								<strong>글쓴이</strong>
								<span>${gBoardVo.g_writer }</span>
							</div>
							<div class="div_in">
								<strong>조회수</strong>
								<span>${gBoardVo.g_viewcnt }</span>
							</div>
							<div class="div_in">
								<strong>국가</strong>
								<span>${gBoardVo.g_location }</span>
							</div>
							<div class="div_in">
								<strong>작성일</strong>
								<span>${gBoardVo.g_regdate }</span>
							</div>
						</td>
					</tr>
					<tr>
						<td colspan="2">
							<div style="text-align:center;">
								${gBoardVo.g_content }
							</div>
						</td>
					</tr>
					<tr>
						<td colspan="2">
							<div class="cmt-write" style="text-align:left;">
								<p>댓글</p>
								<div>
									<div class="div_text" style="width:80%;float:left;" >
										<textarea rows="5" name="r_text" id="r_text" style="resize:none;width:100%;">
										</textarea>
									</div>
									<div class="div_text" style="width:20%;height:100%;float:left;text-align:center;">
										<input type="button" value="등록" id="btn_reply" class="btn btn-lg btn-primary"
											style="width:100%;height: 104px;"/>
									</div>
								</div>
								<ul id="replyList">
								</ul>
							</div>
						</td>
					</tr>
				</thead>
				<tbody>
					<tr>
						<th scope="row">이전글</th>
						<td>
							이전글이 없습니다.
						</td>
					</tr>
					<tr>
						<th scope="row">다음글</th>
						<td><a href="#">다음글 제목</a></td>
					</tr>
				</tbody>
			</table>
					</form>
				</div>
				<div class="col-md-2">
				</div>
			</div>
			<div class="row">
				<div class="col-md-2">
				</div>
				<div class="col-md-8">
					 
					<input type="button" value="목록" class="btn btn-primary" id="btn_list"/>
				</div>
				<div class="col-md-2">
				</div>
			</div>
		</div>
	</div>
</div>
</body>
</html>