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
		<section class="module-small">
			<div class="container">
				<h3>${output.title}</h3>
				<hr />
				<div class="col-sm-15 mb-sm-1">
					<form class="row">

						<div class="col-sm-1 mb-sm-3">
							${output.userId }
						</div>
						<div class="col-sm-1 mb-sm-2">
							<i class="fa fa-comment">${output.hits }</i>
						</div>
						<div class="col-sm-1 mb-sm-2">
							<i class="fa fa-eye">${output.hits }</i>
						</div>
						<div class="col-sm-1 mb-sm-2">
							<i class="fa fa-thumbs-up">${output.love }</i>
						</div>
						<i class="fa fa-thumbs-down">${output.hate }</i>

						<div class="col-sm-2.5 mb-sm-10 pull-right">
							<i class="pull-right time">${output.reg_date }</i>
						</div>

					</form>
				</div>
				<div class="contents-view">
					<div class="post-content">
						${output.content}
					</div>
				</div>
				<div class="recommend"
					style="margin-top: 20px; margin-bottom: 20px; text-align: center;">
					<a href="${pageContext.request.contextPath}/board/love_hate_ok.do?boardCate=${boardCate}&boardNo=${boardno}&type=0"><button class="btn btn-border-d btn-circle" id="like" title="추천하기" >
						<span class="post-like">${output.love}</span><br /> <i
							class="fa fa-thumbs-o-up fa-lg"></i>
					</button></a>
					<a href="${pageContext.request.contextPath}/board/love_hate_ok.do?boardCate=${boardCate}&boardNo=${boardno}&type=1"><button class="btn btn-border-d btn-circle" id="dislike"
						title="비추하기">
						<span class="post-dislike">${output.hate}</span> <br /> <i
							class="fa fa-thumbs-o-down fa-lg"></i>
					</button></a>
				</div>
				<div class="border_button">
					<div class="pull-left mr10">
						<p class="btn-list">
							
							<c:if test="${totalCount > 0}">
								<c:if test="${userInfo.getUserno() == output.userNo}">
							<a href="${pageContext.request.contextPath}/board/board_edit.do?boardCate=${boardCate}&boardNo=${boardno}">
							<button	class="btn btn-g btn-round btn-xs" type="submit">수정</button></a>
							<button class="btn btn-g btn-round btn-xs"
								onclick="if(confirm('한번 삭제한 데이터는 복구할수 없습니다. 삭제하시겠습니까?'))location.href='${pageContext.request.contextPath}/board/board_delete_ok.do?boardCate=${boardCate }&boardNo=${boardno}';"
								type="submit">삭제</button>
							</c:if>
							</c:if>
