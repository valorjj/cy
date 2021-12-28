<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%@ include file="../common/common.jsp"%>
	<%@ include file="../common/header(kth).jsp"%>
	<%
	// 로그인[세션]이 되어 있는경우
	if (logInId != null) {
		out.print("<script>alert('로그인이 되어있습니다.');</script>");
		out.println("<script>location.href='../main(kth).jsp';</script>");
	}
	%>
	<!-- 로그인 페이지 -->
	<div id="login" class=wrap>
		<div class="container">
			<div class="row col-12 d-flex flex-column">
				<ul class="d-flex my-2">
					<li class="mx-3 "><a href="../common/home.jsp">홈</a></li>
					<li class="mx-3 active" style="border-bottom: solid 1px #000;"><a href="./login(kth).jsp">로그인</a></li>
				</ul>
				<h1 class="my-2" style="font-size: 30px;">로그인</h1>
				<div class="row login col-12 border">
					<div class="col-6 d-flex flex-column justify-content-center align-items-center" style="height: 100%;">
						<div class="row col-12">
							<form class="col-12 mt-3" action="../../controller/user/logInController.jsp" method="get" style="height: auto;">
								<h1 class="my-3 text-center border-bottom" style="font-size: 1.5rem;">회원 로그인</h1>
								<input id="logInId" name="logInId" class="my-3 form-control" type="text" placeholder="아이디를 입력해주세요.">
								<input id="loginPassword" name="loginPassword" class="my-3 form-control" type="password" style="width: 100%; font-family: '나눔';" placeholder="비밀번호를 입력해주세요.">
								<div class="my-2" style="height: 50px;">
									<button type="submit" class="form-control btn btn-warning" style="background: orange; color: white; height: 90%;">로그인</button>
								</div>
								<div class="mt-1 d-flex flex-column justify-content-center align-items-center">
									<div class="my-1 col-12 d-flex align-self-between">
										<label class="align-self-center col-6" for="">아직도 싸이월드 회원이 아니신가요?</label>
										<a href="./signUp.jsp" class="col-6" style="width: 100%">
											<button type="button" class="btn btn-outline-warning" style="width: 100%">회원가입</button>
										</a>
									</div>
									<div class="my-1 col-12 d-flex align-self-between">
										<label class="align-self-center col-6" for="">회원아이디 또는 비밀번호를 잊으셨나요?</label>
										<a href="" class="col-6" style="width: 100%">
											<button type="button" class="btn btn-outline-warning" style="width: 100%">아이디 / 비밀번호찾기</button>
										</a>
									</div>
								</div>
							</form>
						</div>
					</div>
					<div class="col-6" style="position: relative;">
						<div style="position: absolute; top: 20%; left: 50%; transform: translate(-50%, -50%); font-weight: bold; line-height: 20px; background: rgba(0, 0, 0, 0.5); border-radius: 10px; width: 60%; text-align: center; padding: 1rem 0; color: white;">
							<span>가입만 해도</span>
							<br>
							<span>바로 이용 가능한</span>
							<br>
							<span>300도토리를</span>
							<br>
							<span>지급해 드립니다.</span>
						</div>
						<div class="text-center">
							<img src="../../image/common/3.login.png" alt="" style="width: 100%; height: 100%;">
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- 액티브 -->
	<script>
		const li = document.querySelector('.active');
		const li2 = document.querySelector('.active2');
		li.style.color = 'orange';
		li2.style.color = 'orange';
	</script>
</body>
</html>