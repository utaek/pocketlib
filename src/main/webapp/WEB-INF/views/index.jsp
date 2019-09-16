<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

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
<c:choose>
	<c:when test="${userInfo ==null}">
		<title>ㅎㅇ</title>
	</c:when>
	<c:otherwise>
		<title>안녕하세요${userInfo.userName}님</title>
	</c:otherwise>
</c:choose>
<!--  
    Favicons
    =============================================
    -->
<link rel="apple-touch-icon" sizes="57x57"
	href="${pageContext.request.contextPath}/assets/images/favicons/apple-icon-57x57.png">
<link rel="apple-touch-icon" sizes="60x60"
	href="${pageContext.request.contextPath}/assets/images/favicons/apple-icon-60x60.png">
<link rel="apple-touch-icon" sizes="72x72"
	href="${pageContext.request.contextPath}/assets/images/favicons/apple-icon-72x72.png">
<link rel="apple-touch-icon" sizes="76x76"
	href="${pageContext.request.contextPath}/assets/images/favicons/apple-icon-76x76.png">
<link rel="apple-touch-icon" sizes="114x114"
	href="${pageContext.request.contextPath}/assets/images/favicons/apple-icon-114x114.png">
<link rel="apple-touch-icon" sizes="120x120"
	href="${pageContext.request.contextPath}/assets/images/favicons/apple-icon-120x120.png">
<link rel="apple-touch-icon" sizes="144x144"
	href="${pageContext.request.contextPath}/assets/images/favicons/apple-icon-144x144.png">
<link rel="apple-touch-icon" sizes="152x152"
	href="${pageContext.request.contextPath}/assets/images/favicons/apple-icon-152x152.png">
<link rel="apple-touch-icon" sizes="180x180"
	href="${pageContext.request.contextPath}/assets/images/favicons/apple-icon-180x180.png">
<link rel="icon" type="image/png" sizes="192x192"
	href="${pageContext.request.contextPath}/assets/images/favicons/android-icon-192x192.png">
<link rel="icon" type="image/png" sizes="32x32"
	href="${pageContext.request.contextPath}/assets/images/favicons/favicon-32x32.png">
<link rel="icon" type="image/png" sizes="96x96"
	href="${pageContext.request.contextPath}/assets/images/favicons/favicon-96x96.png">
<link rel="icon" type="image/png" sizes="16x16"
	href="${pageContext.request.contextPath}/assets/images/favicons/favicon-16x16.png">
<link rel="manifest" href="/manifest.json">
<meta name="msapplication-TileColor" content="#ffffff">
<meta name="msapplication-TileImage"
	content="${pageContext.request.contextPath}/assets/images/favicons/ms-icon-144x144.png">
<meta name="theme-color" content="#ffffff">
<!--  
    Stylesheets
    =============================================
    
    -->
<!-- Default stylesheets-->
<link
	href="${pageContext.request.contextPath}/assets/lib/bootstrap/dist/css/bootstrap.min.css"
	rel="stylesheet">
<!-- Template specific stylesheets-->
<link
	href="https://fonts.googleapis.com/css?family=Roboto+Condensed:400,700"
	rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Volkhov:400i"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700,800"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath}/assets/lib/animate.css/animate.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath}/assets/lib/components-font-awesome/css/font-awesome.min.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath}/assets/lib/et-line-font/et-line-font.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath}/assets/lib/flexslider/flexslider.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath}/assets/lib/owl.carousel/dist/assets/owl.carousel.min.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath}/assets/lib/owl.carousel/dist/assets/owl.theme.default.min.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath}/assets/lib/magnific-popup/dist/magnific-popup.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath}/assets/lib/simple-text-rotator/simpletextrotator.css"
	rel="stylesheet">
<!-- Main stylesheet and color file-->
<link href="${pageContext.request.contextPath}/assets/css/style.css"
	rel="stylesheet">
<link id="color-scheme"
	href="${pageContext.request.contextPath}/assets/css/colors/default.css"
	rel="stylesheet">
</head>

