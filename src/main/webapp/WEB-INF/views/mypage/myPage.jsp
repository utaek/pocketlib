<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="ko" dir="ltr">
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">


<title>Edit Infomation | pocketLib</title>

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
		<section class="module">
			<div class="container">

				<form method="post"
					action="${pageContext.request.contextPath}/login/myPageEdit.do"
					name="form">
					<table class="table table-hover">
						<thead>

							<h3>${userInfo.userName}님의 MyPage</h3>
						</thead>
						<tbody>

							<tr>
								<td>이름</td>
								<td colspan="6">${userInfo.userName}</td>
							</tr>
							<tr>
								<td>성별</td>
								<td colspan="6">${userInfo.gender}</td>

							</tr>
							<tr>
								<td>생년월일</td>
								<td colspan="8">${userInfo.birthday}</td>

							</tr>
							<tr>
								<td>이메일</td>
								<td colspan="8">${userInfo.email}</td>
							</tr>


							<tr>
								<td style="text-align: center;" colspan="9"><input
									class="btn btn-b btn-round" type="submit" value="정보 수정" /></td>
							</tr>
						</tbody>
					</table>
				</form>
			</div>
		</section>
	</div>

	

	</main>


	


</body>
<%@ include file="/WEB-INF/views/inc/bottom.jsp"%>
<%@ include file="/WEB-INF/views/inc/script.jsp"%>
</html>