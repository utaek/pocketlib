<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
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
<title>Register Books | pocketLib</title>
<!-- favicon -->
<%@ include file="/WEB-INF/views/inc/favicon.jsp" %>
	
<!--  
    Stylesheets
    =============================================
    
    -->
    
<style type="text/css">
.footer_1 {
	width: 100%;
	height: 60px;
	text-align: center;
	position: fixed;
	z-index: 9999;
	bottom: 0;
}
</style><!-- Stylesheets -->
<%@ include file="/WEB-INF/views/inc/style.jsp" %>

</head>
<body data-spy="scroll" data-target=".onpage-navigation"
	data-offset="60">
	
	<div class="page-loader">
		<div class="loader">Loading...</div>
	</div>
	
		<!-- Nav bar -->
<%@ include file="/WEB-INF/views/inc/navbar.jsp" %>
	
	
		<div class="main">
	
		<section class="module-small">
		<form method="get" action="${pageContext.request.contextPath}/login/book_register.do">
			<div class="container">
				<h3>관심있는 책을 1권 이상 자유롭게 선택해주세요.</h3>
			</div>
			<hr style="border: solid 1px black; width: 70%" />
			<table class="table table-hover" align="center"
				style="width: 70%; text-align: center;">
				<colgroup>
					<col style="width: 10%;">
					<col style="width: 10%;">
					<col style="width: 10%;">
					<col style="width: 10%;">
					<col style="width: 10%;">
					<col style="width: 10%;">
					<col style="width: 10%;">
					<col style="width: 10%;">
					<col style="width: 10%;">
					<col style="width: 10%;">
				</colgroup>
				
				<c:forEach var="item" items="${bookList}" varStatus="status">
					
						<c:if test="${(status.index) % 5 == 0}">
							<tr>
						</c:if>
						<!-- 한번 봐볼라고 써본 거 -->
						
							<td>
							
								<input type="checkbox" id="isbn" name="isbn"
								value="${item.isbn}"> <img src="${item.cover}"
								height="150"></td>
							<td>${item.title}</td>
						
						<c:if test="${(status.index+1) % 5 == 0}">
							</tr>
						</c:if>
					
				</c:forEach>
				
			</table>
			<div class="footer_1" style="background: #2f2f2f;">
				<p class="btn-list mb-0">
					<input	type="hidden" id="userno" name="userno" value="${input.userno}">
					<button class="btn btn-border-w btn-circle" type="submit">확인</button>
				</p>

			</div>
			
			</form>
		</section>
		</div>
			
</body>
<%@ include file="/WEB-INF/views/inc/bottom.jsp" %>
<%@ include file="/WEB-INF/views/inc/script.jsp"%>
</html>