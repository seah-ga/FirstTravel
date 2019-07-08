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
<!-- include summernote css/js -->
<link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.12/summernote.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.12/summernote.js"></script>
<script src="/resources/kdw/js/myscript.js"></script>
<script>
	$(document).ready(function() {
		var url = "";
		window.onload = function() {
			console.log("전체주소 : " + $(location).attr("href"));
			console.log("index : " + $(location).attr("pathname"));
			url = $(location).attr("pathname");
		}
		var mouseover_image = "";
		// textarea summernote 사용
		 $('#g_content').summernote({
			 tabsize : 2,
			 height : 400,	// set editor height
			 minHeight : null,
			 maxHeight : null,
			 callbacks : {
				 onImageUpload : function(files, editor, welEditable) {
					 console.log("files: " + files); // [object FileList]
					 console.log("editor: " + editor); // undefined
					 console.log("welEditable: " + welEditable); // undefined
					 for (var i = 0; i < files.length; i++) {
						 sendFile(files[i], editor, welEditable);
					 }
				 }
			 },
			 lang: 'ko-KR' // default: 'en-US'
		 });
		
		function sendFile(file, editor, welEditable) {
			var form_data = new FormData();  // 빈 formData 객체 생성
			var url = "/kdw/upload/uploadAjax";
			form_data.append("file", file);  // formData에 key/value 쌍 추가
			$.ajax({
				data : form_data,
				type : "post",
				"url" : url,
				cache : false,
				contentType : false,  // default ="application/x-www-form-urlencoded;charset=UTF-8"
				enctype : "multipart/form-data",
				processData : false,  // 일반적으로 서버에 전달되는 데이터는 query string, 파일 전송의 경우 x
				success : function(fullName) {
					console.log("return_url" + fullName);
					$('#g_content').summernote('editor.insertImage', '/kdw/upload/displayFile?fileName='+ fullName);
					var slashIndex = fullName.lastIndexOf("/");
					var front = fullName.substring(0, slashIndex + 1);
					console.log("front: " + front);
					var rear = fullName.substring(slashIndex + 1);
					console.log("rear: " + rear);
					var thumnailName = front + "s_" + rear;
					console.log("thumnailName: " + thumnailName);
					var startIndex = fullName.indexOf("_");
					var fileName = fullName.substring(startIndex + 1);
					console.log("fileName: " + fileName);
					var div = "";
					if(isImage(fileName)) {
						div += "<div class='div_name' data-filename='" + fullName +"' style='width:100px;height:100px;float:left;margin-left:3px'>"
							+ "<img src='/kdw/upload/displayFile?fileName=" + thumnailName + "' style='width:100px;height:100px;float:left;'><br>" 
							+ "</div>";
					}
					$("#file_area").append(div);
				}
			});
		}
		
		// summernote 이미지 삭제 버튼 클릭시
		$(".note-remove").on("click", "button", function() {
			console.log("삭제버튼 클릭");
			var url = "/kdw/upload/deleteFile?fileName=" + mouseover_image;
			$.get(url, function(result) {
				console.log(result); // 2019/7/2/s_9c2c45e2-7188-45bb-86f7-cca1d9883436_main.jpg
				if (result.trim() != "success") {
					$("div .div_name").each(function() {
						if ($(this).attr("data-filename") == result.trim()){
							$(this).css("display", "none");
							console.log($(this));
						}
					});
				}
			});
			
		});
		
		// 업로드 이미지 이름 얻기
		$("div.note-editing-area").on("mousedown", "img",function(e) {
			var src = $(this).attr("src");
			var valueIndex = src.indexOf("=");
			mouseover_image = src.substring(valueIndex + 1);
			console.log("mouseover_image: " + mouseover_image);
			console.log("src" + src);  // /kdw/upload/displayFile?fileName=2019/7/2/add60812-034f-4b99-87ed-4f92a2af70c5_main.jpg
				
		});
		
		// 여행지역 선택
		$("#g_location").change(function(){
			var val = $("#g_location").val();
			console.log("val" + val);
		});
		
		// 글 작성 완료 버튼
		$("#btn_finish").click(function() {
			var uploadDiv = $("#file_area > div");
			uploadDiv.each(function(index) {
				var fileName = $(this).attr("data-filename");
				var hiddenInput = "<input type='hidden' name='files[" + index + "]' value='" + fileName + "'/>";
				$("#write_form").append(hiddenInput);
			});
			$("#write_form").submit();
		});
	});
</script>
<style>
#file_area {
		width : 100%;
		height : 100px;
		border : 1px dashed black;  
		background-color : #ffffff;
		margin : auto;
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
						<li>1. First Travel의 마케팅(홈페이지, 네이버 블로그, 메일링 발송 등)으로 사용 될 수 있습니다.</li>
						<li>2. 작성 시 예약번호를 반드시 기재해주세요</li>
						<li>3. 이벤트 경품 수령을 위해 사진을 도용하거나 거짓된 후기 등록 시 사전 통보 없이 삭제처리 할 수 있으며 법적 제재를 가할 수 있습니다.</li>
						<li>4. 게시판 성격과 맞지 않는 글은 사전 통보 없이 삭제 처리할 수 있습니다.</li>
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
						<div class="form-group">
							 
							<label for="g_writer">이름</label>
							<input type="text" class="form-control" id="g_writer" name="g_writer" value="${memberVo.user_name }" readonly="readonly"/>
							<label for="gBoard_location">여행지역</label><br>
							<select id="g_location" name="g_location">
								<option value="location">지역선택</option>
								<option value="유럽">유럽</option>
								<option value="중국/대만">중국/대만</option>
								<option value="동남아/홍콩">동남아/홍콩</option>
								<option value="일본">일본</option>
								<option value="미국/캐나다/특수">미국/캐나다/특수</option>
								<option value="제주/내륙">제주/내륙</option>
							</select>
						</div>
						<div class="form-group">
							 
							<label for="gBoard_title">제목</label>
							<input type="text" class="form-control" id="g_title" name="g_title"/>
						</div>
						<div class="form-group g_content">
							 
							<label for="g_content">내용</label><br>
							<textarea rows="20" id="g_content" name="g_content" style="resize:none;width:100%"></textarea>
						</div>
						<div class="form-group">
							 
							<label for="g_file_path">
								 이미지 리스트
							</label>
							<div id="file_area" id="g_file_path"></div>
							<p class="help-block" style="color:#e6067f">
								첨부파일은 파일1개당 5MB를 초과 하실 수 없으며, 이미지 파일 (JPG, GIF, PNG)만 첨부하실 수 있습니다.
							</p>
						</div>
					</form>
				</div>
				<div class="col-md-2">
				</div>
			</div>
			<div class="row">
				<div class="col-md-2">
				</div>
				<div class="col-md-8">
					 
					<input type="button" value="작성완료" class="btn btn-primary" id="btn_finish"/>
				</div>
				<div class="col-md-2">
				</div>
			</div>
		</div>
	</div>
</div>
</body>
</html>