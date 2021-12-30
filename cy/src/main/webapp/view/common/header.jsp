
<%@page import="dto.OtherSession"%>
<%@page import="dto.LogInSession"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
.bgm-wrap iframe#youtube-player {
	display: none
}

.bgm-wrap .audio-box {
	width: 350px;
	height: 100px;
	background: #efefef;
	padding: 5px 15px;
	margin: 15px;
	border-radius: 15px;
	color: gray;
	border: solid 0.5px #ddd
}

.bgm-wrap .audio-box .text-play-click {
	margin-top: 10px;
}

.bgm-wrap .audio-title-wrap {
	margin-bottom: 5px;
	margin-top: 3px;
	font-size: 13px;
	font-weight: 500;
	color: #999;
}

.bgm-wrap .audio-box .audio-control-btn {
	display: inline-block;
	font-size: 14px
}

.bgm-wrap .audio-box .audio-control-btn.btn-play {
	width: 12px;
	margin-right: 5px;
	cursor: pointer;
}

.bgm-wrap .audio-box .audio-control-btn.btn-pause {
	width: 12px;
	margin-right: 5px;
	cursor: pointer;
}

.bgm-wrap .play-time {
	display: inline-block;
	margin: 4px;
}

.bgm-wrap .audio-box .play-progress-box {
	display: inline-block;
	font-size: 14px;
	background: #fff;
	width: 120px;
	height: 4px;
	border: solid 0.5px #ddd;
	vertical-align: middle
}

.bgm-wrap .audio-box .play-progress-bar {
	width: 0;
	height: 100%;
	background: gray;
}

.bgm-wrap .audio-box .play-volume-box {
	display: inline-block;
	margin-left: 15px;
}

.bgm-wrap .audio-box .play-volume-slider {
	display: inline-block;
	width: 40px;
	height: 4px;
	vertical-align: middle;
	margin-left: 5px;
}

.bgm-wrap .audio-box .play-volume-slider .ui-slider-handle.ui-state-active
	{
	border: 1px solid #c5c5c5;
	background: gray;
}

.bgm-wrap .audio-box .play-volume-slider .ui-slider-handle {
	width: 10px;
	height: 10px;
	border-radius: 15px
}

.bgm-wrap .block_tool {
	position: absolute;
	top: -50px;
	width: auto
}

.bgm-wrap .block_tool div {
	margin-bottom: 0;
}

.bgm-wrap .block_tool div .block_copy {
	margin-right: 10px;
	margin-left: 10px
}

.bgm-wrap .block_tool div {
	display: inline-block;
	margin-bottom: 10px;
	width: 40px;
	height: 40px;
	text-align: center;
	border-radius: 50%;
	background: #F1F1F1 no-repeat center;
	box-shadow: 3px 3px 8px 0 rgba(0, 0, 0, 0.05);
	cursor: pointer;
}

.bgm-wrap .block_tool .audio_url p {
	position: absolute;
	left: -15px;
	top: 48px;
	padding: 0 10px;
	height: 40px;
	border-radius: 8px;
	line-height: 40px;
	text-align: center;
	background: #656868;
	color: #FFF;
}

.bgm-wrap .block_tool .audio_list p {
	position: absolute;
	left: 36px;
	top: 48px;
	padding: 0 10px;
	height: 40px;
	border-radius: 8px;
	line-height: 40px;
	text-align: center;
	background: #656868;
	color: #FFF;
}

.bgm-wrap .block_tool .audio_remove p {
	position: absolute;
	left: 83px;
	top: 48px;
	padding: 0 10px;
	height: 40px;
	border-radius: 8px;
	line-height: 40px;
	text-align: center;
	background: #656868;
	color: #FFF;
	width: 70px;
}

.bgm-wrap .block_tool div p:after {
	content: "";
	clear: both;
	display: block;
	position: absolute;
	top: -8px;
	width: 40px;
	height: 10px;
	left: 0;
	background: url(../images/section/section-tool-bg.png) no-repeat right
		center;
}

.bgm-wrap .block_tool div:hover {
	background-color: #EB479A
}

.bgm-wrap .block_tool .audio_url {
	background-image: url(../images/block/list-icon.png) !important;
}

.bgm-wrap .block_tool .audio_url:hover {
	background-image: url(../images/block/list-icon-over.png) !important;
}

