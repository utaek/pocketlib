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
					<li class="dropdown"><a class="dropdown-toggle" href="#"
						data-toggle="dropdown">도서추천</a>
						<ul class="dropdown-menu">
							<li><a href="${pageContext.request.contextPath}/book/bestseller.do">베스트셀러</a></li>
							<li><a href="${pageContext.request.contextPath}/book/item_new_special.do">화제의 신간도서</a></li>
							<li><a href="#">맞춤 추천</a></li>
						</ul></li>
					<li class="dropdown"><a class="dropdown-toggle" href="#"
						data-toggle="dropdown">독서관리</a>
						<ul class="dropdown-menu">
							<c:choose>
								<c:when test="${userInfo!=null}">
									<li><a href="${pageContext.request.contextPath}/book/mybookshelf.do">내 책장</a></li>
								</c:when>
								<c:otherwise>
									<li><a href="${pageContext.request.contextPath}/login/show.do">내 책장</a></li>

								</c:otherwise>
							</c:choose>
							<li><a href="${pageContext.request.contextPath}/book/booksearch.do">책 검색</a></li>
						</ul></li>
					<li class="dropdown"><a class="dropdown-toggle"
						href="${pageContext.request.contextPath}/board/board_list.do"
						data-toggle="dropdown">커뮤니티</a>
						<ul class="dropdown-menu">
							<li><a href="${pageContext.request.contextPath}/board/board_list.do?boardCate=1">자유게시판</a></li>
							<li><a href="${pageContext.request.contextPath}/board/board_list.do?boardCate=2">책 후기 게시판</a></li>
							<li><a href="${pageContext.request.contextPath}/board/board_list.do?boardCate=3">QNA 게시판</a></li>
						</ul></li>
					<li><a href="${pageContext.request.contextPath}/board/FAQ.do">FAQ</a></li>

					<c:choose>
						<c:when test="${userInfo==null}">
							<li><a href="${pageContext.request.contextPath}/login/show.do">로그인</a></li>
						</c:when>
						<c:otherwise>
							<li><a href="${pageContext.request.contextPath}/login/logout.do">로그아웃</a></li>
							<li><a href="${pageContext.request.contextPath}/login/mypage.do">마이페이지</a></li>
						</c:otherwise>
					</c:choose>

				</ul>
			</div>
		</div>
	</nav>


	<!-- 여기부터 -->


	<div class="main showcase-page">
		<section class="module-medium" id="demos">
			<div class="container">
				<div class="row">
					<div class="row mb-60">
						<div class="col-sm-8 col-sm-offset-2" style="margin-left: 5%; width: 100%;">
						
						<div style="float: right;">
									<a href="${pageContext.request.contextPath}/book/booksearch.do">
										<button type="button" class="btn btn-g btn-round ">

											<span class="icon-notebook"></span> 책 추가하기
										</button>
									</a>
								</div>
					
						</div>
						<div class="col-sm-8 col-sm-offset-2"
							style="margin-left: 5%; width: 100%;">
							<h4 class="font-alt mb-0">My bookshelf</h4>
							<hr class="divider-w mt-10 mb-20">
							<div role="tabpanel">
								<ul class="nav nav-tabs font-alt" role="tablist">
									<li class="active"><a href="#support" data-toggle="tab"
										aria-expanded="true"> <span class="icon-book-open"></span>읽은
											책
									</a></li>
									<li><a href="#sales" data-toggle="tab"
										aria-expanded="false"> <span class="icon-notebook"></span>관심책
									</a></li>
								</ul>

								<div class="tab-content">
									<div class="tab-pane active" id="support">
										<!-- 읽은 책list  -->
										<div class="main">
											<section class="module-medium" id="demos">
												<div class="container">
													<div class="row multi-columns-row">

														<c:if test="${BR!=null}">

															<table>
																<c:forEach var="item" items="${BR}" varStatus="status">

																	<c:if test="${(status.index)%4 == 0}">
																		<tr>
																	</c:if>
																	<td style="width: 25%; min-width: 20%;">

																		<div class="col-md-12 col-sm-6 col-xs-12">
																			<a class="content-box"
																				href="${pageContext.request.contextPath}/book/book_detail.do?isbn=${item.isbn}">
																				<div class="content-box-image"
																					style="height: 300px; vertical-align: middle;">
																					<img src="${item.cover}"
																						style="height: 200px; margin-top: 20px">
																					<h4 class="content-box-title font-serif">${item.title}
																					</h4>
																				</div>

																			</a>
																		</div>
																	</td>
																	<c:if test="${(status.index+1)%4==0}">
																		</tr>
																	</c:if>

																</c:forEach>

															</table>
														</c:if>
													</div>
												</div>
											</section>
										</div>
									</div>

									<div class="tab-pane" id="sales">
										<!-- 관심 책list  -->
										<div class="main">
											<section class="module-medium" id="demos">
												<div class="container">
													<div class="row multi-columns-row">




														<c:if test="${BI!=null}">

															<table>
																<c:forEach var="item" items="${BI}" varStatus="status">

																	<c:if test="${(status.index)%4 == 0}">
																		<tr>
																	</c:if>
																	<td style="width: 25%; min-width: 20%;">

																		<div class="col-md-12 col-sm-6 col-xs-12">
																			<a class="content-box"
																				href="${pageContext.request.contextPath}/book/book_detail.do?isbn=${item.isbn}">
																				<div class="content-box-image"
																					style="height: 300px; vertical-align: middle;">
																					<img src="${item.cover}"
																						style="height: 200px; margin-top: 20px">
																					<h4 class="content-box-title font-serif">${item.title}
																					</h4>
																				</div>

																			</a>
																		</div>
																	</td>
																	<c:if test="${(status.index+1)%4==0}">
																		</tr>
																	</c:if>

																</c:forEach>

															</table>
														</c:if>
													</div>
												</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</section>
	</div>



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
							class="fa fa-dribbble"></i></a><a href="#"><i class="fa fa-skype"></i></a>
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
