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

<title>My BookShelf | pocketLib</title>
<!-- favicon -->
<%@ include file="/WEB-INF/views/inc/favicon.jsp"%>

<!-- Stylesheets -->
<%@ include file="/WEB-INF/views/inc/style.jsp"%>


<style>
/* Popup container - can be anything you want */
.popup {
	position: relative;
	display: inline-block;
	cursor: pointer;
	-webkit-user-select: none;
	-moz-user-select: none;
	-ms-user-select: none;
	user-select: none;
}

/* The actual popup */
.popup .popuptext {
	visibility: hidden;
	width: 160px;
	background-color: #555;
	color: #fff;
	text-align: center;
	border-radius: 6px;
	padding: 8px 0;
	position: absolute;
	z-index: 1;
	bottom: 125%;
	left: 50%;
	margin-left: -80px;
}

/* Popup arrow */
.popup .popuptext::after {
	content: "";
	position: absolute;
	top: 100%;
	left: 50%;
	margin-left: -5px;
	border-width: 5px;
	border-style: solid;
	border-color: #555 transparent transparent transparent;
}

/* Toggle this class - hide and show the popup */
.popup .show {
	visibility: visible;
	-webkit-animation: fadeIn 1s;
	animation: fadeIn 1s;
}

/* Add animation (fade in the popup) */
@
-webkit-keyframes fadeIn {
	from {opacity: 0;
}

to {
	opacity: 1;
}

}
@
keyframes fadeIn {
	from {opacity: 0;
}

to {
	opacity: 1;
}
}
</style>


<script language="javascript">
	function showPopup(frm) {
		var url = "bookstat.do";
		var title = "bookstat";
		var status = "width=800, height=900";

		window.open("", title, status);

		frm.target = title;
		frm.action = url;
		frm.method = "post";
		frm.submit();
	}

	function m_over() {

		var popup = document.getElementById("myPopup");
		popup.classList.toggle("show");
	}
</script>



</head>
<body data-spy="scroll" data-target=".onpage-navigation"
	data-offset="60">
	<div class="page-loader">
		<div class="loader">Loading...</div>
	</div>

	<!-- Nav bar -->
	<%@ include file="/WEB-INF/views/inc/navbar.jsp"%>



	<div class="main showcase-page">
		<section class="module-medium" id="demos">
			<div class="container">
				<div class="row">
					<div class="row mb-60">
						<div class="col-sm-8 col-sm-offset-2"
							style="margin-left: 5%; width: 100%;">


							<div class="popup" onmouseover="m_over()" style="float: right;">
								<form name="form">
									<button type="button" class="btn btn-d btn-round "
										onclick="javascript:showPopup(this.form);">
										<span class="icon-presentation"> </span> 나의 책 통계
									</button>
									<span class="popuptext" id="myPopup">확인해봐요</span>
								</form>
							</div>


							<div style="float: right;">
								<a href="${pageContext.request.contextPath}/book/booksearch.do">
									<button type="button" class="btn btn-g btn-round ">

										<span class="icon-notebook"></span> 책 추가하기
									</button>
								</a>
							</div>

						</div>
						<div class="col-sm-8 col-sm-offset-2"
							style="margin-left: 5%; width: 100%;">
							<h4 class="font-alt mb-0">My bookshelf</h4>
							<hr class="divider-w mt-10 mb-20">
							<div role="tabpanel">
								<ul class="nav nav-tabs font-alt" role="tablist">
									<li class="active"><a href="#support" data-toggle="tab"
										aria-expanded="true"> <span class="icon-book-open"></span>읽은책
									</a></li>
									<li><a href="#sales" data-toggle="tab"
										aria-expanded="false"> <span class="icon-notebook"></span>관심책
									</a></li>
								</ul>

								<div class="tab-content">
									<div class="tab-pane active" id="support">
										<!-- 읽은 책list  -->
										<div class="main">
											<section class="module-medium" id="demos">
												<div class="container">
													<div class="row multi-columns-row">

														<c:if test="${BR!=null}">

															<table>
																<c:forEach var="item" items="${BR}" varStatus="status">

																	<c:if test="${(status.index)%4 == 0}">
																		<tr>
																	</c:if>
																	<td style="width: 25%; min-width: 20%;">

																		<div class="col-md-12 col-sm-6 col-xs-12">
																			<a class="content-box"
																				href="${pageContext.request.contextPath}/book/book_detail.do?isbn=${item.isbn}">
																				<div class="content-box-image"
																					style="height: 350px; vertical-align: middle;">
																					<img src="${item.cover}"
																						style="height: 200px; margin-top: 20px">
																					<h4 class="content-box-title font-serif">${item.title}</h4>
																					<h5>나의 평점 ${item.value}</h5>
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
											</section>
										</div>
									</div>

									<div class="tab-pane" id="sales">
										<!-- 관심 책list  -->
										<div class="main">
											<section class="module-medium" id="demos">
												<div class="container">
													<div class="row multi-columns-row">




														<c:if test="${BI!=null}">

															<table>
																<c:forEach var="item" items="${BI}" varStatus="status">

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
																						style="height: 200px; margin-top: 20px">
																					<h4 class="content-box-title font-serif">${item.title}
																					</h4>
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
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</section>
	</div>





</body>
	<%@ include file="/WEB-INF/views/inc/bottom.jsp"%>

	<%@ include file="/WEB-INF/views/inc/script.jsp"%>
</html>
