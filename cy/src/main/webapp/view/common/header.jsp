
<%@page import="dto.OtherSession"%>
<%@page import="dto.LogInSession"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<body>

	<%@ include file="common.jsp"%>
	<%
	// user_no 필요해서 만듬 조지훈 12.23
	LogInSession logInSession = (LogInSession) session.getAttribute("logIn");
	String loginid = null;

	loginid = logInSession.getUser_id();
	int user_no = logInSession.getUser_no();

	// 조지훈 12.23 end

	// 검색한 아이디로 넘어갈때 조지훈 12.24
	OtherSession otherSession = (OtherSession) session.getAttribute("other");
	// 조지훈 12.24 end

	// 유저 검색, 일촌 파도타기, 로그아웃
	%>

	<div class="container" style="background-color: #cccccc">
		<!-- 헤더 박스권 생성 -->

		<!-- <form action="../../controller/user/searchUserController.jsp" method="post"> <!-- 검색 후 검색 컨트롤러로 이동 -->
		<!-- 			<div class="row">
				<div class="col-md-6 input-group my-1 p-1">
					<div class="row">
						<div class="col-md-8">
							<input type="text" class="form-control p-2" id="other" name="other"/> -->


		<form action="../main/test.jsp" method="post">
			<!-- 검색 후 검색 컨트롤러로 이동 -->
			<div class="row">
				<div class="col-md-6 input-group my-1 p-1">
					<div class="row">
						<div class="col-md-6">
							<input type="text" class="form-control p-2" id="" name="userNo" />
						</div>
						<div class="col-md-3">
							<input type="submit" class="form-control btn btn-outline-success"
								value="검색" />
							<!-- ajax 거쳐서 다시 페이지를 로드하는데, 검색한 user_no 혹은 user_id 인수로 건네 받은채로 로드 -->

						</div>
						<div class="col-md-3">
							<div class="row" style="font-size: 12px; font-weight: bold;">접속한
								아이디</div>
							<div class="row" style="color: orange;"><%=loginid%></div>
						</div>
					</div>
				</div>
				<div class="col-md-6 d-flex justify-content-around">
					<div class="row">
						<div>
							<a href="#" class="text-dark">일촌 파도 타기</a>
						</div>
						<div>
							<a href="#" class="text-dark">내 홈페이지</a>
						</div>
						<div>
							<a href="#" class="text-dark">일촌보기</a>
						</div>
						<div>
							<a href="../../controller/user/logOutController.jsp"
								class="text-dark">로그아웃</a>
						</div>
					</div>
				</div>
			</div>
		</form>
	</div>



</body>
</html>