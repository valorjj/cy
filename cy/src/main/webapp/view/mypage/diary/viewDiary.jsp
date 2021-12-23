<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style type="text/css">
</style>
</head>
<body>
	
	<div class="container">
	
			<!-- 상단에서 달력 출력 시작  -->
			<div class="row col-md-8">
				<h3>달력</h3>
			</div>
			<!-- 상단에서 달력 출력 종료 -->

		<div class="row">
		
			<div class="col-md-3"> <!-- 왼쪽 메뉴 -->
				<div class="nav flex-column nav-pills"> 
					<!-- flex-column : 세로 메뉴 	// nav-pills : 액티브[클릭] 색상  -->
					<a class="nav-link active" data-toggle="pill" href="#jj1"> 주문 목록 </a> 
					<a class="nav-link" data-toggle="pill" href="#jj2"> 회원 정보 </a> 
				</div>
			</div>
			
			<div class="col-md-9">	<!-- 왼쪽에서 날짜 누르면 작성된 글 불러온다. -->
				<div class="tab-content" id="pills-tabcontent">
					<div class="tab-pane show active" id="jj1">	<!-- fade : 숨김  show : 열기   -->
						<div class="container">
							<h3>테스트1</h3>
						</div>
					</div>
					<div class="tab-pane fade" id="jj2">	<!-- fade : 숨김  show : 열기   -->
						<div class="container">
							<h3>테스트1</h3>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>


</body>
</html>