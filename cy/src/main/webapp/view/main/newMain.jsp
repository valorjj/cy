<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>새로운 메인 페이지</title>
<style type="text/css">
</style>
</head>
<body>

	<%@ include file="../common/newHeader.jsp"%>

	<div class="container">
		<div class="row my-3 p-3 text-center">
			<h3>
				싸이월드에 오신 것을 환영합니다! <span style="color: orange;"><%=user_id%></span>
				님
			</h3>

		</div>

		<div id="carouselExampleControls" class="carousel slide"
			data-ride="carousel">
			<div class="carousel-inner">
				<div class="carousel-item active">
					<img src="../../image/cy1.jpg" class="d-block w-100" alt="...">
				</div>
				<div class="carousel-item">
					<img src="../../image/cy2.png" class="d-block w-100" alt="...">
				</div>
				<div class="carousel-item">
					<img src="../../image/cy3.jpg" class="d-block w-100" alt="...">
				</div>
				<div class="carousel-item">
					<img src="../../image/cy4.jpg" class="d-block w-100" alt="...">
				</div>
			</div>
			<button class="carousel-control-prev" type="button"
				data-target="#carouselExampleControls" data-slide="prev">
				<span class="carousel-control-prev-icon" aria-hidden="true"></span>
				<span class="sr-only">Previous</span>
			</button>
			<button class="carousel-control-next" type="button"
				data-target="#carouselExampleControls" data-slide="next">
				<span class="carousel-control-next-icon" aria-hidden="true"></span>
				<span class="sr-only">Next</span>
			</button>
		</div>


	</div>

	<%@ include file="../common/footer.jsp"%>


</body>
</html>