<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%@ include file="../common/common.jsp"%>
	<!-- 헤더 고정 -->
	<div id="header" class="wrap">
		<div class="container-fluid">
			<div class="row col-12 justify-content-end my-2">
				<ul class="d-flex text-dark">
					<li><a href="../user/login(kth).jsp">로그인</a></li>
					<li class="mx-2">|</li>
					<li><a href="">싸이월드</a></li>
					<li class="mx-2">|</li>
					<li><a href="">선물가게</a></li>
					<li class="mx-2">|</li>
					<li><a href="../user/signup(kth).jsp">회원가입</a></li>
				</ul>
			</div>
			<div class="row col-12 border-bottom">
				<div class="logo col-4 d-flex justify-content-center align-items-center">
					<a href="/cy/view/common/home.jsp">
						<img src="../../image/common/1.logo.png" alt="">
					</a>
				</div>
				<div class="search col-6 boerer d-flex">
					<div class="input-group rounded align-items-center">
						<input type="search" class="serarchborder form-control rounded" placeholder="Search" aria-label="Search" aria-describedby="search-addon" />
						<span class="input-group-text border-0 ml-2 h-40" id="search-addon">
							<i class="fas fa-search" style="cursor: pointer;"></i>
						</span>
					</div>
				</div>
				<div class="banner col-2">
					<a class="d-flex justify-content-center align-items-center h-100" href="">
						<img class="h-75 w-75" src="../../image/common/2.bn.PNG" alt="">
					</a>
				</div>
			</div>
			<div class="row col-12 border-bottom border-dark" style="height: 50px; line-height: 50px;">
				<ul class="col-10 offset-1 d-flex justify-content-around">
					<li><a href="">배경음악</a></li>
					<li><a href="">스킨</a></li>
					<li><a href="">글꼴</a></li>
					<li><a href="">미니미</a></li>
					<li><a href="">스토리룸</a></li>
				</ul>
			</div>
		</div>
		<!-- 헤더 고정 -->
</body>
</html>