.bgm-wrap .block_tool .audio_list {
	background-image: url(../images/block/desktop-icon.png);
	margin-right: 10px;
	margin-left: 10px !important;
}

.bgm-wrap .block_tool .audio_list:hover {
	background-image: url(../images/block/desktop-icon-over.png) !important;
}

.bgm-wrap .block_tool .audio_remove {
	background-image: url(../images/block/remove.png) !important;
}

.bgm-wrap .block_tool .audio_remove:hover {
	background-image: url(../images/block/remove-over.png) !important;
}
</style>
<link rel="stylesheet" href="../../css/common/common.css" />
</head>
<body>

	<%@ include file="common.jsp"%>
	<%
	// [팝업-미니홈페이지] 에서 모든 페이지에 포함 될 헤더파일에서 로그인 세션을 담습니다.
	if (session.getAttribute("logIn") == null) {
		out.println("<script> window.close(); </script>");
	}
	LogInSession logInSession = (LogInSession) session.getAttribute("logIn");
	String loginid = null;

	loginid = logInSession.getUser_id(); // 로그인 아이디 
	int user_no = logInSession.getUser_no();
	// OtherSession otherSession = (OtherSession) session.getAttribute("other");
	%>

	<div class="container" style="background-color: #eeeeee">
		<form action="/cy/view/main/test.jsp" method="post"
			onsubmit="return detectSpace();">
			<div class="row my-3 p-1">
				<div class="col-md-5">
					<div class="row">
						<div class="col-md-3">
							<input type="text" class="form-control" id="userSearch"
								name="userSearch" />
						</div>
						<div class="col-md-2">
							<input id="searchBtn" type="submit"
								class="form-control btn btn-secondary btn-sm" value="검색" />
						</div>
						<div class="col-md-3">
							<div class="row" style="font-size: 12px; font-weight: bold;">접속한
								아이디</div>
							<div class="row" style="color: orange;"><%=loginid%></div>
						</div>

						<div class="col-md-4">
							<!--  헤더에 음악재생 추가 -->
							<div class="bgm-wrap">
								<div id="audio-player"></div>
								<div class="audio-box" style="">
									<div class="audio-title-wrap">
										<span id="audio-title"> 제목</span>
									</div>
									<div class="audio-control-btn btn-play">
										<i class="fa fa-play"></i>
									</div>
									<div class="play-time start">00:00</div>
									<div class="play-progress-box">
										<div class="play-progress-bar"></div>
									</div>
									<div class="play-time end">00:00</div>
									<div class="play-volume-box">
										<div class="audio-control-btn btn-volume">
											<i class="fa fa-volume-up"></i>
										</div>
										<div class="play-volume-slider"></div>
									</div>
								</div>

								<div class="popup-audio-player" style="display: none">
									<div class="audio-control-btn btn-play">
										<i class="fa fa-play" style=""></i>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="col-md-7 d-flex justify-content-around">
					<div class="row">
						<div class="col-md-3">
							<a href="#" class="text-dark" style="font-size: 1rem;">일촌 파도
								타기</a>
						</div>
						<div class="col-md-3">
							<a href="" class="text-dark" style="font-size: 1rem;">마이홈</a>
						</div>
						<div class="col-md-3">
							<a href="#" class="text-dark" style="font-size: 1rem;">일촌보기</a>
						</div>
						<div class="col-md-3">
							<a href="../../controller/user/logOutController.jsp"
								class="text-dark" style="font-size: 1rem;">로그아웃</a>
						</div>
					</div>
				</div>
			</div>
		</form>
	</div>

	<script type="text/javascript">
		function detectSpace() {

			var blank_pattern = /^\s+|\s+$/g;
			var str = document.getElementById("userSearch");

			if (str.value == '' || str.value == null) {
				alert('값을 입력해주세요');
				return false;
			}

			var blank_pattern = /^\s+|\s+$/g;
			if (str.value.replace(blank_pattern, '') == "") {
				alert(' 공백만 입력되었습니다 ');
				return false;
			}
			var blank_pattern = /[\s]/g;
			if (blank_pattern.test(str.value) == true) {
				alert(' 공백은 사용할 수 없습니다. ');
				return false;
			}
			var special_pattern = /[`~!@#$%^&*|\\\'\";:\/?]/gi;

			if (special_pattern.test(str.value) == true) {
				alert('특수문자는 사용할 수 없습니다.');
				return false;
			}
		}
	</script>



</body>
</html>