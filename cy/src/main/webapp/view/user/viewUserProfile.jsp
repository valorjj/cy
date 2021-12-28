<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%@ include file="../common/common.jsp"%>
	<div class="container">
		<div class="row">
			<div class="profileleft col-3 border d-flex flex-colmun align-items-center"></div>
			<div class="profileright col-9 border"></div>
		</div>
	</div>

	<!-- 메인 페이지 시작 -->
	<div class="container">
		<div class="row">
			<div class="col-md-4">
				<div class="row mainViewCount p-1" style="font-size: 0.4rem;">
					<div class="col-md-4">
						Today:
						<span style="color: red;">(?)</span>
					</div>
					<div class="col-md-4">
						Total:
						<span style="color: red;">(?)</span>
					</div>
				</div>
			</div>
			<div class="col-md-4">
				<div class="col-md-8">
					<span>사이트 한 줄 소개</span>
				</div>
			</div>
			<div class="col-md-4">
				<div class="col-md-8">
					<span>사이트주소</span>
				</div>
			</div>
		</div>
		<!-- 홈페이지 상단 종료 -->
		<hr />
		<!-- 메인 페이지 시작 -->
		<div class="row" style="height: 500px; overflow: auto;">
			<div class="col-md-12 no-gutters">
				<div class="row">
					<!-- 좌측컨첸츠 -->
					<div class="col-md-3">
					<div class="">전체보기</div>
					</div>
					<!-- 좌측컨첸츠 -->
					<div class="col-md-9">
					
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- 메인 페이지 종료 -->
</body>
</html>