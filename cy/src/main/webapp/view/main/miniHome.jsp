<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>미니 홈페이지에 접근하는 화면</title>
</head>
<body>

	<%@ include file="../common/newHeader.jsp"%>
	<!-- 버튼을 누르면 미니 홈페이지를 출력합니다. -->
	<div class="container">
		<div class="row">
			<div class="col-md-6 my-4 p-4"
				style="border: 1px solid #eeeeee; box-shadow: 2px 2px 2px black;">
				<div class="row my-2 p-2">
					<div class="col-md-8 text-center">
						<span><%=user_id%></span> 님의 싸이월드
					</div>
					<div class="col-md-4">
						<a href="logOut.jsp"><button type="button"
								class="btn btn-secondary btn-sm">로그아웃</button></a>
					</div>

				</div>
				<div class="row my-2 p-2">
					<div class="col-md-6" style="border: 1px solid #eeeeee;">
						<img src="../../image/minime.png" alt="" style="max-width: 100%;" />
					</div>
					<div class="col-md-6">
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
					<a href="javascript:openWindowPop('test.jsp', 'popup');"><button
							id="miniBtn" type="button" class="btn btn-warning btn-lg"
							value="미니홈피"
							style="padding: 1rem; box-shadow: 2px 2px 2px #6e420c">내
							미니홈피 바로가기</button></a>

				</div>

			</div>
			<div class="col-md-6 my-4 p-4">

				<img src="../../image/cy_pic1.jpg" alt="" style="max-width: 100%;" />

			</div>

		</div>
	</div>

	<script type="text/javascript">
		function openWindowPop(url, name) {
			var options = 'top=10, left=10, width=1300, height=800, status=no, menubar=no, toolbar=no, resizable=no';
			window.open(url, name, options);
		}
	</script>

</body>
</html>