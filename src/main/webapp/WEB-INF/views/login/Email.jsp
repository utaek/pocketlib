<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="ko" dir="ltr">
<script src="//code.jquery.com/jquery-3.4.1.min.js"></script>

<head>
<meta name="viewport" content="width=device-width, initial-scale=1">

<!--  
    Document Title
    =============================================
    -->
<c:choose>
	<c:when test="${userInfo ==null}">
		<title>pocktLib</title>
	</c:when>
	<c:otherwise>
		<title>안녕하세요 ${userInfo.userName}님</title>
	</c:otherwise>
</c:choose>
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
		<section class="module">
			<div class="container">

					<table class="table table-hover">
						<thead>
							<h3>${userId}님</h3>
						</thead>
						<tbody>
							<h4>Email인증이 완료되었습니다.</h4>
							<h4>로그인 후 이용해주세요.</h4>
							<h4>
								<a href="${pageContext.request.contextPath}/login/show.do">->로그인하러
									가기</a>
							</h4>
						</tbody>
					</table>
			</div>
		</section>
	</div>
	

	

</body>
<%@ include file="/WEB-INF/views/inc/bottom.jsp"%>
<%@ include file="/WEB-INF/views/inc/script.jsp"%>
</html>