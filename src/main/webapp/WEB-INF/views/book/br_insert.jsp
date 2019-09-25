<%@page import="pocketLib.spring.pocketLibSpring.helper.WebHelper"%>
<%@page import="pocketLib.spring.pocketLibSpring.mybatis.model.Customer"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- favicon -->
<%@ include file="/WEB-INF/views/inc/favicon.jsp"%>
<!-- Stylesheets -->
<%@ include file="/WEB-INF/views/inc/style.jsp"%>


<script>
	function rank_reg() {
		if (document.form.date.value == "") {
			var check = confirm("날짜가 입력되지 않았습니다. 오늘 날짜로 등록하시겠습니까?");
			if (check == true) {
				opener.location.reload();
				window.close();
				return true;
			} else {
				return false;
			}

		} else {
			alert("평점이 등록되었습니다.");
			opener.location.reload();
			window.close();
		}
	}
</script>

</head>

<body data-spy="scroll" data-target=".onpage-navigation"
	data-offset="60">

	<div class="main">
		<section class="module">

			<div class="container">
				<form method="post" name="form" onsubmit="return rank_reg()"
					action="rank_ok.do?isbn=${isbn}">

					<h4 class="font-alt mb-0">읽은 날짜 등록</h4>
					<hr class="divider-w mt-10 mb-20">

					<input type="date" name="date" id="date"  max="today" min="min" >
			</div>
			<div class="container">
				<h4 class="font-alt mb-0">평점등록</h4>
				<hr class="divider-w mt-10 mb-20">

				<input type="hidden" id="userno" name="userno"
					value="${userInfo.userno}"> <input type="radio" id="value"
					name="value" value="10" checked>10점 <input type="radio"
					id="value" name="value" value="9">9점 <input type="radio"
					id="value" name="value" value="8">8점 <input type="radio"
					id="value" name="value" value="7">7점 <input type="radio"
					id="value" name="value" value="6">6점 <input type="radio"
					id="value" name="value" value="5">5점 <input type="radio"
					id="value" name="value" value="4">4점 <input type="radio"
					id="value" name="value" value="3">3점 <input type="radio"
					id="value" name="value" value="2">2점 <input type="radio"
					id="value" name="value" value="1">1점
				<button type="submit" class="btn btn-g btn-round btn-xs">평점등록</button>
				</form>
			</div>
		</section>
	</div>
</body>
<script>
	var today = new Date();
	var dd = today.getDate();
	var mm = today.getMonth() + 1;
	var yyyy = today.getFullYear();
	if (dd < 10) {
		dd = '0' + dd
	}
	if (mm < 10) {
		mm = '0' + mm
	}

	today = yyyy + '-' + mm + '-' + dd;
	
	var min = new Date();
	var yyyy = 1900;
	var mm = '0' + 1;
	var dd = '0' + 1;
	min = yyyy+'-'+mm+'-'+dd;
	document.getElementById("date").setAttribute("min", min);
	document.getElementById("date").setAttribute("max", today);
</script>

</html>
