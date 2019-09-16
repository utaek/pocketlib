<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html lang="en-US" dir="ltr">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">

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
<link rel="rp" type="image/png" sizes="16x16"
	href="${pageContext.request.contextPath}/assets/images/rp-1.png">
<link rel="rp" type="image/png" sizes="16x16"
	href="${pageContext.request.contextPath}/assets/images/rp-2.png">


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

<script src="//d3js.org/d3.v5.min.js"></script>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/assets/billboard.css">

<script type="text/javascript"
	src="${pageContext.request.contextPath}/assets/billboard.js"></script>



</head>
<body data-spy="scroll" data-target=".onpage-navigation"
	data-offset="60">

	<div class="main">
		<section class="module">
			<div class="container">
				<div class="row multi-columns-row post-columns">
					<div class="col-md-6 col-lg-6">
						<div class="post">
							<div class="post-header font-alt">
								<h2 class="post-title">MY BOOK STAT</h2>

								<div class="post-meta">POCKETLIB 이 ${userInfo.userName} 님의
									독서 데이터를 수집해 통계 데이터를 보여줍니다.</div>
							</div>
							<div class="post-entry">
								<b>${userInfo.userName} 님</b>은 현재 월 평균 <strong>${avg}권</strong>의
								책을 읽고 계십니다. <br> 지금까지 독서에 투자하신 비용은 <strong>${priceofbookread}원</strong>입니다.
								<br> <b>${userInfo.userName} 님</b>께서 아직 읽지 않으신 관심 책은 총 <strong>${bi_cnt}권</strong>이며
								<br> 금액으로 환산하면 총 <strong>${priceofbookinterested}원</strong>
								입니다. <br> 약 <strong> ${howlong}개월</strong> 안에 눈여겨 보고 계신 도서를
								모두 읽으실 수 있겠네요!
							</div>
						</div>
					</div>
				</div>

			</div>
			<div class="container">
				<div class="row multi-columns-row post-columns">
					<div class="col-md-6 col-lg-6">
						<div class="post">
							<div class="post-header font-alt">
								<h2 class="post-title">GRAPH 1</h2>

								<div class="post-meta">
									POCKETLIB 이 수집한 ${userInfo.userName} 님의 독서량 데이터입니다. <br>
									지금까지 총 ${br_cnt} 권의 책을 읽으셨군요!
								</div>
							</div>
							<div class="post-entry">
								<div id="splineChart"></div>
						<script>
						var chart1= bb.generate({
							bindto: "#splineChart",
							data: {
							// 데이터들 설정 [이름, 값1, 값2, 값3 ... 값n]
		   					 	x: 'x',
								columns: [			
									['x', "가입일", ${termStr}], //columns movieNm, x축 movieNm,
									['월별 독서량',0, ${cntlist}],
									['누적 독서량',0, ${totalStr}],
								],			
								types: {
									'월별 독서량' : "spline",	
									'누적 독서량' : "spline"
								},
								colors: {
							     	'월별 독서량': "#679EE9",
			   					 	'누적 독서량': function(d) {
			     				   		return "#5BC186";
			    					 }
			 			 		}
							},
							axis:{
								x: {
									type: "category",		// 종류
									height: 150,			// x축 텍스트 영역의 높이
									tick: {					// x축의 텍스트 속성
										rotate: -45,						
										}
									}
								}
							});
						</script>

							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="container">
				<div class="row multi-columns-row post-columns">
					<div class="col-md-6 col-lg-6">
						<div class="post">
							<div class="post-header font-alt">
								<h2 class="post-title">GRAPH 2</h2>
								<div class="post-meta">
									POCKETLIB 이 수집한 ${userInfo.userName} 님의 선호 분야입니다. <br>
								</div>
							</div>
							<div class="post-entry">
								<div id="radarLevel"></div>
							<script>	
							var chart2 = bb.generate({
								data: {
								    x: "x",
									    columns: [
											["x", ${catelistStr}],
											["카테고리 별 읽은 책 권 수", ${catecntlistStr}]
										 ],
								    type: "radar",
								    color: function(color, d) {
						   			 	return "#BD6694";
						    		}
						  		},
						 		radar: {
								    level: {
								      depth: ${max},
								      show: false,
								      text: {
								        format: function(x) { return x ; }
								      }
								    },
								    axis: {
								    	max:${max},
								    text: {
								    	position: {
							         		x: -15,
									        y: -5
							       		 }
								      }
								    }
								  },
							  bindto: "#radarLevel"
							});
						</script>
						</div>
					</div>
				</div>
			</div>
		</div>
		
			<div class="container">
				<div class="row multi-columns-row post-columns">
					<div class="col-md-6 col-lg-6">
						<form>
							<button type="submit" class="btn btn-g btn-round btn-xs"
								onclick="window.close();">close</button>
						</form>
					</div>
				</div>
			</div>
		</section>
	</div>
</body>
</html>

