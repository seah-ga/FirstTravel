<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>    
<!doctype html>
<html lang="kr">
<head>
<meta charset="UTF-8">
<title>http://www.blueb.co.kr</title>
<!--  jquery & bootstrap -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="http://netdna.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">
<style type="text/css">
input[type="checkbox"]#menu_state {
  display: none;
}
input[type="checkbox"]:checked ~ #sideBar {
  width: 250px;
}
input[type="checkbox"]:checked ~ #sideBar label[for="menu_state"] i::before {
  content: "\f053";
}
input[type="checkbox"]:checked ~ #sideBar ul {
  width: 100%;
}
input[type="checkbox"]:checked ~ #sideBar ul li a i {
  border-right: 1px solid #2f343e;
}
input[type="checkbox"]:checked ~ #sideBar ul li a span {
  opacity: 1;
  transition: opacity 0.25s ease-in-out;
}
input[type="checkbox"]:checked ~ main {
  left: 250px;
}
#sideBar {
  position: fixed;
  z-index: 9;
  top: 0;
  left: 0;
  bottom: 0;
  background: #383e49;
  color: #9aa3a8;
  width: 50px;
  font-family: 'Montserrat', sans-serif;
  font-weight: lighter;
  transition: all 0.15s ease-in-out;
}
#sideBar label[for="menu_state"] i {
  cursor: pointer;
  position: absolute;
  top: 50%;
  right: -8px;
  box-shadow: 0 1px 3px rgba(0,0,0,0.12), 0 1px 2px rgba(0,0,0,0.24);
  background: #fff;
  font-size: 10px;
  display: flex;
  justify-content: center;
  align-items: center;
  height: 15px;
  width: 15px;
  border-radius: 50%;
  border: 1px solid #ddd;
  transition: width 0.15s ease-in-out;
  z-index: 1;
}
#sideBar label[for="menu_state"] i::before {
  margin-top: 2px;
  content: "\f054";
}
#sideBar label[for="menu_state"] i:hover {
  box-shadow: 0 10px 20px rgba(0,0,0,0.19), 0 6px 6px rgba(0,0,0,0.23);
}
#sideBar ul {
  overflow: hidden;
  display: block;
  width: 50px;
  list-style-type: none;
  padding: 0;
  margin: 0;
}
#sideBar ul li {
  border: 1px solid #2f343e;
  position: relative;
}
#sideBar ul li.unread:after {
  content: attr(data-content);
  position: absolute;
  top: 10px;
  left: 25px;
  display: flex;
  justify-content: center;
  align-items: center;
  width: 15px;
  height: 15px;
  border-radius: 50%;
  color: #fff;
  background: #ef5952;
  font-size: 8px;
}
#sideBar ul li:not(:last-child) {
  border-bottom: none;
}
#sideBar ul li.active a {
  background: #4c515d;
  color: #fff;
}
#sideBar ul li a {
  position: relative;
  display: block;
  white-space: nowrap;
  text-decoration: none;
  color: #9aa3a8;
  height: 50px;
  width: 100%;
  transition: all 0.15s ease-in-out;
}
#sideBar ul li a:hover {
  background: #4c515d;
  color: #fff;
}
#sideBar ul li a * {
  height: 100%;
  display: inline-block;
}
#sideBar ul li a i {
  text-align: center;
  width: 50px;
  z-index: 999999;
}
#sideBar ul li a i.fa {
  line-height: 50px;
}
#sideBar ul li a span {
  padding-left: 25px;
  opacity: 0;
  line-height: 50px;
  transition: opacity 0.1s ease-in-out;
}
main {
  position: absolute;
  transition: all 0.15s ease-in-out;
  top: 0;
  left: 50px;
}
main header {
  position: absolute;
  z-index: -1;
  top: 0;
  left: 0;
  right: 0;
  height: 400px;
  background: url("http://www.blueb.co.kr/SRC2/_image/01.jpg");
  background-size: cover;
  background-position: 50% 50%;
  background-repeat: no-repeat;
}
main section {
  box-shadow: 0 1px 3px rgba(0,0,0,0.12), 0 1px 2px rgba(0,0,0,0.24);
  background: #fff;
  padding: 25px;
  font-family: helvetica;
  font-weight: lighter;
  padding: 50px;
  margin: 150px 75px;
  transition: all 0.15s ease-in-out;
}
main section:hover {
  box-shadow: 0 10px 20px rgba(0,0,0,0.19), 0 6px 6px rgba(0,0,0,0.23);
}
main section h1 {
  padding-top: 0;
  margin-top: 0;
  font-weight: lighter;
}
#div_title {
	margin: 50px;
}
#div_writeForm {
	
	margin-left: 40px;
	align-content: center;
}
#div_content {
	margin: 40px;
}
.up{
	cursor:pointer;
}
.down{
	cursor:pointer;
}
.replyTable th{

   width: 100px;
    padding: 10px;
    font-weight: bold;
    vertical-align: top;
    border-right: 1px solid #ccc;
    border-bottom: 1px solid #ccc;
    border-top: 1px solid #fff;
    border-left: 1px solid #fff;
    background: #eee;
}



