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
					action="${pageContext.request.contextPath}/login/myPageEditOk.do"
					name="form">
					<table class="table table-hover">
						<thead>
							<h3>${userInfo.userName}님의정보수정창입니다.</h3>
						</thead>
						<tbody>

							<tr>
								<td>비밀번호 수정</td>
								<td colspan="8"><input class="form-control" id="password"
									type="password" name="password" placeholder="Password"
									maxlength="20" /></td>
							</tr>
							<tr>
								<td>비밀번호 수정 확인</td>
								<td colspan="8"><input class="form-control" type="password"
									id="password1" name="password1" maxlength="20"
									placeholder="Password"></td>
							</tr>
							<tr>
								<td>이름</td>
								<td colspan="6"><input class="form-control" type="text"
									id="userName" name="userName" maxlength="20"
									value="${userInfo.userName}"></td>
								<td>성별</td>
								<td>
									<div class="form-group"
										style="text-align: center; margin: 0 auto;">
										<label> <input type="radio" name="userGender"
											autocomplete="off" value="남자"
											<c:if test ="${userInfo.gender eq '남자'}">checked</c:if> />남자
										</label> <label> <input type="radio" name="userGender"
											autocomplete="off" value="여자"
											<c:if test ="${userInfo.gender eq '여자'}">checked</c:if> />여자
										</label>
									</div>
								</td>
							</tr>
							<tr>
								<td>생년월일</td>
								<td colspan="2"><select id="user_birth_year"
									name="user_birth_year">
										<option value="1970">1970</option>
										<option value="1971">1971</option>
										<option value="1972">1972</option>
										<option value="1973">1973</option>
										<option value="1974">1974</option>
										<option value="1975">1975</option>
										<option value="1976">1976</option>
										<option value="1977">1977</option>
										<option value="1978">1978</option>
										<option value="1979">1979</option>
										<option value="1980">1980</option>
										<option value="1981">1981</option>
										<option value="1982">1982</option>
										<option value="1983">1983</option>
										<option value="1984">1984</option>
										<option value="1985">1985</option>
										<option value="1986">1986</option>
										<option value="1987">1987</option>
										<option value="1988">1988</option>
										<option value="1989">1989</option>
										<option value="1990">1990</option>
										<option value="1991">1991</option>
										<option value="1992">1992</option>
										<option value="1993">1993</option>
										<option value="1994">1994</option>
										<option value="1995">1995</option>
										<option value="1996">1996</option>
										<option value="1997">1997</option>
										<option value="1998">1998</option>
										<option value="1999">1999</option>
										<option value="2000">2000</option>
										<option value="2001">2001</option>
										<option value="2002">2002</option>
										<option value="2003">2003</option>
										<option value="2004">2004</option>
										<option value="2005">2005</option>
										<option value="2006">2006</option>
										<option value="2007">2007</option>
										<option value="2008">2008</option>
										<option value="2009">2009</option>
										<option value="2010">2010</option>
										<option value="2011">2011</option>
										<option value="2012">2012</option>
										<option value="2013">2013</option>
										<option value="2014">2014</option>
										<option value="2015">2015</option>
										<option value="2016">2016</option>
								</select>년</td>
								<td colspan="2"><select id="user_birth_month"
									name="user_birth_month">
										<option value="1">1</option>
										<option value="2">2</option>
										<option value="3">3</option>
										<option value="4">4</option>
										<option value="5">5</option>
										<option value="6">6</option>
										<option value="7">7</option>
										<option value="8">8</option>
										<option value="9">9</option>
										<option value="10">10</option>
										<option value="11">11</option>
										<option value="12">12</option>
								</select>월</td>
								<td colspan="2"><select id="user_birth_day"
									name="user_birth_day">
										<option value="1">1</option>
										<option value="2">2</option>
										<option value="3">3</option>
										<option value="4">4</option>
										<option value="5">5</option>
										<option value="6">6</option>
										<option value="7">7</option>
										<option value="8">8</option>
										<option value="9">9</option>
										<option value="10">10</option>
										<option value="11">11</option>
										<option value="12">12</option>
										<option value="13">13</option>
										<option value="14">14</option>
										<option value="15">15</option>
										<option value="16">16</option>
										<option value="17">17</option>
										<option value="18">18</option>
										<option value="19">19</option>
										<option value="20">20</option>
										<option value="21">21</option>
										<option value="22">22</option>
										<option value="23">23</option>
										<option value="24">24</option>
										<option value="25">25</option>
										<option value="26">26</option>
										<option value="27">27</option>
										<option value="28">28</option>
										<option value="29">29</option>
										<option value="30">30</option>
										<option value="31">31</option>
								</select>일</td>
								<td colspan="2"></td>
							</tr>
							<tr>
								<td>이메일</td>
								<td colspan="8"><input class="form-control" id="email"
									type="email" name="email" value="${userInfo.email}"
									maxlength="20" /></td>
							</tr>
							<tr>
								<td style="text-align: center;" colspan="9"><input
									class="btn btn-b btn-round" type="submit" value="수정" /></td>
							</tr>
						</tbody>
					</table>
				</form>
			</div>
		</section>

		<%@ include file="/WEB-INF/views/inc/bottom.jsp"%>

	</div>
	</main>

	<%@ include file="/WEB-INF/views/inc/script.jsp"%>

</body>
</html>