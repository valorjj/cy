<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>다어어리 탭</title>

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
	padding: 10px;
	height: 500px;
}

.tab-content.current {
	display: inherit;
}
</style>
</head>
<body>

	<%@ include file="../../common/header.jsp"%>

	<div class="container" style="background-color: #263333;">

		<div class="row no-gutters">
			<div class="col-md-10">
				<div id="tab-1" class="tab-content current" style="overflow: auto;">
					<div class="container">
						<!-- 다이어리  -->



					</div>
				</div>
			</div>

			<div class="col-md-2">
				<ul class="tabs">
					<li class="tab-link">홈</li>
					<li class="tab-link"><a href="#">프로필</a></li>
					<li class="tab-link current"><a href="newDiary.jsp">다이어리</a></li>
					<li class="tab-link">게시판</li>
					<li class="tab-link">사진첩</li>
					<li class="tab-link">방명록</li>
					<li class="tab-link" style="display: none;">관리</li>
				</ul>
			</div>



		</div>



	</div>
</body>
</html>