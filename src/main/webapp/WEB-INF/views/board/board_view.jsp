<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en-US" dir="ltr">
<head>
<script>
	function edit_box() {
		$(".cmt_edit_box").click(function() {
			var clickedID = this.id;
			$("." + clickedID).css("display", "block");
		});
	}
	function edit_box_visible() {
		$(".cmt_edit_box_visible").click(function() {
			var clickedID = this.id;
			$("." + clickedID).css("display", "none");
		});
	}
	function reply_box() {
		$(".cmt_reply_box").click(function() {
			var clickedID = this.id;
			$("." + clickedID).css("display", "block");
		});
	}
	function reply_box_visible() {
		$(".cmt_reply_box_visible").click(function() {
			var clickedID = this.id;
			$("." + clickedID).css("display", "none");
		});
	}
</script>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!--  
    Document Title
    =============================================
    -->

<c:choose>
	<c:when test="${boardCate ==1}">
		<title>Community > ${output.title} | pocketLib</title>
	</c:when>
	<c:when test="${boardCate ==2}">
		<title>Book Review Board > ${output.title} | pocketLib</title>
	</c:when>
	<c:otherwise>
		<title>Q&A > ${output.title} | pocketLib</title>
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
		<section class="module-small">
			<div class="container">
				<h3>${output.title}</h3>
				<hr />
				<div class="col-sm-15 mb-sm-1">
					<form class="row">

						<div class="col-sm-1 mb-sm-3">${output.userId }</div>
						<div class="col-sm-1 mb-sm-2">
							<i class="fa fa-comment">${commentList.size()}</i>
						</div>
						<div class="col-sm-1 mb-sm-2">
							<i class="fa fa-eye">${output.hits }</i>
						</div>
						<div class="col-sm-1 mb-sm-2">
							<i class="fa fa-thumbs-up">${output.love }</i>
						</div>
						<i class="fa fa-thumbs-down">${output.hate }</i>

						<div class="col-sm-2.5 mb-sm-10 pull-right">
							<i class="pull-right time">${output.reg_date }</i>
						</div>

					</form>
				</div>
				<c:choose>
				<c:when test="${output.boardCate ==2}">
				<div>
				<a
					href="${pageContext.request.contextPath}/book/book_detail.do?isbn=${output.isbn}">
					<img src="${bookCover}" height="150">
				</a>
				<h4>${bookTitle}</h4>
				</div></c:when>
				</c:choose>

				<div class="contents-view">
					<div class="post-content">${output.content}</div>
				</div>
				<div class="recommend"
					style="margin-top: 20px; margin-bottom: 20px; text-align: center;">
					<a
						href="${pageContext.request.contextPath}/board/love_hate_ok.do?boardCate=${boardCate}&boardNo=${boardno}&type=0"><button
							class="btn btn-border-d btn-circle" id="like" title="추천하기">
							<span class="post-like">${output.love}</span><br /> <i
								class="fa fa-thumbs-o-up fa-lg"></i>
						</button></a> <a
						href="${pageContext.request.contextPath}/board/love_hate_ok.do?boardCate=${boardCate}&boardNo=${boardno}&type=1"><button
							class="btn btn-border-d btn-circle" id="dislike" title="비추하기">
							<span class="post-dislike">${output.hate}</span> <br /> <i
								class="fa fa-thumbs-o-down fa-lg"></i>
						</button></a>
				</div>
				<div class="border_button">
					<div class="pull-left mr10">
						<p class="btn-list">

							<c:if test="${totalCount > 0}">
								<c:if test="${userInfo.getUserno() == output.userNo}">
									<a
										href="${pageContext.request.contextPath}/board/board_edit.do?boardCate=${boardCate}&boardNo=${boardno}">
										<button class="btn btn-g btn-round btn-xs" type="submit">수정</button>
									</a>
									<button class="btn btn-g btn-round btn-xs"
										onclick="if(confirm('한번 삭제한 데이터는 복구할수 없습니다. 삭제하시겠습니까?'))location.href='${pageContext.request.contextPath}/board/board_delete_ok.do?boardCate=${boardCate }&boardNo=${boardno}';"
										type="submit">삭제</button>
								</c:if>
							</c:if>
							<a
								href="${pageContext.request.contextPath}/board/board_list.do?boardCate=${boardCate}&searchList=${keywordOption }&keyword=${keyword }&sortCate=${sortCate}"><button
									class="btn btn-g btn-round btn-xs" type="submit">목록</button></a>
						</p>
					</div>
					<div class="pull-right">
						<p class="btn-list">
							<a href="${pageContext.request.contextPath}/login/show.do"> <c:choose>
									<c:when test="${userInfo != null}">
										<a
											href="${pageContext.request.contextPath}/board/board_add.do?boardCate=${boardCate}">
											<button class="btn btn-success btn-round btn-xs"
												type="submit">글쓰기</button>
										</a>
									</c:when>
									<c:otherwise>
										<a href="${pageContext.request.contextPath}/login/show.do">
											<button class="btn btn-success btn-round btn-xs"
												onclick="if(alert('비회원은 글쓰기가 불가능합니다. 로그인 해주세요.'));"
												type="submit">글쓰기</button>
										</a>
									</c:otherwise>
								</c:choose>
							</a>
						</p>
					</div>
				</div>
			</div>
		</section>
		<section class="module-extra-small">
			<div class="container">
				<div id="viewcomment">

					<c:choose>
						<c:when test="${commentList.size() == 0}">
							<h4 style="text-align: center; margin-bottom: 40px;">댓글이없습니다.</h4>
						</c:when>
						<c:otherwise>
							<c:forEach var="item" items="${commentList}" varStatus="status">
								<c:set var="userId" value="${item.userId}" />
								<c:set var="cmt_reg_date" value="${item.cmt_reg_date}" />
								<c:set var="cmt_love" value="${item.cmt_love}" />
								<c:set var="cmt_hate" value="${item.cmt_hate}" />
								<c:set var="cmt_content" value="${item.cmt_content}" />
								<c:set var="cmtId" value="cmt-${item.cmtNo}" />
								<c:set var="cmtNo" value="${item.cmtNo}" />
								<c:set var="ccmt_ref" value="${item.ccmt_ref}" />
								<c:set var="ccmt_exist" value="${item.ccmt_exist}" />

								<div class="median" id="${cmtId}"
									style="padding-left: calc(${ccmt_exist}*30px);">
									<div class="media-body">
										<h4 class="media-heading">
											<span>${userId}</span> <span class="time"> <i
												class="fa fa-clock-o">${cmt_reg_date}</i>
											</span> <span class="reply"> <a
												href="${pageContext.request.contextPath}/board/cmt_love_hate_ok.do?boardCate=${boardCate }&cmtNo=${cmtNo }&boardNo=${boardno }&type=0">
													<i class="fa fa-thumbs-o-up fa-xs">추천 </i> <span>${cmt_love }</span>
											</a> <a
												href="${pageContext.request.contextPath}/board/cmt_love_hate_ok.do?boardCate=${boardCate }&cmtNo=${cmtNo }&boardNo=${boardno }&type=1">
													<i class="fa fa-thumbs-o-down fa-xs">비추천 </i> <span>${cmt_hate }</span>
											</a> <c:if test="${userInfo !=null}">
													<c:if test="${ccmt_exist == 0}">
														<a href="javascript:;" onclick="reply_box()"
															class="cmt_reply_box"
															id="comment_reply_box_inner-${cmtId}"> 답글 </a>
													</c:if>
													<c:if test="${userInfo.getUserId()== userId}">
														<a href="javascript:;" onclick="edit_box()"
															class="cmt_edit_box" id="comment_edit_box_inner-${cmtId}">수정</a>
														<a href=""
															onclick="if(confirm('이 글에 등록된 답글이 모두삭제됩니다. 삭제하시겠습니까?'))location.href='${pageContext.request.contextPath}/board/cmt_delete_ok.do?boardCate=${boardCate }&boardNo=${boardno }&cmtNo=${cmtNo }';">
															삭제 </a>
													</c:if>
												</c:if>
											</span>
										</h4>
										${cmt_content }
										<div id="comment_edit_box">
											<div class="well comment_edit_box_inner-${cmtId}"
												style="display: none;">
												<form
													action="${pageContext.request.contextPath}/board/cmt_edit_ok.do?boardCate=${boardCate }&boardNo=${boardno }&cmtNo=${cmtNo}"
													name="editcomment" id="editcomment" method="post"
													accept-charset="utf-8" novalidate="novalidate">
													<input type="hidden" name="boardNo" id="boardNo"
														value="${boardno}" /> <input type="hidden"
														name="boardCate" id="boardCate" value="${boardCate }" />
													<textarea class="form-control" name="cmt_content"
														id="cmt_content" rows="5"></textarea>
													<div class="comment_write_button_area"
														style="margin-top: 20px; overflow: hidden;">
														<div class="form-group pull-right">
															<button type="submit" class="btn btn-b btn-round btn-xs">댓글수정</button>
															<a href="javascript:;" onclick="edit_box_visible()"
																class="cmt_edit_box_visible"
																id="comment_edit_box_inner-${cmtId}">
																<button type="button" class="btn btn-b btn-round btn-xs">취소</button>
															</a>
														</div>
													</div>
												</form>
											</div>
										</div>
										<div id="comment_reply_box">
											<div class="well comment_reply_box_inner-${cmtId }"
												style="display: none;">
												<form
													action="${pageContext.request.contextPath}/board/ccmt_add_ok.do?boardCate=${boardCate }&boardNo=${boardno }&cmtNo=${cmtNo}"
													name="replycomment" id="replycomment" method="post"
													accept-charset="utf-8" novalidate="novalidate">
													<input type="hidden" name="boardNo" id="boardNo"
														value="${boardno }" /> <input type="hidden"
														name="boardCate" id="boardCate" value="${boardCate }" />
													<textarea class="form-control" name="cmt_content"
														id="cmt_content" rows="5"></textarea>
													<div class="comment_write_button_area"
														style="margin-top: 20px; overflow: hidden;">
														<div class="form-group pull-right">
															<button type="submit" class="btn btn-b btn-round btn-xs">답글달기</button>
															<a href="javascript:;" onclick="reply_box_visible()"
																class="cmt_reply_box_visible"
																id="comment_reply_box_inner-${cmtId }">
																<button type="button" class="btn btn-b btn-round btn-xs">취소</button>
															</a>
														</div>
													</div>
												</form>
											</div>
										</div>

									</div>
								</div>
								<hr />
							</c:forEach>
						</c:otherwise>
					</c:choose>

				</div>
				<c:choose>
					<c:when test="${userInfo != null}">
						<div id="comment_write_box">
							<div class="well comment_write_box_inner">
								<form
									action="${pageContext.request.contextPath}/board/cmt_add_ok.do"
									name="fcomment" id="fcomment" method="post"
									accept-charset="utf-8" novalidate="novalidate">
									<input type="hidden" name="boardNo" id="boardNo"
										value="${boardno }" /> <input type="hidden" name="boardCate"
										id="boardCate" value="${boardCate }" />
									<textarea class="form-control" name="cmt_content"
										id="cmt_content" rows="5"></textarea>
									<div class="comment_write_button_area"
										style="margin-top: 20px; overflow: hidden;">
										<div class="form-group pull-right">
											<button type="submit" class="btn btn-b btn-round btn-xs">댓글등록</button>
										</div>

										<div class="form-group pull-left">
											현재 글자수 <span id="counter">(0 /최대 200자) </span>
										</div>
									</div>
								</form>
							</div>
						</div>
					</c:when>
					<c:otherwise>
						<div class="median" id="???" style="padding-left: 0px;">
							<div class="media-body">
								<h4 style="text-align: center; margin-bottom: 40px;">
									<a href="${pageContext.request.contextPath}/login/show.do">로그인</a>을하시면
									댓글을 등록할 수 있습니다.
								</h4>
							</div>
						</div>
					</c:otherwise>
				</c:choose>
			</div>
		</section>
	</div>

	<%@ include file="/WEB-INF/views/inc/bottom.jsp"%>


	<%@ include file="/WEB-INF/views/inc/script.jsp"%>

</body>

</html>