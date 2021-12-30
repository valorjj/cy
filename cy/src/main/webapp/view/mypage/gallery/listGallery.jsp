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
	<%@ include file="../../common/header.jsp"%>

	<%
	int userNo = Integer.parseInt(request.getParameter("userNumber")); // 갤러리 주인 번호 

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

	<div class="container">
		<div class="row">
			<div class="col-md-10">
				<div class="row">
					<div class="col-md-3">
						<img src="../../upload/" alt="" class="img-thumbnail"
							style="max-width: 100%;">
						<hr>
						<div>
							<span> 홈페이지 소개글을 적고, 수정할 수 있는 부분입니다. </span>
						</div>
						<hr>
						<div class="row text-center">
							<button type="button" class="btn btn-secondary btn-sm" value="">소개글
								수정</button>

						</div>
						<hr>
						<!-- 나중에 시간되면 다크모드 전환도 넣을 까해서 밝기 아이콘 넣어두었음 -->
						<div class="">
							<button type="button" class="btn btn-secondary btn-sm" value="">프로필
								사진 수정</button>
						</div>
						<div class="my-2">
							<h6>
								홈페이지 주소(http://cyworld/<span style="color: blue;"></span>)
							</h6>
						</div>
					</div>
					<div class="col-md-9 row"
						style="overflow: auto; height: 500px; margin-left: 15px; align-items: center;">

						<%
						if (GalleryDao.getGalleryDao().gallerylist(startrow, listsize, userNo) != null) {
							galleries = GalleryDao.getGalleryDao().gallerylist(startrow, listsize, userNo);

							int j = 0;
							for (Gallery gallery : galleries) {
						%>
						<div class="card my-5"
							style="align-content: center; text-align: center; padding: 0px 30px; margin-left: 50px;">
							<p class="item"><%=gallery.getTitle()%></p>
							<hr>
							<div class="row">
								<div class="col-md-4 pt-1">

									작성번호 :
									<%=gallery.getGpost_no()%>
									<br> 작성자 :
									<%=gallery.getWriter()%>

								</div>
								<div class="col-md-4 py-3">
									작성일 :
									<%=gallery.getDate()%>
								</div>
								<div class="col-md-2 py-2">
									<a href="updateGallery.jsp?gpost_no=<%=gallery.getGpost_no()%>">
										<button type="button" class="form-control">수정</button>
									</a>
								</div>
								<div class="col-md-2 py-2">
									<a
										href="../../../controller/mypage/gallery/deleteGalleryController.jsp?gpost_no=<%=gallery.getGpost_no()%>">
										<button type="button" class="form-control">삭제</button>
									</a>
								</div>
							</div>
							<hr>
							<br> <br> <img
								src="../../../upload/<%=gallery.getPhoto()%>"
								class="card-img-top pimg" style="width: 500px;">
							<div class="card-body">
								<hr>
								<!-- 본문내용 -->
								<p class="item"><%=gallery.getContent()%>
								</p>
							</div>
							<br>
							<hr>

							<div style="overflow: auto; height: 120px;">
								<table class="table" border="1">
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
						<br> <br> <br>
						<%
						j++;
						}
						}
						%>

						<div class="col-md-4 offset-4">
							<br>
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
					<br>
					<div class="col-md-3 offset-9">
						<br> <br> <a href="writeGallery.jsp?userNo=<%=userNo%>"><button
								type="button" class="form-control">글 등록</button></a>
					</div>
				</div>

			</div>

			<br> <br>
			<div class="col-md-2">
				<ul class="tabs">
					<li class="tab-link current">홈</li>
					<li class="tab-link"><a href="#">프로필</a></li>
					<li class="tab-link" id="folder-4"><a
						href="../post/listPost.jsp">게시판</a></li>
					<li class="tab-link" id="folder-5"><a href="listGallery.jsp">사진첩</a></li>
					<li class="tab-link">방명록</li>
					<li class="tab-link" style="display: none;">관리</li>
				</ul>
			</div>
		</div>
	</div>
	<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
	<script>
		function reply( gpost_no ,j, userNo) {
			 var reply1 = document.getElementsByName("reply2")[j].value;
			$.ajax({
				url: "../../../controller/mypage/comment/gpostWriteController.jsp",
				data: { reply1 : reply1 , gpost_no : gpost_no},
				success: function(result) { 	
					if(result==1){
						// 댓글 등록 성공 시 
						location.href='../../../view/mypage/gallery/listGallery.jsp?gpost_no'+gpost_no
					} else {
						
						
					}
					
				}
			});
		
			
		}
		
	
		
	</script>

</body>
</html>