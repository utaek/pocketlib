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

<title>FAQ | pocketLib</title>
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
						<h1 class="module-title font-alt mb-0">F A Q</h1>
					</div>
				</div>
			</div>
		</section>
		<section class="module">
			<div class="container">
				<div class="row">
					<div class="col-sm-8 col-sm-offset-2"
						style="margin-left: 5%; width: 100%;">
						<div role="tabpanel">
							<ul class="nav nav-tabs font-alt" role="tablist">
								<li class="active"><a href="#support" data-toggle="tab"><span
										class="icon-genius"></span>공지사항</a></li>
								<li><a href="#sales" data-toggle="tab"><span
										class="icon-globe"></span>FAQ</a></li>
							</ul>
							<!-- 공지사항 탭 -->
							<div class="tab-content">
								<div class="tab-pane active" id="support">
									<div class="panel-group" id="accordion">
										<div class="panel panel-default">
											<div class="panel-heading">
												<h4 class="panel-title font-alt">
													<a data-toggle="collapse" data-parent="#accordion"
														href="#support1">첫번째 공지사항 </a>
												</h4>
											</div>
											<div class="panel-collapse collapse in" id="support1">
												<div class="panel-body">첫번째 공지사항 내용 첫번째 공지사항 내용 첫번째
													공지사항 내용 첫번째 공지사항 내용 첫번째 공지사항 내용 첫번째 공지사항 내용 첫번째 공지사항 내용 첫번째
													공지사항 내용 첫번째 공지사항 내용</div>
											</div>
										</div>
										<div class="panel panel-default">
											<div class="panel-heading">
												<h4 class="panel-title font-alt">
													<a class="collapsed" data-toggle="collapse"
														data-parent="#accordion" href="#support2">두번째 공지사항 </a>
												</h4>
											</div>
											<div class="panel-collapse collapse" id="support2">
												<div class="panel-body">두번째 공지사항 내용 두번째 공지사항 내용 두번째
													공지사항 내용 두번째 공지사항 내용 두번째 공지사항 내용 두번째 공지사항 내용 두번째 공지사항 내용 두번째
													공지사항 내용 두번째 공지사항 내용</div>
											</div>
										</div>
									</div>
								</div>
								<!-- FAQ탭 -->
								<div class="tab-pane" id="sales">
									<div class="panel-group" id="accordion">
										<div class="panel panel-default">
											<div class="panel-heading">
												<h4 class="panel-title font-alt">
													<a data-toggle="collapse" data-parent="#accordion"
														href="#sales1">첫번째 FAQ</a>
												</h4>
											</div>
											<div class="panel-collapse collapse in" id="sales1">
												<div class="panel-body">첫번째 FAQ내용 첫번째 FAQ내용 첫번째 FAQ내용
													첫번째 FAQ내용 첫번째 FAQ내용 첫번째 FAQ내용 첫번째 FAQ내용 첫번째 FAQ내용 첫번째 FAQ내용
												</div>
											</div>
										</div>
										<div class="panel panel-default">
											<div class="panel-heading">
												<h4 class="panel-title font-alt">
													<a class="collapsed" data-toggle="collapse"
														data-parent="#accordion" href="#sales2"> 두번째 FAQ </a>
												</h4>
											</div>
											<div class="panel-collapse collapse" id="sales2">
												<div class="panel-body">두번째 FAQ내용 두번째 FAQ내용 두번째 FAQ내용
													두번째 FAQ내용 두번째 FAQ내용 두번째 FAQ내용 두번째 FAQ내용 두번째 FAQ내용 두번째 FAQ내용
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</section>
		
		</div>

		
	</main>
	
	<%@ include file="/WEB-INF/views/inc/script.jsp"%>
	<%@ include file="/WEB-INF/views/inc/bottom.jsp"%>
	
</body>
	
</html>