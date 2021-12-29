<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- 로그인 페이지에는 헤더 빼고 common 만 끌어온다. -->
	<%@ include file="../common/common.jsp"%>
	<!-- 헤더 고정 -->
	<div id="header" class="wrap">
		<div class="container-fluid">
			<div class="row col-12 justify-content-end my-2">
				<ul class="d-flex text-dark">
					<li><a href="#">싸이월드</a></li>
					<li class="mx-2">|</li>
					<li><a href="./signUp.jsp">회원가입</a></li>
					<li class="mx-2">|</li>
					<li><a href="./logIn.jsp">로그인</a></li>
				</ul>
			</div>
			<div class="row col-12 border-bottom">
				<div class="logo col-4 offset-4 text-center">
					<a href="#" class="">
						<img src="../../image/1.logo.png" alt="">
					</a>
				</div>
			</div>
		</div>
		<!-- 헤더 고정 -->
		<!-- 캐러셀 -->
		<div id="slide" class="wrap">
			<!-- Carousel wrapper -->
			<div id="carouselExampleCaptions" class="carousel slide" data-ride="carousel">
				<ol class="carousel-indicators">
					<li data-target="#carouselExampleCaptions" data-slide-to="0" class="active"></li>
					<li data-target="#carouselExampleCaptions" data-slide-to="1"></li>
					<li data-target="#carouselExampleCaptions" data-slide-to="2"></li>
				</ol>
				<div class="carousel-inner">
					<div class="carousel-item active">
						<img src="../../image/cyworld_back3.jpg" class="d-block" alt="" style="background-repeat: no-repeat; background-position: center; background-size: cover; width: 100%">
						<div class="carousel-caption d-none d-md-block" style="background: rgba(0, 0, 0, 0.5); width: 50%; display: block; margin: 0 auto; border-radius: 20px;">
							<h5>Welcome to Cyworld !!</h5>
						</div>
					</div>
					<div class="carousel-item">
						<img src="../../image/back2.png" class="d-block w-100" alt="...">
						<div class="carousel-caption d-none d-md-block" style="background: rgba(0, 0, 0, 0.5); width: 50%; display: block; margin: 0 auto; border-radius: 20px;">
							<h5>Welcome to Cyworld !!</h5>
						</div>
					</div>
					<div class="carousel-item">
						<img src="../../image/back1.png" class="d-block w-100" alt="...">
						<div class="carousel-caption d-none d-md-block" style="background: rgba(0, 0, 0, 0.5); width: 50%; display: block; margin: 0 auto; border-radius: 20px;">
							<h5>Welcome to Cyworld !!</h5>
						</div>
					</div>
				</div>
				<button class="carousel-control-prev" type="button" data-target="#carouselExampleCaptions" data-slide="prev">
					<span class="carousel-control-prev-icon" aria-hidden="true"></span>
					<span class="sr-only">Previous</span>
				</button>
				<button class="carousel-control-next" type="button" data-target="#carouselExampleCaptions" data-slide="next">
					<span class="carousel-control-next-icon" aria-hidden="true"></span>
					<span class="sr-only">Next</span>
				</button>
			</div>
			<!-- Carousel wrapper -->
		</div>
		<!-- 캐러셀 종료 -->
		<!-- 푸터 시작 -->
		<div id="footer" class="wrap">
			<div class="container-fluid text-light" style="background: grey;">
				<div class="row justify-content-center">
					<div class="copyright text-center" style="width: 100%; height: 50px; line-height: 50px; font-size: 20px;">(주)CYWORLD</div>
					<ul class="d-flex my-1">
						<li class="mx-2">2조</li>
						<li class="mx-2">조장 : 김정진</li>
						<li class="mx-2">조원 : 신우현</li>
						<li class="mx-2">조원 : 조지훈</li>
						<li class="mx-2">조원 : 김태호</li>
					</ul>
					<div class="col-12 text-center my-1 text-dark" style="word-spacing: 10px;">
						<span>소개</span>
						<span>·</span>
						<span>도움말</span>
						<span>·</span>
						<span>개인정보처리방침</span>
						<span>·</span>
						<span>약관</span>
					</div>
				</div>
			</div>
		</div>
		<!-- 푸터 종료-->
</body>
</html>