<%@page import="dao.user.UserDao"%>
<%@page import="dto.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메인 화면</title>

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

	<%
	int otherUserNo = -1;
	// 메인 페이지를 호출하면서 유저 고유 번호를 인수로 넘겨받아야합니다. 
	if (request.getParameter("userNo") != null) {
		otherUserNo = Integer.parseInt(request.getParameter("userNo"));
	} else {
		otherUserNo = user_no;
	}

	if (otherUserNo == user_no) {
		// 검색한 유저 고유 번호와 로그인 한 계정이 일치할 경우
		// 관리 탭을 보이게한다. 
		// 방문자 수가 증가되면 안된다.
		User user = UserDao.getUserDao().getUser(user_no);
	%>

	<div class="container p-3" style="background-color: #263333;">
		<div class="row no-gutters">
			<div class="col-md-10">
				<div id="tab-1" class="tab-content current" style="overflow: auto;">
					<!-- 메인 페이지 호출 -->
					<div class="container">
						<div class="row">
							<div class="col-md-4">
								<div class="row mainViewCount p-1" style="font-size: 0.4rem;">
									<%
									// 세션값을 확인해서, 홈페이지 주인 user_no 와 일치하지 않으면 방문자수를 증가시킵니다. [미구현]
									// 방문자수는 하루에 1번만 늘어날 수 있습니다. [미구현]
									// 방문한 사람 user_no 값을 방문자 세션에 저장해야합니다. [미구현]
									// 방문한 사람의 세션은 VisitorSession 객체에 리스트로 저장합니다.  [미구현]
									// 비회원 전용 기능은 아예 없으므로, 무조건 로그인 페이지에서 로그인 해야만 검색할 수 있게 막아둡니다. [미구현]

									// 1. 본인 계정으로 로그인 했을 때

									// 2. 다른 사람 계정 탐방할 때
									%>
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
						<div class="row" style="height: 500px; overflow: auto;">
							<div class="col-md-12 no-gutters">
								<div class="row">
									<div class="col-md-3">
										<!-- 프로필 사진 부분 -->

										<%
										// 서버에 저장된 이미지를 user_no 를 이용해서 불러옵니다.
										%>

										<img src="../../upload/<%=user.getUser_pic()%>" alt=""
											class="img-thumbnail" style="max-width: 100%;" />
										<hr />
										<div>
											<span> 홈페이지 소개글을 적고, 수정할 수 있는 부분입니다. </span>
										</div>
										<hr />
										<div class="row text-center">
											<button type="button" class="btn btn-secondary btn-sm"
												value="">소개글 수정</button>

										</div>
										<hr />
										<!-- 나중에 시간되면 다크모드 전환도 넣을 까해서 밝기 아이콘 넣어두었음 -->
										<div class="">
											<button type="button" class="btn btn-secondary btn-sm"
												value="">프로필 사진 수정</button>
										</div>
										<div class="my-2">
											<h6>
												홈페이지 주소(http://cyworld/<span style="color: blue;"><%=loginid%></span>)
											</h6>
										</div>
									</div>

									<div class="col-md-9">
										<!-- 센터 부분 -->
										<div class="row" style="overflow: hidden;">
											<div class="col-md-6">
												<span style="color: orange;">updated news</span>
												<hr />
												<%
												// DB 에서 게시글 조회 수 가장 최근 게시글 4개 끌어와서 출력합니다.
												// for(int i=0; i<4 ; i++) { ... }
												// dao 에서 쿼리문을 여러번 사용해서 최신순으로 정렬합니다. 
												// (inner) join 을 사용해서 한 테이블로 가져와서 글 4개만 출력합니다. 
												// db 에 각 게시판의 고유 번호를 부여하지 않았으니 dto 에서 강제로 값을 넣어줘야 할 것 같습니다. 
												// 처음에 dao 에 등록할 때, 생성자 자체에 category='게시판' or category='사진첩' 이런식으로다가
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


												<%
												// 각 게시판에 해당하는 dao 를 돌면서 총 글 갯수를 긁어옵니다. 이건 금방할듯 
												// 대신 게시판 등록, 수정, 삭제가 문제없이 돌아가야해서 완성되고 해도 될 것 같음
												%>

												<span style="color: orange;">boardlist</span>
												<hr />
												<div class="row">
													<div class="col-md-12">
														<div class="row">
															<!-- <div class="col-md-6">
												<a href="">다이어리 </a>
											</div> -->
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
										<hr />
										<span style="color: orange;">사진첩</span>
										<hr />
										<div class="row">
											<!-- 메인 페이지 중앙에 출력되는 이미지 혹은 동영상 혹은 미니룸 -->
											<div class="col-md-3">
												<img src="../../image/siam.jpg" class="img-thumbnail"
													alt="..." style="max-width: 100%;">
											</div>
											<div class="col-md-3">
												<img src="../../image/siam.jpg" class="img-thumbnail"
													alt="..." style="max-width: 100%;">
											</div>
											<div class="col-md-3">
												<img src="../../image/siam.jpg" class="img-thumbnail"
													alt="..." style="max-width: 100%;">
											</div>
											<div class="col-md-3">
												<img src="../../image/siam.jpg" class="img-thumbnail"
													alt="..." style="max-width: 100%;">
											</div>

										</div>
										<hr />
										<span style="color: orange; font-size: 12px;"> 일촌평</span>
										<div>
											<!-- 일촌평 시작 -->
											<%
											// 1. DB 에서 가져와서 가장 최근 5개만 출력되도록 한다.
											%>
											<h6>일촌평입니다...</h6>
											<h6>일촌평입니다...</h6>
											<h6>일촌평입니다...</h6>
											<h6>일촌평입니다...</h6>
											<h6>일촌평입니다...</h6>
										</div>
										<!-- 일촌평 종료 -->
									</div>
								</div>
							</div>
						</div>
					</div>
					<!-- 메인 페이지 종료 -->
				</div>
			</div>
			<div class="col-md-2">
				<ul class="tabs">
					<li class="tab-link current">홈</li>
					<li class="tab-link"><a href="#">프로필</a></li>
					<li class="tab-link"><a href="../mypage/diary/newDiary.jsp">다이어리</a></li>
					<li class="tab-link">게시판</li>
					<li class="tab-link">사진첩</li>
					<li class="tab-link"><a href="../mypage/visitor/viewLogList.jsp">방명록</a></li>
					<li class="tab-link" style="display: none;">관리</li>
				</ul>
			</div>
		</div>
	</div>

	<%
	} else {
	// 로그인 된 계정과 다른 유저의 미니 홈페이지에 방문하는 경우
	// 관리 페이지를 숨긴다. 
	User user = UserDao.getUserDao().getUser(otherUserNo);
	%>


	<div class="container p-3" style="background-color: #263333;">
		<div class="row no-gutters">
			<div class="col-md-10">
				<div id="tab-1" class="tab-content current" style="overflow: auto;">
					<!-- 메인 페이지 호출 -->
					<div class="container">
						<div class="row">
							<div class="col-md-4">
								<div class="row mainViewCount p-1" style="font-size: 0.4rem;">
									<%
									// 세션값을 확인해서, 홈페이지 주인 user_no 와 일치하지 않으면 방문자수를 증가시킵니다. [미구현]
									// 방문자수는 하루에 1번만 늘어날 수 있습니다. [미구현]
									// 방문한 사람 user_no 값을 방문자 세션에 저장해야합니다. [미구현]
									// 방문한 사람의 세션은 VisitorSession 객체에 리스트로 저장합니다.  [미구현]
									// 비회원 전용 기능은 아예 없으므로, 무조건 로그인 페이지에서 로그인 해야만 검색할 수 있게 막아둡니다. [미구현]

									// 1. 본인 계정으로 로그인 했을 때

									// 2. 다른 사람 계정 탐방할 때
									%>
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
						<div class="row" style="height: 500px; overflow: auto;">
							<div class="col-md-12 no-gutters">
								<div class="row">
									<div class="col-md-3">
										<!-- 프로필 사진 부분 -->

										<%
										// 서버에 저장된 이미지를 user_no 를 이용해서 불러옵니다.
										%>

										<img src="../../upload/<%=user.getUser_pic()%>" alt=""
											class="img-thumbnail" style="max-width: 100%;" />
										<hr />
										<div>
											<span> 홈페이지 소개글을 적고, 수정할 수 있는 부분입니다. </span>
										</div>
										<hr />
										<div class="row text-center">
											<button type="button" class="btn btn-secondary btn-sm"
												value="">소개글 수정</button>

										</div>
										<hr />
										<!-- 나중에 시간되면 다크모드 전환도 넣을 까해서 밝기 아이콘 넣어두었음 -->
										<div class="">
											<button type="button" class="btn btn-secondary btn-sm"
												value="">프로필 사진 수정</button>
										</div>
										<div class="my-2">
											<h6>
												홈페이지 주소(http://cyworld/<span style="color: blue;"><%=loginid%></span>)
											</h6>
										</div>
									</div>

									<div class="col-md-9">
										<!-- 센터 부분 -->
										<div class="row" style="overflow: hidden;">
											<div class="col-md-6">
												<span style="color: orange;">updated news</span>
												<hr />
												<%
												// DB 에서 게시글 조회 수 가장 최근 게시글 4개 끌어와서 출력합니다.
												// for(int i=0; i<4 ; i++) { ... }
												// dao 에서 쿼리문을 여러번 사용해서 최신순으로 정렬합니다. 
												// (inner) join 을 사용해서 한 테이블로 가져와서 글 4개만 출력합니다. 
												// db 에 각 게시판의 고유 번호를 부여하지 않았으니 dto 에서 강제로 값을 넣어줘야 할 것 같습니다. 
												// 처음에 dao 에 등록할 때, 생성자 자체에 category='게시판' or category='사진첩' 이런식으로다가
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


												<%
												// 각 게시판에 해당하는 dao 를 돌면서 총 글 갯수를 긁어옵니다. 이건 금방할듯 
												// 대신 게시판 등록, 수정, 삭제가 문제없이 돌아가야해서 완성되고 해도 될 것 같음
												%>

												<span style="color: orange;">boardlist</span>
												<hr />
												<div class="row">
													<div class="col-md-12">
														<div class="row">
															<!-- <div class="col-md-6">
												<a href="">다이어리 </a>
											</div> -->
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
										<hr />
										<span style="color: orange;">사진첩</span>
										<hr />
										<div class="row">
											<!-- 메인 페이지 중앙에 출력되는 이미지 혹은 동영상 혹은 미니룸 -->
											<div class="col-md-3">
												<img src="../../image/siam.jpg" class="img-thumbnail"
													alt="..." style="max-width: 100%;">
											</div>
											<div class="col-md-3">
												<img src="../../image/siam.jpg" class="img-thumbnail"
													alt="..." style="max-width: 100%;">
											</div>
											<div class="col-md-3">
												<img src="../../image/siam.jpg" class="img-thumbnail"
													alt="..." style="max-width: 100%;">
											</div>
											<div class="col-md-3">
												<img src="../../image/siam.jpg" class="img-thumbnail"
													alt="..." style="max-width: 100%;">
											</div>

										</div>
										<hr />
										<span style="color: orange; font-size: 12px;"> 일촌평</span>
										<div>
											<!-- 일촌평 시작 -->
											<%
											// 1. DB 에서 가져와서 가장 최근 5개만 출력되도록 한다.
											%>
											<h6>일촌평입니다...</h6>
											<h6>일촌평입니다...</h6>
											<h6>일촌평입니다...</h6>
											<h6>일촌평입니다...</h6>
											<h6>일촌평입니다...</h6>
										</div>
										<!-- 일촌평 종료 -->
									</div>
								</div>
							</div>
						</div>
					</div>
					<!-- 메인 페이지 종료 -->
				</div>
			</div>
			<div class="col-md-2">
				<ul class="tabs">
					<li class="tab-link current">홈</li>
					<li class="tab-link"><a href="#">프로필</a></li>
					<li class="tab-link"><a href="../mypage/diary/newDiary.jsp">다이어리</a></li>
					<li class="tab-link">게시판</li>
					<li class="tab-link">사진첩</li>
					<li class="tab-link"><a href="../mypage/visitor/viewLogList.jsp">방명록</a></li>
					<li class="tab-link" style="display: none;">관리</li>
				</ul>
			</div>
		</div>
	</div>

	<%
	}
	%>
	<script type="text/javascript">
		/* 		$(document).ready(function() {
		 $('ul.tabs li').click(function() {
		 var tab_id = $(this).attr('data-tab');

		 $('ul.tabs li').removeClass('current');
		 $('.tab-content').removeClass('current');

		 $(this).addClass('current');
		 $("#" + tab_id).addClass('current');
		 });
		 });

		 function showPopup() {
		 window.open("main.jsp", "a",
		 "width=800, height=500, left=100, top=50");
		 } */
	</script>
</body>
</html>