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
						<div class="mainbox d-flex" style="height: 100%;">
							<div class="mainleft col-3 d-flex flex-column justify-content-start align-items-center border border-dark p-3 bg-light">
								<div class="mainleftbox border border-dark">
									<div class="todey">
										<div>
											today is ...
											<span>이모티콘</span>
											<div class="imgbox p-2">
												<img src="https://images.unsplash.com/photo-1504214208698-ea1916a2195a?w=500&h=500&fit=crop" alt="" style="width: 100%;">
											</div>
										</div>
									</div>
									<div class="img"></div>
									<div class="mytext">나는 가끔.. 눈물을 .. 흘린다 ..</div>
									<div class="edit d-flex justify-content-center">
										<div>
											<img src="" alt="">
											EDIT
										</div>
										<div>
											<img src="" alt="">
											HISTORY
										</div>
									</div>
									<div class="myinfo">
										<div class="text-dark d-flex flex-column">
											<div>
												<span class="text-primary">이젠컴퓨터</span>
												<span>성별</span>
												<span>2011.12.22</span>
											</div>
											<div>
												<label for="" style="color: orange;">이메일</label>
											</div>
											<div>
												<a href="">임티1</a>
												<a href="">임티2</a>
											</div>
										</div>
									</div>
								</div>
								<div>
									<div class="line" style="border: 1px #999 dashed; width: 80%;"></div>
								</div>
								<div></div>
							</div>
							<div class="mainright col-8 border border-primary p-3 bg-light">
								<div class="mainrightbox">
									<div class="mainhome">
										<div class="hometop noticezone border my-2" style="width: 100%;">
											<h6 style="border-bottom: 1px solid grey;">최근소식</h6>
											<div class="d-flex justify-content-between">
												<div class="homeleft col-6">
													<ul>
														<li><span>아이콘</span>텍스트내용</li>
														<li><span>아이콘</span>텍스트내용</li>
														<li><span>아이콘</span>텍스트내용</li>
														<li><span>아이콘</span>텍스트내용</li>
													</ul>
												</div>
												<div class="homeright col-6"">
													<form action="" class="">
														<table class="table table-bordered text-center">
															<tr>
																<td>다이어리 <span>0/0</span></td>
																<td>사진접 <span>0/0</span></td>
															</tr>
															<tr>
																<td>게시판 <span>0/0</span></td>
																<td>방명록 <span>0/0</span></td>
															</tr>
														</table>
													</form>
												</div>
											</div>
										</div>
										<div class="homemid photozone border my-2">
											<h6>포토스토리</h6>
											<div class="photobox border">
												<div class="d-flex flex-wrap justify-content-around">
													<div class="photoitem">
														<a href="">
															<img src="https://images.unsplash.com/photo-1504214208698-ea1916a2195a?w=500&h=500&fit=crop" alt="" />
														</a>
													</div>
													<div class="photoitem">
														<a href="">
															<img src="https://images.unsplash.com/photo-1504214208698-ea1916a2195a?w=500&h=500&fit=crop" alt="" />
														</a>
													</div>
													<div class="photoitem">
														<a href="">
															<img src="https://images.unsplash.com/photo-1504214208698-ea1916a2195a?w=500&h=500&fit=crop" alt="" />
														</a>
													</div>
													<div class="photoitem">
														<a href="">
															<img src="https://images.unsplash.com/photo-1504214208698-ea1916a2195a?w=500&h=500&fit=crop" alt="" />
														</a>
													</div>
													<div class="photoitem">
														<a href="">
															<img src="https://images.unsplash.com/photo-1504214208698-ea1916a2195a?w=500&h=500&fit=crop" alt="" />
														</a>
													</div>
													<div class="photoitem">
														<a href="">
															<img src="https://images.unsplash.com/photo-1504214208698-ea1916a2195a?w=500&h=500&fit=crop" alt="" />
														</a>
													</div>
												</div>
												<div class="paging" style="transform: scale(0.6);">
													<nav aria-label="Page navigation example">
														<ul class="pagination justify-content-center">
															<li class="page-item disabled"><a class="page-link">Previous</a></li>
															<li class="page-item"><a class="page-link" href="#">1</a></li>
															<li class="page-item"><a class="page-link" href="#">2</a></li>
															<li class="page-item"><a class="page-link" href="#">3</a></li>
															<li class="page-item"><a class="page-link" href="#">Next</a></li>
														</ul>
													</nav>
												</div>
											</div>
										</div>
										<div class="homebot commentzone border my-2">
											<h6>일촌평</h6>
											<div class="comment">
												<form action="">
													<div>
														<label for="">ㅇㅇㅇ</label>
														<span>반갑다~</span>
														<span>날짜</span>
													</div>
													<div>
														<label for="">ㅇㅇㅇ</label>
														<span>반갑다~</span>
														<span>날짜</span>
													</div>
													<div>
														<label for="">ㅇㅇㅇ</label>
														<span>반갑다~</span>
														<span>날짜</span>
													</div>
													<div>
														<label for="">ㅇㅇㅇ</label>
														<span>반갑다~</span>
														<span>날짜</span>
													</div>
													<div>
														<label for="">ㅇㅇㅇ</label>
														<span>반갑다~</span>
														<span>날짜</span>
													</div>
												</form>
											</div>
										</div>
									</div>
								</div>
							</div>
							<!-- 메인 우측 네비게이션 -->
							<div class="nav col-1 ">
								<div class="category d-flex flex-column justify-content-center text-center ">
									<div class="category_home active">
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
