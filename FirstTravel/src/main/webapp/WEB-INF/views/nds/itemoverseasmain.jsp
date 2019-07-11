<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/nds/header.jsp" %>
<%@ include file="../include/nds/search.jsp" %>
<!DOCTYPE html>
<html>
<head>
<script>
$(document).ready(function(){
	// 검색 창
	$("#country").change(function() {
		var overseas_Country = $("#country option:selected").val();
		var data = {
				"overseas_Country" : overseas_Country
		};
		var url = "/overseasrest/countrychk";
		
		$.ajax({
			"type" : "post",
			"url" : url,
			"headers" : {
				"content-type" : "application/json",
				"X-HTTP-Method-Override" : "post"
			},
			"dataType" : "text",
			"data" : JSON.stringify(data),
			"success" : function(rData) {
			var	parsedJson = JSON.parse(rData);
			var str = "";
				for (var i = 0; i<parsedJson.length; i++) {
					str += "<option value='"+parsedJson[i].airPort+"'>"+parsedJson[i].overseas_City+"</option>";
					console.log(parsedJson[i].airPort);
				}
				$("#city").html(str);
			}
		});
	});
});
</script>
<title>해외 상품(메인)</title>
</head>
<body>
<section class="page">
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<div class="content">
					<h1 class="page-name">해외 메인</h1>
				</div>
			</div>
		</div>
	</div>
</section>
   <div class="row">
                <div class="col-lg-12">
                  <div class="section-top text-center">
                 	 <h2>이달 베스트 상품(해외)</h2>
              </div>
          </div>
      </div>
<div class="container latest">
  <div class="one_third">
    <figure class="shadow"><a href="/nds/itemoverseasread?overseas_Country=${overseas[10].overseas_Country}&overseas_City=${overseas[10].overseas_City}&airPort=${overseas[10].airPort}" class="thumb"><img src="/ndsupload/displayFile?fileName=${overseas[10].image1}" alt="alt" /></a>
      <figcaption> <a href="/nds/itemoverseasread?overseas_Country=${overseas[10].overseas_Country}&overseas_City=${overseas[10].overseas_City}&airPort=${overseas[10].airPort}" class="thumb">
        <h3 class="heading">${overseas[10].overseas_City}</h3>
        </a>
        <p class="bioquote">${overseas[10].overseas_promotioncontent}</p>
      </figcaption>
    </figure>
  </div>
  <!-- one_third ends here -->
  <div class="one_third">
    <figure class="shadow"><a href="/nds/itemoverseasread?overseas_Country=${overseas[25].overseas_Country}&overseas_City=${overseas[25].overseas_City}&airPort=${overseas[25].airPort}" class="thumb"><img src="/ndsupload/displayFile?fileName=${overseas[25].image1}" alt="alt" /></a>
      <figcaption> <a href="/nds/itemoverseasread?overseas_Country=${overseas[25].overseas_Country}&overseas_City=${overseas[25].overseas_City}&airPort=${overseas[25].airPort}" class="thumb">
        <h3 class="heading">${overseas[25].overseas_City}</h3>
        </a>
        <p class="bioquote">${overseas[25].overseas_promotioncontent}</p>
      </figcaption>
    </figure>
  </div>
  <!-- one_third ends here -->
  <div class="one_third lastcolumn">
    <figure class="shadow"><a href="/nds/itemoverseasread?overseas_Country=${overseas[26].overseas_Country}&overseas_City=${overseas[26].overseas_City}&airPort=${overseas[26].airPort}" class="thumb"><img src="/ndsupload/displayFile?fileName=${overseas[26].image1}" alt="alt" /></a>
      <figcaption> <a href="/nds/itemoverseasread?overseas_Country=${overseas[26].overseas_Country}&overseas_City=${overseas[26].overseas_City}&airPort=${overseas[26].airPort}" class="thumb">
        <h3 class="heading">${overseas[26].overseas_City}</h3>
        </a>
        <p class="bioquote">${overseas[26].overseas_promotioncontent}</p>
      </figcaption>
    </figure>
  </div>
  <!-- one_third ends here --> 
</div>
<div class="row">
                <div class="col-lg-12">
                  <div class="section-top text-center">
                 	 <h2>이달 베스트 후기(해외)</h2>
              </div>
          </div>
      </div>
      <div class="container latest">
      <c:forEach items="${reviewbestlist}" begin="0" end="2" var="reviewVo">
  <div class="col-md-4">
    <figure class="shadow">
    				  <a href="/nds/reviewread?review_num=${reviewVo.review_num}" class="thumb"><img src="
	    				  <c:choose>
		          		    <c:when test="${reviewVo.review_image != 'null'}">
		           			   /ndsupload/display?fileName=${reviewVo.review_image}
 		           		   </c:when>
		             		 <c:when test="${reviewVo.review_image == 'null'}">
 		            		  /resources/nds/images/b_nullImage.jpg
		             	    </c:when>
		             		 </c:choose>" alt="alt" /></a>
    		  <figcaption>
       <a href="/nds/reviewread?review_num=${reviewVo.review_num}">
        <h3 class="heading">${reviewVo.review_name}</h3>
        </a>
        <p class="bioquote">${reviewVo.review_content}</p>
      </figcaption>
    </figure>
  </div>
  </c:forEach>
  <!-- one_third ends here --> 
</div>
	
<%@ include file="../include/nds/ndsfooter.jsp" %>
<%@ include file="../include/nds/footer.jsp"%>
</body>
</html>