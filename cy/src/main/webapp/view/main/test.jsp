<%@page import="dao.user.FriendDao"%>
<%@page import="dao.user.UserDao"%>
<%@page import="dto.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메인 화면</title>
<style type="text/css">
body {
	/* margin-top: 100px; */
	font-family: 'Trebuchet MS', serif;
	line-height: 1.6;
	height: auto;
	background-image: url(../../image/gridback.png);
	background-repeat: repeat;
	background-size: 15px;
	background-position: center;
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

/* 이미지업로드 */
#profile-upload {
	background-image: url('');
	background-size: cover;
	background-position: center;
	height: 200px;
	width: 100%;
	border: 1px solid #bbb;
	position: relative;
	border-radius: 10px;
	overflow: hidden;
}

#profile-upload:hover input.upload {
	display: block;
}

#profile-upload:hover .hvr-profile-img {
	display: inline-block;
}

#profile-upload .fa {
	margin: auto;
	position: absolute;
	bottom: -4px;
	left: 0;
	text-align: center;
	right: 0;
	padding: 6px;
	opacity: 1;
	transition: opacity 1s linear;
	-webkit-transform: scale(.75);
}

#profile-upload:hover .fa {
	opacity: 1;
	-webkit-transform: scale(1);
}

#profile-upload input.upload {
	z-index: 1;
	left: 0;
	margin: 0;
	bottom: 0;
	top: 0;
	padding: 0;
	opacity: 0;
	outline: none;
	cursor: pointer;
	position: absolute;
	background: #ccc;
	width: 100%;
	display: none;
}

#profile-upload .hvr-profile-img {
	width: 100%;
	height: 100%;
	display: none;
	position: absolute;
	vertical-align: middle;
	position: relative;
	background: transparent;
}

#profile-upload .fa:after {
	content: "";
	position: absolute;
	bottom: 0;
	left: 0;
	width: 100%;
	height: 0px;
	background: rgba(0, 0, 0, 0.3);
	z-index: -1;
	transition: height 0.3s;
}

