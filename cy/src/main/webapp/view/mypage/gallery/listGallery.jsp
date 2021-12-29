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
	String pagenum = request.getParameter("pagenum"); // 4. 클릭한 페이지번호
	if (pagenum == null) { // 클릭한 페이지번호가 없으면 [ 게시판 첫화면 ]
		pagenum = "1"; //	1페이지 설정
	}

	int lastrow = GalleryDao.getGalleryDao().gallerycount(); // 1. 총 게시물수 

	int listsize = 5; //2. 페이지당 화면에 표시할 게시물수 

	int lastpage = 0; // 3. 마지막페이지
	if (lastrow % listsize == 0) { // 만약에 총게시물/페이지당게시물 나머지가 없으면
		lastpage = lastrow / listsize; // * 총게시물/페이당게시물 
	} else {
		lastpage = lastrow / listsize + 1; // * 총게시물/페이당게시물+1
	}

	int currentpage = Integer.parseInt(pagenum); // 5. 현재페이지번호
	int startrow = (currentpage - 1) * listsize;
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
					<div class="col-md-9 row" style="overflow: auto; height: 500px;">

						<%
						ArrayList<Gallery> galleries = GalleryDao.getGalleryDao().gallerylist(startrow, listsize);

						for (Gallery gallery : galleries) {
						%>
						<div class="card my-5"
							style="align-content: center; text-align: center; border: 1px solid red;">
							<p class="item"><%=gallery.getTitle()%></p>
							<hr>
							<div class="row">
								<div class="col-md-3">
									작성번호 : <%=gallery.getGpost_no()%>
									작성자 :
									<%=gallery.getWriter()%>
									
								</div>
								<div class="col-md-3">
									작성일 :
									<%=gallery.getDate()%>
								</div>
								<div class="col-md-3 ">
									<a href=".jsp?gpost_no=">
										<button type="button" class="form-control">수정</button>
									</a>
								</div>
								<div class="col-md-3 ">
									<a href=".jsp?gpost_no=">
										<button type="button" class="form-control">삭제</button>
									</a>
								</div>
							</div>
							<br> <br> <img
								src="../../../upload/<%=gallery.getPhoto()%>"
								class="card-img-top pimg" style="width: 500px;">
							<div class="card-body">
								<hr>
								<!-- 본문내용 -->
								<p class="item"><%=gallery.getContent()%>
								</p>
							</div>

							<br> <br> <br>
							<div class="row" id="">
								<!--  댓글 입력 창 ajax? -->

								<!-- 이미 등록된 댓글 출력창 -->
								<%
								// 1. reply 테이블에서 정보를 다 뺴온다
								// 2. 리스트에 저장하려면 dao ArrayList<Reply> replys = ...
								// 3. for 문 돌려서 출력하되, overflow 걸어두기
								%>


							</div>
						</div>
						<br> <br> <br>
						<%
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

				</div>
				<div class="row">
					<div class="col-md-2 offset-10">
						<br> <a href="writeGallery.jsp"><button type="button"
								class="form-control">글 등록</button></a> <br>
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
	
	</script>

</body>
</html>