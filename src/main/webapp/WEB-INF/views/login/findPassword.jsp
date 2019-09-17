<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="ko" dir="ltr">
<script src="//code.jquery.com/jquery-3.4.1.min.js"></script>
<script>
	$(function() {
		$("#check_user_id")
				.click(
						function(e) {

							e.preventDefault();
							var user_id = $("#userID").val();
							var url = "${pageContext.request.contextPath}/login/register/duplicate.do?userID="
									+ user_id;
							window.open(url, "check_id",
									"width=400, height=300");
						});
	});
</script>
<script>
	function checksubmit() {
		if (document.form.check_user_id.value == "uncheck") {
			alert("중복체크해주세요");
			return false;
		} else if (document.form.check_user_id.value == "check") {
			return true;
		}
	}
</script>
<script>
	function inputIdChk() {
		document.form.check_user_id.value = "uncheck";
	}
</script>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">

<!--  
    Document Title
    =============================================
    -->

<title>Find Password | pocketLib</title>
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
					action="${pageContext.request.contextPath}/login/newPassword.do"
					name="form" onsubmit='return checksubmit();'>
					<table class="table table-hover">
						<thead>
							<h3>Find Password</h3>
							<h6>회원가입시 사용했던 아이디, 이름, 이메일주소를 입력해주세요.</h6>
						</thead>
						<tbody>
							<tr>
								<td style="width: 110px;">아이디</td>
								<td colspan="8"><input class="form-control" type="text"
									id="userID" name="userID" maxlength="20" placeholder="UserID"></td>
							</tr>
							<tr>
								<td>이름</td>
								<td colspan="8"><input class="form-control" type="text"
									id="userName" name="userName" maxlength="20"
									placeholder="UserName"></td>
							</tr>
							<tr>
								<td>이메일</td>
								<td colspan="8"><input class="form-control" id="email"
									type="email" name="email" placeholder="Email" maxlength="20" /></td>
							</tr>
							<tr>
								<td style="text-align: center;" colspan="9"><input
									class="btn btn-b btn-round" type="submit" value="비밀번호 찾기" /></td>
							</tr>
						</tbody>
					</table>
				</form>
			</div>
		</section>
	</div>
	<%@ include file="/WEB-INF/views/inc/bottom.jsp"%>
	</main>

	<%@ include file="/WEB-INF/views/inc/script.jsp"%>

</body>
</html>