#profile-upload:hover .fa:after {
	height: 100%;
}
</style>
</head>
<body>
	<%@ include file="../common/header.jsp"%>
	<%
	int otherUserNo = -1; // 검색한 유저의 정보를 저장하는 변수입니다. -1 로 초기화 시켜둡니다. 
	User myself = UserDao.getUserDao().getUser(user_no); // 로그인한 사람의 정보를 미리 저장해둡니다. 

	if (request.getParameter("userSearch") != null) { // 검색이 존재하는 경우입니다. 
		// 검색한 유저의 번호를 otherUserNo 라는 변수에 초기화시킵니다. 
		otherUserNo = Integer.parseInt(request.getParameter("userSearch"));
		session.setAttribute("other", otherUserNo); // 일단 otherSession 클래스는 버리고 번호 하나만 세션에 저장합니다. 
		if (otherUserNo == user_no) {
			// 검색 대상이 본인 아이디인 경우
			otherUserNo = user_no;
		} else {
			// 검색 대상이 남의 아이디인 경우
			UserDao.getUserDao().updateViewCount(otherUserNo); // 방문한 사람의 홈페이지 조회수를 +1 시킵니다.
			String visitor = user_no + ":" + otherUserNo; // 로그인 한 계정 번호:찾아서 들어간 사람정보
			if (session.getAttribute(visitor) == null) {
		session.setAttribute(visitor, true); // 조회수 증가 방지 
		session.setMaxInactiveInterval(60 * 60 * 24); // 세션 유효시간을 하루로 설정합니다. 
			}

		}

	} else {
		// 검색값이 로그인 한 유저와 동일한 경우입니다. 
		otherUserNo = user_no;
	}

	if (otherUserNo == user_no) {
		// 검색한 유저 고유 번호와 로그인 한 계정이 일치할 경우
		// 관리 탭을 보이게한다. 
		// 방문자 수가 증가되면 안된다.
		User user = UserDao.getUserDao().getUser(user_no);
	%>
	<div class="container p-3" style="background-color: lightgrey;">
		<div class="row no-gutters">
			<div class="col-md-10">
				<div id="tab-1" class="tab-content current" style="overflow: auto;">
					<!-- 메인 페이지 호출 -->
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
								<div class="col-12">
									주소(http://cyworld/
									<span style="color: blue;"><%=user.getUser_id()%></span>
									)
								</div>
							</div>
						</div>
						<!-- 홈페이지 상단 종료 -->
						<hr />
						<!-- 메인 페이지 시작 -->
						<div class="row" style="height: auto; overflow: hidden;">
							<div class="col-md-12 no-gutters">
								<div class="row">
									<div class="col-md-3" style="overflow: auto;">
										<img src="../../upload/<%=user.getUser_pic()%>" alt="" class="img-thumbnail" style="max-width: 100%;" />
										<hr />
										<div>
											<span>
												<%=user.getIntro()%>
											</span>
										</div>
										<hr />
										<div class="d-flex justify-content-center">
											<button type="button" class="btn btn-secondary btn-sm" data-toggle="modal" data-target="#updateIntroModal">소개글 수정</button>
										</div>
										<hr />
										<!-- 나중에 시간되면 다크모드 전환도 넣을 까해서 밝기 아이콘 넣어두었음 -->
										<div class="d-flex justify-content-center">
											<button type="button" class="btn btn-secondary btn-sm" data-toggle="modal" data-target="#updateUserPicModal">프로필 사진 수정</button>
										</div>
										<div class="my-2">
											<div class="feelWrapper d-flex">
												<div class="feel mr-2">오늘의 기분</div>
												<select class="feelSelect">
													<option>기쁨 😀</option>
													<option>슬픔 😭</option>
													<option>분노 😡</option>
													<option>행복 😊</option>
													<option>귀찮 😒</option>
												</select>
											</div>
										</div>
									</div>
									<div class="col-md-9 d-flex flex-column">
										<!-- 센터 부분 -->
										<div class="row" style="overflow: hidden;">
											<div class="col-md-6">
												<span style="color: orange;">updated news</span>
												<hr />
												<div class="row">
													<div class="col-12 d-flex border-bottom">
														<div class="col-md-4 ">
															<div class="badge badge-warning">사진첩</div>
														</div>
														<div class="col-md-8">
															<div class="w-auto">사진첩 업데이트1</div>
														</div>
													</div>
													<div class="col-12 d-flex border-bottom">
														<div class="col-md-4">
															<div class="badge badge-info">게시판</div>
														</div>
														<div class="col-md-8">
															<div class="w-auto">게시판 업데이트1</div>
														</div>
													</div>
													<div class="col-12 d-flex border-bottom">
														<div class="col-md-4">
															<div class="badge badge-danger">방명록</div>
														</div>
														<div class="col-md-8">
															<div class="w-auto">방명록 업데이트1</div>
														</div>
													</div>
													<div class="col-12 d-flex border-bottom">
														<div class="col-md-4">
															<div class="badge badge-primary">방명록</div>
														</div>
														<div class="col-md-8">
															<div class="w-auto">방명록 업데이트1</div>
														</div>
													</div>
												</div>
											</div>
											<div class="col-md-6">
												<span style="color: orange;">boardlist</span>
												<hr />
												<div class="row">
													<div class="col-md-12">
														<div class="row border-bottom" style="width: 98%">
															<div class="col-md-6 ">
																<a href="" class="badge badge-info">게시판 </a>
															</div>
															<div class="col-md-6">
																<span> 1 / 100 </span>
															</div>
														</div>
														<div class="row border-bottom" style="width: 98%">
															<div class="col-md-6">
																<a href="" class="badge badge-warning">사진첩</a>
															</div>
															<div class="col-md-6">
																<span> 1 / 100 </span>
															</div>
														</div>
														<div class="row border-bottom" style="width: 98%">
															<div class="col-md-6">
																<a href="" class="badge badge-danger">방명록</a>
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
												<img src="../../image/siam.jpg" class="img-thumbnail" alt="..." style="max-width: 100%;">
											</div>
											<div class="col-md-3">
												<img src="../../image/siam.jpg" class="img-thumbnail" alt="..." style="max-width: 100%;">
											</div>
											<div class="col-md-3">
												<img src="../../image/siam.jpg" class="img-thumbnail" alt="..." style="max-width: 100%;">
											</div>
											<div class="col-md-3">
												<img src="../../image/siam.jpg" class="img-thumbnail" alt="..." style="max-width: 100%;">
											</div>
										</div>
										<div class="row my-2" style="overflow-y: scroll;">
											<!-- 일촌평 시작 -->
											<%
											// 1. DB 에서 가져와서 가장 최근 5개만 출력되도록 한다.
											%>
											<div class="btn-bar d-flex col-12 mb-1" style="height: 20px;">
												<div class="col-1 align-self-center">
													<span class="badge badge-warning">일촌평</span>
												</div>
												<div class="text-area col-8 align-self-center">
													<div style="width: 100%">
														<textarea class="text-input hidden text-input hidden w-100" id="input" rows="1" maxlength="50" style="border: none; border-right: 0px; border-top: 0px; boder-left: 0px; boder-bottom: 0px;"></textarea>
													</div>
													<div class="text-output" id="output" style="position: absolute top: 0 bottom: 0 width: 100% padding: $pad overflow-y: auto background: #fff user-select: none"></div>
												</div>
												<div class="btn-area col-3  align-self-center d-flex justify-content-center fori" style="width: 100%">
													<div class="btn btn-edit " id="edit" style="width: 33%">
														<button class="badge badge-dark text-white edit" onclick="dis()">EDIT</button>
													</div>
													<div class="btn btn-small btn-edit-cancel cancel" id="cancel" style="display: none; width: 33%">
														<button class="badge badge-dark text-white">취소</button>
													</div>
													<div class="btn btn-small btn-edit-submit submit" id="submit" style="display: none; width: 33%">
														<button class="badge badge-dark text-white">확인</button>
													</div>
												</div>
											</div>
											<div class="btn-bar d-flex col-12 mb-1" style="height: 20px;">
												<div class="col-1 align-self-center">
													<span class="badge badge-warning">일촌평</span>
												</div>
												<div class="text-area col-8 align-self-center">
													<div style="width: 100%">
														<textarea class="text-input hidden text-input hidden w-100" id="input" rows="1" maxlength="50" style="border: none; border-right: 0px; border-top: 0px; boder-left: 0px; boder-bottom: 0px;"></textarea>
													</div>
													<div class="text-output" id="output" style="position: absolute top: 0 bottom: 0 width: 100% padding: $pad overflow-y: auto background: #fff user-select: none"></div>
												</div>
												<div class="btn-area col-3  align-self-center d-flex justify-content-center fori" style="width: 100%">
													<div class="btn btn-edit " id="edit" style="width: 33%">
														<button class="badge badge-dark text-white edit" onclick="dis()">EDIT</button>
													</div>
													<div class="btn btn-small btn-edit-cancel cancel" id="cancel" style="display: none; width: 33%">
														<button class="badge badge-dark text-white">취소</button>
													</div>
													<div class="btn btn-small btn-edit-submit submit" id="submit" style="display: none; width: 33%">
														<button class="badge badge-dark text-white">확인</button>
													</div>
												</div>
											</div>
											<div class="btn-bar d-flex col-12 mb-1" style="height: 20px;">
												<div class="col-1 align-self-center">
													<span class="badge badge-warning">일촌평</span>
												</div>
												<div class="text-area col-8 align-self-center">
													<div style="width: 100%">
														<textarea class="text-input hidden text-input hidden w-100" id="input" rows="1" maxlength="50" style="border: none; border-right: 0px; border-top: 0px; boder-left: 0px; boder-bottom: 0px;"></textarea>
													</div>
													<div class="text-output" id="output" style="position: absolute top: 0 bottom: 0 width: 100% padding: $pad overflow-y: auto background: #fff user-select: none"></div>
												</div>
												<div class="btn-area col-3  align-self-center d-flex justify-content-center fori" style="width: 100%">
													<div class="btn btn-edit " id="edit" style="width: 33%">
														<button class="badge badge-dark text-white edit" onclick="dis()">EDIT</button>
													</div>
													<div class="btn btn-small btn-edit-cancel cancel" id="cancel" style="display: none; width: 33%">
														<button class="badge badge-dark text-white">취소</button>
													</div>
													<div class="btn btn-small btn-edit-submit submit" id="submit" style="display: none; width: 33%">
														<button class="badge badge-dark text-white">확인</button>
													</div>
												</div>
											</div>
										</div>
										<!-- 일촌평 종료 -->
										<div class="row d-flex flex-column my-2">
											<div class="h6 bg-info pl-2 text-white">storyroom</div>
											<button class="text-left" style="border: none;">
												<span class="badge badge-primary">미니룸선택</span>
												<input type="file" name="logo" id='getval' class="upload" title="Dimensions" id="imag">
											</button>
											<div class="backimg mt-10" style="width: 100%; position: relative;">
												<div id='profile-upload'>
													<div class="hvr-profile-img"></div>
												</div>
												<!-- 미니미업로드용 -->
												<div class="" style="position: absolute; top: 0; left: 0; width: 100%;">
													<span class="badge badge-warning">미니미선택</span>
													<input type="file" id="file" value="미니미 아이템">
													<canvas class="" id="canvas" width="590px" height="180px"></canvas>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<!-- 메인 페이지 종료 -->
			</div>
			<div class="col-md-2">
				<ul class="tabs d-flex flex-column">
					<li class="tab-link button pulse current"><a href="test.jsp?userNumber=<%=user.getUser_no()%>"></a>홈</li>
					<li class="tab-link button pulse"><a href="#" class="text-white">프로필</a></li>
					<li class="tab-link button pulse"><a href="../mypage/post/listPost.jsp?userNumber=<%=user.getUser_no()%>" class="text-white">게시판</a></li>
					<li class="tab-link button pulse"><a href="#" class="text-white">사진첩</a></li>
					<li class="tab-link button pulse"><a href="/cy/view/mypage/visitor/viewLogList.jsp" class="text-white">방명록</a></li>
					<li class="tab-link button pulse"><a href="/cy/view/mypage/setting/viewSetting.jsp" class="text-white">관리</a></li>
				</ul>
				<!-- 뮤직 -->
				<div class="musicplayer p-3" style="height: 100px;">
					<iframe style="display: block; margin: 0 auto; width: 100%; height: auto;" scrolling="no" frameborder="no" allow="autoplay" src="https://w.soundcloud.com/player/?url=https%3A//api.soundcloud.com/tracks/306913234&color=%23ff5500&auto_play=false&hide_related=false&show_comments=true&show_user=true&show_reposts=false&show_teaser=true&visual=true"></iframe>
				</div>
				<!-- 뮤직 -->
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
									http://cyworld/
									<span style="color: blue;"><%=user.getUser_id()%></span>
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
										<img src="../../upload/<%=user.getUser_pic()%>" alt="" class="img-thumbnail" style="max-width: 100%;" />
										<hr />
										<div class="">
											<span>
												<%=user.getIntro()%>
											</span>
										</div>
										<hr />
										<div class="d-flex justify-content-center">
											<%
											// 이미 일촌인 경우와 아닌 경우를 나눕니다.
											int friend_no = user.getUser_no();
											boolean isFriend = FriendDao.getFriendDao().isFriend(friend_no, user_no);
											if (!isFriend) {
											%>
											<button type="button" class="btn btn-warning btn-sm" value="" id="ilchonBtn" onclick="becomeFriend(<%=user.getUser_no()%>, <%=friend_no%>);">일촌맺기</button>
											<%
											} else {
											%>
											<button type="button" class="btn btn-warning btn-sm" value="" id="ilchonBtn" onclick="becomeFriend(<%=user.getUser_no()%>, <%=friend_no%>);">일촌끊기</button>
											<%
											}
											%>
										</div>
										<hr />
										<div class="d-flex justify-content-center" style="display: none">
											<button type="button" class="btn btn-secondary btn-sm" value="" style="display: none">소개글 수정</button>
										</div>
										<hr />
										<!-- 나중에 시간되면 다크모드 전환도 넣을 까해서 밝기 아이콘 넣어두었음 -->
										<div class="">
											<button type="button" class="btn btn-secondary btn-sm" value="" style="display: none">프로필 사진 수정</button>
										</div>
										<div class="my-2">
											<h6>
												홈페이지 주소(http://cyworld/
												<span style="color: blue;"><%=user.getUser_id()%></span>
												)
											</h6>
										</div>
									</div>
									<div class="col-md-9">
										<!-- 센터 부분 -->
										<div class="row" style="overflow: hidden;">
											<div class="col-md-6">
												<span style="color: orange;">updated news</span>
												<hr />
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
												<span style="color: orange;">boardlist</span>
												<hr />
												<div class="row">
													<div class="col-md-12">
														<div class="row">
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
												<img src="../../image/siam.jpg" class="img-thumbnail" alt="..." style="max-width: 100%;">
											</div>
											<div class="col-md-3">
												<img src="../../image/siam.jpg" class="img-thumbnail" alt="..." style="max-width: 100%;">
											</div>
											<div class="col-md-3">
												<img src="../../image/siam.jpg" class="img-thumbnail" alt="..." style="max-width: 100%;">
											</div>
											<div class="col-md-3">
												<img src="../../image/siam.jpg" class="img-thumbnail" alt="..." style="max-width: 100%;">
											</div>
										</div>
										<hr />
										<span style="color: orange; font-size: 12px;"> 일촌평</span>
										<div>
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
					<li class="tab-link current"><a href="test.jsp?userNumber=<%=user.getUser_no()%>">홈</a></li>
					<li class="tab-link"><a href="#" class="text-white">프로필</a></li>
					<li class="tab-link"><a href="/cy/view/mypage/post/listPost.jsp?userNumber=<%=user.getUser_no()%>" class="text-white">게시판</a></li>
					<li class="tab-link"><a href="#" class="text-white">사진첩</a></li>
					<li class="tab-link"><a href="/cy/view/mypage/visitor/viewLogList.jsp" class="text-white">방명록</a></li>
				</ul>
			</div>
		</div>
	</div>
	<%
	}
	%>
	<!-- Modal -->
	<div class="modal fade" id="updateIntroModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
		<form action="../../controller/user/updateUserIntro.jsp" method="get">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="exampleModalLabel">홈페이지 소개</h5>
						<button type="button" class="close" data-dismiss="modal" aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
					</div>
					<div class="modal-body">
						<input type="text" class="form-control" id="" name="newIntro" />
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-secondary btn-sm" data-dismiss="modal">Close</button>
						<input type="submit" class="btn btn-secondary btn-sm" name="" />
					</div>
				</div>
			</div>
		</form>
	</div>
	<div class="modal fade" id="updateUserPicModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
		<form action="../../controller/user/updateUserPic.jsp" method="post" enctype="multipart/form-data">
			<input type="hidden" name="userNo" value="<%=user_no%>" />
			<input type="hidden" name="oldPic" value="<%=myself.getUser_pic()%>">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="exampleModalLabel">프로필 사진</h5>
						<button type="button" class="close" data-dismiss="modal" aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
					</div>
					<div class="modal-body">
						<div class="input-group mb-3">
							<div class="input-group-prepend">
								<span class="input-group-text">사진업로드</span>
							</div>
							<div class="custom-file">
								<input type="file" class="custom-file-input" id="newPic" name="newPic" onchange="readURL(this);" />
								<label for="newPic" class="custom-file-label">Choose file</label>
							</div>
						</div>
						<div>
							<img class="" id="imagePreview" style="max-width: 100%;">
						</div>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-secondary btn-sm" data-dismiss="modal">Close</button>
						<input type="submit" class="btn btn-secondary btn-sm" name="" />
					</div>
				</div>
			</div>
		</form>
	</div>
	<script type="text/javascript">
	
		function becomeFriend(friend_no, user_no) {
			var you = friend_no;
			var me = user_no;
			$.ajax({
				url : '../../controller/user/ilchonController.jsp',
				data : {
					friend_no : you, user_no : me
				},
				success : function(result) {
					if(result==1){
						document.getElementById("ilchonBtn").innerHTML="일촌맺기";
					} else {
						document.getElementById("ilchonBtn").innerHTML="일촌끊기";
					}
				}

			});
		}
		
		function readURL(input){
			  if (input.files && input.files[0]) {
				    var reader = new FileReader();
				    reader.onload = function(e) {
				      document.getElementById('imagePreview').src = e.target.result;
				    };
				    reader.readAsDataURL(input.files[0]);
				  } else {
				    document.getElementById('imagePreview').src = "";
				  }
			
		}
		
		
	</script>
	<!-- 이미지 배경 업로드 -->
	<script type="text/javascript">
	document.getElementById('getval').addEventListener('change', readURL, true);
	function readURL(){
	    var file = document.getElementById("getval").files[0];
	    var reader = new FileReader();
	    reader.onloadend = function(){
	        document.getElementById('profile-upload').style.backgroundImage = "url(" + reader.result + ")";        
	    }
	    if(file){
	        reader.readAsDataURL(file);
	    }else{
	    }
	}
	</script>
	<!--미니미업로드1,2  -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
	<script src="https://rawgit.com/kangax/fabric.js/master/dist/fabric.min.js"></script>
	<script type="text/javascript">
	var canvas = new fabric.Canvas('canvas');

	document.getElementById('file').addEventListener("change", function (e) {
	  var file = e.target.files[0];
	  var reader = new FileReader();
	  console.log("reader   " + reader);
	  reader.onload = function (f) {
	    var data = f.target.result;
	    fabric.Image.fromURL(data, function (img) {
	      var oImg = img.set({left: 0, top: 0, width: 600, height: 100, angle: 0}).scale(0.9);
	      canvas.add(oImg).renderAll();
	      canvas.setActiveObject(oImg);  
	    });
	  };
	  reader.readAsDataURL(file);
	});

	</script>
	<!-- 글등록 -->
	<script>
	
	$('.fori').each(function(){
		
		 $(".edit").on("click", function(){

			  $('.cancel').show();
			  $('.submit').show();

			  });

	
	
	  $(".cancel").on("click", function(){

		  $('.cancel').hide();
		  $('.submit').hide();

		  });

	
		
		 $(".submit").on("click", function(){

			  $('.cancel').hide();
			  $('.submit').hide();

			  });

			
	} );
	
	 
  
	  
	  
        function name() {

        }

        var btnEdit = document.getElementById("edit");
        var btnCancel = document.getElementById("cancel");
        var btnSubmit = document.getElementById("submit");

        function activateInput() {
            var currentText = output.innerHTML;
            input.value = currentText.replace(/<br>/g, "\n");
            btnEdit.classList.add("activated");
            options.classList.add("hidden");
            output.classList.add("hidden");
            input.classList.remove("hidden");
            input.focus();
        }

        function submitInput() {
            var newText = input.value;
            output.innerHTML = newText.replace(/\n\r?/g, '<br>');
            deactivateInput();
        }

        function deactivateInput() {
            btnEdit.classList.remove("activated");
            options.classList.remove("hidden");
            input.classList.add("hidden");
            output.classList.remove("hidden");
        }

        function init() {
            // start editing
            btnEdit.addEventListener(
                "click",
                function () {
                    if (!btnEdit.classList.contains("activated")) {
                        activateInput();
                    }
                }
            );

            // cancel editing
            btnCancel.addEventListener(
                "click",
                function () {
                    deactivateInput();
                }
            );

            // submit text
            btnSubmit.addEventListener(
                "click",
                function () {
                    submitInput();
                }
            );

            // open input for initial text
            // ---------------------------
            activateInput();


        }
    </script>
</body>
</html>