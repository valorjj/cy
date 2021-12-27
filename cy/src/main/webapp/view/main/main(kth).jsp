<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>탭 연습</title>

<style type="text/css">
body {
	margin-top: 100px;
	font-family: 'Trebuchet MS', serif;
	line-height: 1.6;
	height: 500px;
}

ul.tabs {
	margin: 0px;
	padding: 0px;
	list-style: none;
}

ul.tabs li {
	background: #00a8be;
	color: #222;
	padding: 10px 15px;
	cursor: pointer;
}

ul.tabs li.current {
	background: #00a8be;
	color: #ededed;
}

.tab-content {
	display: none;
	background: #ededed;
	padding: 15px;
	height: 500px;
}

.tab-content.current {
	display: inherit;
}
</style>


</head>
<body>

	<%@ include file="../common/header.jsp"%>

	<div class="container p-3" style="background-color: #263333;">
		<div class="row no-gutters">
			<div class="col-md-10" style="height: 500px;">
				<!-- 탭 눌렀을 때 전환될 화면 1 -->
				<div id="tab-1" class="tab-content current" style="overflow: auto;">
					<!-- 메인 페이지 호출 -->
					<%@ include file="../user/viewUserHome.jsp"%>
				</div>

				<div id="tab-2" class="tab-content">
					<!-- 프로필 페이지 호출  -->
					<%@ include file="../user/viewUserProfile.jsp"%>
				</div>

				<div id="tab-3" class="tab-content">
					<!-- 다이어리 페이지 호출 -->
					<%@ include file="../mypage/diary/viewDiary.jsp"%>
				</div>

				<div id="tab-4" class="tab-content"></div>

				<div id="tab-5" class="tab-content"></div>

				<div id="tab-6" class="tab-content"></div>

				<div id="tab-7" class="tab-content"></div>

			</div>
			<!-- 탭 눌렀을 때 전환될 화면 2 -->


			<div class="col-md-2">
				<ul class="tabs">
					<li class="tab-link current" data-tab="tab-1">홈</li>
					<li class="tab-link" data-tab="tab-2">프로필</li>
					<li class="tab-link" data-tab="tab-3">다이어리</li>
					<li class="tab-link" data-tab="tab-4">게시판</li>
					<li class="tab-link" data-tab="tab-5">사진첩</li>
					<li class="tab-link" data-tab="tab-6">방명록</li>
					<li class="tab-link" data-tab="tab-7">관리</li>
				</ul>
			</div>
		</div>
	</div>
	<script type="text/javascript">
		$(document).ready(function() {
			$('ul.tabs li').click(function() {
				var tab_id = $(this).attr('data-tab');

				$('ul.tabs li').removeClass('current');
				$('.tab-content').removeClass('current');

				$(this).addClass('current');
				$("#" + tab_id).addClass('current');
			});
		});
	</script>
</body>
</html>