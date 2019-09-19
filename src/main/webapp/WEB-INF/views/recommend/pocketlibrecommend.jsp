<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

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

		<title>Recommend Book | pocketLib</title>

<!-- favicon -->
<%@ include file="/WEB-INF/views/inc/favicon.jsp" %>
	
<!-- Stylesheets -->
<%@ include file="/WEB-INF/views/inc/style.jsp" %>

</head>
<body data-spy="scroll" data-target=".onpage-navigation"
	data-offset="60">
	<main>
	<div class="page-loader">
		<div class="loader">Loading...</div>
	</div>
	
	
	<!-- Nav bar --> <%@ include file="/WEB-INF/views/inc/navbar.jsp"%>
	
	
	
	<div class="main">
	<hr class="divider-w">
        <section class="module-small">
          <div class="container">
            <div class="row">
              <div class="col-sm-7 col-sm-offset-2">
                <h2 class="module-title font-alt">지금 뜨는 도서</h2>
                <div class="module-subtitle font-serif">최근 한달 동안 내 책장에 많이 추가된 도서 목록입니다.</div>
              </div>
            </div>
            <div class="row">
              <div class="owl-carousel text-center" data-items="4" data-pagination="false" data-navigation="false">
              <c:forEach var="item" items="${output}" varStatus="status">
                <div class="owl-item">
                  <div class="col-sm-12">
                    <div class="ex-product"><a href="${pageContext.request.contextPath}/book/book_detail.do?isbn=${item.isbn}">
                    	<img src="${item.cover}" alt="Leather belt" style="height:250px; width:180px;"/></a>
                      <h4 class="shop-item-title font-alt"><a href="${pageContext.request.contextPath}/book/book_detail.do?isbn=${item.isbn}"><span class="btn btn-d btn-xs">${status.index+1}</span></a></h4>
                    </div>
                  </div>
                </div>
                </c:forEach>
                </div>
              </div>
          </div>
        </section>
        
        <section class="module-small">
          <div class="container">
            <div class="row">
              <div class="col-sm-7 col-sm-offset-2">
                <h2 class="module-title font-alt">PocketLib 인기 도서</h2>
                <div class="module-subtitle font-serif">PocketLib에서 가장 인기있는 도서 목록입니다.</div>
              </div>
            </div>
            <div class="row">
              <div class="owl-carousel text-center" data-items="4" data-pagination="false" data-navigation="false">
              <c:forEach var="item" items="${output2}" varStatus="status">
                <div class="owl-item">
                  <div class="col-sm-12">
                    <div class="ex-product"><a href="${pageContext.request.contextPath}/book/book_detail.do?isbn=${item.isbn}">
                    	<img src="${item.cover}" alt="Leather belt" style="height:250px; width:180px;"/></a>
                      <h4 class="shop-item-title font-alt"><a href="${pageContext.request.contextPath}/book/book_detail.do?isbn=${item.isbn}"><span class="btn btn-d btn-xs">${status.index+1}</span></a></h4>
                    </div>
                  </div>
                </div>
                </c:forEach>
                </div>
              </div>
          </div>
        </section>
        
        <c:choose>
        	<c:when test="${userInfo!=null}">
        	 <section class="module-small">
          <div class="container">
            <div class="row">
              <div class="col-sm-7 col-sm-offset-2">
                <h2 class="module-title font-alt">${userInfo.userName}님을 위한 맞춤 추천 </h2>
                <div class="module-subtitle font-serif">${userInfo.userName}님이 최근 읽으신 책과 비슷한 카테고리의 도서 목록입니다.</div>
              </div>
            </div>
            <div class="row">
              <div class="owl-carousel text-center" data-items="4" data-pagination="false" data-navigation="false">
              <c:forEach var="item" items="${randomBook}" varStatus="status">
                <div class="owl-item">
                  <div class="col-sm-12">
                    <div class="ex-product"><a href="${pageContext.request.contextPath}/book/book_detail.do?isbn=${item.isbn}">
                    	<img src="${item.cover}" alt="Leather belt" style="height:250px; width:180px;"/></a>
                      <h4 class="shop-item-title font-alt"><a href="${pageContext.request.contextPath}/book/book_detail.do?isbn=${item.isbn}"><span class="btn btn-d btn-xs">${status.index+1}</span></a></h4>
                    </div>
                  </div>
                </div>
                </c:forEach>
                </div>
              </div>
          </div>
        </section>
        	</c:when>
        	<c:otherwise>
        	 <section class="module-small">
          <div class="container">
            <div class="row">
              <div class="col-sm-7 col-sm-offset-2">
                <h2 class="module-title font-alt">당신을 위한 맞춤 추천 </h2>
                <div class="module-subtitle font-serif"><a href="${pageContext.request.contextPath}/login/show.do">로그인</a> 후에 시작됩니다.</div>
              </div>
            </div>
            
          </div>
        </section>
        	</c:otherwise>
        </c:choose>
        

        	<c:if test="${userInfo!=null}">
        	 <section class="module-small">
          <div class="container">
            <div class="row">
              <div class="col-sm-7 col-sm-offset-2">
                <h2 class="module-title font-alt">${userInfo.userName}님을 위한 관심 도서 추천 </h2>
                <div class="module-subtitle font-serif">${userInfo.userName}님이 선택하신 관심 도서와 비슷한 카테고리의 도서 목록입니다.<br/>
                	<h5>새로고침하시면 새로운 목록을 불러올 수 있습니다.</h5>
                </div>
              </div>
            </div>
            <div class="row">
              <div class="owl-carousel text-center" data-items="4" data-pagination="false" data-navigation="false">
              <c:forEach var="item" items="${InterestedBook}" varStatus="status">
                <div class="owl-item">
                  <div class="col-sm-12">
                    <div class="ex-product"><a href="${pageContext.request.contextPath}/book/book_detail.do?isbn=${item.isbn}">
                    	<img src="${item.cover}" alt="Leather belt" style="height:250px; width:180px;"/></a>
                      <h4 class="shop-item-title font-alt"><a href="${pageContext.request.contextPath}/book/book_detail.do?isbn=${item.isbn}"><span class="btn btn-d btn-xs">${status.index+1}</span></a></h4>
                    </div>
                  </div>
                </div>
                </c:forEach>
                </div>
              </div>
          </div>
        </section>
        	</c:if>
 
        
        </div>

	
	
	</main>
		

</body>

<%@ include file="/WEB-INF/views/inc/bottom.jsp" %>
<%@ include file="/WEB-INF/views/inc/script.jsp"%>
</html>