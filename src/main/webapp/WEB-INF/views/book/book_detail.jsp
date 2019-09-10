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
	href="${pageContext.request.contextPath}/assets/lib/owl.carousel/dist/${pageContext.request.contextPath}/assets/owl.carousel.min.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath}/assets/lib/owl.carousel/dist/${pageContext.request.contextPath}/assets/owl.theme.default.min.css"
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
<style>
/* Popup container - can be anything you want */
.popup {
	position: relative;
	display: inline-block;
	cursor: pointer;
	-webkit-user-select: none;
	-moz-user-select: none;
	-ms-user-select: none;
	user-select: none;
}

/* The actual popup */
.popup .popuptext {
	visibility: hidden;
	width: 160px;
	background-color: #555;
	color: #fff;
	text-align: center;
	border-radius: 6px;
	padding: 8px 0;
	position: absolute;
	z-index: 1;
	bottom: 125%;
	left: 50%;
	margin-left: -80px;
}

/* Popup arrow */
.popup .popuptext::after {
	content: "";
	position: absolute;
	top: 100%;
	left: 50%;
	margin-left: -5px;
	border-width: 5px;
	border-style: solid;
	border-color: #555 transparent transparent transparent;
}

/* Toggle this class - hide and show the popup */
.popup .show {
	visibility: visible;
	-webkit-animation: fadeIn 1s;
	animation: fadeIn 1s;
}

/* Add animation (fade in the popup) */
@
-webkit-keyframes fadeIn {
	from {opacity: 0;
}

to {
	opacity: 1;
}

}
@
keyframes fadeIn {
	from {opacity: 0;
}

to {
	opacity: 1;
}
}
</style>

<script language="javascript">
	function showPopup(frm) {
		var url = "myreview.do";
		var title = "myreview";
		var status = "width=400, height=400";

		window.open("", title, status);

		frm.target = title;
		frm.action = url;
		frm.method = "post";
		frm.submit();
	}

	function m_over() {

		var popup = document.getElementById("myPopup");
		popup.classList.toggle("show");
	}
</script>

