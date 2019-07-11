<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../../include/nds/header.jsp" %>

<script src="/resources/ljh/js/myscript.js"></script>




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
	//댓글 목록 얻어오기
	function getCompanionReplyList(){
		var url = "/companionreply/list/${companionVo.companion_numbercode}";
		$.getJSON(url , function(receivedData){
			//console.log(receivedData); 밑에부터는 확인필요
			var strHtml = "";
			$(receivedData).each(function(i){
				var user_id = "${memberVo.user_id}";
				strHtml += "<tr>"
					  +  	"<td>" + this.reply_numbercode + "</td>" 
					  +  	"<td>" + this.reply_content + "</td>" 
					  +  	"<td>" + this.reply_writer + "</td>"
					  +  	"<td>" + dateString(this.reply_date) + "</td>";
					if(user_id == this.reply_writer){
							strHtml += "<td>"
					  + 	"<input type='button' value='수정' class='btn-xs btn-warning'"
					  +     " data-reply_content='" + this.reply_content + "'"
					  +     " data-reply_writer='" + this.reply_writer + "'"
					  +		" data-reply_numbercode='" + this.reply_numbercode + "'"
					  +		" data-index='" + i + "'>" 
					  + 	"</td>"
					  +  	"<td>"
					  + 	"<input type='button' value='삭제' class='btn-xs btn-warning'"
					  +     " data-reply_numbercode='" + this.reply_numbercode + "'"
					  +		" data-companion_numbercode='" + this.companion_numbercode + "'"
					  +		" data-index='" + i + "'>"
					  +		"</td>"
					} else {
						strHtml += "<td>&nbsp;</td>"
								+  "<td>&nbsp;</td>";
					}
					
					strHtml +=  "</tr>";
				
			});
			
			$("#companionReplyList").html(strHtml);
		});//getJSON;
		
	}
	
	//댓글목록버튼
	$("#btnCompanionReplyList").click(function(){
		getCompanionReplyList();
	}); //btnCompanionReplyList 클릭
		
	
	//댓글쓰기버튼
	$("#btnCompanionReplyFinish").click(function(){
		var companion_numbercode = "${companionVo.companion_numbercode}";
		var reply_content = $("#reply_content").val();
		var reply_writer = $("#reply_writer").val();
		var data = {
				"companion_numbercode" : companion_numbercode,
				"reply_content" : reply_content,
				"reply_writer" : reply_writer
		};
		var url = "/companionreply/insert";
// 		$.post(url, JSON.stringify(data), function(receivedData) {
//  			console.log(receivedData);
//  		});
console.log(data);
		$.ajax({
			"type" : "post",
			"url" : url,
			"headers" : {
				"Content-Type" : "application/json",
				"X-HTTP-Method-Override" : "post"
			},
			"dataType" : "text",
			"data" : JSON.stringify(data),
			"success" : function(receivedData) {
				getCompanionReplyList(); // 댓글 목록 가져오기
			}
		});// $.ajax
	});//btnCompanionReplyFinish 클릭
	//댓글 수정 버튼 (tbody 아이디를 가져와서)
	$("#companionReplyList").on("click",".btn-danger", function(){
		$("#modal-721283").trigger("click"); //연쇄반응 연쇄반응 modal-721283
		var reply_content = $(this).attr("#data-reply_content");
		var reply_writer = $(this).attr("#data-reply_writer");
		var reply_numbercode = $(this).attr("#data-reply_numbercode");
		var index = $(this).attr("#data-index");
		$("modal-reply_content").val(reply_content);
		$("modal-reply_writer").val(reply_writer);
		$("modal-reply_numbercode").val(reply_numbercode);
		$("modal-comapanion_numbercode").val(companion_numbercode);
	}); // $("#replyList").on("click")
	//댓글 삭제 버튼
	$("#companionReplyList").on("click",".btn-danger", function(){
		var reply_numbercode = $(this).attr("#data-reply_numbercode");
		var companion_numbercode = $(this).attr("#data-companion_numbercode");
		var index = $(this).attr("#data-index");
		var url = "/companionreply/delete/" + reply_numbercode + "/" + companion_numbercode;
		$.ajax({
			"type" : 'delete',
			"url" : url,
			"headers" : {
				"Content-Type" : "application/json",
				"X-HTTP-Method-Overried" : "delete"
			},
			"success" : function(receivedData){
				//console.log(receivedData); // success
				if(receivedData == "success"){
					// 1. 댓글 데이터를 새로 불러오기
//	 				getReplyList();
					// 2. Traversing(트래버싱)
					$("#companionReplyList > tr").eq(index).fadeOut("1000");
				}
			}
		});
	});
	//모달창 작성완료 버튼
	$("#btnModalReplyFinish").click(function() {
		var reply_content = $("#modal_reply_content").val();
		var reply_writer = $("#modal_reply_writer").val();
		var reply_numbercode = $("#reply_numbercode").val();
		var data = {
				"reply_content" : reply_content,
				"reply_writer" : reply_writer,
				"reply_numbercode" : reply_numbercode
		};
// 		console.log(data);
		var url = "/companionreply/update/" + reply_numbercode;
		$.ajax({
			"type" : "put",
			"url" : url,
			"headers" : {
				"Content-Type" : "application/json",
				"X-HTTP-Method-Override" : "put"
			},
			"dataType" : "text",
			"data" : JSON.stringify(data),
			"success" : function(receivedData) {
				$("#btnModalReply").next().trigger("click"); // 모달창 사라지기
// 				getReplyList(); // 1. 새로 불러 들이기
				// 2. 해당 댓글, 댓글러만 수정
				var index = $("#modal_index").val();
				// <tbody> 내의 해당 번째 <tr>
				var target_tr = $("#companionReplyList > tr").eq(index);
				// <tr>의 1번째(두번째) <td> - 댓글내용
				target_tr.find("td").eq(1).text(reply_content);
				// <tr>의 2번째(세번째) <td> - 댓글러
				target_tr.find("td").eq(2).text(reply_writer);
			} // "success"
		}); // $.ajax
	}); // $("#btnModalReply").click
	
	
	
});
</script>
<!-- modal창   -->
	<div class="row">
		<div class="col-md-12">
			<a style="display:none;" id="modal-721283" href="#modal-container-721283" role="button" class="btn" data-toggle="modal">Launch demo modal</a>
			 <div class="modal fade" id="modal-container-721283" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
			 	<div class="modal-dialog" role="document">
			 		<div class="modal-content">
			 			<div class="modal-header">
			 				<h5 class="modal-title" id="myModalLabel">
			 					글수정
			 				</h5>
			 			<button type="button" class="close" data-dismiss="modal">
			 				<span aria-hidden="true">x</span>
			 			</button>
			 			</div>
			 			<div class="modal-body">
			 				<input type="hidden" id="modal-index">
			 				<input type="hidden" id="modal-reply_numbercode">
			 				<div class="form-group">
			 					<label for="title">댓글내용</label>
			 					<input type="text" class="form-control" id="modal_reply_content">
			 				</div>
			 				<div class="form-group">
			 					<label for="title">작성자</label>
			 					<input type="text" class="form-control" id="modal_reply_writer">
			 				</div>
			 			</div>
			 			<div class="modal-footer">
			 				<input type="button" class="btn btn-warning" id="btnModalReplyFinish" value="작성완료">
			 				<button type="button" class="btn btn-warning" data-dismiss="modal">닫기</button>	
			 			</div>
			 		</div>
			 	</div>
			 </div>
		</div>
	</div>
	
