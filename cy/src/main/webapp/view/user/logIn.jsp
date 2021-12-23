<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>LOGIN</title>
<style type="text/css">

/* 나중에 배경, input 등 꾸밀 때 사용할 css 블럭 */
body {
	padding: 8px;
}
</style>
</head>
<body>
	<!-- 로그인 페이지에는 헤더 빼고 common 만 끌어온다. -->
	<%@ include file="../common/common.jsp"%>
	<%
	// 1. 한가운데 동그라미에 로그인 창 출력 (싸이월드와 비슷하게)
	%>
	<div class="container-fluid signpagebackgroum">
		<div class="row col-12 d-flex flex-column justify-content-center" style="height: 100vh">
			<form class="border border-lightgrey rounded p-5" action="../../controller/user/logInController.jsp" method="get" style="width: 50%; display: block; margin: 0 auto;">
				<div class="loginbox" style="width: 100%">
					<div class="text-center">
						<!-- 싸이월드 로고, 이미지 출력하는 부분 -->
						<img class="img-fluid" src="../../image/cy_logo2.jpg" alt="">
					</div>
					<div class="d-flex flex-column align-items-center justify-content-center" style="width: 100%">
						<div class="my-2">
							<!--  아이디 입력하는 부분 -->
							<input type="text" class="form-control" id="logInId" name="logInId" placeholder="아이디" />
						</div>
						<div class="my-2">
							<!-- 비밀번호 입력하는 부분 -->
							<input type="password" class="form-control" id="loginPassword" name="loginPassword" placeholder="비밀번호" />
						</div>
						<input type="submit" class="form-control btn my-2" value="로그인" style="width: 13rem; background-color: orange; color: white;" />
						<!-- 로그인 버튼 -->
						<div class="row text-center my-2" style="width: 80%">
							<!-- 아이디, 비밀번호 찾기와 회원가입 부분 -->
							<div class="col-md-6">
								<a href="#" class="text-info">아이디/비밀번호 찾기</a>
							</div>
							<div class="col-md-6">
								<a href="signUp.jsp" class="text-success">회원가입</a>
							</div>
						</div>
					</div>
				</div>
			</form>
		</div>
	</div>
</body>
</html>