</head>
<body data-spy="scroll" data-target=".onpage-navigation"
	data-offset="60">

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
				<a class="navbar-brand"
					href="${pageContext.request.contextPath}/index.do">pocketLib</a>
			</div>
			<div class="collapse navbar-collapse" id="custom-collapse">
				<ul class="nav navbar-nav navbar-right">
					<li><a href="index.jsp">Home</a></li>
					<li><a href="buttons.html">팀 소개</a></li>
					<li class="dropdown"><a class="dropdown-toggle" href="#"
						data-toggle="dropdown">도서추천</a>
						<ul class="dropdown-menu">
							<li><a
								href="${pageContext.request.contextPath}/book/bestseller.do">베스트
									셀러</a></li>
							<li><a href="#">작가별 추천</a></li>
							<li><a href="#">장르별 추천</a></li>
							<li><a href="#">맞춤 추천</a></li>
						</ul></li>
					<li class="dropdown"><a class="dropdown-toggle" href="#"
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
								href="${pageContext.request.contextPath}/book/booksearch.do">책 검색</a></li>


						</ul></li>
					<li class="dropdown"><a class="dropdown-toggle" href="#"
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
					<li class="dropdown"><a class="dropdown-toggle" href="#"
						data-toggle="dropdown">고객센터</a>
						<ul class="dropdown-menu">
							<li><a href="buttons.html">공지사항</a>
							<li><a href="buttons.html">FAQ</a>
							<li><a href="buttons.html">Email상담</a>
						</ul></li>
					<c:choose>
						<c:when test="${userInfo==null}">
							<li><a
								href="${pageContext.request.contextPath}/login/show.do">Login</a></li>
						</c:when>
						<c:otherwise>
							<li><a
								href="${pageContext.request.contextPath}/loing/logout.do">로그아웃</a></li>
							<li><a
								href="${pageContext.request.contextPath}/mypage/mypage.do">마이페이지</a></li>
						</c:otherwise>
					</c:choose>
				</ul>
			</div>
		</div>
	</nav>

	<div class="main">
		<section class="module bg-dark-30"
			data-background="${pageContext.request.contextPath}/assets/images/01.jpg">
			<div class="container">
				<div class="row" style="width: 70%;">
					<div class="col-sm-6 col-sm-offset-3" style="width: 70%;">
						<h1 class="module-title font-alt mb-0">Book Detail</h1>
					</div>
				</div>
			</div>
		</section>

		<section class="module">
			<div class="container">

				<div class="row multi-columns-row">
					<div class="col-sm-6 col-md-6 col-lg-6"
						style="width: 100%; float: none;">
						<div class="price-table font-alt">

							<h4>책 자세히 보기</h4>
							<div class="borderline"></div>
							<p class="price">
								<img src="${output.cover}"
									style="width: 30%; max-width: 40%; margin-top: 15px; margin-bottom: 15px;">
							</p>
							<ul class="price-details">

								<table class="table table hover">
									<colgroup>
										<col style="width: 15%;">
										<col style="width: 85%;">
									</colgroup>
									<tr>
										<td>제목</td>
										<td>${output.title}</td>

									</tr>
									<tr>
										<td>저자</td>
										<td>${output.author}</td>

									</tr>

									<tr>
										<td>출판사</td>
										<td>${output.publisher}</td>
									</tr>


									<tr>
										<td>평점</td>
										<td>
											<!-- 여기가 평점 별  --> <c:choose>
												<c:when test="${customerReviewRank == 0}">
													<c:forEach var="j" begin="1" end="5" varStatus="status">
														<i class="fa fa-star-o fa-2x"></i>
														<c:set var="j" value="${j+1}" />
													</c:forEach>
												</c:when>

												<c:when test="${customerReviewRank != 0}">
													<c:forEach var="i" begin="1"
														end="${(customerReviewRank-2)/2}" varStatus="status">
														<i class="fa fa-star fa-2x"></i>
														<c:set var="i" value="${i+1}" />
													</c:forEach>

												</c:when>
											</c:choose> <c:choose>
												<c:when
													test="${(customerReviewRank % 2 == 0) && customerReviewRank!=0}">

													<i class="fa fa-star fa-2x"></i>
												</c:when>
												<c:when
													test="${(customerReviewRank % 2 != 0) && customerReviewRank!=0}">
													<i class="fa fa-star fa-2x"></i>
													<i class="fa fa-star-half fa-2x"></i>
												</c:when>

											</c:choose> (${customerReviewRank})

											<div class="popup" onmouseover="m_over()">
												<form name="form">
											<input type="hidden" name="isbn" value="${isbn}">
												<!-- 로그인 안 한 상태면 팝업 안 열고 로그인 페이지로 이동시키기 -->
												
													<c:choose>
														<c:when test="${userInfo==null}">
															<a href="${pageContext.request.contextPath}/login/show.do">
															<input type="button" class="btn btn-g btn-round btn-xs"
																value="평점등록" onclick="alert('로그인 후 이용하세요');" /></a>
															<span class="popuptext" id="myPopup">평점을 등록해보세요! </span>
														
														</c:when>
														<c:when test="${cnt==0 && userInfo!=null}">

															<input type="button" class="btn btn-g btn-round btn-xs"
																value="평점등록" onclick="javascript:showPopup(this.form);" />
															<span class="popuptext" id="myPopup">평점을 등록해보세요! </span>

														</c:when>

														<c:when test="${cnt>0 && userInfo!=null}}">

															<input type="button" class="btn btn-g btn-round btn-xs"
																value="평점 재등록"
																onclick="javascript:showPopup(this.form);" />
															<span class="popuptext2" id="myPopup">평점을 수정할 수
																있습니다! </span>
															

														</c:when>
													</c:choose>
												</form>
											</div>
										</td>
									</tr>

									<tr>
										<td>판매가</td>
										<td>${output.priceSales}</td>
									</tr>


									<tr>
										<td>정가</td>
										<td>${output.priceStandard}</td>
									</tr>
									<tr>
										<td>ISBN</td>
										<td>${output.isbn}</td>
									</tr>


									<tr>
										<td>분류</td>
										<td>${output.categoryName}</td>
									</tr>
									<tr>
										<td>책 소개</td>
										<td>${output.description}</td>
									</tr>
								</table>
							</ul>
							<!-- 관심책 등록 버튼 -->
							<c:choose>
								<c:when test="${totalCountbI>0}">
									<form class="form" method="post"
										action="${pageContext.request.contextPath}/book/bi_delete.do">

										<input type="hidden" name="isbn" value="${output.isbn}">
										<input type="submit" class="btn btn-g btn-round"
											value="관심책 취소">
									</form>

								</c:when>


								<c:when test="${totalCountbI==0}">
									<form class="form" method="post"
										action="${pageContext.request.contextPath}/book/bi_insert.do">
										<input type="hidden" name="isbn" value="${output.isbn}">
										<input type="submit" class="btn btn-g btn-round"
											value="관심책 등록">
									</form>
								</c:when>
							</c:choose>

							<!-- 읽은책 등록 버튼 -->

							<c:choose>
								<c:when test="${totalCountbR>0}">
									<form class="form" method="post"
										action="${pageContext.request.contextPath}/book/br_delete.do">
										<input type="hidden" name="isbn" value="${output.isbn}">
										<input type="submit" class="btn btn-d btn-round"
											value="읽은책 취소">
									</form>

								</c:when>


								<c:when test="${totalCountbR==0}">
									<form class="form" method="post"
										action="${pageContext.request.contextPath}/book/br_insert.do">
										<input type="hidden" name="isbn" value="${output.isbn}">
										<input type="submit" class="btn btn-d btn-round"
											value="읽은책 등록">
									</form>
								</c:when>
							</c:choose>



						</div>
					</div>
				</div>
			</div>
		</section>
		<div class="module-small bg-dark">
			<div class="container">
				<div class="row">
					<div class="col-sm-3">
						<div class="widget">
							<h5 class="widget-title font-alt">About Titan</h5>
							<p>The languages only differ in their grammar, their
								pronunciation and their most common words.</p>
							<p>Phone: +1 234 567 89 10</p>
							Fax: +1 234 567 89 10
							<p>
								Email:<a href="#">somecompany@example.com</a>
							</p>
						</div>
					</div>
					<div class="col-sm-3">
						<div class="widget">
							<h5 class="widget-title font-alt">Recent Comments</h5>
							<ul class="icon-list">
								<li>Maria on <a href="#">Designer Desk Essentials</a></li>
								<li>John on <a href="#">Realistic Business Card Mockup</a></li>
								<li>Andy on <a href="#">Eco bag Mockup</a></li>
								<li>Jack on <a href="#">Bottle Mockup</a></li>
								<li>Mark on <a href="#">Our trip to the Alps</a></li>
							</ul>
						</div>
					</div>
					<div class="col-sm-3">
						<div class="widget">
							<h5 class="widget-title font-alt">Blog Categories</h5>
							<ul class="icon-list">
								<li><a href="#">Photography - 7</a></li>
								<li><a href="#">Web Design - 3</a></li>
								<li><a href="#">Illustration - 12</a></li>
								<li><a href="#">Marketing - 1</a></li>
								<li><a href="#">Wordpress - 16</a></li>
							</ul>
						</div>
					</div>
					<div class="col-sm-3">
						<div class="widget">
							<h5 class="widget-title font-alt">Popular Posts</h5>
							<ul class="widget-posts">
								<li class="clearfix">
									<div class="widget-posts-image">
										<a href="#"><img
											src="${pageContext.request.contextPath}/assets/images/rp-1.jpg"
											alt="Post Thumbnail" /></a>
									</div>
									<div class="widget-posts-body">
										<div class="widget-posts-title">
											<a href="#">Designer Desk Essentials</a>
										</div>
										<div class="widget-posts-meta">23 january</div>
									</div>
								</li>
								<li class="clearfix">
									<div class="widget-posts-image">
										<a href="#"><img
											src="${pageContext.request.contextPath}/assets/images/rp-2.jpg"
											alt="Post Thumbnail" /></a>
									</div>
									<div class="widget-posts-body">
										<div class="widget-posts-title">
											<a href="#">Realistic Business Card Mockup</a>
										</div>
										<div class="widget-posts-meta">15 February</div>
									</div>
								</li>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</div>
		<hr class="divider-d">
		<footer class="footer bg-dark">
			<div class="container">
				<div class="row">
					<div class="col-sm-6">
						<p class="copyright font-alt">
							&copy; 2017&nbsp;<a href="index.html">TitaN</a>, All Rights
							Reserved
						</p>
					</div>
					<div class="col-sm-6">
						<div class="footer-social-links">
							<a href="#"><i class="fa fa-facebook"></i></a><a href="#"><i
								class="fa fa-twitter"></i></a><a href="#"><i
								class="fa fa-dribbble"></i></a><a href="#"><i
								class="fa fa-skype"></i></a>
						</div>
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