<!-- /modal창 -->
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
				<c:if test="${memberVo.user_id == companionVo.companion_writer}">
				<input type="button" class="btn btn-warning" value="수정"
				id="btnUpdate"/>
				<input type="button" class="btn btn-warning" value="삭제"
				id="btnDelete"/>
				</c:if>
				<input type="button" class="btn btn-success" value="목록"
				id="btnList"/>
		</div>
	</div>
	<br>
	<br>
	<br>
	
	<!-- 댓글 작성 -->
	<div class="row" style="background-color: #bfd2ef">
		<div class="col-md-12">
			<div class="form-group">
				<label for="reply_content">댓글 내용</label>
				<input type="text" class="form-control" id="reply_content"/>
			</div>
			
			<div class="form-group">
				<label for="reply_writer">작성자</label>
				<input type="text" class="form-control" id="reply_writer"
					value="${memberVo.user_id}"/>
			</div>
			
			<div class="form-group">
				<input type="button" class="btn-xs btn-success" id="btnCompanionReplyFinish"
					value="작성완료"/>
			</div>
		</div>
	</div>
	
	
	<!-- 댓글 목록 -->
	<div class="row">
		<div class="col-md-12">
			<p><input type="button" id="btnCompanionReplyList" value="댓글목록"
				class="btn btn-warning"></p>
			<table class="table">
				<thead>
					<tr>
						<th>번호</th>
						<th>댓글내용</th>
						<th>작성자</th>
						<th>날짜</th>
						<th>수정</th>
						<th>삭제</th>
					</tr>
				</thead>
				<tbody id="companionReplyList">
					
				</tbody>
			</table>
		</div>
	</div>
</div>
	
<%@ include file="../../include/nds/footer.jsp" %>		
