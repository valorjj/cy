<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
	<div class="container">
		<div class="row col-8" style="display: block; margin: 0 auto;">
			<ul class="d-flex my-2 text-warning">
				<li class="mx-3" style="list-style: none;"><a
					href="./signhome.jsp" style="color: black;">홈</a></li>
				<li class="mx-3 active"
					style="border-bottom: solid 1px #000; list-style: none;"><a
					href="./logIn.jsp" style="color: orange">로그인</a></li>
			</ul>
			<div class="title text-center" style="width: 100%;">
				<p class="my-2 h3">싸이월드에 오신 것을 환영합니다</p>
				<p class="my-2 h5">
					<span class="mr-2" style="font-weight: bold;">지금 회원가입하신 후</span> <span
						class="text-warning">싸이월드의 다양한 서비스를</span> 만나보세요
				</p>
			</div>
		</div>
		<hr />
		<div class="row offset-3 my-4 p-1">
			<form action="../../controller/user/logInController.jsp" method="get">
				<div>
					<div class="">
						<!-- 싸이월드 로고, 이미지 출력하는 부분 -->
						<img src="../../image/cy_logo2.jpg" alt="" />
					</div>
					<div class="my-2 input-group-lg">
						<!--  아이디 입력하는 부분 -->
						<input type="text" class="form-control" id="logInId"
							name="logInId" placeholder="아이디" />
					</div>
					<div class="my-2 input-group-lg">
						<!-- 비밀번호 입력하는 부분 -->
						<input type="password" class="form-control" id="loginPassword"
							name="loginPassword" placeholder="비밀번호" />
					</div>
					<input type="submit" class="form-control btn btn-warning w-50 my-2"
						value="로그인" style="display: block; margin: 0 auto;" />
					<!-- 로그인 버튼 -->
					<div
						class="my-3 d-flex flex-column justify-content-center align-items-center">
						<div class="my-1 col-12 d-flex align-self-between">
							<label class="align-self-center col-6" for="">아직도 싸이월드
								회원이 아니신가요?</label> <a href="./signUp.jsp" class="col-6"
								style="width: 100%">
								<button type="button" class="btn btn-outline-warning"
									style="width: 100%">회원가입</button>
							</a>
						</div>
						<div class="my-1 col-12 d-flex align-self-between">
							<label class="align-self-center col-6" for="">회원아이디 또는
								비밀번호를 잊으셨나요?</label> <a href="" class="col-6" style="width: 100%">
								<button type="button" class="btn btn-outline-warning"
									style="width: 100%">아이디 / 비밀번호찾기</button>
							</a>
						</div>
					</div>
				</div>
			</form>
		</div>
	</div>
</body>
</html>