<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<%@include file="../../include/nds/header.jsp" %>  
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<script>
$(document).ready(function() {
	getReplyList();
	// 이전글 클릭시
	$("#go_prev").click(function(e) {
		e.preventDefault();
		var g_no = $(this).attr("data-g_no");
		var href = $(this).attr("href");
		$("input[name=g_no]").val(g_no);
		$("#page_form").attr("action", href).submit();
	});
	
	// 다음글 클릭시
	$("#go_next").click(function(e) {
		e.preventDefault();
		var g_no = $(this).attr("data-g_no");
		var href = $(this).attr("href");
		$("input[name=g_no]").val(g_no);
		$("#page_form").attr("action", href).submit();
	});
	
	
	// 목록으로 가기 버튼 클릭시
	$("#btn_list").click(function() {
		var href = "/kdw/gallery/gallery_list";
		$("#page_form").attr("action", href);
		$("#page_form").submit();
	});
	
	// 수정 버튼 클릭시
	$("#btn_update").click(function() {
		location.href = "/kdw/gallery/gallery_modify?g_no=${gBoardVo.g_no}";
	});
	
	// 삭제 버튼 클릭시
	$("#btn_delete").click(function() {
		var g_no = "${gBoardVo.g_no}";
		var url = "/kdw/gallery/gallery_delete/" + g_no;
		$.ajax({
			"type" : "delete",
			"url" : url,
			"headers" : {
				"content-type" : "application/json",
				"X-HTTP-Method-Override" : "delete"
			},
			"success" : function(rData) {
				console.log(rData);
				if (rData == "success") {
					var href = "/kdw/gallery/gallery_list";
					$("#page_form").attr("action", href);
					$("#page_form").submit();
				} else {
					alter("삭제 실패");
				}
			}
		});
	});
	
	// 댓글 목록 불러오기
	function getReplyList() {
		var url = "/kdw/reply/reply_list/${gBoardVo.g_no}";
		console.log("${gBoardVo.g_no}");
		$.getJSON(url, function(rData) {
			console.log("rData : " + rData);
			var strHtml = "";
			$(rData).each(function(i) {
				var user_code = parseInt("${memberVo.user_code}");
				var r_code = parseInt(this.user_code);
				console.log("user_code: " + user_code + "writer_code : " + this.user_code);
				strHtml += "<li style='border-bottom : 0px;'>" + this.r_replyer + "</li>"
						+ "<li><p>" + this.r_text + "</p>";
				if(user_code == r_code) {
				strHtml	+= "<input type='button' class='btn btn-xs btn-warning btn_modify' value='수정' data-g_no='" + this.g_no
						+ "' data-r_no='" + this.r_no + "' data-r_text='" + this.r_text + "' data-index='" + i + "'/>"
						+ "<input type='button' class='btn btn-xs btn-danger btn_delete' value='삭제' data-g_no='" + this.g_no
						+ "' data-r_no='" + this.r_no + "' data-index='" + i + "'/>"
						+ "</li>";
				} else {
				strHtml += "</li>";
				}
			});
			$("#replyList").html(strHtml);
		});
		
		// 모달 수정 버튼 클릭시
		$("#btn_modal_modify").click(function() {
			var r_no = $("#modal_text").attr("data-r_no");
			var r_text = $("#modal_text").val();
			console.log("m-text : " + r_text);
			var data = {
					"r_no" : r_no,
					"r_text" : r_text
			};
			var url = "/kdw/reply/reply_update/" + r_no;
			$.ajax({
				"type" : "put",
				"url" : url,
				"headers" : {
					"content-type" : "application/json",
					"X-HTTP-Method-Override" : "put"
				},
				"dataType" : "text",
				"data" : JSON.stringify(data),
				"success" : function(rData) {
					console.log("rData : " + rData);
					if (rData == "success") {
						getReplyList();
					}
				}
			});
		});
		
		// 답글 수정 버튼 클릭시
		$("#replyList").on("click", ".btn_modify", function() {
			console.log("수정버튼 클릭");
			var r_no = $(this).attr("data-r_no");
			var r_text = $(this).attr("data-r_text");
			console.log("text : " + r_text);
			$("#modal_text").attr("data-r_no", r_no);
			$("#modal_text").val(r_text);
			$("#btn_modal").trigger("click");
		});
		// 답글 삭제 버튼 클릭시
		$("#replyList").on("click", ".btn_delete", function() {
			var r_no = $(this).attr("data-r_no");
			var g_no = $(this).attr("data-g_no");
			var index = $(this).attr("data-index");
			
			var url = "/kdw/reply/reply_delete/" + r_no + "/" + g_no;
			$.ajax({
				"type" : "delete",
				"url" : url,
				"headers" : {
					"content-type" : "application/josn",
					"X-HTTP-Method-Override" : "delete"
				},
				"success" : function(receivedData) {
					console.log(receivedData);
					if(receivedData == "success") {
// 						$("#replyList > li").eq(index).fadeOut(100);
						getReplyList();
					}
				}
			});
		});
	}
	
	// 답글 달기 버튼 클릭시
	$("#btn_reply").click(function() {
		var g_no = "${gBoardVo.g_no}";
		var r_text = $("#r_text").val();
		$("#r_text").val("");
		if(r_text == null || r_text == "") {
			return false;
		}
		var data = {
				"g_no" : g_no,
				"r_text" : r_text
		};
		var url = "/kdw/reply/reply_insert";
		
		$.ajax({
			"type" : "post",
			"url" : url,
			"headers" : {
				"Content-type" : "application/json",
				"H-HTTP-Method-Override" : "post"
			},
			"data" : JSON.stringify(data),
			"success" : function(receivedData) {
				console.log("receivedData : " + receivedData);
				if (receivedData == "members") {
					getReplyList();
					
				} else {
					var message = "로그인이 필요합니다.";
					$("#r_text").val(message);
				}
				
			}
		}); // ajax
	}); // $("#btn_reply").click(function()
	
	
});
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
.list li {
	position : relative ;
	padding : 5px 0;
	border-bottom : 1px dashed #ccc;
}
li {
	display : list-item;
	text-align : -webkit-match-parent;
}
ol, ul {
	list-style : none;
}
p {
    display: block;
    margin : 5px;s
    margin-block-start: 1em;
    margin-block-end: 1em;
    margin-inline-start: 0px;
    margin-inline-end: 0px;
}
</style>
</head>
<body>
<!-- Modal -->
 <button type="button" class="btn btn-info btn-lg" id="btn_modal" style="display:none;"  data-toggle="modal" data-target="#myModal">Open Modal</button>
