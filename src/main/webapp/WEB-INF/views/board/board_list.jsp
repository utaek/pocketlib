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
							<li><a
								href="${pageContext.request.contextPath}/book/bestseller.do">베스트
									셀러</a></li>
									<li><a href="${pageContext.request.contextPath}/book/item_new_special.do">화제의 신간도서</a></li>
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
								href="${pageContext.request.contextPath}/book/booksearch.do">책
									검색</a></li>
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
		<section class="module-small">
			<div class="container">
			<c:choose>
				<c:when test="${boardCate==1}">
					<h1>자유게시판</h1>
				</c:when>
				<c:when test="${boardCate==2}">
					<h1>책 후기게시판</h1>
				</c:when>
				<c:otherwise>
					<h1>QNA게시판</h1>
				</c:otherwise>
			</c:choose>
				<hr />
				<form class="row">
					<form method="get" action="${pageContext.request.contextPath}/board/board_list.do">
						<div class="col-sm-2 mb-sm-20">
							<select class="form-control" id="sortCate" name="sortCate" onchange="location.href='${pageContext.request.contextPath}/board/board_list.do?${boardCate}&searchList=${keywordOption}&keyword=${keyword}&sortCate='+ this.value;">
								<option value="order">정렬하기</option>
								<option value="reg_date" <c:if test="${sortCate != null and sortCate == 'reg_date'}"> selected </c:if>>날짜순</option>
								<option value="hits" <c:if test="${sortCate != null and sortCate == 'hits'}"> selected </c:if>>조회순</option>
								
							</select>
						</div>
						<div class="col-sm-4 mb-sm-20 pull-right">
							<input type="hidden" id="boardCate" name="boardCate" value="${boardCate}"/>
							<input class="form-control" type="text" name="keyword"
								 id="keyword" style="text-transform: none;"
								placeholder="Search..." value="${keyword}" />
							
							<button class="search-btn" type="submit">
								<i class="fa fa-search"></i>
							</button>
						</div>
						<div class="col-sm-2 mb-sm-19 pull-right">
							<select class="form-control" id="searchList" name="searchList">
							
								<option value="title_content" <c:if test="${keywordOption != null and keywordOption == 'title_content'}"> selected </c:if>>제목+내용</option>
								<option value="title" <c:if test="${keywordOption != null and keywordOption == 'title'}"> selected </c:if>>제목</option>
								<option value="userId" <c:if test="${keywordOption != null and keywordOption == 'userId'}"> selected </c:if>>글쓴이</option>
							</select>
						</div>
					</form>
				</form>
				<hr style="border: solid 1px black;" />
				<table class="table table-hover">
					<thead>
						<tr>
							<th>번호</th>
							<th>제목</th>
							<th>글쓴이</th>
							<th>날짜</th>
							<th>조회수</th>
						</tr>
					</thead>
					<tbody>
						<c:choose>
							<c:when test="${output.size() == 0}">
								<tr>
									<td colspan="3" align="center">조회결과가 없습니다</td>
								</tr>
							</c:when>
							<c:otherwise>
								<c:forEach var="item" items="${output}" varStatus="status">
									<c:set var="boardno" value="${item.boardNo}"/>
									<c:set var="title" value="${item.title}"/>
									<c:set var="content" value="${item.content}"/>
									<c:set var="userid" value="${item.userId}"/>
									<c:set var="reg_date" value="${item.reg_date}"/>
									<c:set var="hits" value="${item.hits}"/>
									
									<c:if test="${keyword!=''}">
										<c:set var="mark" value="<mark>${keyword}</mark>"/>
										<c:set var="title" value="${fn:replace(title,keyword,mark)}"/>
										<c:set var="content" value="${fn:replace(content,keyword,mark)}"/>
										<c:set var="userid" value="${fn:replace(userid,keyword,mark)}"/>
									</c:if>
								
							
						<tr>
							<td><span class="label label-primary">${boardOrder}</span></td>
							<td style="text-overflow: ellipsis;">
							<a href="${pageContext.request.contextPath}/board/board_view.do?boardCate=${boardCate}&boardNo=${boardno}&searchList=${keywordOption }&keyword=${keyword }&sortCate=${sortCate}">${title}</a></td>	
							<td>${userid}</td>
							<td>${reg_date}</td>
							<td>${hits}</td>
						</tr>
							<c:set var="boardOrder" value="${boardOrder-1}"/>
						</c:forEach>
						</c:otherwise>
						</c:choose>
					</tbody>
				</table>
				<div class="border_button">
					<div class="pull-left mr10">
						<p class="btn-list">
							<a href="${pageContext.request.contextPath}/board/board_list.do?boardCate=${boardCate}"><button
									class="btn btn-g btn-round btn-xs" type="submit">목록</button></a>
						</p>
					</div>
					<div class="pull-right">
						<p class="btn-list">					
							<c:choose>
								<c:when test="${userInfo != null}">
									<a href="${pageContext.request.contextPath}/board/board_add.do?boardCate=${boardCate}">
										<button class="btn btn-success btn-round btn-xs" type="submit">글쓰기</button>
									</a>
								</c:when>
								<c:otherwise>
									<a href="${pageContext.request.contextPath}/login/show.do">
										<button class="btn btn-success btn-round btn-xs" onclick="if(alert('비회원은 글쓰기가 불가능합니다. 로그인 해주세요.'));"
									type="submit">글쓰기</button></a>
								</c:otherwise>
							</c:choose>
						</p>
					</div>
				</div>
				<div class="row" style="text-align: center;">
					<div class="col-sm-12">
						<div class="pagination font-alt">
								<c:choose>
								<c:when test="${pageData.prevPage > 0}">
									<c:url value="/board/board_list.do" var="prevPageUrl">
										<c:param name="boardCate" value="${boardCate}" />
										<c:param name="page" value="${pageData.prevPage}" />
										<c:param name="keyword" value="${keyword}" />
										<c:param name="searchList" value="${keywordOption}" />
										<c:param name="sortCate" value="${sortCate}" />
									</c:url>
									<i class='fa fa-angle-right'></i>
								</c:when> 
								<c:otherwise>
									<i class="fa fa-angle-left"></i>
								</c:otherwise>
								</c:choose>
							<c:forEach var="i" begin="${pageData.startPage}" end="${pageData.endPage}" varStatus="status">
								<c:url value="/board/board_list.do" var="pageUrl"> 
									<c:param name="boardCate" value="${boardCate}" />
									<c:param name="page" value="${i}" />
									<c:param name="keyword" value="${keyword}" />
									<c:param name="searchList" value="${keywordOption}" />
									<c:param name="sortCate" value="${sortCate}" />
								</c:url>
								<c:choose>
									<c:when test="${pageData.nowPage == i}">
										<a class='active'><strong>${i}</strong></a>
									</c:when>
									<c:otherwise>
										<a href = "${pageUrl}">${i}</a>
									</c:otherwise>
								</c:choose>
							</c:forEach>
							
							<c:choose>
								<c:when test="${pageData.nextPage > 0}">
									<c:url value="/board/board_list.do" var="nextPageUrl"> 
										<c:param name="boardCate" value="${boardCate}" />
										<c:param name="page" value="${pageData.nextPage}" />
										<c:param name="keyword" value="${keyword}" />
										<c:param name="searchList" value="${keywordOption}" />
										<c:param name="sortCate" value="${sortCate}" />
									</c:url>
									<a href = "${nextPageUrl}"><i class='fa fa-angle-right'></i></a>
								</c:when>
								<c:otherwise>
									<i class='fa fa-angle-right'></i>
								</c:otherwise>
							</c:choose>
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
									<a href="#"><img src="../assets/images/rp-1.jpg"
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
									<a href="#"><img src="../assets/images/rp-2.jpg"
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
					Shared by <i class="fa fa-love"></i><a
						href="https://bootstrapthemes.co">BootstrapThemes</a>
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
	</div>
	<div class="scroll-up">
		<a href="#totop"><i class="fa fa-angle-double-up"></i></a>
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