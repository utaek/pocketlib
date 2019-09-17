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

<title>New Book | pocketLib</title>
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

	<div class="main showcase-page">
		<div class="main">
			<section class="module-small">
				<div class="container">

					<form class="row" method="get"
						action="${pageContext.request.contextPath}/book/item_new_special.do">

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
		</div>

		<div class="container">
			<div class="row multi-columns-row">

				<h2>${aladinBookList.searchCategoryName}분야화제의 신간</h2>
				<c:if test="${aladinBookList != null}">

					<table style="width: 100%; min-width: 80%;">

						<c:forEach var="item" items="${aladinBookList.item}"
							varStatus="status">
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
												style="height: 200px; margin-top: 20px" />
											<h4 class="content-box-title font-serif"
												style="font-size: 15px;">${item.title}</h4>
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
	<%@ include file="/WEB-INF/views/inc/bottom.jsp"%>

	</main>
	<%@ include file="/WEB-INF/views/inc/script.jsp"%>

</body>
</html>