
<%@page import="dto.OtherSession"%>
<%@page import="dto.LogInSession"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
</style>
</head>
<body>

	<%@ include file="common.jsp"%>
	<%
	// [팝업-미니홈페이지] 에서 모든 페이지에 포함 될 헤더파일에서 로그인 세션을 담습니다.
	if (session.getAttribute("logIn") == null) {
		out.println("<script> window.close(); </script>");
	}
	LogInSession logInSession = (LogInSession) session.getAttribute("logIn");
	String loginid = null;

	loginid = logInSession.getUser_id(); // 로그인 아이디 
	int user_no = logInSession.getUser_no();
	// OtherSession otherSession = (OtherSession) session.getAttribute("other");
	%>

	<div class="container" style="background-color: #eeeeee">
		<form action="../main/test.jsp" method="post">
			<div class="row my-3 p-1">
				<div class="col-md-5">
					<div class="row">
						<div class="col-md-6">
							<input type="text" class="form-control" id="userSearch"
								name="userSearch" onchange="detectAnyInput();" />
						</div>
						<div class="col-md-3">
							<input id="searchBtn" type="submit"
								class="form-control btn btn-secondary btn-sm" value="검색" />
						</div>
						<div class="col-md-3">
							<div class="row" style="font-size: 12px; font-weight: bold;">접속한
								아이디</div>
							<div class="row" style="color: orange;"><%=loginid%></div>
						</div>
					</div>
				</div>
				<div class="col-md-7 d-flex justify-content-around">
					<div class="row">
						<div class="col-md-3">
							<a href="#" class="text-dark" style="font-size: 1.2rem;">일촌
								파도 타기</a>
						</div>
						<div class="col-md-3">
							<a href="" class="text-dark" style="font-size: 1.2rem;">마이홈</a>
						</div>
						<div class="col-md-3">
							<a href="#" class="text-dark" style="font-size: 1.2rem;">일촌보기</a>
						</div>
						<div class="col-md-3">
							<a href="../../controller/user/logOutController.jsp"
								class="text-dark" style="font-size: 1.2rem;">로그아웃</a>
						</div>
					</div>
				</div>
			</div>
		</form>
	</div>

	<script type="text/javascript">
		function detectAnyInput() {

/* 			if ($("#userSearch").val().trim() == "") {
				$("#searchBtn").attr('disabled', 'disabled');
			} else {
				$("#searchBtn").attr('disabled', '');
			} */

		}
	</script>



</body>
</html>