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

		<title>Write Post | pocketLib</title>

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
<link href="${pageContext.request.contextPath}/assets/lib/owl.carousel/dist/assets/owl.carousel.min.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath}/assets/lib/owl.carousel/dist/assets/owl.theme.default.min.css"
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
					<li><a href="${pageContext.request.contextPath}/">팀 소개</a></li>
					<li class="dropdown"><a class="dropdown-toggle" href="${pageContext.request.contextPath}/book/bestseller.do"
						data-toggle="dropdown">도서추천</a>
						<ul class="dropdown-menu">
							<li><a
								href="${pageContext.request.contextPath}/book/bestseller.do">베스트셀러</a></li>
							<li><a
								href="${pageContext.request.contextPath}/book/item_new_special.do">화제의
									신간도서</a></li>
							<li><a href="${pageContext.request.contextPath}/recommend/pocketlibrecommend.do">맞춤 추천</a></li>
						</ul></li>
					<li class="dropdown"><a class="dropdown-toggle" href="${pageContext.request.contextPath}/book/mybookshelf.do"
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
								href="${pageContext.request.contextPath}/board/board_list.do?boardCate=3">Q&A
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
	<div class="main">
		<section class="module-small">
			<div class="container">
			<c:choose>
			
			<c:when test="${boardCate==1}">
				<h1>자유게시판 글쓰기</h1>
				<hr />
				<form class="row" method="post"
					action="${pageContext.request.contextPath}/board/board_add_ok.do">
					<label for="post-title" class="col-sm-1 control-label">제목</label>
					<div class="col-sm-8" style="display: table;">
						<input type="hidden" id="boardCate" name="boardCate" value="${boardCate}">
						<input class="form-control" type="text" name="title" id="title" />
					</div>
					<br>
					<div class="form-group" style="margin-top: 30px">
						<textarea name="content" class="ckeditor" name="content"
							id="content"></textarea>
						<hr />
						<script src="//cdn.ckeditor.com/4.12.1/basic/ckeditor.js"></script>
					</div>
			
			<div class="border_button">
				<div class="border_button text-center mt20">
					<p class="btn-list">
						<button class="btn btn-success btn-round btn-xs" type="submit">작성완료</button>
						<a href="${pageContext.request.contextPath}/board/board_list.do?boardCate=${boardCate}"><button
								class="btn btn-g btn-round btn-xs" type="button">취소</button></a>
					</p>
				</div>
			</div>
			</form>
			</c:when>
			<c:when test="${boardCate==2}">
				<h1>책 후기 게시판 글쓰기</h1>
				<hr />
				<form class="row" method="post"
					action="${pageContext.request.contextPath}/board/board_add_ok.do">
					<label for="post-title" class="col-sm-1 control-label">제목</label>
					<div class="col-sm-8" style="display: table;">
						<input type="hidden" id="boardCate" name="boardCate" value="${boardCate}">
						<input class="form-control" type="text" name="title" id="title" />
					</div>
					<br>
					<div class="form-group" style="margin-top: 30px">
						<textarea name="content" class="ckeditor" name="content"
							id="content"></textarea>
						<hr />
						<script src="//cdn.ckeditor.com/4.12.1/basic/ckeditor.js"></script>
					</div>
			
			<div class="border_button">
				<div class="border_button text-center mt20">
					<p class="btn-list">
						<button class="btn btn-success btn-round btn-xs" type="submit">작성완료</button>
						<a href="${pageContext.request.contextPath}/board/board_list.do?boardCate=${boardCate}"><button
								class="btn btn-g btn-round btn-xs" type="button">취소</button></a>
					</p>
				</div>
			</div>
			</form>
			</c:when>
			<c:otherwise>
				<h1>Q&A게시판 글쓰기</h1>
				<hr />
				<form class="row" method="post"
					action="${pageContext.request.contextPath}/board/board_add_ok.do">
					<label for="post-title" class="col-sm-1 control-label">제목</label>
					<div class="col-sm-8" style="display: table;">
						<input type="hidden" id="boardCate" name="boardCate" value="${boardCate}">
						<input class="form-control" type="text" name="title" id="title" />
					</div>
					<br>
					<div class="form-group" style="margin-top: 30px">
						<textarea name="content" class="ckeditor" name="content"
							id="content"></textarea>
						<hr />
						<script src="//cdn.ckeditor.com/4.12.1/basic/ckeditor.js"></script>
					</div>
			
			<div class="border_button">
				<div class="border_button text-center mt20">
					<p class="btn-list">
						<button class="btn btn-success btn-round btn-xs" type="submit">작성완료</button>
						<a href="${pageContext.request.contextPath}/board/board_list.do?boardCate=${boardCate}"><button
								class="btn btn-g btn-round btn-xs" type="button">취소</button></a>
					</p>
				</div>
			</div>
			</form>
			</c:otherwise>
			</c:choose>
		</div>
	</section>
	</div>

	<div class="module-extra-small bg-dark">
			<div class="container">
				<div class="row">
					<div class="col-sm-9">
						<div>
							<a href="${pageContext.request.contextPath}" class="font-alt"
								style="font-size: 14px; padding-right: 10px;">About
								pocketLib</a> <a href="${pageContext.request.contextPath}"
								class="font-alt" style="font-size: 14px; padding-right: 10px;">이용약관</a>


							<a href="${pageContext.request.contextPath}" class="font-alt"
								style="font-size: 14px; padding-right: 10px;">개인정보취급방침</a> <a
								href="${pageContext.request.contextPath}/board/FAQ.do"
								class="font-alt" style="font-size: 14px; padding-right: 10px;">고객센터</a>


							<a href="https://github.com/utaek/pocketlib" target="_blank"
								class="font-alt" style="font-size: 14px; padding-right: 10px;">Github</a>

						</div>
						<hr style="margin: 8px 0;" />

						<div class="widget-title font-alt">
							<p>
								<span style="padding-right: 10px;"> <Strong
									style="font-size: 12px;">팀명</Strong>: pocketLib
								</span> <span style="padding-right: 10px;"> <Strong
									style="font-size: 12px;">Email</Strong>: oooo@ooooo.com
								</span>
							</p>

						</div>
						<hr class="divider-d">
						<div class="font-alt">
							<span class=""> pocketLib은 BootStrap 기반 오픈소스와 Spring
								Framework로 만들어졌습니다.<br /> 자세한 내용은 <a
								href="https://github.com/utaek/pocketlib" target="_blank">Github</a>에서
								확인 하실 수 있습니다.
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
								&copy; 2019&nbsp;<a href="${pageContext.request.contextPath}">pocektLib</a>,
								All Rights Reserved
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
	<script src="../assets/lib/jquery/dist/jquery.js"></script>
	<script src="../assets/lib/bootstrap/dist/js/bootstrap.min.js"></script>
	<script src="../assets/lib/wow/dist/wow.js"></script>
	<script
		src="../assets/lib/jquery.mb.ytplayer/dist/jquery.mb.YTPlayer.js"></script>
	<script src="../assets/lib/isotope/dist/isotope.pkgd.js"></script>
	<script src="../assets/lib/imagesloaded/imagesloaded.pkgd.js"></script>
	<script src="../assets/lib/flexslider/jquery.flexslider.js"></script>
	<script src="../assets/lib/owl.carousel/dist/owl.carousel.min.js"></script>
	<script src="../assets/lib/smoothscroll.js"></script>
	<script
		src="../assets/lib/magnific-popup/dist/jquery.magnific-popup.js"></script>
	<script
		src="../assets/lib/simple-text-rotator/jquery.simple-text-rotator.min.js"></script>
	<script src="../assets/js/plugins.js"></script>
	<script src="../assets/js/main.js"></script>
</body>
</html>