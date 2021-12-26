<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

</head>
<body>
<%@ include file="../common/common.jsp" %>
<%@ include file="../common/header.jsp" %>

	
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
						<img src="https://mdbcdn.b-cdn.net/img/Photos/Slides/img%20(35).webp" class="d-block w-100" alt="...">
						<div class="carousel-caption d-none d-md-block" style="background: rgba(0, 0, 0, 0.5); width: 50%; display: block; margin: 0 auto; border-radius: 20px;">
							<h5>First slide label</h5>
							<p>Some representative placeholder content for the first slide.</p>
						</div>
					</div>
					<div class="carousel-item">
						<img src="https://mdbcdn.b-cdn.net/img/Photos/Slides/img%20(35).webp" class="d-block w-100" alt="...">
						<div class="carousel-caption d-none d-md-block" style="background: rgba(0, 0, 0, 0.5); width: 50%; display: block; margin: 0 auto; border-radius: 20px;">
							<h5>Second slide label</h5>
							<p>Some representative placeholder content for the second slide.</p>
						</div>
					</div>
					<div class="carousel-item">
						<img src="https://mdbcdn.b-cdn.net/img/Photos/Slides/img%20(35).webp" class="d-block w-100" alt="...">
						<div class="carousel-caption d-none d-md-block" style="background: rgba(0, 0, 0, 0.5); width: 50%; display: block; margin: 0 auto; border-radius: 20px;">
							<h5>Third slide label</h5>
							<p>Some representative placeholder content for the third slide.</p>
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
	</div>
</body>
</html>