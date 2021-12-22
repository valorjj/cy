<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%@include file="../common/common.jsp"%>
	<%@include file="../common/header(kth).jsp"%>
	<!-- 메인 시작-->
	<div class="wrap" style="position: relative;">
		<div id="main" class="" style="position: relative; height: 85vh;">
			<div class="container border border-primary bg-light" style="position: absolute; top: 50%; left: 50%; transform: translate(-50%, -50%); height: auto;">
				<!-- 메인상단 -->
				<div class="row col-lg-12 d-flex" style="display: block; margin: 0 auto; width: 100%; height: auto;">
					<!-- 메인 상단 좌측 카운터 -->
					<div class="col-sm-3 visitcount d-flex justify-content-center" style="width: 100%;">
						<div class="d-flex align-items-center text-center">
							<div class="today mx-3">
								today
								<span> 10</span>
							</div>
							<span>|</span>
							<div class="total mx-3">
								total
								<span>100</span>
							</div>
						</div>
					</div>
					<!-- 메인 상단 타이틀 -->
					<div class="topbox col-sm-9 d-flex justify-content-between align-items-center">
						<div class="title" style="font-size: 1.5rem;">
							<a href="">사이좋은 사람들, 싸이월드</a>
						</div>
						<button class="btn btn-dark">수정</button>
					</div>
				</div>
				<!-- 메인 컨텐츠 -->
				<div class="row col-lg-12 d-flex" style="display: block; margin: 0 auto; width: 100%; height: auto;">
					<!-- 메인 좌측 레이아웃 -->
					<div class="main col-lg-10 col-sm-10 col-10 border border-danger" style="height: 600px;">
					<!-- 프로필 컨텐츠 -->
						<div class="mainbox col-12 d-flex" style="height: 100%;">
							<!-- 좌측 프로필컨텐츠 -->
							<div class="mainleft col-3 d-flex flex-column justify-content-start align-items-center border border-dark p-3 bg-light">
								<div class="profiletitle align-self-start">
									<h6>about me...</h6>
									<h4 class="text-info">PROFILE</h4>
								</div>
								<div class="borderline" style="border: 1.5px dotted lightgrey; width: 100%; border-width: 80%;"></div>
								<div class="myfold mt-3">
									<!-- 사이드 아코디언 -->
									<div class="accordion" id="accordionExample">
										<div class="card">
											<div class="card-header" id="headingOne">
												<h2 class="mb-0">
													<button class="btn btn-link btn-block text-left" type="button" data-toggle="collapse" data-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne">내소개</button>
												</h2>
											</div>
											<div id="collapseOne" class="collapse show" aria-labelledby="headingOne" data-parent="#accordionExample">
												<div class="card-body">
													<ul>
														<a href="">
															<li>아이템1</li>
														</a>
														<a href="">
															<li>아이템1</li>
														</a>
														<a href="">
															<li>아이템1</li>
														</a>
													</ul>
												</div>
											</div>
										</div>
										<div class="card">
											<div class="card-header" id="headingTwo">
												<h2 class="mb-0">
													<button class="btn btn-link btn-block text-left collapsed" type="button" data-toggle="collapse" data-target="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">내인맥</button>
												</h2>
											</div>
											<div id="collapseTwo" class="collapse" aria-labelledby="headingTwo" data-parent="#accordionExample">
												<div class="card-body">
													<ul>
														<a href="">
															<li>아이템1</li>
														</a>
														<a href="">
															<li>아이템1</li>
														</a>
														<a href="">
															<li>아이템1</li>
														</a>
													</ul>
												</div>
											</div>
										</div>
										<div class="card">
											<div class="card-header" id="headingThree">
												<h2 class="mb-0">
													<button class="btn btn-link btn-block text-left collapsed" type="button" data-toggle="collapse" data-target="#collapseThree" aria-expanded="false" aria-controls="collapseThree">내즐겨찾기</button>
												</h2>
											</div>
											<div id="collapseThree" class="collapse" aria-labelledby="headingThree" data-parent="#accordionExample">
												<div class="card-body">
													<ul>
														<a href="">
															<li>아이템1</li>
														</a>
														<a href="">
															<li>아이템1</li>
														</a>
														<a href="">
															<li>아이템1</li>
														</a>
													</ul>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
							<!-- 좌측 프로필컨텐츠 종료-->
							
							<!-- 우측 컨텐츠 시작 -->
							<div class="mainright col-8 border border-primary p-3 bg-light">
								<div class="mainrightbox">
									<div class="mainprofile">
										<div class="profiletop border my-2" style="width: 100%;">
											아이템
										</div>
										<div class="profilemid  border my-2">
											
										</div>
										<div class="profilebot border my-2">
							
										</div>
									</div>
								</div>
							</div>
							<!-- 우측 컨텐츠 종료 -->
							<!-- 메인 우측 네비게이션 -->
							<div class="nav col-1 ">
								<div class="category d-flex flex-column justify-content-center text-center ">
									<div class="category_home">
										<a class="" href="main.jsp">홈</a>
									</div>
									<div class="category_profile ">
										<a class="" href="mainProfile.jsp">프로필</a>
									</div>
									<div class="category_diary">
										<a class="" href="">다이어리</a>
									</div>
									<div class="category_gallery ">
										<a class="" href="">사진첩</a>
									</div>
									<div class="category_board ">
										<a class="" href="">게시판</a>
									</div>
									<div class="category_guestbook">
										<a class="" href="">방명록</a>
									</div>
									<div class="category_setting ">
										<a class="" href="">관리</a>
									</div>
								</div>
							</div>
							<div class="mainboxinner"></div>
						</div>
					</div>
					<!-- 메인 좌측 레이아웃 종료 -->
					<!-- 메인 우측레이아웃 주크박스 시작 -->
					<div class="mainmusic col-lg-2 col-sm-2 col-2 d-flex flex-column justify-content-start align-items-center border-danger" style="height: auto;">
						<div class="musicbox">
							<div class="infobox">
								<div class="title bg-dark text-light">싸이월드홈</div>
								<div class="state bg-light">
									<ul>
										<li>액티브</li>
										<li>페이머스</li>
										<li>프렌들리</li>
									</ul>
								</div>
								<div class="mysymbol d-flex justify-content-center bg-light">
									<label for="">마이심볼</label>
									<a href="">
										<img src="" alt="">
									</a>
									<a href="">
										<img src="" alt="">
									</a>
									<a href="">
										<img src="" alt="">
									</a>
								</div>
								<div class="pagecount">
									<label for="">스크랩</label>
									<span class="text-danger">
										숫자
										<img src="" alt="">
										new
									</span>
									<label for="">즐겨찾기</label>
									<span class="text-danger">숫자</span>
								</div>
								<div class="item">
									<a class="bg-primary" href="">사용중인아이템</a>
									<div>
										<label for="">
											선물함
											<span class="text-danger">숫자</span>
										</label>
										<label for="">
											소망상자
											<span class="text-danger">숫자</span>
										</label>
									</div>
								</div>
							</div>
							<div class="player bg-warning">
								<div class="musictitle"></div>
								<div class="playcontroll">재생멈춤</div>
							</div>
						</div>
					</div>
					<!-- 메인 우측레이아웃 주크박스 종료 -->
				</div>
				<!-- 메인 컨텐츠 종료-->
			</div>
		</div>
	</div>
	<!-- 메인 종료 -->
	<%@include file="../common/footer.jsp"%>
</body>
</html>
