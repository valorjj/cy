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

<link rel="stylesheet" href="/cy/css/common/mini.css" />
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

	<div class="container p-3" style="background-color: #263333;">
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
												<h6>
													홈페이지 주소(http://cyworld/<span style="color: blue;"><%=user.getUser_id()%></span>)
												</h6>
											</div>
										</div>

										<div class="col-md-9" style="box-shadow: 2px 2px 2px #cccccc;">
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
											<div class="row">
												<div class="col-md-2"><%=UserDao.getUserDao().getid(fLog.getFriend_no())%></div>
												<div class="col-md-7"><%=fLog.getFlog_content()%></div>
												<div class="col-md-3"><%=fLog.getFlow_date()%></div>
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
				</div>
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
		<div class="container p-1" style="border: 2px dotted white">
			<div class="row no-gutters">
				<div class="col-md-10">
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
										<span>사이트 한 줄 소개</span>
									</div>
								</div>

								<div class="col-md-4">
									<div class="col-md-8">
										http://cyworld/<span style="color: blue;"><%=user.getUser_id()%></span>
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
											<div class="d-flex justify-content-center"
												style="display: none">
												<button type="button" class="btn btn-secondary btn-sm"
													value="" style="display: none">소개글 수정</button>
											</div>
											<hr />
											<!-- 나중에 시간되면 다크모드 전환도 넣을 까해서 밝기 아이콘 넣어두었음 -->
											<div class="">
												<button type="button" class="btn btn-secondary btn-sm"
													value="" style="display: none">프로필 사진 수정</button>
											</div>
											<div class="my-2">
												<h6>
													홈페이지 주소(http://cyworld/<span style="color: blue;"><%=user.getUser_id()%></span>)
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
											<div class="row">
												<div class="col-md-2"><%=UserDao.getUserDao().getid(fLog.getFriend_no())%></div>
												<div class="col-md-7"><%=fLog.getFlog_content()%></div>
												<div class="col-md-3"><%=fLog.getFlow_date()%></div>
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
							href="test.jsp?userNumber=<%=user.getUser_no()%>">홈</a></li>
						<li class="tab-link"><a
							href="../user/viewUserProfile.jsp?userNumber=<%=otherUserNo%>"
							class="text-white">프로필</a></li>
						<li class="tab-link"><a
							href="/cy/view/mypage/post/listPost.jsp?userNumber=<%=user.getUser_no()%>"
							class="text-white">게시판</a></li>
						<li class="tab-link"><a
							href="../mypage/gallery/listGallery.jsp" class="text-white">사진첩</a></li>
						<li class="tab-link"><a
							href="/cy/view/mypage/visitor/viewLogList.jsp?userNumber=<%=user.getUser_no()%>"
							class="text-white">방명록</a></li>
					</ul>
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
</body>
</html>