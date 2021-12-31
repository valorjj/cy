<%@page import="dto.Total"%>
<%@page import="dao.mypage.VisitorDao"%>
<%@page import="dao.mypage.GalleryDao"%>
<%@page import="dao.mypage.PostDao"%>
<%@page import="dto.FLog"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dao.mypage.FLogDao"%>
<%@page import="dao.user.FriendDao"%>
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
	int otherUserNo = -1; // 1. 검색한 유저의 정보를 저장하는 변수입니다. -1 로 초기화 시켜둡니다. 
	// 2. otherUserNo 변수 하나로 검색이 있을때, 없을때, 자기 자신을 검색했을 때를 통합적으로 사용합니다.
	// 3. 검색이 있을 경우에는 검색한 사람의 번호로 초기화시킵니다.
	// 3.1 내 자신을 검색한 경우에는 로그인 한 사람의 번호로 초기화시킵니다.
	// 3.2 다른 사람을 검색한 경우에는 검색한 사람의 번호로 초기화시킵니다. 
	// 4. 검색이 없는 경우에는 로그인 한 계정의 번호로 초기화시킵니다. 

	User myself = UserDao.getUserDao().getUser(user_no); // 메인 홈페이지에 내 정보를 우선적으로 표시해야하는 경우를 위해 로그인 한 사람의 정보를 미리 저장해둡니다. 
	// 필요없을 것 같음
	String otherUserId = null;

	System.out.println("접속한 본인 유저 번호는 : " + user_no);

	if (request.getParameter("userSearch") != null) {
		// 1. 검색이 존재하는 경우입니다. 
		// 2. 검색한 유저의 번호를 otherUserNo 라는 변수에 초기화시킵니다. 
		// 3. 다른 유저를 검색했을 경우, "other" 라는 세션에 그 번호를 저장합니다. 
		otherUserNo = Integer.parseInt(request.getParameter("userSearch"));
		otherUserId = UserDao.getUserDao().getid(otherUserNo);
		OtherSession otherSession = new OtherSession(otherUserNo, otherUserId);

		session.setAttribute("other", otherSession);
		System.out.println("검색한 사람의 번호는 :" + otherUserNo);

		if (otherUserNo == user_no) {
			// 1. 검색 대상이 본인 아이디인 경우
			// 2. otherUserNo 를 내 유저 번호로 초기화시킵니다. 
			System.out.println("검색한 사람이 자기 자신일 때 :" + otherUserNo);
			otherUserNo = user_no;
		} else {
			// 1. 검색 대상이 남의 아이디인 경우
			// 2. 조회수를 증가시키는 부분입니다. 
			System.out.println("검색한 사람이 남일 때 ");
			UserDao.getUserDao().updateViewCount(otherUserNo); // 방문한 사람의 홈페이지 조회수를 +1 시킵니다.
			String visitor = user_no + ":" + otherUserNo; // 로그인 한 계정 번호:찾아서 들어간 사람정보
			if (session.getAttribute(visitor) == null) {
		session.setAttribute(visitor, true); // 조회수 증가 방지 세션 값 설정
		session.setMaxInactiveInterval(60 * 60 * 24); // 세션 유효시간을 하루로 설정합니다. 
			}
		}

	} else {
		System.out.println("검색한 사람이 없을 때 회원 번호 :" + otherUserNo);
		// 검색값이 로그인 한 유저와 동일한 경우입니다. 
		otherUserNo = user_no;
	}

	if (otherUserNo == user_no) {
		// 검색한 유저 고유 번호와 로그인 한 계정이 일치할 경우
		// 관리 탭을 보이게한다. 
		System.out.println("현재 내 홈페이지를 보고있습니다. 내 회원 번호는 : " + otherUserNo);
		User user = UserDao.getUserDao().getUser(otherUserNo);
		// 로그인 한 사람 번호에 해당하는 게시물 가져오기
	%>


	<div class="container p-3" style="background-color: lightgrey;">
		<div class="container p-1" style="border: 2px dotted white">
			<div class="row no-gutters">
				<div class="col-md-10" style="box-shadow: 1px 1px 1px black;">
					<div id="" class="tab-content current" style="overflow: auto;">
						<!-- 메인 페이지 호출 -->
						<div class="container">
							<div class="row">
								<div class="col-md-4">
									<div class="row mainViewCount p-1" style="font-size: 0.8rem;">
										<div class="col-md-4">
											Today: <span style="color: orange;">(?)</span>
										</div>
										<div class="col-md-4">
											Total: <span style="color: orange;"><%=user.getView()%></span>
										</div>
									</div>
								</div>

								<div class="col-md-4">
									<div class="col-md-8">
										<span><%=user.getIntro()%></span>
									</div>
								</div>

								<div class="col-md-4">
									<div class="col-md-8">
										<span>www.cyworld.myHome/<%=user.getUser_id()%></span>
									</div>
								</div>

							</div>
							<!-- 홈페이지 상단 종료 -->
							<hr />
							<!-- 메인 페이지 시작 -->
							<div class="row" style="height: 500px; overflow: auto;">
								<div class="col-md-12 no-gutters">
									<div class="row">
										<div class="col-md-3"
											style="overflow: auto; box-shadow: 2px 2px 2px #cccccc;">
											<img src="../../upload/<%=user.getUser_pic()%>" alt=""
												class="img-thumbnail" style="max-width: 100%;" />
											<hr />
											<div>
												<span> <%=user.getIntro()%>
												</span>
											</div>
											<hr />
											<div class="d-flex justify-content-center">
												<button type="button" class="btn btn-info btn-sm"
													data-toggle="modal" data-target="#updateIntroModal">소개글
													수정</button>
											</div>
											<hr />
											<!-- 나중에 시간되면 다크모드 전환도 넣을 까해서 밝기 아이콘 넣어두었음 -->
											<div class="d-flex justify-content-center">
												<button type="button" class="btn btn-success btn-sm"
													data-toggle="modal" data-target="#updateUserPicModal">프로필
													사진 수정</button>
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

										<div class="col-md-9" style="box-shadow: 2px 2px 2px #cccccc;">
											<!-- 센터 부분 -->
											<div class="row" style="overflow: hidden;">
												<div class="col-md-6">
													<span style="color: orange;">updated news</span>
													<hr />

													<%
													System.out.println("현재 본인 미니 홈페이지를 보고 있습니다. 내 번호는 :" + otherUserNo);
													ArrayList<Total> totals = UserDao.getUserDao().getTotalContents(otherUserNo);
													if (totals != null) {
														for (Total total : totals) {
													%>
													<div class="col-12 d-flex border-bottom">
														<div class="col-md-4">
															<%
															if (total.getCategory().equals("게시판")) {
															%>
															<div class="badge badge-info"><%=total.getCategory()%></div>

															<%
															} else if (total.getCategory().equals("사진첩")) {
															%>
															<div class="badge badge-danger"><%=total.getCategory()%></div>
															<%
															} else if (total.getCategory().equals("방명록")) {
															%>
															<div class="badge badge-warning"><%=total.getCategory()%></div>
															<%
															}
															%>
														</div>
														<div class="col-md-8">
															<div class="w-auto"><%=total.getContent().substring(0, 5)%></div>
														</div>
													</div>
													<%
													}
													} else {
													%>
													<div>등록된 게시물이 없습니다 ...</div>
													<%
													}
													%>
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
																	<span> 0 / <%=PostDao.getPostDao().getTotalPost(user_no)%>
																	</span>
																</div>
															</div>
															<div class="row border-bottom" style="width: 98%">
																<div class="col-md-6">
																	<a href="" class="badge badge-danger">사진첩</a>
																</div>
																<div class="col-md-6">
																	<span> 0 / <%=GalleryDao.getGalleryDao().getTotalGallery(user_no)%>
																	</span>
																</div>
															</div>
															<div class="row border-bottom" style="width: 98%">
																<div class="col-md-6">
																	<a href="" class="badge badge-warning">방명록</a>
																</div>
																<div class="col-md-6">
																	<span> 0 / <%=VisitorDao.getvisitorDao().getTotalVisitor(user_no)%>
																	</span>
																</div>
															</div>
														</div>
														<!-- 게시판 리스트 종료 -->
													</div>
												</div>
											</div>


											<hr />
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
											<div class="row p-2">
												<span style="color: orange; font-size: 12px;"> 일촌평</span>
											</div>

											<%
											// 1. 일촌평을 가져와서 출력합니다. 
											ArrayList<FLog> fLogs = FLogDao.getFLogDao().getFLogList(user_no);
											for (FLog fLog : fLogs) {
											%>
											<div class="btn-bar d-flex col-12 mb-1" style="height: 20px;">
												<div class="col-1 align-self-center">
													<span class="badge badge-warning">일촌평</span>
												</div>
												<div class="text-area col-8 align-self-center">
													<div style="width: 100%">
														<textarea
															class="text-input hidden text-input hidden w-100"
															id="input" rows="1" maxlength="50"
															style="border: none; border-right: 0px; border-top: 0px; boder-left: 0px; boder-bottom: 0px;"><%=fLog.getFlog_content()%></textarea>
													</div>
													<div class="text-output" id="output"
														style="position: absolute top: 0 bottom: 0 width: 100% padding: $pad overflow-y: auto background: #fff user-select: none"></div>
												</div>
												<div
													class="btn-area col-3  align-self-center d-flex justify-content-center fori"
													style="width: 100%">
													<div class="btn btn-edit " id="edit" style="width: 33%">
														<button class="badge badge-dark text-white edit"
															onclick="dis()">EDIT</button>
													</div>
													<div class="btn btn-small btn-edit-cancel cancel"
														id="cancel" style="display: none; width: 33%">
														<button class="badge badge-dark text-white">취소</button>
													</div>
													<div class="btn btn-small btn-edit-submit submit"
														id="submit" style="display: none; width: 33%">
														<button class="badge badge-dark text-white">확인</button>
													</div>
												</div>
											</div>
											<%
											}
											%>
										</div>
									</div>
									<!-- 일촌평 종료 -->
								</div>
							</div>
						</div>
					</div>
					<!-- 메인 페이지 종료 -->
				</div>
				<div class="col-md-2">
					<ul class="tabs">
						<li class="tab-link current text-white"><a
							href="test.jsp?userNumber=<%=user.getUser_no()%>"></a>홈</li>
						<li class="tab-link"><a
							href="../user/viewUserProfile.jsp?userNumber=<%=user_no%>"
							class="text-white">프로필</a></li>
						<li class="tab-link"><a
							href="../mypage/post/listPost.jsp?userNumber=<%=user.getUser_no()%>"
							class="text-white">게시판</a></li>
						<li class="tab-link"><a
							href="../mypage/gallery/listGallery.jsp?userNumber=<%=user_no%>"
							class="text-white">사진첩</a></li>
						<li class="tab-link"><a
							href="/cy/view/mypage/visitor/viewLogList.jsp?userNumber=<%=user_no%>"
							class="text-white">방명록</a></li>
						<li class="tab-link"><a href="#" class="text-white">관리</a></li>
					</ul>
					<div class="musicplayer p-3" style="height: 100px;">
						<iframe
							style="display: block; margin: 0 auto; width: 100%; height: auto;"
							scrolling="no" frameborder="no" allow="autoplay"
							src="https://w.soundcloud.com/player/?url=https%3A//api.soundcloud.com/tracks/306913234&color=%23ff5500&auto_play=false&hide_related=false&show_comments=true&show_user=true&show_reposts=false&show_teaser=true&visual=true"></iframe>
					</div>
				</div>
			</div>
		</div>
	</div>
	<%
	} else {
	// 로그인 된 계정과 다른 유저의 미니 홈페이지에 방문하는 경우
	// 관리 페이지를 숨긴다. 
	System.out.println("다른 사람 홈페이지에 방문했습니다. 홈페이지 주인 번호는 : " + otherUserNo + " 입니다. ");
	User user = UserDao.getUserDao().getUser(otherUserNo);
	%>
	<div class="container p-3" style="background-color: lightgrey;">
		<div class="container p-1" style="border: 2px dotted white">
			<div class="row no-gutters">
				<div class="col-md-10" style="box-shadow: 1px 1px 1px black;">
					<div id="tab-1" class="tab-content current" style="overflow: auto;">
						<!-- 메인 페이지 호출 -->
						<div class="container">
							<div class="row">
								<div class="col-md-4">
									<div class="row mainViewCount p-1" style="font-size: 0.8rem;">
										<div class="col-md-4">
											Today: <span style="color: orange;">(?)</span>
										</div>
										<div class="col-md-4">
											Total: <span style="color: orange;"><%=user.getView()%></span>
										</div>
									</div>
								</div>

								<div class="col-md-4">
									<div class="col-md-8">
										<span><%=user.getIntro()%></span>
									</div>
								</div>

								<div class="col-md-4">
									<div class="col-md-8">
										<span>www.cyworld.myHome/<%=user.getUser_id()%></span>
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

											<img src="../../upload/<%=user.getUser_pic()%>" alt=""
												class="img-thumbnail" style="max-width: 100%;" />
											<hr />
											<div class="">
												<span> <%=user.getIntro()%>
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
												<button type="button" class="btn btn-warning btn-sm"
													value="" id="ilchonBtn"
													onclick="becomeFriend(<%=friend_no%>, <%=user_no%>);">일촌맺기</button>
												<%
												} else {
												%>
												<button type="button" class="btn btn-warning btn-sm"
													value="" id="ilchonBtn"
													onclick="becomeFriend(<%=friend_no%>, <%=user_no%>);">일촌끊기</button>
												<%
												}
												%>
											</div>
											<hr />
											<div class="my-2">
												<h6>
													홈페이지 주소(http://cyworld/<span style="color: blue;"><%=user.getUser_id()%></span>)
												</h6>
											</div>
										</div>

										<div class="col-md-9">
											<!-- 센터 부분 : 게시판 정보, 사진, 일촌평, 미니룸은 나중에 -->
											<div class="row" style="overflow: hidden;">
												<div class="col-md-6">
													<span style="color: orange;">updated news</span>
													<hr />

													<%
													
													ArrayList<Total> totals2 = UserDao.getUserDao().getTotalContents(user.getUser_no());
													System.out.println("현재보고 있는 사람 회원 번호는 :" + user.getUser_no());
													if (totals2 != null) {
														for (Total total : totals2) {
															
													%>
													<div class="col-12 d-flex border-bottom">
														<div class="col-md-4">
															<%
															if (total.getCategory().equals("게시판")) {
															%>
															<div class="badge badge-info"><%=total.getCategory()%></div>

															<%
															} else if (total.getCategory().equals("사진첩")) {
															%>
															<div class="badge badge-danger"><%=total.getCategory()%></div>
															<%
															} else if (total.getCategory().equals("방명록")) {
															%>
															<div class="badge badge-warning"><%=total.getCategory()%></div>
															<%
															}
															%>
														</div>
														<div class="col-md-8">
															<div class="w-auto"><%=total.getContent().substring(0, 5)%></div>
														</div>
													</div>
													<%
													}
													} else { // 1. 등록된 게시물이 아무것도 없을 때
													%>
													<div>아무런 게시글이 없습니다 ...</div>
													<div>아무런 게시글이 없습니다 ...</div>
													<div>아무런 게시글이 없습니다 ...</div>
													<div>아무런 게시글이 없습니다 ...</div>
													<%
													}
													%>
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
																	<span> 0 / <%=PostDao.getPostDao().getTotalPost(user.getUser_no())%>
																	</span>
																</div>
															</div>
															<div class="row border-bottom" style="width: 98%">
																<div class="col-md-6">
																	<a href="" class="badge badge-warning">사진첩</a>
																</div>
																<div class="col-md-6">
																	<span> 0 / <%=GalleryDao.getGalleryDao().getTotalGallery(user.getUser_no())%>
																	</span>
																</div>
															</div>
															<div class="row border-bottom" style="width: 98%">
																<div class="col-md-6">
																	<a href="" class="badge badge-danger">방명록</a>
																</div>
																<div class="col-md-6">
																	<span> 0 / <%=VisitorDao.getvisitorDao().getTotalVisitor(user.getUser_no())%>
																	</span>
																</div>
															</div>
														</div>
														<!-- 게시판 리스트 종료 -->
													</div>
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
											<div class="row">
												<div class="col-md-6">
													<span style="color: orange; font-size: 12px;"> 일촌평</span>
												</div>
												<div class="col-md-6">
													<button type="button" class="btn btn-secondary btn-sm"
														id="ilchonBtn" data-toggle="modal"
														data-target="#createNewIlchonComment">일촌평 등록</button>

												</div>
											</div>

											<hr />
											<%
											// 1. 일촌평을 가져와서 출력합니다. 
											ArrayList<FLog> fLogs = FLogDao.getFLogDao().getFLogList(user.getUser_no());
											for (FLog fLog : fLogs) {
											%>
											<div class="btn-bar d-flex col-12 mb-1" style="height: 20px;">
												<div class="col-1 align-self-center">
													<span class="badge badge-warning">일촌평</span>
												</div>
												<div class="text-area col-8 align-self-center">
													<div style="width: 100%">
														<textarea
															class="text-input hidden text-input hidden w-100"
															id="input" rows="1" maxlength="50"
															style="border: none; border-right: 0px; border-top: 0px; boder-left: 0px; boder-bottom: 0px;"><%=fLog.getFlog_content()%></textarea>
													</div>
													<div class="text-output" id="output"
														style="position: absolute top: 0 bottom: 0 width: 100% padding: $pad overflow-y: auto background: #fff user-select: none"></div>
												</div>
												<div
													class="btn-area col-3  align-self-center d-flex justify-content-center fori"
													style="width: 100%">
													<div class="btn btn-edit " id="edit" style="width: 33%">
														<button class="badge badge-dark text-white edit"
															onclick="dis()">EDIT</button>
													</div>
													<div class="btn btn-small btn-edit-cancel cancel"
														id="cancel" style="display: none; width: 33%">
														<button class="badge badge-dark text-white">취소</button>
													</div>
													<div class="btn btn-small btn-edit-submit submit"
														id="submit" style="display: none; width: 33%">
														<button class="badge badge-dark text-white">확인</button>
													</div>
												</div>
											</div>
											<%
											}
											%>
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
						<li class="tab-link current text-white"><a
							href="test.jsp?userNumber=<%=otherUserNo%>">홈</a></li>
						<li class="tab-link"><a
							href="../user/viewUserProfile.jsp?userNumber=<%=otherUserNo%>"
							class="text-white">프로필</a></li>
						<li class="tab-link"><a
							href="/cy/view/mypage/post/listPost.jsp?userNumber=<%=otherUserNo%>"
							class="text-white">게시판</a></li>
						<li class="tab-link"><a
							href="../mypage/gallery/listGallery.jsp?userNumber=<%=otherUserNo%>"
							class="text-white">사진첩</a></li>
						<li class="tab-link"><a
							href="/cy/view/mypage/visitor/viewLogList.jsp?userNumber=<%=otherUserNo%>"
							class="text-white">방명록</a></li>
					</ul>
					<div class="musicplayer p-3" style="height: 100px;">
						<iframe
							style="display: block; margin: 0 auto; width: 100%; height: auto;"
							scrolling="no" frameborder="no" allow="autoplay"
							src="https://w.soundcloud.com/player/?url=https%3A//api.soundcloud.com/tracks/306913234&color=%23ff5500&auto_play=false&hide_related=false&show_comments=true&show_user=true&show_reposts=false&show_teaser=true&visual=true"></iframe>
					</div>
				</div>
			</div>
		</div>
	</div>
	<%
	}
	%>
	<!-- Modal -->
	<div class="modal fade" id="updateIntroModal" tabindex="-1"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<form action="../../controller/user/updateUserIntro.jsp" method="get">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="exampleModalLabel">홈페이지 소개</h5>
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
					</div>
					<div class="modal-body">
						<input type="text" class="form-control" id="" name="newIntro" />
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-secondary btn-sm"
							data-dismiss="modal">Close</button>
						<input type="submit" class="btn btn-secondary btn-sm" name="" />
					</div>
				</div>
			</div>
		</form>
	</div>
	<div class="modal fade" id="updateUserPicModal" tabindex="-1"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<form action="../../controller/user/updateUserPic.jsp" method="post"
			enctype="multipart/form-data">
			<input type="hidden" name="userNo" value="<%=user_no%>" /> <input
				type="hidden" name="oldPic" value="<%=myself.getUser_pic()%>">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="exampleModalLabel">프로필 사진</h5>
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
					</div>
					<div class="modal-body">
						<div class="input-group mb-3">
							<div class="input-group-prepend">
								<span class="input-group-text">사진업로드</span>
							</div>
							<div class="custom-file">
								<input type="file" class="custom-file-input" id="newPic"
									name="newPic" onchange="readURL(this);" /> <label for="newPic"
									class="custom-file-label">Choose file</label>
							</div>
						</div>
						<div>
							<img class="" id="imagePreview" style="max-width: 100%;">
						</div>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-secondary btn-sm"
							data-dismiss="modal">Close</button>
						<input type="submit" class="btn btn-secondary btn-sm" name="" />
					</div>
				</div>
			</div>
		</form>
	</div>

	<!-- Modal -->
	<div class="modal fade" id="createNewIlchonComment" tabindex="-1"
		aria-hidden="true">
		<form action="../../controller/user/createIlchonCommentController.jsp"
			method="post">
			<input type="hidden" value="<%=otherUserNo%>" name="otherUserNo">
			<input type="hidden" value="<%=user_no%>" name="userNo">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="exampleModalLabel">친구에게 일촌평을
							남겨주세요 !</h5>
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
					</div>
					<div class="modal-body">
						<input type="text" class="form-control" id="friendComment"
							name="friendComment" />
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-secondary btn-sm"
							data-dismiss="modal">Close</button>
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
	<!-- 	<script type="text/javascript">
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
	미니미업로드1,2 
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
	<script
		src="https://rawgit.com/kangax/fabric.js/master/dist/fabric.min.js"></script> -->
	<!-- 	<script type="text/javascript">
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

	</script> -->
	<!-- 글등록 -->
	<!-- 	<script>
	
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
    </script> -->
</body>
</html>