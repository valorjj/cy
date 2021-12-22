<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>main page</title>
</head>

<body>
	<!-- 메인 페이지 시작 -->
	<div class="container" id="main">
		<div class="row">
			<div class="col-md-4">
				<div class="row mainViewCount p-1" style="font-size: 0.4rem;">
					<div class="col-md-4">
						Today: <span style="color: red;">(?)</span>
					</div>
					<div class="col-md-4">
						Total: <span style="color: red;">(?)</span>
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
		<div class="row">

			<div class="col-md-12 no-gutters">
				<div class="row">
					<div class="col-md-3">
						<img src="../../image/default-profile-photo.png" alt=""
							class="img-thumbnail" />
						<hr />
						<div>
							<h3>홈페이지 소개</h3>
						</div>
						<hr />

						<div class="row text-left">
							<div class="col-md-6">
								<a href="">EDIT</a>
							</div>
							<div class="col-md-6">
								<a href="">history</a>
							</div>
						</div>
						<hr />
						<!-- 나중에 시간되면 다크모드 전환도 넣을 까해서 밝기 아이콘 넣어두었음 -->
						<div>
							싸이월드 <span id="" class="" onclick=""><i
								class="bi bi-brightness-high"></i></span>
						</div>
						<div>
							<h6>홈페이지 주소</h6>
						</div>
					</div>

					<div class="col-md-9">
						<div class="row">
							<div class="col-md-6">
								<span style="color: orange;">updated news</span>
								<%
								// DB 에서 게시글 조회 수 가장 최근 게시글 4개 끌어와서 출력합니다.
								// for(int i=0; i<4 ; i++) { ... }
								%>
								<div class="row">
									<div class="col-md-4">
										<div>사진첩</div>
									</div>
									<div class="col-md-8">
										<div class="w-auto">사진첩 업데이트1</div>
									</div>
									<div class="col-md-4">
										<div>게시판</div>
									</div>
									<div class="col-md-8">
										<div class="w-auto">게시판 업데이트1</div>
									</div>
									<div class="col-md-4">
										<div>방명록</div>
									</div>
									<div class="col-md-8">
										<div class="w-auto">방명록 업데이트1</div>
									</div>
									<div class="col-md-4">
										<div>방명록</div>
									</div>
									<div class="col-md-8">
										<div class="w-auto">방명록 업데이트1</div>
									</div>
								</div>
							</div>

							<div class="col-md-6">
								<!-- 게시판 리스트 시작-->

								<span style="color: orange;">boardlist</span>

								<div class="row">

									<div class="col-md-12">
										<!-- 게시판 리스트  -->

										<div class="row">
											<div class="col-md-6">
												<a href="">다이어리 </a>
											</div>
											<div class="col-md-6">
												<span> 1 / 100 </span>
											</div>
										</div>
										<div class="row">
											<div class="col-md-6">
												<a href="">게시판 </a>
											</div>
											<div class="col-md-6">
												<span> 1 / 100 </span>
											</div>
										</div>
										<div class="row">
											<div class="col-md-6">
												<a href="">사진첩</a>
											</div>
											<div class="col-md-6">
												<span> 1 / 100 </span>
											</div>
										</div>
										<div class="row">
											<div class="col-md-6">
												<a href="">방명록</a>
											</div>
											<div class="col-md-6">
												<span> 1 / 100 </span>
											</div>
										</div>
									</div>

								</div>
								<!-- 게시판 리스트 종료 -->

							</div>

						</div>

						<div class="row">
							<!-- 메인 페이지 중앙에 출력되는 이미지 혹은 동영상 혹은 미니룸 -->
							<div
								style="background-color: #eeeeee; width: 8000px; height: 180px;">
								미니룸</div>

						</div>
						<hr />
						<span> 일촌평</span>
						<div>
							<%
							// 1. DB 에서 가져와서 가장 최근 5개만 출력되도록 한다.
							%>

							<h6>일촌평입니다...</h6>
							<h6>일촌평입니다...</h6>
							<h6>일촌평입니다...</h6>
							<h6>일촌평입니다...</h6>
							<h6>일촌평입니다...</h6>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- 메인 페이지 종료 -->
	</div>


	<!-- 메인 페이지 종료 -->


</body>
</html>