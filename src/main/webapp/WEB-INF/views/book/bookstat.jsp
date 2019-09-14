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
				<h4 class="font-alt mb-0">독서 통계</h4>
				<hr class="divider-w mt-10 mb-20">

				<span>지금까지 읽은 책 수 ->${br_cnt} </span>

				<c:forEach var="item1" items="${CateName}" varStatus="status">
					<span>${item1}</span>

				</c:forEach>

				<br> <br>

				<c:forEach var="item2" items="${catesplit}" varStatus="status">


					<span>${item2}</span>

				</c:forEach>

				<br> <br> <span> 읽은 책 권 수 추이 </span>

				<div id="splineChart"></div>

				<script>
		
				var chart1= bb.generate({
					bindto: "#splineChart",
				data: {
				// 데이터들 설정 [이름, 값1, 값2, 값3 ... 값n]
		    	x: 'x',
				columns: [
				
					['x', "가입일", ${termStr}], //columns movieNm, x축 movieNm,
					
					['읽은 책 권 수 추이',0, ${cntlist}],
					['총 읽은 권 수 추이',0, ${totalStr}],
				],
				
				types: {
					'읽은 책 권 수 추이' : "spline",	
					'총 읽은 권 수 추이' : "spline"
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


	
				<div id="radarLevel"></div>

				<script>
		
				var chart2 = bb.generate({
					 data: {
						    x: "x",
						    columns: [
							["x", ${catelistStr}],
							["카테고리 별 읽은 책 권 수", ${catecntlistStr}]
							 ],
						    type: "radar"
						  },
						  radar: {
						    level: {
						      depth: ${maxlength},
						      show: false,
						      text: {
						        format: function(x) { return x + "권"; }
						      }
						    },
						    axis: {
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



				<form>

					<button type="submit" class="btn btn-g btn-round btn-xs"
						onclick="window.close();">닫기</button>

				</form>

			</div>
		</section>
	</div>

</body>
</html>

