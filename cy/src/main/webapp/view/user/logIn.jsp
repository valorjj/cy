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

	<%
	// 1. 한가운데 동그라미에 로그인 창 출력
	%>

	<div class="container">
		<div class="row">
			<form action="../../controller/logInController.jsp" method="get">
				<div>
					<div class="">
						<!-- 싸이월드 로고, 이미지 출력하는 부분 -->
						<img src="../../image/cy_logo2.jpg" alt="" />
					</div>
					<div class="">
						<!--  아이디 입력하는 부분 -->
						<input type="text" class="form-control logInId" id="" name=""
							placeholder="아이디" />
					</div>
					<div class="">
						<!-- 비밀번호 입력하는 부분 -->
						<input type="password" class="form-control" id="" name=""
							placeholder="비밀번호" />
					</div>
					<input type="submit" class="btn btn-secondary" />
					<!-- 로그인 버튼 -->
					<div class="row">
						<!-- 아이디, 비밀번호 찾기와 회원가입 부분 -->
						<div class="col-md-6">
							<a href="#" style="font-size: 10px;">아이디/비밀번호 찾기</a> <a
								href="signUp.jsp" style="font-size: 10px;">회원가입</a>
						</div>
					</div>
				</div>
			</form>
		</div>
	</div>

</body>
</html>