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



<title>Book Search | pocketLib</title>
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

	<section class="module">
		<div class="container">
			<div class="row mb-60">
				<div class="col-sm-8 col-sm-offset-2">
					<form role="form" method="get"
						action="${pageContext.request.contextPath}/book/searchresult.do">
							<div class="post-header font-alt">
						
							<h2 class="post-title">BOOK SEARCH  </h2>

						</div>
						<div class="search-box">
							<input class="form-control" type="text" id="query" name="query"
								value="${query}" placeholder="Search..." />
							<button class="search-btn" type="submit">
								<i class="fa fa-search"></i>
							</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	
		<div class="container">

			<c:if test="${search!=null}">
				<hr style="border: solid 1px black; width: 70%;" />
				<table class="table table-hover" align="center"
					style="width: 70%; text-align: center;">

					<colgroup>
						<col style="width: 5%;">
						<col style="width: 30%;">
						<col style="width: 65%;">
					</colgroup>
					<c:forEach var="item" items="${search}" varStatus="status">
						<tr>
							<td><h4>${status.index+1}</h4></td>
							<td><a
								href="${pageContext.request.contextPath}/book/book_detail.do?isbn=${item.isbn}&customerReviewRank=${item.customerReviewRank}">
									<img src="${item.cover}" style="height: 250px;">
							</a></td>

							<td>
								<h3>
									<a
										href="${pageContext.request.contextPath}/book/book_detail.do?isbn=${item.isbn}&customerReviewRank=${item.customerReviewRank}">${item.title}</a>
								</h3>
								<table class="table table-hover">
									<tr>
										<td>저자</td>
										<td>${item.author}</td>
									</tr>
									<tr>
										<td>출판사</td>
										<td>${item.publisher}</td>
									</tr>
									<tr>
										<td>평점</td>
										<td>
											<!-- 여기가 평점 별  --> <c:choose>
												<c:when test="${item.customerReviewRank == 0}">
													<c:forEach var="j" begin="1" end="5" varStatus="status">
														<i class="fa fa-star-o fa-2x"></i>
														<c:set var="j" value="${j+1}" />
													</c:forEach>
												</c:when>

												<c:when test="${item.customerReviewRank != 0}">
													<c:forEach var="i" begin="1"
														end="${(item.customerReviewRank-2)/2}" varStatus="status">
														<i class="fa fa-star fa-2x"></i>
														<c:set var="i" value="${i+1}" />
													</c:forEach>

												</c:when>
											</c:choose> <c:choose>
												<c:when
													test="${(item.customerReviewRank % 2 == 0) && item.customerReviewRank!=0}">

													<i class="fa fa-star fa-2x"></i>
												</c:when>
												<c:when
													test="${(item.customerReviewRank % 2 != 0) && item.customerReviewRank!=0}">
													<i class="fa fa-star fa-2x"></i>
													<i class="fa fa-star-half fa-2x"></i>
												</c:when>

											</c:choose> (${item.customerReviewRank})

										</td>
									</tr>

								</table>
							</td>
						</tr>
					</c:forEach>
				</table>
			</c:if>
		</div>
	</section>
</main>

	<%@ include file="/WEB-INF/views/inc/bottom.jsp"%>

	
	<%@ include file="/WEB-INF/views/inc/script.jsp"%>

</body>
</html>