</style>
<script>
var nowPage = 1;
var pagingNum = 10;
var lastPage = 1;
var updownList;	
var space = "   ";
var search_type = "";
var search_val = "";
function getPageInfo(country_name,search_val,search_type) {
//		var data = { "nowPage" : nowPage };	


	if(!search_val && !search_type){
		var url = "/wiki/tip/" + country_name + "/" + nowPage;
	}else{
		var url = "/wiki/tip/" + country_name + "/" + nowPage + "?search_type=" + search_type 
		+ "&search_val=" + search_val;
	}
		console.log(url);
		$.getJSON(url, function(rData){
			console.log("rData", rData);
			var innerHtml = "";
			var lastIndex = rData.length - 1; /// 페이징을 위한 Vo Index
			console.log("lastIndex", lastIndex);
			updownList = rData[lastIndex].updownList;
			console.log("updownList", updownList);
			console.log("${memberVo.user_id}");
			$(rData).each(function(i) {
				innerHtml += "<tr>";
					innerHtml += "<td>" + rData[i].tip_no + "</td>";
					innerHtml += "<td>" + rData[i].tip_content + space 
							  +   "<span class='glyphicon glyphicon-chevron-down gldown' style='float:right;cursor:pointer'></span>"
					          + "<span class='glyphicon glyphicon-chevron-up glup' style='display:none;float:right;cursor:pointer'></span>" ;
					          + "</td>";
					innerHtml += "<td>" + rData[i].tip_regdate + "</td>";
					innerHtml += "<td data-writer-code = '"+ rData[i].tip_writer_code 
								+ "'>" + rData[i].tip_writer_id + "</td>";
					innerHtml += "<td><span class='glyphicon glyphicon-thumbs-up up' data-tipNo='"+ rData[i].tip_no +"'";
					// 로그인 유저가 추천 했던 글일때
					$(updownList).each(function(j){
						if(this.tip_sort == "up" && this.tip_no == rData[i].tip_no ){
							innerHtml += "style='color:red'";
						}
	// 					console.log(this);
					});
					innerHtml  += ">"; 
					innerHtml  += space + rData[i].tip_up + "</span></td>";
					innerHtml += "<td><span class='glyphicon glyphicon-thumbs-down down' data-tipNo='"+ rData[i].tip_no +"'";
					
					// 로그인 유저가 비추천 했던 글일때
					$(updownList).each(function(j){
						if(this.tip_sort == "down" && this.tip_no == rData[i].tip_no ){
							innerHtml += "style='color:blue'";
						}
	// 					console.log(this);
					});
					innerHtml += ">";
					innerHtml +=  space + rData[i].tip_down + "</span></td>";
	
					if(parseInt("${memberVo.user_code}") == parseInt(rData[i].tip_writer_code) ){
						innerHtml += "<td><span class='glyphicon glyphicon-remove remove' style='color:red; cursor:pointer'/></td>";
						innerHtml += "<td><span class='glyphicon glyphicon-pencil update' style='cursor:pointer'/></td>";
					}else{
						innerHtml += "<td></td><td></td>"
					}
				
				innerHtml += "</tr>";
	//				console.log("dd" , Object.keys(rData).length);
	//				console.log("dd" , rData.length);
				if (rData.length - 2 == i){ //////// 마지막 값은 html화 하지않고 반복문 종료
	// 				console.log("if문실행"); 
	//					break;
					return false;
				}
			});
			var pagingDto = rData[lastIndex].psjPagingDto; /// 페이징 dto 꺼내기.
				console.log("pagingDto", pagingDto);
			lastPage = pagingDto.lastPage;
			pagingNum = pagingDto.pagingNum;
			
			var pageHtml = "";
			///// 페이징 
			// 현재 페이지기준 마지막 페이지가 페이징 갯수보다 클 때
			if(pagingDto.endPage > pagingDto.pagingNum){
				pageHtml += "<li class='page-item' id='prev_li'>"
						 +	 "<a class='page-link' href='prev' class='pagePrev'>이전</a>"
						 +  "</li>"
			}
			
			if(pagingDto.endPage != pagingDto.startPage){
				for(var i = pagingDto.startPage; i <= pagingDto.endPage; i++){
					pageHtml += "<li class='page-item";
					if(nowPage == i){
						pageHtml += " active'>";
					}else{
						pageHtml += "'>";
					}
					pageHtml += "<a class='page-link' href='num' class='pageNum'>" + i + "</a>";
					pageHtml += "</li>";
				}
		//// 페이지가 1개뿐일때
			}else{ 
				pageHtml += "<li class='page-item active'>" ;
			    pageHtml += "<a class='page-link' href='num' class='pageNum'>" + 1 +"</a>";
			    pageHtml += "</li>";
			}
			// 현재 페이지기준 마지막 페이지가 끝페이지 보다 작을 때
			//( 마지막 페이지와 끝페이지가 같지 않을 때)
			if(pagingDto.endPage != pagingDto.lastPage){
				pageHtml += "<li class='page-item'>";
				pageHtml += "<a class='page-link' href='next' class='pagePrev'>다음</a>";
				pageHtml += "</li>";
			}
			$("#div_main").css("display","block");
			$(".pagination").html(pageHtml);
			$("#table_tip_list").html(innerHtml);
			$("#tip_title").text(country_name);
		
		});
	
	
}
	$(document).ready(function() {
		$(".ul_countryList").on("click", "a", function(e) {
			e.preventDefault();
			nowPage = 1;
			var country_name = $(this).children('span').text();
			getPageInfo(country_name);
		});
		///// 페이징 클릭시 =========================================
		$('.pagination').on('click',"a[href='num']",function(e) {
			console.log("클릭");
			e.preventDefault();
			nowPage = $(this).text();
			console.log(nowPage);
			
			var country_name = $("#tip_title").text();
			getPageInfo(country_name,search_val,search_type);
// 			console.log(nowPage);
		});
		$('.pagination').on('click','a[href="prev"]',function(e) {
			e.preventDefault();
			nowPage = parseInt(nowPage / pagingNum) * pagingNum - pagingNum + 1;
			var country_name = $("#tip_title").text();
			getPageInfo(country_name,search_val,search_type);
// 			console.log(nowPage);
		});
		$('.pagination').on('click','a[href="next"]',function(e) {
			e.preventDefault();
		
			var country_name = $("#tip_title").text();
			if(nowPage % pagingNum == 0 && nowPage / pagingNum > 0) {
				nowPage = parseInt(nowPage)  + 1;
				console.log("dddddddd" + nowPage);
			}else{
				nowPage = parseInt(nowPage / pagingNum + 1) * pagingNum;
			}
			getPageInfo(country_name,search_val,search_type);
// 			console.log(nowPage);
		});
		// 페이징끝 =======================================
		$("#btn-write").click(function() {
			var url = "/wiki/tip";
			var tip_content = $("#txt_tip").val();
			console.log(tip_content);
			var user_code = "${memberVo.user_code}";
			var user_id = "${memberVo.user_id}";
			var country_name = $("#tip_title").text();
			var data = { 
					"tip_country" : country_name,
					"tip_writer_code" : user_code,
					"tip_content" : tip_content,
					"tip_writer_id" : user_id
					
			};
			var jsonData = JSON.stringify(data);
			$.ajax({
				"type" : "put",
				"data" : jsonData,
				"url" : url,
				"headers" : {
					"Content-Type" : "application/json",
					"X-HTTP-Method-Override" : "post"
				},
				"dataType" : "text",
				"success" :function(rData){
					nowPage = 1; // 바로 1페이지로가서 페이지정보리로드.
					getPageInfo(country_name);
				}
			}); //-- ajax
		}); // -- click
		
		
		/////// 추천 비추천버튼 style ////////////////
		$("#table_tip_list").on("mouseenter", "span.up", function() {
			
			
		});

		//추천버튼클릭
		$("#table_tip_list").on("click", "span.up", function() {
			if(!"${memberVo}"){
				alert('로그인 후 이용해 주세요');
			}else{
				var tipNo = $(this).attr("data-tipNo");
				var sort = "up";
				var thisEl = $(this);
				var url = "";
				console.log(thisEl.css("color"));
				if(thisEl.css("color") != "rgb(51, 51, 51)"){
					console.log("ㅇㅇㅇㅇ");
					url = "/wiki/tip/" + sort + "/" + tipNo + "/minus";
					$.ajax({
						"type" : "post",
						"url" : url,
						"headers" : {
							"Content-Type" : "application/json",
							"X-HTTP-Method-Override" : "post"
						},
						"dataType" : "text",
						"success" :function(rData){
							thisEl.attr("style","cursor:pointer;");
							var upNum = parseInt(thisEl.text()) - 1;
							thisEl.text(space + upNum);
						}
					});	
				}else{
					url = "/wiki/tip/" + sort + "/" + tipNo + "/plus";
// 					console.log(url);
					$.ajax({
						"type" : "post",
						"url" : url,
						"headers" : {
							"Content-Type" : "application/json",
							"X-HTTP-Method-Override" : "post"
						},
						"dataType" : "text",
						"success" :function(rData){
							thisEl.attr("style","cursor:pointer; color:red");
							var upNum = parseInt(thisEl.text()) + 1;
							thisEl.text(space + upNum);
						}
					});	
					
				}	
				
			}
		});
		
		
		//비추버튼 클릭
		$("#table_tip_list").on("click", "span.down", function() {
			if(!"${memberVo}"){
				alert('로그인 후 이용해 주세요');
			}else{
				var tipNo = $(this).attr("data-tipNo");
				var sort = "down";
				var thisEl = $(this);
				var url = "";
				console.log(thisEl.css("color"));
				if(thisEl.css("color") != "rgb(51, 51, 51)"){
					console.log("ㅇㅇㅇㅇ");
					url = "/wiki/tip/" + sort + "/" + tipNo + "/minus";
					$.ajax({
						"type" : "post",
						"url" : url,
						"headers" : {
							"Content-Type" : "application/json",
							"X-HTTP-Method-Override" : "post"
						},
						"dataType" : "text",
						"success" :function(rData){
							thisEl.attr("style","cursor:pointer;");
							var upNum = parseInt(thisEl.text()) - 1;
							thisEl.text(space + upNum);
						}
					});	
				}else{
					url = "/wiki/tip/" + sort + "/" + tipNo + "/plus";
// 					console.log(url);
					$.ajax({
						"type" : "post",
						"url" : url,
						"headers" : {
							"Content-Type" : "application/json",
							"X-HTTP-Method-Override" : "post"
						},
						"dataType" : "text",
						"success" :function(rData){
							thisEl.attr("style","cursor:pointer; color:blue");
							var upNum = parseInt(thisEl.text()) + 1;
							thisEl.text(space + upNum);
						}
					});	
					
				}	
				
			}
		});
		//////// 게시 팁 삭제
		$("#table_tip_list").on("click", "span.remove", function() {
			console.log("삭제버튼클릭");
			
			var tip_no = $(this).parent().parent().children().eq(0).text();
			console.log(tip_no);
			var url = "/wiki/tip/" + tip_no;
			var country_name = $("#tip_title").text();
			console.log(country_name);
			$.ajax({
				"type" : "delete",
				"url" : url,
				"headers" : {
					"Content-Type" : "application/json",
					"X-HTTP-Method-Override" : "post"
				},
				"dataType" : "text",
				"success" :function(rData){
					if(rData.trim() == "success"){
						getPageInfo(country_name,search_val,search_type);
					}
				}	
			});	
				
		});
		/// 게시 팁 업데이트
		$("#table_tip_list").on("click", "span.update", function() {
			// 기존 팁 내용
			var td_tip_content = $(this).parent().parent().children().eq(1);
			console.log(td_tip_content.text());
			var origin_txt = td_tip_content.text();
			var innerUpdateForm = "<input type='text' class='txt_update'" 
			    innerUpdateForm += "value='" + origin_txt + "'>"
			
			$(this).parent().html("<button class='btn-update'>완료</button>" +
					"<button class='btn-update' data-origin_txt='" +  origin_txt + "'>취소</button>");
			td_tip_content.html(innerUpdateForm);
			td_tip_content.children("input[class=txt_update]").focus();
			td_tip_content.children("input[class=txt_update]").select(); 
			// 버튼클릭시 기존 내용 전체 드래그 상태로. 
		});
		$("#table_tip_list").on("click","button.btn-update", function() {
// 			console.log("클릭클릭");
			var td_tip_content =  
			$(this).parent().parent().children().eq(1);
			var tip_content = td_tip_content.children("input[class=txt_update]").val();
			
			var tip_no = td_tip_content.prev().text();
// 			console.log(tip_no);
			var url = "/wiki/tip/" + tip_no;
			var country_name = $("#tip_title").text();
			
			var data = {
				"tip_content" : tip_content	
			};
			var jsonData = JSON.stringify(data);
			console.log(jsonData);
			$.ajax({
				"type" : "post",
				"url" : url,
				"data" : jsonData,
				"headers" : {
					"Content-Type" : "application/json",
					"X-HTTP-Method-Override" : "post"
				},
				"dataType" : "text",
				"success" :function(rData){
					if(rData.trim() == "success"){
						getPageInfo(country_name,search_val,search_type);
					}
				}
			});	
			
			
		});
		$("#btn-search").click(function() {
			var country_name = $("#tip_title").text();
			search_type = $("#sel_search").val();
			search_val = $("#txt_search").val();
			getPageInfo(country_name,search_val,search_type);
// 			console.log(search_type + " ::" + search_val);
		});
		
		///댓글펼치기
		$("#table_tip_list").on('click','span.gldown', function() {
// 			console.log($(this).parent().parent());
			var tip_no = $(this).parent().parent().children().eq(0).text();
			console.log(tip_no);
			var thisEl = $(this);
			var tr = $(this).parent().parent();
			var url = "/wiki/reply/" + tip_no;
			var replyHtml ="<td></td>";  // td 한칸을 비우고싶어서.. 다른 방법 강구해볼것
			replyHtml += "<td><input type='text' class='txt-reply' placeholder='댓글을 입력해주세요.' size='50'>";
			replyHtml += "<input type='button' class='btn-primary btn-xs' value='입력'>";
			replyHtml += "<table class='replyTable'>";
			$.getJSON(url, function(rData){
				console.log(rData);
				$(rData).each(function(i){
					console.log(rData[i].tip_rep_writer_id + " ㅇㅇ");
					
					replyHtml += "<tr>";
					replyHtml += "<th>"+ rData[i].tip_rep_writer_id +"</th>";
					replyHtml += "<td>" + rData[i].tip_rep_content + "</td>";
					replyHtml += "</tr>";
					
				});
				replyHtml += "</table></td>";
				console.log(replyHtml);
				tr.after(replyHtml); // 다음 tr에 붙이기
				thisEl.attr("class","glyphicon glyphicon-chevron-up glup");
			});
			
			
		});
		$("#table_tip_list").on('click', 'span.glup', function() {
			$(this).parent().parent().next().next().remove(); // 댓글 목록 삭제
			$(this).attr("class","glyphicon glyphicon-chevron-down gldown");
		});
		
		$("#txt_tip").click(function() {
			var user = "${memberVo}";
			// 로그인이 되어 있지 않을시 로그인 페이지로.
			if(!user){
				location.href = "/kdw/login";
			}
		});
	}); // -- doc	
