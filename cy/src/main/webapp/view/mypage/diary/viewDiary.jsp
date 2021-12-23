<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style type="text/css">
#diary-body {
	height: 500px;
}

ul.diary-tabs {
	margin: 0px;
	padding: 0px;
	list-style: none;
}

ul.diary-tabs li {
	background: #00a8be;
	color: #222;
	padding: 10px 15px;
	cursor: pointer;
}

ul.diary-tabs li.current {
	background: #00a8be;
	color: #ededed;
}

.diary-tab-content {
	display: none;
	background: #ededed;
	height: 500px;
}

.diary-tab-content.current {
	display: inherit;
}
</style>

</head>

<body>

	<div class="container">
		<div class="row" id="diary-body">
			<!-- 왼쪽 서브 폴더 메뉴 시작 -->
			<div class="col-md-2 d-tabs-menu" id="">
				<ul class="diary-tabs">
					<li class="current tab-link" data-tab="diary-tab1">2021.12.23</li>
					<li class="tab-link" data-tab="diary-tab2">2021.12.24</li>
					<li class="tab-link" data-tab="diary-tab3">2021.12.25</li>
				</ul>
			</div>
			<!-- 왼쪽 서브 폴더 메뉴 종료  -->
			<div class="col-md-10" id="diary-content-area">
				<!-- 상단 달력 시작 -->
				<div class="row">
					<h6>달력 출력 될 부분</h6>
				</div>
				<!-- 상단 달력 종료 -->
				<hr />
				<!-- 탭 눌렀을 때 전환될 화면 시작 -->

				<div id="diary-tab1" class="diary-tab-content current" style="overflow: auto;">
					<%@ include file="viewDiaryList.jsp"%>
				</div>
				<div id="diary-tab2" class="diary-tab-content" style="overflow: auto;"></div>
				<div id="diary-tab3" class="diary-tab-content" style="overflow: auto;"></div>

				<!-- 탭 눌렀을 때 전환될 화면 종료 -->
			</div>
		</div>
	</div>

	<script type="text/javascript">
		$(document).ready(function() {
			$('ul.diary-tabs li').click(function() {
				var d_tab_id = $(this).attr('data-tab');

				$('ul.diary-tabs li').removeClass('current');
				$('.diary-tab-content').removeClass('current');

				$(this).addClass('current');
				$("#" + d_tab_id).addClass('current');
			});
		});
	</script>

	<script src="../../js/mypage/diary.js"></script>
</body>
</html>