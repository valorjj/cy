
<%@page import="dto.OtherSession"%>
<%@page import="dto.LogInSession"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="/cy/css/common/common.css" />
<link rel="stylesheet" href="/cy/css/common/mini.css" />

<style type="text/css">
#audio-player {
	height: 100px;
	width: 450px;
	overflow: hidden;
	background-color: #2B2B2B;
	color: white;
	-webkit-user-select: none; /* webkit (safari, chrome) browsers */
	-moz-user-select: none; /* mozilla browsers */
	-khtml-user-select: none; /* webkit (konqueror) browsers */
	-ms-user-select: none; /* IE10+ */
}

#controls {
	height: 50px;
	background-color: #808080;
	width: 350px;
}

.time {
	font-size: 10px;
	color: white;
	position: relative;
	top: 14px;
	margin: 5px;
}

.ui-progressbar {
	background: #2B2B2B;
}

.ui-progressbar-value {
	background: white;
}

#progressbar, #volume {
	height: 10px;
	display: inline-block;
	border-radius: 0px;
	border: none;
	position: relative;
	top: 16px;
}

#progressbar {
	width: 150px;
}

#play, #mute {
	font-size: 16px;
	width: 20px;
	position: relative;
	top: 17px;
}

#play {
	margin-left: 15px;
}

#volume {
	width: 50px;
}

#more-info-box {
	display: inline-block;
	width: 150px;
	height: 50px;
	position: relative;
	left: 350px;
	top: -50px;
	padding-top: 18px;
	text-align: center;
	font-family: sans-serif;
	font-size: 12px;
	color: white;
}

#more-info-box, #more-info-box>span {
	cursor: context-menu;
}

#info-tray {
	display: inline-block;
	color: white;
	position: relative;
	width: 100%;
	top: -65px;
	height: 50px;
	padding: 5px;
}

#gap-test {
	margin: 0px;
	padding: 0px;
}
</style>
<link
	href="http://maxcdn.bootstrapcdn.com/font-awesome/4.6.3/css/font-awesome.min.css"
	rel="stylesheet" />
<link
	href="https://code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css"
	rel="stylesheet" />
<link rel="stylesheet" href="/cy/css/common/mini.css" />
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
	%>

	<div class="container" style="background-color: #eeeeee">
		<form action="/cy/view/main/test.jsp" method="post"
			onsubmit="return detectSpace();">
			<div class="row" id="gap-test">
				<div class="col-md-5">
					<div class="row">
						<div class="col-md-3 align-self-center">
							<input type="text" class="form-control" id="userSearch"
								name="userSearch" />
						</div>
						<div class="col-md-2 align-self-center">
							<!-- 헤더에서 검색한 결과값 -->
							<input id="searchBtn" type="submit"
								class="form-control btn btn-secondary btn-sm" value="검색" />
						</div>
						<div class="col-md-2 align-self-center">
							<div class="row" style="font-size: 12px; font-weight: bold;">접속한
								아이디</div>
							<div class="row" style="color: orange;"><%=loginid%></div>
						</div>

						<div class="col-md-1">
							<!-- 음악 재생 플레이어 영역-->
							<!--  헤더에 음악재생 추가 -->
							<audio id="player" autoplay="autoplay">
								<source src="/cy/audio/audio_sample.mp3" type="audio/mpeg" />
							</audio>

							<div id="audio-player">
								<div id="controls">
									<i id="play" class="fa fa-pause"></i> <span id="start-time"
										class="time">00:00</span>
									<div id="progressbar"></div>
									<span id="time" class="time">00:00</span> <i id="mute"
										class="fa fa-volume-up"></i>
									<div id="volume"></div>
								</div>
								<div id="more-info-box">
									<span id="more-info">목록</span>
								</div>
								<div id="info-tray" style="text-align: center;">
									<br> Track: <span id="track">프리스타일_Y</span>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</form>
	</div>

	<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
	<script src="https://code.jquery.com/ui/1.11.4/jquery-ui.min.js"></script>


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

	<script>
		var audio_player = $("#audio-player");
		var play_button = $('#play');
		var progress_bar = $("#progressbar");
		var time = $("#time");
		var mute_button = $('#mute');
		var volume_bar = $('#volume');
		var more_info = $('#more-info-box');
		var info_tray = $("#info-tray");
		var player = document.getElementById('player');
		var duration = 0;
		var volume = 0.75;

		player.onloadedmetadata = function() {
			duration = player.duration;
			progress_bar.progressbar("option", {
				'max' : duration
			});
		};

		player.load();
		player.volume = 0.75;
		player.addEventListener("timeupdate", function() {
			progress_bar.progressbar('value', player.currentTime);
			time.text(getTime(player.currentTime));
		}, false);

		function getTime(t) {
			var m = ~~(t / 60), s = ~~(t % 60);
			return (m < 10 ? "0" + m : m) + ':' + (s < 10 ? "0" + s : s);
		}

		function getProgressBarClickInfo(progress_bar, e) {
			var offset = progress_bar.position();
			var x = e.pageX - offset.left; // or e.offsetX (less support, though)
			var y = e.pageY - offset.top; // or e.offsetY
			var max = progress_bar.progressbar("option", "max");
			var value = x * max / progress_bar.width();

			return {
				x : x,
				y : y,
				max : max,
				value : value
			};
		}

		volume_bar.progressbar({
			value : player.volume * 100,
		});

		volume_bar.click(function(e) {
			var info = getProgressBarClickInfo($(this), e);
			volume_bar.progressbar('value', info.value);
			player.volume = info.value / info.max;
		});

		progress_bar.progressbar({
			value : player.currentTime,
		});

		progress_bar.click(function(e) {
			var info = getProgressBarClickInfo($(this), e);
			player.currentTime = player.duration / info.max * info.value;
		});

		play_button.click(function() {
			player[player.paused ? 'play' : 'pause']();
			$(this).toggleClass("fa-play", !player.paused);
			$(this).toggleClass("fa-pause", player.paused);
		});

		mute_button.click(function() {
			if (player.volume == 0) {
				player.volume = volume;
			} else {
				volume = player.volume;
				player.volume = 0;
			}

			volume_bar.progressbar('value', player.volume * 100);

			$(this).toggleClass("fa-volume-up", player.volume != 0);
			$(this).toggleClass("fa-volume-off", player.volume == 0);
		});

		more_info.click(function() {
			audio_player.animate({
				height : (audio_player.height() == 50) ? 100 : 50
			}, 1000);
		});
	</script>
</body>
</html>