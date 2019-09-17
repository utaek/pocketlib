<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en-US" dir="ltr">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!--  
    Document Title
    =============================================
    -->

<title>pocketLib</title>

<!-- favicon -->
<%@ include file="/WEB-INF/views/inc/favicon.jsp" %>
<!-- Stylesheets -->
<%@ include file="/WEB-INF/views/inc/style.jsp" %>

<body data-spy="scroll" data-target=".onpage-navigation"
	data-offset="60">
	<main>
	<div class="page-loader">
		<div class="loader">Loading...</div>
	</div>
	
	<!-- Nav bar -->
<%@ include file="/WEB-INF/views/inc/navbar.jsp" %>
		<section class="home-section home-parallax home-fade" id="home">
		<div class="hero-slider">
			<ul class="slides">
				<li class="bg-dark-30 bg-dark"
					style="background-image: url(${pageContext.request.contextPath}/assets/images/section-8.jpg);">
					<div class="titan-caption">
						<div class="caption-content">
							<div class="font-alt mb-30 titan-title-size-1">Hello &amp;
								welcome</div>
							<div class="font-alt mb-40 titan-title-size-4">pocketLib</div>
							<a class="section-scroll btn btn-border-w btn-round"
								href="#about">about us</a>
						</div>
					</div>
				</li>
				<li class="bg-dark-30 bg-dark"
					style="background-image: url(${pageContext.request.contextPath}/assets/images/section-9.jpg);">
					<div class="titan-caption">
						<div class="caption-content">
							<div class="font-alt mb-30 titan-title-size-2">
								맞춤 추천을 받아보세요.<br />pocketLib이 도서를 추천해드립니다.
							</div>
							<a class="btn btn-border-w btn-round" href="${pageContext.request.contextPath}/recommend/pocketlibrecommend.do">Recommend</a>
						</div>
					</div>
				</li>
				<li class="bg-dark-30 bg-dark"
					style="background-image: url(${pageContext.request.contextPath}/assets/images/section-10.jpg);">
					<div class="titan-caption">
						<div class="caption-content">
							<div class="font-alt mb-30 titan-title-size-1">나만의 서재에 책을
								등록해보세요.</div>
							<div class="font-alt mb-40 titan-title-size-3">My pocketLib</div>
							<a class="section-scroll btn btn-border-w btn-round"
								href="${pageContext.request.contextPath}/book/mybookshelf.do">My pocketLib</a>
						</div>
					</div>
				</li>
			</ul>
		</div>
	</section>
	<div class="main">
		<section class="module-medium">
			<div class="container" id="container"
				style="font-family: 'overwatch'; src: url('fonts/koverwatch.woff2');">
				<div class="CSV">

					<script src="https://d3js.org/d3.v3.min.js"></script>
				 <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
				  <script src="https://d3js.org/d3.v3.js"></script>
				
					<script
						src="https://rawgit.com/jasondavies/d3-cloud/master/build/d3.layout.cloud.js"
						type="text/JavaScript"></script>

					<script>
				var body = d3.select("body"),
				    length = 100,
				    color = d3.scale.linear().domain([1,length])
				      .interpolate(d3.interpolateHcl)
				      .range([d3.rgb("#6192E8"), d3.rgb('#DF53A4')]);

        var width = 1200,
            height = 400

        var svg = d3.select("div.CSV").append("svg")
            .attr("width", width)
            .attr("height", height);
        d3.csv("${pageContext.request.contextPath}/searching.csv", function (data) {
        	console.log(data);
            showCloud(data)
            setInterval(function(){
                 showCloud(data)
            },2000) 
        });
        //scale.linear: 선형적인 스케일로 표준화를 시킨다. 
        //domain: 데이터의 범위, 입력 크기
        //range: 표시할 범위, 출력 크기 
        //clamp: domain의 범위를 넘어간 값에 대하여 domain의 최대값으로 고정시킨다.

        wordScale = d3.scale.linear().domain([0, 1000]).range([0, 200]).clamp(true);

        var svg = d3.select("svg")
                    .append("g")
                    .attr("transform", "translate(" + (width / 2) + "," + (height / 2) + ")");

        function showCloud(data) {
            d3.layout.cloud().size([width, height])
                //클라우드 레이아웃에 데이터 전달
                .words(data)
                .rotate(function (d) {
                    return d.text.length > 3 ? 0 : 0;
                })
                //스케일로 각 단어의 크기를 설정
                .fontSize(function (d) {
                    return wordScale(d.frequency);
                })
                //클라우드 레이아웃을 초기화 > end이벤트 발생 > 연결된 함수 작동  
                .on("end", draw)
                .start();

            function draw(words) { 
                var cloud = svg.selectAll("text").data(words)
                //Entering words
                cloud.enter()
                    .append("text")
                    .style("font-family", "overwatch")
                    .style("fill", function (d) {
                    	  min = Math.ceil(0);
                    	  max = Math.floor(100);
                    	  
                    	 return color( Math.floor(Math.random() * (max - min + 1)) + min);
                    	
                    	
                    })
                    .style("fill-opacity", .5)
                    .attr("text-anchor", "middle") 
                    .attr('font-size', 1)
                    .text(function (d) {
                        return d.text;
                    }); 
                cloud
                    .transition()
                    .duration(600)
                    .style("font-size", function (d) {
                        return d.size + "px";
                    })
                    .attr("transform", function (d) {
                        return "translate(" + [d.x, d.y] + ")rotate(" + d.rotate + ")";
                    })
                    .style("fill-opacity", 1); 
                     }
        }
    </script>
				</div>
			</div>
		</section>
		<section class="module">
			<div class="row">
				<div class="col-sm-8 col-sm-offset-2">
					<c:forEach var="list" items="${bigList}" varStatus="status">
						<table class="table table-hover" align="center"
							style="width: 70%; text-align: center;">
							<colgroup>
								<col style="width: 20%;">
								<col style="width: 80%;">
							</colgroup>

							<c:if test="${fn:length(list)>0}">
								<div class="alert alert-success" role="alert">
								<h4 class="font-al mb-0">
							
									<strong>${months[status.index]} 의 인기도서</strong> <span><i
										class="icon-quote"></i></span>
								</div>
								<tbody>
									<tr>

										<c:forEach var="item" items="${list}" varStatus="status">
											<td>${status.index+1}위</td>
											<td><a
												href="${pageContext.request.contextPath}/book/book_detail.do?isbn=${item.isbn}">
													${item.title}</a></td>
									</tr>
								</tbody>
								</c:forEach>
							</c:if>
							</c:forEach>
						</table>
				</div>
			</div>
		</section>
		</div>
		<%@ include file="/WEB-INF/views/inc/bottom.jsp" %>
		
		
	</main>
	<%@ include file="/WEB-INF/views/inc/script.jsp" %>
</body>

</html>