<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/nds/search.jsp" %>
<!DOCTYPE html>
<html>
<head>
<script>
$(document).ready(function(){
	$("#country").change(function() {
		var overseas_Country = $("#country option:selected").val();
		var data = {
				"overseas_Country" : overseas_Country
		};
		var url = "/restover/countrychk";
		
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
   <div class="row">
                <div class="col-lg-12">
                  <div class="section-top text-center">
                 	 <h2>이달 베스트 상품(해외)</h2>
              </div>
          </div>
      </div>
      
<div class="container latest">
  <div class="one_third">
    <figure class="shadow"><a href="#" class="thumb"><img src="/resources/nds/images/portfolio/a.jpg" alt="alt" /></a>
      <figcaption> <a href="#">
        <h3 class="heading">Retro Movie</h3>
        </a>
        <p class="bioquote">One morning, when Gregor Samsa woke from troubled dreams, he found himself transformed in his bed into a horrible vermin. </p>
      </figcaption>
    </figure>
  </div>
  <!-- one_third ends here -->
  <div class="one_third">
    <figure class="shadow"><a href="#" class="thumb"><img src="/resources/nds/images/portfolio/b.jpg" alt="alt" /></a>
      <figcaption> <a href="#">
        <h3 class="heading">Retro Movie</h3>
        </a>
        <p class="bioquote">One morning, when Gregor Samsa woke from troubled dreams, he found himself transformed in his bed into a horrible vermin. </p>
      </figcaption>
    </figure>
  </div>
  <!-- one_third ends here -->
  <div class="one_third lastcolumn">
    <figure class="shadow"><a href="#" class="thumb"><img src="/resources/nds/images/portfolio/c.jpg" alt="alt" /></a>
      <figcaption> <a href="#">
        <h3 class="heading">Retro Movie</h3>
        </a>
        <p class="bioquote">One morning, when Gregor Samsa woke from troubled dreams, he found himself transformed in his bed into a horrible vermin. </p>
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
  <div class="one_third">
    <figure class="shadow"><a href="#" class="thumb"><img src="/resources/nds/images/portfolio/a.jpg" alt="alt" /></a>
      <figcaption> <a href="#">
        <h3 class="heading">Retro Movie</h3>
        </a>
        <p class="bioquote">One morning, when Gregor Samsa woke from troubled dreams, he found himself transformed in his bed into a horrible vermin. </p>
      </figcaption>
    </figure>
  </div>
  <!-- one_third ends here -->
  <div class="one_third">
    <figure class="shadow"><a href="#" class="thumb"><img src="/resources/nds/images/portfolio/b.jpg" alt="alt" /></a>
      <figcaption> <a href="#">
        <h3 class="heading">Retro Movie</h3>
        </a>
        <p class="bioquote">One morning, when Gregor Samsa woke from troubled dreams, he found himself transformed in his bed into a horrible vermin. </p>
      </figcaption>
    </figure>
  </div>
  <!-- one_third ends here -->
  <div class="one_third lastcolumn">
    <figure class="shadow"><a href="#" class="thumb"><img src="/resources/nds/images/portfolio/c.jpg" alt="alt" /></a>
      <figcaption> <a href="#">
        <h3 class="heading">Retro Movie</h3>
        </a>
        <p class="bioquote">One morning, when Gregor Samsa woke from troubled dreams, he found himself transformed in his bed into a horrible vermin. </p>
      </figcaption>
    </figure>
  </div>
  <!-- one_third ends here --> 
</div>
<section class="category-area section-padding">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="section-top text-center">
                        <h2>진행중인 이벤트</h2>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-3 col-md-6">
                    <div class="single-category text-center mb-4">
                        <img src="/resources/nds/images/portfolio/a.jpg" alt="category">
                        <h4>accounting & Finance</h4>
                        <h5>250 open job</h5>
                    </div>
                </div>
                <div class="col-lg-3 col-md-6">
                    <div class="single-category text-center mb-4">
                        <img src="/resources/nds/images/portfolio/a.jpg" alt="category">
                        <h4>production & operation</h4>
                        <h5>250 open jobㄹㄹㄹ</h5>
                    </div>
                </div>
                <div class="col-lg-3 col-md-6">
                    <div class="single-category text-center mb-4">
                        <img src="/resources/nds/images/portfolio/a.jpg" alt="category">
                        <h4>telecommunication</h4>
                        <h5>250 open job</h5>
                    </div>
                </div>
                <div class="col-lg-3 col-md-6">
                    <div class="single-category text-center mb-4">
                        <img src="/resources/nds/images/portfolio/a.jpg" alt="category">
                        <h4>garments & textile</h4>
                        <h5>250 open job</h5>
                    </div>
                </div>
                <div class="col-lg-3 col-md-6">
                    <div class="single-category text-center mb-4 mb-lg-0">
                        <img src="/resources/nds/images/portfolio/a.jpg" alt="category">
                        <h4>marketing and sales</h4>
                        <h5>250 open job</h5>
                    </div>
                </div>
                <div class="col-lg-3 col-md-6">
                    <div class="single-category text-center mb-4 mb-lg-0">
                        <img src="/resources/nds/images/portfolio/a.jpg" alt="category">
                        <h4>engineer & architech</h4>
                        <h5>250 open job</h5>
                    </div>
                </div>
                <div class="col-lg-3 col-md-6">
                    <div class="single-category text-center mb-4 mb-md-0">
                        <img src="/resources/nds/images/portfolio/a.jpg" alt="category">
                        <h4>design & crative</h4>
                        <h5>250 open job</h5>
                    </div>
                </div>
                <div class="col-lg-3 col-md-6">
                    <div class="single-category text-center">
                        <img src="/resources/nds/images/portfolio/a.jpg" alt="category">
                        <h4>customer support</h4>
                        <h5>250 open job</h5>
                    </div>
                </div>
            </div>
        </div>
    </section>
	
<%@ include file="../include/nds/ndsfooter.jsp" %>
</body>
</html>