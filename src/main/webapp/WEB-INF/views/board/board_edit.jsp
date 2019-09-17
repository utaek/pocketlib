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

<title>Edit Post | pocketLib</title>

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
			<form class="row" method="post"
					action="${pageContext.request.contextPath}/board/board_edit_ok.do">
				
			<div class="container">
				<h1>자유게시판 글쓰기</h1>
				<hr />
					<label for="post-title" class="col-sm-1 control-label">제목</label>
					<div class="col-sm-8" style="display: table;">
						<input type="hidden" id="boardCate" name="boardCate"
							value="${boardCate}"> <input type="hidden" id="boardNo"
							name="boardNo" value="${boardno}"> <input
							class="form-control" type="text" name="title" id="title"
							value="${output.title}" />
					</div>
					<br>
					<div class="form-group" style="margin-top: 30px">
						<textarea name="content" class="ckeditor" name="content"
							id="content">${output.content}</textarea>
						<hr />
						<script src="//cdn.ckeditor.com/4.12.1/basic/ckeditor.js"></script>
					</div>
			</div>
			<div class="border_button">
				<div class="border_button text-center mt20">
					<p class="btn-list">
						<button class="btn btn-success btn-round btn-xs" type="submit">작성완료</button>
						<a
							href="${pageContext.request.contextPath}/board/board_list.do?boardCate=${boardCate}"><button
								class="btn btn-g btn-round btn-xs" type="button">취소</button></a>
					</p>
				</div>

			</div>
			</form>
		</section>
	</div>


	<%@ include file="/WEB-INF/views/inc/bottom.jsp"%>

	</main>
	<%@ include file="/WEB-INF/views/inc/script.jsp"%>

</body>
</html>