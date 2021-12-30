<%@page import="dto.User"%>
<%@page import="dao.user.UserDao"%>
<%@page import="dao.mypage.ReplyDao"%>
<%@page import="dto.Reply"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dao.mypage.GalleryDao"%>
<%@page import="dto.Gallery"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link rel="stylesheet" href="/cy/css/common/mini.css" />
</head>
<body>
	<%@ include file="../../common/header.jsp"%>

	<%
	int userNo = Integer.parseInt(request.getParameter("userNumber")); // 갤러리 주인 번호 
	User user = UserDao.getUserDao().getUser(userNo); // 갤러리 주인 정보 불러오기 

	String pagenum = request.getParameter("pagenum"); // 4. 클릭한 페이지번호
	if (pagenum == null) { // 클릭한 페이지번호가 없으면 [ 게시판 첫화면 ]
		pagenum = "1"; //	1페이지 설정
	}

	int lastrow = GalleryDao.getGalleryDao().gallerycount(); // 1. 총 게시물수 
	int listsize = 4; //2. 페이지당 화면에 표시할 게시물수 

	int lastpage = 0; // 3. 마지막페이지

	if (lastrow % listsize == 0) { // 만약에 총게시물/페이지당게시물 나머지가 없으면
		lastpage = lastrow / listsize; // * 총게시물/페이당게시물 
	} else {
		lastpage = lastrow / listsize + 1; // * 총게시물/페이당게시물+1
	}

	int currentpage = Integer.parseInt(pagenum); // 5. 현재페이지번호
	int startrow = (currentpage - 1) * listsize;

	ArrayList<Gallery> galleries;
	%>

	<div class="container" style="background-color: #263333;">
		<div class="container p-1" style="border: 2px dotted white">
			<div class="row no-gutters">
				<div class="col-md-10" style="box-shadow: 1px 1px 1px black;">
					<div class="tab-content current" style="overflow: auto;">
						<div class="container">
							<div class="row">
								<div class="col-md-2" id="left-nav">
									<img src="../../../upload/<%=user.getUser_pic()%>" alt=""
										class="img-thumbnail" style="max-width: 100%;">
									<hr>
									<div>
										<span> <%=user.getIntro()%></span>
									</div>
									<hr>
									<div class="d-flex justify-content-center">
										<button type="button" class="btn btn-secondary btn-sm"
											data-toggle="modal" data-target="#updateIntroModal">소개글
											수정</button>
									</div>
									<hr />
									<!-- 나중에 시간되면 다크모드 전환도 넣을 까해서 밝기 아이콘 넣어두었음 -->
									<div class="d-flex justify-content-center">
										<button type="button" class="btn btn-secondary btn-sm"
											data-toggle="modal" data-target="#updateUserPicModal">프로필
											사진 수정</button>
									</div>
								</div>
								<div class="col-md-10"
									style="overflow: auto; height: 500px; align-items: center;"
									id="right-nav">

									<%
									if (GalleryDao.getGalleryDao().gallerylist(startrow, listsize, userNo) != null) {
										galleries = GalleryDao.getGalleryDao().gallerylist(startrow, listsize, userNo);

										int j = 0;
										for (Gallery gallery : galleries) {
									%>

									<!-- 게시물 출력 div 시작 -->
									<div class="card my-5"
										style="align-content: center; text-align: center; padding: 0px 30px; margin-left: 50px; background-color: #eeeeee; box-shadow: 2px 2px 2px #cccccc;">
										<!-- 게시물 제목 출력 -->
										<div class="row"
											style="background-color: #eeeeee; border-bottom: 1px solid white">
											<p class="item"><%=gallery.getTitle()%></p>
										</div>
										<div class="row"
											style="background-color: #eeeeee; border-bottom: 1px solid white">
											<div class="col-md-1"><%=j%></div>
											<div class="col-md-3"><%=gallery.getWriter()%></div>
											<div class="col-md-3"><%=gallery.getDate()%></div>
										</div>

										<div class="d-flex justify-content-end">
											<div class="col-md-3 my-2">
												<a
													href="updateGallery.jsp?gpost_no=<%=gallery.getGpost_no()%>&userNumber=<%=userNo%>">
													<button type="button" class="btn btn-secondary btn-sm"
														value="" name="">수정</button>
												</a>
											</div>
											<div class="col-md-3 my-2">
												<a
													href="../../../controller/mypage/gallery/deleteGalleryController.jsp?gpost_no=<%=gallery.getGpost_no()%>">
													<button type="button" class="btn btn-secondary btn-sm"
														value="" name="">삭제</button>
												</a>
											</div>
										</div>
										<hr>

										<br> <br> <img
											src="../../../upload/<%=gallery.getPhoto()%>"
											class="card-img-top pimg img-thumbnail" style="width: 500px;">
										<div class="card-body">
											<hr>
											<!-- 본문내용 -->
											<p class="item"><%=gallery.getContent()%>
											</p>
										</div>
										<br>
										<hr>

										<div style="overflow: auto; height: 120px;">
											<table class="table table-hover table-borderless">
												<tr>
													<th>번호</th>
													<th>id</th>
													<th>내용</th>
													<th colspan="2">작성일</th>

												</tr>
												<%
												ArrayList<Reply> replies = ReplyDao.getReplyDao().galleryCommentlist(gallery.getGpost_no());
												int i = 1;
												for (Reply reply : replies) {
												%>
												<tr>
													<th><%=i%></th>
													<th><%=reply.getWriter()%></th>
													<th><%=reply.getContent()%></th>
													<th><%=reply.getDate()%></th>
													<th><a
														href="../../../controller/mypage/comment/gpostDeleteController.jsp?reply_no=<%=reply.getReply_no()%>&gpost_no=<%=gallery.getGpost_no()%>">
															<button class="form-control btn btn-outline-none">X</button>
													</a>
												</tr>
												<%
												i++;
												}
												%>
											</table>
										</div>
										<br>
										<div class="row">
											<div class="col-md-9">
												<input type="text" class="form-control" id="reply1"
													name="reply2">
											</div>
											<div class="col-md-3">
												<button type="button" class="form-control"
													onclick="reply( <%=gallery.getGpost_no()%> , <%=j%>, <%=userNo%>);">댓글</button>
												<br>
											</div>
										</div>
									</div>
								</div>
								<!-- 게시물 출력 div 종료 -->
								<br> <br> <br>
								<%
								j++;
								}
								}
								%>

								<div class="row">
									<div class="col-md-4 offset-4">
										<ul class="pagination">
											<%
											if (currentpage == 1) {
											%>
											<li class="page-item"><a
												href="listGallery.jsp?pagenum=<%=currentpage%>"
												class="page-link"> ◀ </a></li>
											<%
											} else {
											%>
											<li class="page-item"><a
												href="listGallery.jsp?pagenum=<%=currentpage - 1%>"
												class="page-link"> ◀ </a></li>
											<%
											}
											%>
											<%
											for (int i = 1; i <= lastpage; i++) {
											%>
											<li class="page-item"><a
												href="listGallery.jsp?pagenum=<%=i%>" class="page-link"><%=i%></a></li>
											<%
											}
											%>
											<%
											if (currentpage == lastpage) {
											%>
											<li class="page-item"><a
												href="listGallery.jsp?pagenum=<%=currentpage%>"
												class="page-link"> ▶ </a></li>
											<%
											} else {
											%>
											<li class="page-item"><a
												href="listGallery.jsp?pagenum=<%=currentpage + 1%>"
												class="page-link"> ▶ </a></li>
											<%
											}
											%>
										</ul>
									</div>
								</div>
							</div>
						</div>
						<br>
						<div class="col-md-3 offset-9">
							<br> <br> <a href="writeGallery.jsp?userNo=<%=userNo%>"><button
									type="button" class="form-control">글 등록</button></a>
						</div>
					</div>
				</div>

				<div class="col-md-2">
					<ul class="tabs">
						<li class="tab-link"><a
							href="/cy/view/main/test.jsp?userNumber=<%=userNo%>"
							class="text-white">홈</a></li>
						<li class="tab-link"><a
							href="/cy/view/user/viewUserProfile.jsp?userNumber=<%=userNo%>"
							class="text-white">프로필</a></li>
						<li class="tab-link current" id="folder-4"><a
							href="/cy/view/mypage/post/listPost.jsp?userNumber=<%=userNo%>"
							class="text-white">게시판</a></li>
						<li class="tab-link" id="folder-5" class="text-white"><a
							href="/cy/view/mypage/gallery/listGallery.jsp?userNumber=<%=userNo%>">사진첩</a></li>
						<li class="tab-link"><a
							href="/cy/view/mypage/visitor/viewLogList.jsp?userNumber=<%=userNo%>"
							class="text-white">방명록</a></li>
						<li class="tab-link" style="display: none;" class="text-white">관리</li>
					</ul>
				</div>


			</div>
		</div>
	</div>

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
				type="hidden" name="oldPic" value="<%=user.getUser_pic()%>">
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



	<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
	<script>
	
		function reply( gpost_no ,j, userNo) {
			var reply1 = document.getElementsByName("reply2")[j].value;
			$.ajax({
				url: "../../../controller/mypage/comment/gpostWriteController.jsp",
				data: { reply1 : reply1 , gpost_no : gpost_no, userNo : userNo},
				success: function(result) { 	
					if(result==1){
						// 댓글 등록 성공 시 
						location.href='../../../view/mypage/gallery/listGallery.jsp?gpost_no'+gpost_no+'&userNumber='+userNo;
					} else {
					} 
				}
			});
		}
		
	
		
	</script>

</body>
</html>