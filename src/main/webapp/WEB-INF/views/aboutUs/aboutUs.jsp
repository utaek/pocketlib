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

<title>About Us | pocketLib</title>
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
		<section class="module bg-dark-60 about-page-header"
			data-background="${pageContext.request.contextPath}/assets/images/about_bg.jpg">
			<div class="container">
				<div class="row">
					<div class="col-sm-6 col-sm-offset-3">
						<h2 class="module-title font-alt">About</h2>
						<div class="module-subtitle font-alt">
							POCKETLIB 프로젝트를 소개합니다. <br /> period of developing the project :
							19.08.17 ~ 19.09.17
						</div>
					</div>
				</div>
			</div>
		</section>
		<section class="module">
			<div class="container">
				<div class="row">
					<div class="col-sm-6 col-sm-offset-3">
						<h2 class="module-title font-alt">Our skills</h2>
						<div class="module-subtitle font-alt">skills & experiences</div>
					</div>
				</div>
				<div class="row">
					<div class="col-sm-6">
						<h6 class="font-alt">
							<span class="icon-tools-2"></span> JAVA
						</h6>
						<div class="progress">
							<div class="progress-bar pb-dark" aria-valuenow="70"
								role="progressbar" aria-valuemin="0" aria-valuemax="100">
								<span class="font-alt"></span>
							</div>
						</div>
						<h6 class="font-alt">
							<span class="icon-strategy"></span> JSP
						</h6>
						<div class="progress">
							<div class="progress-bar pb-dark" aria-valuenow="60"
								role="progressbar" aria-valuemin="0" aria-valuemax="100">
								<span class="font-alt"></span>
							</div>
						</div>
						<h6 class="font-alt">
							<span class="icon-target"></span> SPRING
						</h6>
						<div class="progress">
							<div class="progress-bar pb-dark" aria-valuenow="80"
								role="progressbar" aria-valuemin="0" aria-valuemax="100">
								<span class="font-alt"></span>
							</div>
						</div>
						<h6 class="font-alt">
							<span class="icon-camera"></span> JAVA SCRIPT
						</h6>
						<div class="progress">
							<div class="progress-bar pb-dark" aria-valuenow="25"
								role="progressbar" aria-valuemin="0" aria-valuemax="100">
								<span class="font-alt"></span>
							</div>
						</div>
					</div>
					<div class="col-sm-6">
						<h6 class="font-alt">
							<span class="icon-tools-2"></span> MYSQL
						</h6>
						<div class="progress">
							<div class="progress-bar pb-dark" aria-valuenow="90"
								role="progressbar" aria-valuemin="0" aria-valuemax="100">
								<span class="font-alt"></span>
							</div>
						</div>
						<h6 class="font-alt">
							<span class="icon-strategy"></span> JQUERY
						</h6>
						<div class="progress">
							<div class="progress-bar pb-dark" aria-valuenow="20"
								role="progressbar" aria-valuemin="0" aria-valuemax="100">
								<span class="font-alt"></span>
							</div>
						</div>
						<h6 class="font-alt">
							<span class="icon-target"></span> MYBATIS
						</h6>
						<div class="progress">
							<div class="progress-bar pb-dark" aria-valuenow="85"
								role="progressbar" aria-valuemin="0" aria-valuemax="100">
								<span class="font-alt"></span>
							</div>
						</div>
						<h6 class="font-alt">
							<span class="icon-camera"></span> HTML+CSS
						</h6>
						<div class="progress">
							<div class="progress-bar pb-dark" aria-valuenow="30"
								role="progressbar" aria-valuemin="0" aria-valuemax="100">
								<span class="font-alt"></span>
							</div>
						</div>
					</div>
				</div>
			</div>
		</section>

		<section class="module" id="team">
			<div class="container">
				<div class="row">
					<div class="col-sm-6 col-sm-offset-3">
						<h2 class="module-title font-alt">Team</h2>
						<div class="module-subtitle font-alt">pocketLib Developers</div>
					</div>
				</div>
				<div class="row">
					<div class="mb-sm-20 wow fadeInUp col-sm-6 col-md-6"
						onclick="wow fadeInUp">
						<div class="team-item">
							<div class="team-image">
								<img
									src="${pageContext.request.contextPath}/assets/images/team-1.gif"
									alt="Member Photo" />
								<div class="team-detail">
									<h5 class="font-alt">우리팀 첫째</h5>
									<p class="font-serif">헬스쟁이</p>

								</div>
							</div>
							<div class="team-descr font-alt">
								<div class="team-name">송수협</div>
								<div class="team-role">pocketLib crew</div>
							</div>
						</div>
					</div>
					<div class="mb-sm-20 wow fadeInUp col-sm-6 col-md-3"
						onclick="wow fadeInUp">
						<div class="team-item">
							<div class="team-image">
								<img
									src="${pageContext.request.contextPath}/assets/images/team-2.gif"
									alt="Member Photo" />
								<div class="team-detail">
									<h5 class="font-alt">우리팀 둘째</h5>
									<p class="font-serif">센스쟁이</p>

								</div>
							</div>
							<div class="team-descr font-alt">
								<div class="team-name">박장호</div>
								<div class="team-role">pocketLib crew</div>
							</div>
						</div>
					</div>
					<div class="mb-sm-20 wow fadeInUp col-sm-6 col-md-3"
						onclick="wow fadeInUp">
						<div class="team-item">
							<div class="team-image">
								<img
									src="${pageContext.request.contextPath}/assets/images/team-3.gif"
									alt="Member Photo" />
								<div class="team-detail">
									<h5 class="font-alt">우리팀 셋째</h5>
									<p class="font-serif">코쟁이</p>

								</div>
							</div>
							<div class="team-descr font-alt">
								<div class="team-name">최우택</div>
								<div class="team-role">pocketLib crew</div>
							</div>
						</div>
					</div>
					<div class="mb-sm-20 wow fadeInUp col-sm-6 col-md-3"
						onclick="wow fadeInUp">
						<div class="team-item">
							<div class="team-image">
								<img
									src="${pageContext.request.contextPath}/assets/images/team-4.gif"
									alt="Member Photo" />
								<div class="team-detail">
									<h5 class="font-alt">우리팀 넷째</h5>
									<p class="font-serif">거짓말쟁이</p>

								</div>
							</div>
							<div class="team-descr font-alt">
								<div class="team-name">김현종</div>
								<div class="team-role">pocketLib crew</div>
							</div>
						</div>
					</div>
					<div class="mb-sm-20 wow fadeInUp col-sm-6 col-md-3" 
						onclick="wow fadeInUp">
						<div class="team-item">
							<div class="team-image">
								<img
									src="${pageContext.request.contextPath}/assets/images/team-5.gif"
									alt="Member Photo" style="height:265px;"/>
								<div class="team-detail">
									<h5 class="font-alt">우리팀 막내</h5>
									<p class="font-serif">말썽쟁이</p>

								</div>
							</div>
							<div class="team-descr font-alt">
								<div class="team-name">정수연</div>
								<div class="team-role">pocketLib crew</div>
							</div>
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