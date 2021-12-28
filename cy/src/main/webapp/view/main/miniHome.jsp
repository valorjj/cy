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
		<div class="row my-2 p-2">
			<div class="col-md-6">
				<a href="javascript:openWindowPop('test.jsp', 'popup');"><button
						id="miniBtn" type="button" class="btn btn-secondary btn-lg"
						value="미니홈피">내 미니홈피 바로가기</button></a>

			</div>
			<div class="col-md-6">
				<div class="row">
					<div class="col-md-6">
						<img src="../../image/cy_logo.jpg" alt="..."
							style="max-width: 100%" class="img-thumbnail">
					</div>
					<div class="col-md-6">
						<img src="../../image/cy_logo.jpg" alt="..."
							style="max-width: 100%" class="img-thumbnail">
					</div>
				</div>
				<div class="row">
					<div class="col-md-6">
						<img src="../../image/cy_logo.jpg" alt="..."
							style="max-width: 100%" class="img-thumbnail">
					</div>
					<div class="col-md-6">
						<img src="../../image/cy_logo.jpg" alt="..."
							style="max-width: 100%" class="img-thumbnail">
					</div>
				</div>
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