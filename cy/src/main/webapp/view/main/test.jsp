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
	padding: 10px;
	height: 500px;
}

.tab-content.current {
	display: inherit;
}
</style>


</head>
<body>

	<%@ include file="../common/header.jsp"%>

	
			<!-- 탭 눌렀을 때 전환될 화면 2 -->

			<div class="col-md-2">
				<ul class="tabs">
					<li class="tab-link current" data-tab="tab-1">홈</li>
					<li class="tab-link" data-tab="tab-2">프로필</li>
					<li class="tab-link" data-tab="tab-3">다이어리</li>
					<li class="tab-link" data-tab="tab-4">게시판</li>
					<li class="tab-link" data-tab="tab-5">사진첩</li>
					<li class="tab-link" data-tab="tab-6"><a href="../mypage/visitor/viewLogList.jsp"> 방명록</a></li>
					<li class="tab-link" data-tab="tab-7" style="display: none;">관리</li>
				</ul>
			</div>
		
	
</body>
</html>