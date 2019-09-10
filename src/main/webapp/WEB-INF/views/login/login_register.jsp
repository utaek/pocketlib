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
<link href="${pageContext.request.contextPath}/assets/lib/bootstrap/dist/css/bootstrap.min.css"
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
<link href="${pageContext.request.contextPath}/assets/lib/animate.css/animate.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/assets/lib/components-font-awesome/css/font-awesome.min.css"
	rel="stylesheet">
<link href="${pageContext.request.contextPath}/assets/lib/et-line-font/et-line-font.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/assets/lib/flexslider/flexslider.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/assets/lib/owl.carousel/dist/${pageContext.request.contextPath}/assets/owl.carousel.min.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath}/assets/lib/owl.carousel/dist/${pageContext.request.contextPath}/assets/owl.theme.default.min.css"
	rel="stylesheet">
<link href="${pageContext.request.contextPath}/assets/lib/magnific-popup/dist/magnific-popup.css"
	rel="stylesheet">
<link href="${pageContext.request.contextPath}/assets/lib/simple-text-rotator/simpletextrotator.css"
	rel="stylesheet">
<!-- Main stylesheet and color file-->
<link href="${pageContext.request.contextPath}/assets/css/style.css" rel="stylesheet">
<link id="color-scheme" href="${pageContext.request.contextPath}/assets/css/colors/default.css"
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
					<li><a href="buttons.html">팀 소개</a></li>
					<li class="dropdown"><a class="dropdown-toggle" href="#"
						data-toggle="dropdown">도서추천</a>
						<ul class="dropdown-menu">
							<li><a href="#">베스트 셀러</a></li>
							<li><a href="#">작가별 추천</a></li>
							<li><a href="#">장르별 추천</a></li>
							<li><a href="#">맞춤 추천</a></li>
						</ul></li>
					<li class="dropdown"><a class="dropdown-toggle" href="#"
						data-toggle="dropdown">독서관리</a>
						<ul class="dropdown-menu">
							<li><a href="#">내 책장</a></li>
							<li><a href="#">???????</a></li>
						</ul></li>
					<li class="dropdown"><a class="dropdown-toggle"
						href="${pageContext.request.contextPath}/board/board_list.do" data-toggle="dropdown">커뮤니티</a>
						<ul class="dropdown-menu">
							<li><a href="${pageContext.request.contextPath}/board/board_list.do?boardCate=1">자유게시판</a></li>
							<li><a href="${pageContext.request.contextPath}/board/board_list.do?boardCate=2">책 후기
									게시판</a></li>
							<li><a href="${pageContext.request.contextPath}/board/board_list.do?boardCate=3">QNA
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
	<div class="main">
		<section class="module bg-dark-30"
			data-background="${pageContext.request.contextPath}/assets/images/01.jpg">
			<div class="container">
				<div class="row">
					<div class="col-sm-6 col-sm-offset-3">
						<h1 class="module-title font-alt mb-0">Login-Register</h1>
					</div>
				</div>
			</div>
		</section>
		<section class="module">
			<div class="container">
				<div class="row">
					<div class="col-sm-5 col-sm-offset-1 mb-sm-40">
						<h4 class="font-alt">Login</h4>
						<hr class="divider-w mb-10">
						<form class="form" name="form" method="post" action="${pageContext.request.contextPath}/login/login.do">
							<div class="form-group">
								<input class="form-control" id="userId" type="text"
									name="userId" placeholder="UserID" />
							</div>
							<div class="form-group">
								<input class="form-control" id="password" type="password"
									name="password" placeholder="Password" />
							</div>
							<div class="form-group">
								<input class="btn btn-b btn-round" type="submit" value="Login" />
							</div>
						</form>
					</div>
					<div class="col-sm-5">
						<h4 class="font-alt">Register</h4>
						<hr class="divider-w mb-10">
						<form class="form" action="${pageContext.request.contextPath}/login/registerShow.do">
							<div class="form-group">
								<button class="btn btn-block btn-round btn-b" type="submit">Register</button>
							</div>
						</form>
						<h4 class="font-alt">Forgot Password?</h4>
						<hr class="divider-w mb-10">
						<form class="form" action="${pageContext.request.contextPath}/login/findPassword.do">
							<div class="form-group">
								<button class="btn btn-block btn-round btn-b" type="submit">Find Password</button>
							</div>
						</form>
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
										<a href="#"><img src="${pageContext.request.contextPath}/assets/images/rp-1.jpg"
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
										<a href="#"><img src="${pageContext.request.contextPath}/assets/images/rp-2.jpg"
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
	</div>
	<div class="scroll-up">
		<a href="#totop"><i class="fa fa-angle-double-up"></i></a>
	</div>
	</main>
	<!--  
    JavaScripts
    =============================================
    -->
	<script src="${pageContext.request.contextPath}/assets/lib/jquery/dist/jquery.js"></script>
	<script src="${pageContext.request.contextPath}/assets/lib/bootstrap/dist/js/bootstrap.min.js"></script>
	<script src="${pageContext.request.contextPath}/assets/lib/wow/dist/wow.js"></script>
	<script src="${pageContext.request.contextPath}/assets/lib/jquery.mb.ytplayer/dist/jquery.mb.YTPlayer.js"></script>
	<script src="${pageContext.request.contextPath}/assets/lib/isotope/dist/isotope.pkgd.js"></script>
	<script src="${pageContext.request.contextPath}/assets/lib/imagesloaded/imagesloaded.pkgd.js"></script>
	<script src="${pageContext.request.contextPath}/assets/lib/flexslider/jquery.flexslider.js"></script>
	<script src="${pageContext.request.contextPath}/assets/lib/owl.carousel/dist/owl.carousel.min.js"></script>
	<script src="${pageContext.request.contextPath}/assets/lib/smoothscroll.js"></script>
	<script src="${pageContext.request.contextPath}/assets/lib/magnific-popup/dist/jquery.magnific-popup.js"></script>
	<script
		src="${pageContext.request.contextPath}/assets/lib/simple-text-rotator/jquery.simple-text-rotator.min.js"></script>
	<script src="${pageContext.request.contextPath}/assets/js/plugins.js"></script>
	<script src="${pageContext.request.contextPath}/assets/js/main.js"></script>
</body>
</html>