.
							<a
								href="${pageContext.request.contextPath}/board/board_list.do?boardCate=${boardCate}&searchList=${keywordOption }&keyword=${keyword }&sortCate=${sortCate}"><button
									class="btn btn-g btn-round btn-xs" type="submit">목록</button></a>
						</p>
					</div>
					<div class="pull-right">
						<p class="btn-list">
							<a href="${pageContext.request.contextPath}/login/show.do"> 
						<c:choose>
							<c:when test="${userInfo != null}">
 								<a href="${pageContext.request.contextPath}/board/board_add.do?boardCate=${boardCate}">
									<button class="btn btn-success btn-round btn-xs" type="submit">글쓰기</button>
								</a> 
							</c:when>
							<c:otherwise>
								<a href="${pageContext.request.contextPath}/login/show.do">
									<button class="btn btn-success btn-round btn-xs"
								onclick="if(alert('비회원은 글쓰기가 불가능합니다. 로그인 해주세요.'));"
								type="submit">글쓰기</button></a> 
							</c:otherwise>
						</c:choose>
							</a>
						</p>
					</div>
				</div>
			</div>
		</section>
		<section class="module-extra-small">
		<div class="container">
			<div id="viewcomment">
		 	
			<c:choose>
				<c:when test="${commentList.size() == 0}">
					<h4 style="text-align: center; margin-bottom: 40px;">댓글이없습니다.</h4>
				</c:when>
				<c:otherwise>
					<c:forEach var="item" items="${commentList}" varStatus="status">
						<c:set var="userId" value="${item.userId}"/>
						<c:set var="cmt_reg_date" value="${item.cmt_reg_date}"/>
						<c:set var="cmt_love" value="${item.cmt_love}"/>
						<c:set var="cmt_hate" value="${item.cmt_hate}"/>
						<c:set var="cmt_content" value="${item.cmt_content}"/>
						<c:set var="cmtId" value="cmt-${item.cmtNo}"/>
						<c:set var="cmtNo" value="${item.cmtNo}"/>
						<c:set var="ccmt_ref" value="${item.ccmt_ref}"/>
						<c:set var="ccmt_exist" value="${item.ccmt_exist}"/>
			
			<div class="median" id="${cmtId}" style="padding-left: calc(${ccmt_exist}*30px);">
				<div class="media-body">
					<h4 class="media-heading">
						<span>${userId}</span> 
						<span class="time"> 
							<i class="fa fa-clock-o">${cmt_reg_date}</i>
						</span> 
						<span class="reply"> 
						<a href="${pageContext.request.contextPath}/board/cmt_love_hate_ok.do?boardCate=${boardCate }&cmtNo=${cmtNo }&boardNo=${boardno }&type=0"> 
							<i class="fa fa-thumbs-o-up fa-xs">추천 </i> <span>${cmt_love }</span>
						</a> 
						<a href="${pageContext.request.contextPath}/board/cmt_love_hate_ok.do?boardCate=${boardCate }&cmtNo=${cmtNo }&boardNo=${boardno }&type=1"> 
							<i class="fa fa-thumbs-o-down fa-xs">비추천 </i> <span>${cmt_hate }</span>
						</a>
						<c:if test="${userInfo !=null}">
							<c:if test="${ccmt_exist == 0}">
								<a href="javascript:;" onclick="reply_box()" class="cmt_reply_box" id="comment_reply_box_inner-${cmtId}">
								답글 </a>
							</c:if>
							<c:if test="${userInfo.getUserId()== userId}">
								<a href="javascript:;" onclick="edit_box()" class="cmt_edit_box" id="comment_edit_box_inner-${cmtId}">수정</a>
								<a href="" onclick="if(confirm('이 글에 등록된 답글이 모두삭제됩니다. 삭제하시겠습니까?'))location.href='${pageContext.request.contextPath}/board/cmt_delete_ok.do?boardCate=${boardCate }&boardNo=${boardno }&cmtNo=${cmtNo }';">
								삭제 </a>
							</c:if>
						</c:if>
						</span>
					</h4>
					${cmt_content }
					<div id="comment_edit_box">
						<div class="well comment_edit_box_inner-${cmtId}" style="display:none;">
							<form action="${pageContext.request.contextPath}/board/cmt_edit_ok.do?boardCate=${boardCate }&boardNo=${boardno }&cmtNo=${cmtNo}" name="editcomment" id="editcomment"
								method="post" accept-charset="utf-8" novalidate="novalidate">
								<input type="hidden" name="boardNo" id="boardNo" value="${boardno}" /> 
								<input type="hidden" name="boardCate" id="boardCate" value="${boardCate }" />
								<textarea class="form-control" name="cmt_content" id="cmt_content" rows="5"></textarea>
									<div class="comment_write_button_area" style="margin-top: 20px; overflow: hidden;">
									<div class="form-group pull-right">
										<button type="submit" class="btn btn-b btn-round btn-xs">댓글수정</button>
										<a href="javascript:;" onclick="edit_box_visible()" class="cmt_edit_box_visible" id="comment_edit_box_inner-${cmtId}">
										<button type="button" class="btn btn-b btn-round btn-xs">취소</button></a>
									</div>
									</div>
							</form>
						</div>
					</div>
					<div id="comment_reply_box">
						<div class="well comment_reply_box_inner-${cmtId }" style="display:none;">
							<form action="${pageContext.request.contextPath}/board/ccmt_add_ok.do?boardCate=${boardCate }&boardNo=${boardno }&cmtNo=${cmtNo}" name="replycomment" id="replycomment"
								method="post" accept-charset="utf-8" novalidate="novalidate">
								<input type="hidden" name="boardNo" id="boardNo" value="${boardno }" /> 
								<input type="hidden" name="boardCate" id="boardCate" value="${boardCate }" />
								<textarea class="form-control" name="cmt_content" id="cmt_content" rows="5"></textarea>
									<div class="comment_write_button_area" style="margin-top: 20px; overflow: hidden;">
									<div class="form-group pull-right">
										<button type="submit" class="btn btn-b btn-round btn-xs">답글달기</button>
										<a href="javascript:;" onclick="reply_box_visible()" class="cmt_reply_box_visible" id="comment_reply_box_inner-${cmtId }">
										<button type="button" class="btn btn-b btn-round btn-xs">취소</button></a>
									</div>
									</div>
							</form>
						</div>
					</div>
					
				</div>
			</div>
			<hr/>
				</c:forEach>
				</c:otherwise>
			</c:choose>
			
		</div>
	<c:choose>
		<c:when test="${userInfo != null}">
	<div id="comment_write_box">
		<div class="well comment_write_box_inner">
			<form action="${pageContext.request.contextPath}/board/cmt_add_ok.do" name="fcomment" id="fcomment"
				method="post" accept-charset="utf-8" novalidate="novalidate">
				<input type="hidden" name="boardNo" id="boardNo" value="${boardno }" /> 
					<input type="hidden" name="boardCate" id="boardCate" value="${boardCate }" />
				<textarea class="form-control" name="cmt_content" id="cmt_content"
					rows="5"></textarea>
				<div class="comment_write_button_area"
					style="margin-top: 20px; overflow: hidden;">
					<div class="form-group pull-right">
						<button type="submit" class="btn btn-b btn-round btn-xs">댓글등록</button>
					</div>

					<div class="form-group pull-left">
						현재 글자수 <span id="counter">(0 /최대 200자) </span>
					</div>
				</div>
			</form>
		</div>
	</div>
	</c:when>
	<c:otherwise>
	<div class="median" id="???" style="padding-left: 0px;">
		<div class="media-body">
			<h4 style="text-align: center; margin-bottom: 40px;">
				<a href="${pageContext.request.contextPath}/login/show.do">로그인</a>을하시면 댓글을 등록할 수
				있습니다.
			</h4>
		</div>
	</div>
	</c:otherwise>
	</c:choose>
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