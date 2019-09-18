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

<title>Login | pocketLib</title>
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
		<section class="module bg-dark-30"
			data-background="${pageContext.request.contextPath}/assets/images/01.jpg">
			<div class="container">
				<div class="row">
					<div class="col-sm-6 col-sm-offset-3">
						<h1 class="module-title font-alt mb-0">Login-Register</h1>
					</div>
				</div>
			</div>
		</section>
		<section class="module">
			<div class="container">
				<div class="row">
					<div class="col-sm-5 col-sm-offset-1 mb-sm-40">
						<h4 class="font-alt">Login</h4>
						<hr class="divider-w mb-10">
						<form class="form" name="form" method="post"
							action="${pageContext.request.contextPath}/login/login.do">
							<div class="form-group">
								<input class="form-control" id="userId" type="text"
									name="userId" placeholder="UserID" />
							</div>
							<div class="form-group">
								<input class="form-control" id="password" type="password"
									name="password" placeholder="Password" />
							</div>
							<div class="form-group">
								<input class="btn btn-b btn-round" type="submit" value="Login" />
							</div>
						</form>
					</div>
					<div class="col-sm-5">
						<h4 class="font-alt">Register</h4>
						<hr class="divider-w mb-10">
						<form class="form"
							action="${pageContext.request.contextPath}/login/registerShow.do">
							<div class="form-group">
								<button class="btn btn-block btn-round btn-b" type="submit">Register</button>
							</div>
						</form>
						<h4 class="font-alt">Forgot Password?</h4>
						<hr class="divider-w mb-10">
						<form class="form"
							action="${pageContext.request.contextPath}/login/findPassword.do">
							<div class="form-group">
								<button class="btn btn-block btn-round btn-b" type="submit">Find
									Password</button>
							</div>
						</form>
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