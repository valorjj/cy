<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>LOGIN</title>
<style type="text/css">

	.logInId{
		width: 100%;
		bordoer: none;
		cursor: pointer;
		overflow: visible;
		-ms-user-select: none;
		-webkit-user-select: none;
		user-select: none;
	}
	
	.logInId{
		outline:none;
	}
</style>
</head>
<body>
		<!-- 로그인 페이지에는 헤더 빼고 common 만 끌어온다. -->
	<%@ include file="../common/common.jsp"%>
	<%
	// 1. 한가운데 동그라미에 로그인 창 출력 (싸이월드와 비슷하게)
	%>

	<div class="container">
		<div class="row">
			<form action="../../controller/user/logInController.jsp" method="get">
				<div>
					<div class="">
						<!-- 싸이월드 로고, 이미지 출력하는 부분 -->
						<img src="../../image/cy_logo2.jpg" alt="" />
					</div>
					<div class="">
						<!--  아이디 입력하는 부분 -->
						<input type="text" class="form-control" id="logInId"
							name="logInId" placeholder="아이디" />
					</div>
					<div class="">
						<!-- 비밀번호 입력하는 부분 -->
						<input type="password" class="form-control" id="loginPassword"
							name="loginPassword" placeholder="비밀번호" />
					</div>
					<input type="submit" class="form-control" value="로그인" />
					<!-- 로그인 버튼 -->
					<div class="row">
						<!-- 아이디, 비밀번호 찾기와 회원가입 부분 -->
						<div class="col-md-6">
							<a href="#" class="text-info">아이디/비밀번호 찾기</a>
						</div>
						<div class="col-md-6">
							<a href="signUp.jsp" class="text-success">회원가입</a>
						</div>
					</div>
				</div>
			</form>
		</div>
	</div>

</body>
</html>