<body data-spy="scroll" data-target=".onpage-navigation"
	data-offset="60">
	<main>
	<div class="page-loader">
		<div class="loader">Loading...</div>
	</div>
	<nav class="navbar navbar-custom navbar-fixed-top" role="navigation">
		<div class="container">
			<div class="navbar-header">
				<button class="navbar-toggle" type="button" data-toggle="collapse"
					data-target="#custom-collapse">
					<span class="sr-only">Toggle navigation</span><span
						class="icon-bar"></span><span class="icon-bar"></span><span
						class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="${pageContext.request.contextPath}/">pocketLib</a>
			</div>
			<div class="collapse navbar-collapse" id="custom-collapse">
				<ul class="nav navbar-nav navbar-right">
					<li><a href="${pageContext.request.contextPath}/">Home</a></li>
					<li><a href="${pageContext.request.contextPath}/">팀 소개</a></li>
					<li class="dropdown"><a class="dropdown-toggle"
						href="${pageContext.request.contextPath}/book/bestseller.do"
						data-toggle="dropdown">도서추천</a>
						<ul class="dropdown-menu">
							<li><a
								href="${pageContext.request.contextPath}/book/bestseller.do">베스트셀러</a></li>
							<li><a
								href="${pageContext.request.contextPath}/book/item_new_special.do">화제의
									신간도서</a></li>
							<li><a
								href="${pageContext.request.contextPath}/recommend/pocketlibrecommend.do">맞춤
									추천</a></li>
						</ul></li>
					<li class="dropdown"><a class="dropdown-toggle"
						href="${pageContext.request.contextPath}/book/mybookshelf.do"
						data-toggle="dropdown">독서관리</a>
						<ul class="dropdown-menu">
							<c:choose>
								<c:when test="${userInfo!=null}">
									<li><a
										href="${pageContext.request.contextPath}/book/mybookshelf.do">내
											책장</a></li>
								</c:when>
								<c:otherwise>
									<li><a
										href="${pageContext.request.contextPath}/login/show.do">내
											책장</a></li>

								</c:otherwise>
							</c:choose>
							<li><a
								href="${pageContext.request.contextPath}/book/booksearch.do">책
									검색</a></li>
						</ul></li>
					<li class="dropdown"><a class="dropdown-toggle"
						href="${pageContext.request.contextPath}/board/board_list.do"
						data-toggle="dropdown">커뮤니티</a>
						<ul class="dropdown-menu">
							<li><a
								href="${pageContext.request.contextPath}/board/board_list.do?boardCate=1">자유게시판</a></li>
							<li><a
								href="${pageContext.request.contextPath}/board/board_list.do?boardCate=2">책
									후기 게시판</a></li>
							<li><a
								href="${pageContext.request.contextPath}/board/board_list.do?boardCate=3">QNA
									게시판</a></li>
						</ul></li>

					<li><a href="${pageContext.request.contextPath}/board/FAQ.do">FAQ</a></li>

					<c:choose>
						<c:when test="${userInfo==null}">
							<li><a
								href="${pageContext.request.contextPath}/login/show.do">로그인</a></li>
						</c:when>
						<c:otherwise>
							<li><a
								href="${pageContext.request.contextPath}/login/logout.do">로그아웃</a></li>
							<li><a
								href="${pageContext.request.contextPath}/login/mypage.do">마이페이지</a></li>
						</c:otherwise>
					</c:choose>

				</ul>
			</div>
		</div>
	</nav>
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
							<a class="btn btn-border-w btn-round" href="about">Recommend</a>
						</div>
					</div>
				</li>
				<li class="bg-dark-30 bg-dark"
					style="background-image: url(${pageContext.request.contextPath}/assets/images/section-10.jpg);">
					<div class="titan-caption">
						<div class="caption-content">
							<div class="font-alt mb-30 titan-title-size-1">나만의 서재에 책을 등록해보세요.</div>
							<div class="font-alt mb-40 titan-title-size-3">My pocketLib</div>
							<a class="section-scroll btn btn-border-w btn-round"
								href="#about">My pocketLib</a>
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
					<script
						src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
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
        d3.csv("${pageContext.request.contextPath}/assets/searching.csv", function (data) {
            showCloud(data)
            setInterval(function(){
                 showCloud(data)
            },2000) 
        });
        //scale.linear: 선형적인 스케일로 표준화를 시킨다. 
        //domain: 데이터의 범위, 입력 크기
        //range: 표시할 범위, 출력 크기 
        //clamp: domain의 범위를 넘어간 값에 대하여 domain의 최대값으로 고정시킨다.
        wordScale = d3.scale.linear().domain([0, 100]).range([0, 150]).clamp(true);
        var keywords = ["${rank1}", "${rank2}", "${rank3}"]
        var svg = d3.select("svg")
                    .append("g")
                    .attr("transform", "translate(" + width / 2 + "," + height / 2 + ")")

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

							<c:if test="${list[status.index] != null}">
							<div class="alert alert-success" role="alert">
								${months[status.index]} 의 인기도서 <span><i
									class="icon-quote"></i></span>
							</div>
							</c:if>

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

					</c:forEach>
					</table>


				</div>
			</div>
		</section>

		<div class="module-extra-small bg-dark">
			<div class="container">
				<div class="row">
					<div class="col-sm-9">
						<div>
							<a href="${pageContext.request.contextPath}" class="font-alt" style="font-size:14px; padding-right:10px;">About pocketLib</a>
					
										
							<a href="${pageContext.request.contextPath}" class="font-alt" style="font-size:14px; padding-right:10px;">이용약관</a>
					
										
							<a href="${pageContext.request.contextPath}" class="font-alt" style="font-size:14px; padding-right:10px;">개인정보취급방침</a>
					
										
							<a href="${pageContext.request.contextPath}/board/FAQ.do" class="font-alt" style="font-size:14px; padding-right:10px;">고객센터</a>
					
										
							<a href="https://github.com/utaek/pocketlib" target="_blank" class="font-alt" style="font-size:14px; padding-right:10px;">Github</a>
							
						</div>
						<hr style="margin: 8px 0;"/>
						
						<div class="widget-title font-alt">
							<p>
								<span style="padding-right:10px;">
							  		<Strong style="font-size:12px;">팀명</Strong>: pocketLib	
							  	</span>
							  	<span style="padding-right:10px;">
							  		<Strong style="font-size:12px;">Email</Strong>: oooo@ooooo.com
							  	</span>
							</p>
							
						</div>
						<hr class="divider-d">
						<div class ="font-alt">
							<span class="">
								pocketLib은 BootStrap 기반 오픈소스와 Spring Framework로 만들어졌습니다.<br/>
								자세한 내용은 <a href="https://github.com/utaek/pocketlib" target="_blank">Github</a>에서 확인 하실 수 있습니다.
							</span>
						</div>
					</div>
					
			</div>
		</div>
		
		<footer class="footer bg-dark">
			<div class="container">
				<div class="row">
					<div class="col-sm-6">
						<p class="copyright font-alt">
							&copy; 2019&nbsp;<a href="${pageContext.request.contextPath}">pocektLib</a>, All Rights
							Reserved
						</p>
					</div>
				</div>
			</div>
		</footer>
		<div class="scroll-up">
			<a href="#totop"><i class="fa fa-angle-double-up"></i></a>
		</div>
	</div>

	</main>
	<!--  
    JavaScripts
    =============================================
    -->
	<script
		src="${pageContext.request.contextPath}/assets/lib/jquery/dist/jquery.js"></script>
	<script
		src="${pageContext.request.contextPath}/assets/lib/bootstrap/dist/js/bootstrap.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/assets/lib/wow/dist/wow.js"></script>
	<script
		src="${pageContext.request.contextPath}/assets/lib/jquery.mb.ytplayer/dist/jquery.mb.YTPlayer.js"></script>
	<script
		src="${pageContext.request.contextPath}/assets/lib/isotope/dist/isotope.pkgd.js"></script>
	<script
		src="${pageContext.request.contextPath}/assets/lib/imagesloaded/imagesloaded.pkgd.js"></script>
	<script
		src="${pageContext.request.contextPath}/assets/lib/flexslider/jquery.flexslider.js"></script>
	<script
		src="${pageContext.request.contextPath}/assets/lib/owl.carousel/dist/owl.carousel.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/assets/lib/smoothscroll.js"></script>
	<script
		src="${pageContext.request.contextPath}/assets/lib/magnific-popup/dist/jquery.magnific-popup.js"></script>
	<script
		src="${pageContext.request.contextPath}/assets/lib/simple-text-rotator/jquery.simple-text-rotator.min.js"></script>
	<script src="${pageContext.request.contextPath}/assets/js/plugins.js"></script>
	<script src="${pageContext.request.contextPath}/assets/js/main.js"></script>
</body>

</html>