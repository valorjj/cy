<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>미니 홈페이지에 접근하는 화면</title>
<link rel="stylesheet" href="../../css/common/miniHome.css" />
<link rel="stylesheet" href="../../css/common/canvas.css" />
</head>
<body>

	<canvas id="canvas"></canvas>
	<%@ include file="../common/newHeader.jsp"%>
	<!-- 버튼을 누르면 미니 홈페이지를 출력합니다. -->
	<div class="container">
		<div class="row rowborder">
			<div class="col-md-6 my-4 p-4 myinfo" style="border: 1px solid #eeeeee; box-shadow: 2px 2px 2px black;">
				<div class="row my-2 p-2">
					<div class="col-md-8 text-center">
						<span style="color: orange; font-weight: bold"><%=user_id%></span>
						님의 싸이월드
					</div>
					<div class="col-md-4">
						<a href="logOut.jsp">
							<button type="button" class="btn btn-secondary btn-sm">로그아웃</button>
						</a>
					</div>
				</div>
				<div class="row my-2 p-2">
					<div class="col-md-6 glass" style="border: 1px solid #eeeeee;">
						<img src="../../image/minime.png" alt="" style="max-width: 100%;" />
					</div>
					<div class="col-md-6 mystat">
						<div class="row">
							<div class="col-md-8">오늘 방문자수</div>
							<div class="col-md-4" style="color: orange;">0</div>
						</div>
						<div class="row">
							<div class="col-md-8">새 게시물</div>
							<div class="col-md-4" style="color: orange;">0</div>
						</div>
						<div class="row">
							<div class="col-md-8">일촌신청</div>
							<div class="col-md-4" style="color: orange;">0</div>
						</div>
						<div class="row">
							<div class="col-md-8">선물함</div>
							<div class="col-md-4" style="color: orange;">0</div>
						</div>
						<div class="row">
							<div class="col-md-8">내 도토리</div>
							<div class="col-md-4" style="color: orange;">
								<img src="../../image/dotori.png" alt="" style="width: 18px;" />
								999
							</div>
						</div>
					</div>
				</div>
				<div class="d-flex justify-content-center">
					<a href="javascript:openWindowPop('test.jsp', 'popup');">
						<button id="miniBtn" type="button" class="btn btn-warning btn-lg draw" value="미니홈피" style="padding: 1rem; box-shadow: 2px 2px 2px #6e420c">내 미니홈피 바로가기</button>
					</a>
				</div>
			</div>
			<div class="col-md-6 my-4 p-4">
				<div id="slider" style="display: block; margin: 0 auto;">
					<ul class="mb-3 dotbox">
						<li id="controle1" class="active" style="font-size: 2rem;"><a href="#">•</a></li>
						<li id="controle2"><a href="#" style="font-size: 2rem;">•</a></li>
						<li id="controle3"><a href="#" style="font-size: 2rem;">•</a></li>
					</ul>
					<div id="1" class="hide">
						<iframe id="player" type="text/html" width="500" height="350" src="https://www.youtube.com/embed/ZSiP2p01nU0?autoplay=1&mute=1 " frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen> </iframe>
					</div>
					<div id="2" class="hide">
						<iframe id="player" type="text/html" width="500" height="350" src="https://www.youtube.com/embed/_3A-jr1xC9o" frameborder="0"></iframe>
					</div>
					<div id="3" class="hide">
						<iframe id="player" type="text/html" width="500" height="350" src="https://www.youtube.com/embed/_i0n1bOBRoM" frameborder="0"></iframe>
					</div>
				</div>
			</div>
		</div>
		<canvas></canvas>
	</div>
	<div class=""></div>
	<script type="text/javascript">
		function openWindowPop(url, name) {
			var options = 'top=10, left=10, width=1300, height=800, status=no, menubar=no, toolbar=no, resizable=no';
			window.open(url, name, options);
		}
	</script>
	<!-- 플레이어 -->
	<script type="text/javascript">
	$(document).ready(function(){

		  $("#Slider_Content").fadeIn(500);
		  $("#1").fadeIn(500);
		  
		  $("#controle1").click(function(e){
				$("#1").fadeIn();
		    $("#2").fadeOut();
		    $("#3").fadeOut();
			});
		  
		  $("#controle2").click(function(e){
				$("#1").fadeOut();
		    $("#2").fadeIn();
		    $("#3").fadeOut();
			});

		  $("#controle3").click(function(e){
				$("#1").fadeOut();
		    $("#2").fadeOut();
		    $("#3").fadeIn();
			});

		});
	</script>
	
	<!-- 캔버스 -->
	<script src="../../js/common/canvas.js" type="text/javascript"></script>
	
</body>
</html>
