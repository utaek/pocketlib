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

<title>Book Detail| pocketLib</title>
<!-- favicon -->
<%@ include file="/WEB-INF/views/inc/favicon.jsp"%>
<!-- Stylesheets -->
<%@ include file="/WEB-INF/views/inc/style.jsp"%>



</head>
<body data-spy="scroll" data-target=".onpage-navigation"
	data-offset="60">

	<div class="page-loader">
		<div class="loader">Loading...</div>
	</div>
	<!-- Nav bar -->
	<%@ include file="/WEB-INF/views/inc/navbar.jsp"%>


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
											<!-- 여기가 평점 별  --> 
											<c:choose>
												<c:when test="${output.customerReviewRank == 0}">
													<c:forEach var="j" begin="1" end="5" varStatus="status">
														<i class="fa fa-star-o fa-2x"></i>
												</c:forEach>
												</c:when>
												<c:when test="${output.customerReviewRank >=2 }">
													<c:forEach var="i" begin="1" end="${(output.customerReviewRank-2)/2}"
														varStatus="status">
														<i class="fa fa-star fa-2x"></i>
													</c:forEach>
												</c:when>
											</c:choose> 
											<c:choose>
												<c:when
													test="${(output.customerReviewRank % 2 == 0) && output.customerReviewRank!=0}">

													<i class="fa fa-star fa-2x"></i>
												</c:when>
												<c:when
													test="${(output.customerReviewRank % 2 != 0) && output.customerReviewRank!=0}">
													<i class="fa fa-star fa-2x"></i>
													<i class="fa fa-star-half-o fa-2x"></i>
												</c:when>
											</c:choose>
											<c:choose>
												<c:when test="${output.customerReviewRank >=2 }">
													<c:forEach var="i" begin="1" end="${(10-output.customerReviewRank)/2}" varStatus="status">
														<i class="fa fa-star-o fa-2x"></i>
													</c:forEach>
												</c:when> 
											</c:choose>(${output.customerReviewRank})
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
								<c:when test="${userInfo==null}">
									<a href="${pageContext.request.contextPath}/login/show.do">
										<input type="button" class="btn btn-d btn-round"
										value="읽은책 등록" onclick="alert('로그인 후 이용하세요');" />
									</a>
								</c:when>
								<c:when test="${userInfo!=null && totalCountbR>0}">
									<form class="form" method="post"
										action="${pageContext.request.contextPath}/book/br_delete.do">
										<input type="hidden" name="isbn" value="${output.isbn}">
										<input type="submit" class="btn btn-d btn-round"
											value="읽은책 취소">
									</form>
								</c:when>
								<c:when test="${userInfo!=null && totalCountbR==0}">
									<form class="form" method="post"
										action="${pageContext.request.contextPath}/book/br_insert.do">

										<input type="hidden" name="isbn" value="${output.isbn}">
							
										<input type="submit" class="btn btn-d btn-round" value="읽은책 등록"  />
									</form>
								</c:when>
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