<div class="modal fade" id="myModal" role="dialog">
  <div class="modal-dialog">
  
    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
        <h4 class="modal-title">답글 수정하기</h4>
      </div>
      <div class="modal-body">
        <input type="text" id="modal_text" data-r_no="">
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-primary" id="btn_modal_modify" data-dismiss="modal">수정</button>
      </div>
    </div>
    
  </div>
</div>
<form id="page_form">
	<input type="hidden" name="g_no" value="${param.g_no}">
	<input type="hidden" name="keyword" value="${param.keyword }">
	<input type="hidden" name="searchType" value="${param.searchType }">
	<input type="hidden" name="page" value="${param.page }">
	<input type="hidden" name="g_location" value="${param.g_location }">
</form>
<div class="container-fluid">
	<div class="row">
		<div class="col-md-12">
			<div class="row">
				<div class="col-md-2">
				</div>
				<div class="col-md-8">
					<div>
						<h3 style="float:left;font-size:24px;font-weigth:600;margin-top:0px;">겔러리 게시판</h3><p style="float:left;padding:8px 0 0 20px;"> / 회원님들께서 꾸며주시는 공간입니다.</p>
					</div>
				</div>
				<div class="col-md-2">
				</div>
			</div>
			<div class="row">
				<div class="col-md-2">
				</div>
				<div class="col-md-8">
					<form role="form" id="read_form">
						<table class="table" style="text-align:center;">
				<thead>
					<tr>
						<th scope="col" colspan="2" style="text-align:center;font-size: 20px;"><strong>${gBoardVo.g_title }</strong></th>
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
					<tr style="text-align:center;">
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
								<div class="col-md-12">
									<div class="div_text" style="width:80%;float:left;" >
										<textarea rows="5" name="r_text" id="r_text" style="resize:none;width:100%;text-align:left;border: 1px solid #444;"></textarea>
									</div>
									<div class="div_text" style="width:20%;height:100%;float:left;text-align:center;">
										<input type="button" value="등록" id="btn_reply" class="btn btn-lg btn-primary"
											style="width:100%;height: 104px;color:inherit;border: 2px solid #000;"/>
									</div>
								</div>
								<div class="col-md-12">
									<ul class="list" id="replyList">
										
									</ul>
								</div>
							</div>
						</td>
					</tr>
				</thead>
				<tbody>
					<tr>
						<th scope="row">이전글</th>
						<c:if test="${prevBoardVo != null }">
							<td><a href="/kdw/gallery/gallery_read" id="go_prev" data-g_no="${prevBoardVo.g_no }">${prevBoardVo.g_title }</a></td>
						</c:if>
						<c:if test="${prevBoardVo == null }">
							<td>이전글이 없습니다.</td>
						</c:if>
					</tr>
					<tr>
						<th scope="row">다음글</th>
						<c:if test="${nextBoardVo != null }">
							<td><a href="/kdw/gallery/gallery_read" id="go_next" data-g_no="${nextBoardVo.g_no }">${nextBoardVo.g_title}</a></td>
						</c:if>
						<c:if test="${nextBoardVo == null }">
							<td>다음글이 없습니다.</td>
						</c:if>
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
					<input type="button" value="목록" class="btn btn-primary" id="btn_list" style="color:inherit;border: 2px solid #000;"/>
					<c:if test="${gBoardVo.user_code == memberVo.user_code }">
						<input type="button" value="수정" class="btn btn-success" id="btn_update" style="color:inherit;border: 2px solid #000;"/>
						<input type="button" value="삭제" class="btn btn-danger" id="btn_delete" style="color:inherit;border: 2px solid #000;"/>
					</c:if>
				</div>
				<div class="col-md-2">
				</div>
			</div>
		</div>
	</div>
</div>
<%@include file="../../include/nds/footer.jsp" %>
</body>
</html>