</script>
</head>
<body>
<input type="checkbox" id="menu_state" checked>
<nav id="sideBar">
	<label for="menu_state"><i class="fa"></i></label>
	<ul class="ul_countryList">
		<c:forEach var="vo" items="${overseaList}">
		<li>
			<a href="">
				<i class="fa fa-inbox"></i>
				<span>${vo.overseas_Country}</span>
			</a>
		</li>
		</c:forEach>
	</ul>
	
</nav>
<main>
<div id="div_out">
	<div id="div_title">
		<h1 id="tip_title">국가를 선택해 주세요.</h1><hr>
	</div>
	
	<div style="display:none" id="div_main">
	<!-- /ndsupload/displayFile?fileName=이름 -->
	<div class="col-md-12" id="div_writeForm">
		<input type="text" size="150" placeholder="팁을 작성해 주세요." id="txt_tip"
			<c:if test="${memberVo == null}">value="로그인 후 이용해 주세요" readonly="readonly"</c:if>
		>
		<input type="button" value="쓰기" id="btn-write">
	</div>
		<div class="col-md-12" id="div_content">
			<div class="container-fluid">
				<div class="row">
					<div class="col-md-12">
						<table class="table">
							<thead>
								<tr>
									<th>#</th>
									<th>팁</th>
									<th>작성일</th>
									<th>작성자</th>
									
								</tr>
							</thead>
							<tbody id="table_tip_list">
								<tr>
									<td>1</td>
									<td>TB - Monthly</td>
									<td>01/04/2012</td>
									<td>Default</td>
									<td>Default</td>
								</tr>
								
							</tbody>
						</table>
							<div class="col-md-6">
								<nav>
									<ul class="pagination">
										<li class="page-item" id="prev_li">
											<a class="page-link" href="prev" class="pagePrev">이전</a>
										</li>
										<li class="page-item">
											<a class="page-link" href="num" class="pageNum">1</a>
										</li>
										<li class="page-item" id="next_li">
											<a class="page-link" href="next" class="pageNext">다음</a>
										</li>
									</ul>
								</nav>
								<select  style="height:25px" id="sel_search">
									<option value="writer">작성자</option>
									<option value="content">내용</option>
								</select>
								<input type="text" placeholder="검색할 내용을 입력해 주세요." id="txt_search" size="30">
								<input type="button" value="검색" id="btn-search">
							</div>
							
					</div>
				</div>
				
			</div>
			
		</div>
		</div>
	</div>
</main>
</body>
</html>