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
	<c:when test="${boardCate ==1}">
		<title>Community | pocketLib</title>
	</c:when>
	<c:when test="${boardCate ==2}">
		<title>Book Review Board | pocketLib</title>
	</c:when>
	<c:when test="${boardCate ==3}">
		<title>Q&A | pocketLib</title>
	</c:when>
	<c:otherwise>
		<title>Notice | pocketLib</title>
	</c:otherwise>
</c:choose>
<!-- favicon -->
<%@ include file="/WEB-INF/views/inc/favicon.jsp"%>
<!-- Stylesheets -->
<%@ include file="/WEB-INF/views/inc/style.jsp"%>

</head>
<body data-spy="scroll" data-target=".onpage-navigation"
	data-offset="60">
	<main>
	<div class="page-loader">
		<div class="loader">Loading...</div>
	</div>
	<!-- Nav bar --> <%@ include file="/WEB-INF/views/inc/navbar.jsp"%>

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
					<c:when test="${boardCate==3}">
						<h1>Q&A 게시판</h1>
					</c:when>
					<c:otherwise>
						<h1>공지사항</h1>
					</c:otherwise>
				</c:choose>
				<hr />
				<form class="row">
					<form method="get"
						action="${pageContext.request.contextPath}/board/board_list.do">
						<div class="col-sm-2 mb-sm-20">
							<select class="form-control" id="sortCate" name="sortCate"
								onchange="location.href='${pageContext.request.contextPath}/board/board_list.do?boardCate=${boardCate}&searchList=${keywordOption}&keyword=${keyword}&sortCate='+ this.value;">
								<option value="order">정렬하기</option>
								<option value="reg_date"
									<c:if test="${sortCate != null and sortCate == 'reg_date'}"> selected </c:if>>날짜순</option>
								<option value="hits"
									<c:if test="${sortCate != null and sortCate == 'hits'}"> selected </c:if>>조회순</option>

							</select>
						</div>
						<div class="col-sm-4 mb-sm-20 pull-right">
							<input type="hidden" id="boardCate" name="boardCate"
								value="${boardCate}" /> <input class="form-control" type="text"
								name="keyword" id="keyword" style="text-transform: none;"
								placeholder="Search..." value="${keyword}" />

							<button class="search-btn" type="submit">
								<i class="fa fa-search"></i>
							</button>
						</div>
						<div class="col-sm-2 mb-sm-19 pull-right">
							<select class="form-control" id="searchList" name="searchList">

								<option value="title_content"
									<c:if test="${keywordOption != null and keywordOption == 'title_content'}"> selected </c:if>>제목+내용</option>
								<option value="title"
									<c:if test="${keywordOption != null and keywordOption == 'title'}"> selected </c:if>>제목</option>
								<option value="userId"
									<c:if test="${keywordOption != null and keywordOption == 'userId'}"> selected </c:if>>글쓴이</option>
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
							<th style="text-align: center;">글쓴이</th>
							<th style="text-align: center;">날짜</th>
							<th style="text-align: center;">조회수</th>
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
								<c:forEach var="item" items="${output2}" varStatus="status">
									<c:set var="boardno" value="${item.boardNo}" />
									<c:set var="title" value="${item.title}" />
									<c:set var="content" value="${item.content}" />
									<c:set var="userid" value="${item.userId}" />
									<c:set var="reg_date" value="${item.reg_date}" />
									<c:set var="hits" value="${item.hits}" />
									<tr>
										<td style="width: 9%;"><span class="label label-primary">공지</span></td>
										<td style="width: 38%;"><a
											href="${pageContext.request.contextPath}/board/board_view.do?boardCate=${boardCate}&boardNo=${boardno}&searchList=${keywordOption }&keyword=${keyword }&sortCate=${sortCate}">${title}</a></td>
										<td style="width: 17%; text-align: center;">${userid}</td>
										<td style="width: 13%; text-align: center;">${reg_date}</td>
										<td style="width: 10%; text-align: center;">${hits}</td>
									</tr>
								</c:forEach>

								<c:forEach var="item" items="${output}" varStatus="status">
									<c:set var="boardno" value="${item.boardNo}" />
									<c:set var="title" value="${item.title}" />
									<c:set var="content" value="${item.content}" />
									<c:set var="userid" value="${item.userId}" />
									<c:set var="reg_date" value="${item.reg_date}" />
									<c:set var="hits" value="${item.hits}" />
									<c:set var="isbn" value="${item.isbn}" />

									<c:if test="${keyword!=''}">
										<c:set var="mark" value="<mark>${keyword}</mark>" />
										<c:set var="title" value="${fn:replace(title,keyword,mark)}" />
										<c:set var="content"
											value="${fn:replace(content,keyword,mark)}" />
										<c:set var="userid" value="${fn:replace(userid,keyword,mark)}" />
									</c:if>


									<tr>

									

										<td style="width: 9%;"><span class="font-alt"
											style="font-size: 13px;">${boardOrder}</span></td>
										<td style="width: 38%;"><a
											href="${pageContext.request.contextPath}/board/board_view.do?boardCate=${boardCate}&boardNo=${boardno}&searchList=${keywordOption }&keyword=${keyword }&sortCate=${sortCate}&isbn=${isbn}">${title}</a></td>
										<td style="width: 17%; text-align: center;">${userid}</td>
										<td style="width: 13%; text-align: center;">${reg_date}</td>
										<td style="width: 10%; text-align: center;">${hits}</td>

									</tr>
									<c:set var="boardOrder" value="${boardOrder-1}" />
								</c:forEach>
							</c:otherwise>
						</c:choose>
					</tbody>
				</table>
				<div class="border_button">
					<div class="pull-left mr10">
						<p class="btn-list">
							<a
								href="${pageContext.request.contextPath}/board/board_list.do?boardCate=${boardCate}"><button
									class="btn btn-g btn-round btn-xs" type="submit">목록</button></a>
						</p>
					</div>
					<div class="pull-right">
						<p class="btn-list">
							<c:choose>
								<c:when
									test="${boardCate == 2 and length>0 and userInfo !=null}">
									<a
										href="${pageContext.request.contextPath}/board/board_add.do?boardCate=${boardCate}">
										<button class="btn btn-success btn-round btn-xs" type="submit">글쓰기</button>
									</a>
								</c:when>
								<c:when test="${boardCate == 2 and length == 0}">
									<a href="${pageContext.request.contextPath}/">
										<button class="btn btn-success btn-round btn-xs"
											onclick="if(alert('읽은책을 등록후 후기작성 가능합니다.'));" type="submit">글쓰기</button>
									</a>
								</c:when>
								<c:when test="${userInfo != null}">
									<c:if
										test="${boardCate!=4 || (boardCate==4 && userInfo.userId=='admin')}">
										<a
											href="${pageContext.request.contextPath}/board/board_add.do?boardCate=${boardCate}">
											<button class="btn btn-success btn-round btn-xs"
												type="submit">글쓰기</button>
										</a>
									</c:if>
								</c:when>


								<c:otherwise>
									<c:if
										test="${boardCate!=4 || (boardCate==4 && userInfo.userId=='admin')}">
										<a href="${pageContext.request.contextPath}/login/show.do">
											<button class="btn btn-success btn-round btn-xs"
												onclick="if(alert('비회원은 글쓰기가 불가능합니다. 로그인 해주세요.'));"
												type="submit">글쓰기</button>
										</a>
									</c:if>
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
							<c:forEach var="i" begin="${pageData.startPage}"
								end="${pageData.endPage}" varStatus="status">
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
										<a href="${pageUrl}">${i}</a>
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
									<a href="${nextPageUrl}"><i class='fa fa-angle-right'></i></a>
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
	</main>
</body>
<%@ include file="/WEB-INF/views/inc/bottom.jsp"%>
<%@ include file="/WEB-INF/views/inc/script.jsp"%>
</html>