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

<title>BestSeller | pocketLib</title>
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

				<form class="row" method="get"
					action="${pageContext.request.contextPath}/book/bestseller.do">

					<div class="col-sm-4 mb-sm-19 pull-left">
						<select class="form-control" name="category" value="${category}">
							<option selected="selected" value=336>장르선택</option>
							<option value=336>자기계발</option>
							<option value=170>경제경영</option>
							<option value=1>소설/시/희곡</option>
							<option value=987>과학</option>
							<option value=798>사회과학</option>
							<option value=656>인문학</option>
							<option value=517>예술/대중문화</option>
							<option value=1196>여행</option>
							<option value=55889>에세이</option>
						</select>

					</div>
					<button class="btn btn-g btn-round" type="submit"
						style="float: left;">찾기</button>

				</form>

			</div>
			</section>

				<div class="container">

				<h3>${aladinBookList.searchCategoryName}분야베스트셀러</h3>
</div>
				<c:if test="${aladinBookList!=null}">
					<hr style="border: solid 1px black; width: 70%" />

					<table class="table table-hover" align="center"
						style="width: 70%; text-align: center;">

						<colgroup>
							<col style="width: 10%;">
							<col style="width: 50%;">
							<col style="width: 40%;">
						</colgroup>

						<c:forEach var="item" items="${aladinBookList.item}"
							varStatus="status">
							<thead>
								<tr>
									<td><h3>${item.bestRank}위</h3></td>
									<td><a
										href="${pageContext.request.contextPath}/book/book_detail.do?isbn=${item.isbn}">
											<img src="${item.cover}" height="150">
									</a></td>
									<td>
										<h3>
											<a
												href="${pageContext.request.contextPath}/book/book_detail.do?isbn=${item.isbn}">
												${item.title}</a>
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
													<!-- 여기가 평점 별  -->
											<c:choose>
												<c:when test="${item.customerReviewRank == 0}">
													<c:forEach var="j" begin="1" end="5" varStatus="status">
														<i class="fa fa-star-o fa-2x"></i>
												</c:forEach>
												</c:when>
												<c:when test="${item.customerReviewRank >=2 }">
													<c:forEach var="i" begin="1" end="${(item.customerReviewRank-2)/2}"
														varStatus="status">
														<i class="fa fa-star fa-2x"></i>
													</c:forEach>
												</c:when>
											</c:choose> 
											<c:choose>
												<c:when
													test="${(item.customerReviewRank % 2 == 0) && item.customerReviewRank!=0}">

													<i class="fa fa-star fa-2x"></i>
												</c:when>
												<c:when
													test="${(item.customerReviewRank % 2 != 0) && item.customerReviewRank!=0}">
													<i class="fa fa-star fa-2x"></i>
													<i class="fa fa-star-half-o fa-2x"></i>
												</c:when>
											</c:choose>
											<c:choose>
												<c:when test="${item.customerReviewRank >=2 }">
													<c:forEach var="i" begin="1" end="${(10-item.customerReviewRank)/2}" varStatus="status">
														<i class="fa fa-star-o fa-2x"></i>
													</c:forEach>
												</c:when> 
											</c:choose>(${item.customerReviewRank})

												</td>
											</tr>
										</table>
									</td>
								</tr>
							</thead>
						</c:forEach>
					</table>
				</c:if>
			</div>
		
		
	
	</main>
	

</body>
<%@ include file="/WEB-INF/views/inc/bottom.jsp"%>
<%@ include file="/WEB-INF/views/inc/script.jsp"%>
</html>